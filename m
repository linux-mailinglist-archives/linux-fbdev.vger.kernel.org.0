Return-Path: <linux-fbdev+bounces-7290-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EhoMdQ9C2oJFAUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7290-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2026 18:27:00 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E51570E1E
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2026 18:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4A8F306064C
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2026 16:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A80481FC3;
	Mon, 18 May 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QypHied7"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52671296BCF
	for <linux-fbdev@vger.kernel.org>; Mon, 18 May 2026 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120893; cv=none; b=HYZCqu8EQvDFF0oAJ1H2mVjfFZu1Wxy3oIi4oDW2PTeyUyLaCR+hQiwHFy4JQOPZkVRoiBB6CxpeAhiQcvo59j/gN20UXAHSCl1QsYGxVAv8nA6grBkvwpzQHqCEnK45/6AVIjTAzOnqOvL/juJP8m8Z94r7pHgJLpuaVOUqdbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120893; c=relaxed/simple;
	bh=9TXq6OAKtTy29c2ZSYYSiFXHX6iuG3bFkK7SUcGbhSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bKZ1gYCydXYDk7ZdZEcD68DJsWx6s8dgLQFZQ4sGhr1jGRG6NS2DnJbanbuZGi/WDLZnGY8610xNgG+K/xV8VyJdj4SzVn5fcssDjE3998ELQRfH3+F09nQRPJ4NhlpppPHSmAYtbAGuDrA8VIY3RlbqWoJ9RH9RBDsQLrNCovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QypHied7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1385928f8f.0
        for <linux-fbdev@vger.kernel.org>; Mon, 18 May 2026 09:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779120882; x=1779725682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TXq6OAKtTy29c2ZSYYSiFXHX6iuG3bFkK7SUcGbhSE=;
        b=QypHied78Cd+861e1PQzHdGeGL8Kp7gKsO4tXrdVUBQb6tEefgi7oR4ri02ltZA2n4
         wcbmOwcIQazxMM6yKxWwXlCBRCAxV/bpV5FF+B3zE0pJfG75mA7tlV5RshFcv3lSYXcR
         Z5smczQBdU5beJEmzn+EPBhOG+LBnfLdQZGHER3q/GfBJYnoNDBCmDaq/ivWCFmkHu90
         EkVGaCewV5K4vSQMRinkqCDfNtUvHkF9u6Q2FTZUrKPlBfI8OeIELp4x6r4oaC6t9Hzo
         y30akrD9HWEw4sED+Hqy0ca86FWS/zkpoQ1YwFG9zJPEyM/wxiHSjdVvADsy7Pgndi+x
         GLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120882; x=1779725682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TXq6OAKtTy29c2ZSYYSiFXHX6iuG3bFkK7SUcGbhSE=;
        b=Lcn0Tt8E//6T4BCJOnlbLWp8l68ai5mpn4QPJ1/kgihGVkjAyxzqjC0PPudlHIiTGl
         i9t+2BCea6vPkJKrNlIjxjF2KBzaXYeGX4hjGJUewSxBIke4ou5vxjGXr7WJY/eiMUoY
         aAqF+4ZnQBzsJL8NoyZkaF7700YsqKAbQ7A+e6e0lYaWBGEbNxKoLomf+Y8NeyHbYbR8
         99ihbkxNhNEAdUeBXgBZKLr2td1ra0QTeGHfNFdmoQmkHs6KfhcgIgCbs+br1eSIGyEs
         ykgaDm33R1eo57iAr+AMILZ3uVRBWGIdQ3fkK5avx5S1XTPemiWVJ3BFJlu5MkNPn0cQ
         n4yw==
X-Gm-Message-State: AOJu0YyfWzIS52dQ5P3UzZcFCoboxy1NNh7Puehegw5acQxT+JQto95P
	fH2iRJBj0xtZOEK//U7cJBMvoaTJ7M+Yws/3eh3JmerXFO8TMJtB06KrNPSDhcMRhvs=
X-Gm-Gg: Acq92OE4NcM5WwlrDz8XBnMX/7l4aZiUl3pJdjG5NDACE7DRivh7rtPLuiXpi0ufSvo
	n1qb44iEKuWATil7LIZSLczM8dTk1l+NFQ72LcrwWStjiEYQ7yPGlRb7Ty44eOpqkU1nVGiAtP9
	JKAN2Puf46Iy2YSkb7AnwBYXnBu0KXqls6gQ0NUrvGOQi0ZQUQYUCasU85DTVyTkfl9d1bJ+vU6
	eDjsLKrSFYu4X7/x9Mififlt4tAzRPwR6N1tVZ7ItMRlG3DG5zCd8XvtDh1grLf9dzZlP+oIp9O
	ys77tZ3JGBPA79dK/G0zT8Kwx0R3nhhngjiFnqoodtHAYgiQiTJK0CqAI7qEkvyq95cgC70UazZ
	4StsKnjH2k8HmRy/1ZmkLZLqLQLYdWqc2o9gc2H1bFyaoSZCpYUG8Syqmql1fz/9+KW5lyFwgW6
	qpI8syPKweawm/q6GiEenXc6MBzPUfF1IBqg==
X-Received: by 2002:a05:6000:1aca:b0:43c:f247:4792 with SMTP id ffacd0b85a97d-45e5c5be70cmr24447586f8f.12.1779120881786;
        Mon, 18 May 2026 09:14:41 -0700 (PDT)
Received: from RM.localdomain ([92.53.30.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3acf7sm38316771f8f.12.2026.05.18.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:14:41 -0700 (PDT)
From: =?UTF-8?q?Rahman=20Mahmutovi=C4=87?= <mahmutovicrahman5@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: deller@gmx.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: chipsfb: add missing MODULE_DESCRIPTION() macro
Date: Mon, 18 May 2026 18:14:36 +0200
Message-ID: <20260518161439.556-1-mahmutovicrahman5@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260509131831.1073-1-mahmutovicrahman5@gmail.com>
References: <20260509131831.1073-1-mahmutovicrahman5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7290-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahmutovicrahman5@gmail.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 67E51570E1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Helge,

Can you check my patches and let me know if any changes are needed?

Thanks,
Rahman Mahmutović

