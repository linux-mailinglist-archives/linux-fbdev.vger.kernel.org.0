Return-Path: <linux-fbdev+bounces-6820-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ORyBs621GnQwgcAu9opvQ
	(envelope-from <linux-fbdev+bounces-6820-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Apr 2026 09:48:30 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A63AAF75
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Apr 2026 09:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66F9D300C911
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Apr 2026 07:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03403A381A;
	Tue,  7 Apr 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sp0BjMRq"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8735C3A3803
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Apr 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548101; cv=none; b=lgtiuLaueLAVkCZnN/3MlF4ODe/IFhu2YCUUKq1ctg+i3gQgUN8Ml/pkHwObKuKnsWRJqcaRTJSz1GT+xynWGjVx3FUb0dt3i3/OdJV9VBTv3CC6rscdiznmmWX375J/Fkb0DOuaaJAJWf20IG6URXj+Nvkvgc/VfNDYkUtbaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548101; c=relaxed/simple;
	bh=SwbZZZ1xSxNg4oKvTI7d37r7D7/JAHZDzMxhs2PpqL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pvTvD33snG2JILpYieuyFkhW/UQag3Qwjq8vs/T+R4FYo9UR7Hrru8Jb/PzeoMwTlmS8XQKyFYOsN7IJSuAOtCmc2hUFfQVoiZEOT1BX5MnTfe1cPVySxpMmt6XAfPlc57d00oNQI3rPB9/qxqmPDzEg91eNDYZeNoxmcdneyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sp0BjMRq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cd70febc7so3610085b3a.2
        for <linux-fbdev@vger.kernel.org>; Tue, 07 Apr 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775548100; x=1776152900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqeOhTHdWAUDurkfzU8G9NdSfZd1cydaJmMmKO+4GYM=;
        b=Sp0BjMRqZ4xhgJCg5SsA/to4EuXIBXVo8ch54cGXGo2R4dFlkA301tMfQT6LAafgOe
         JGW1zzKvMLLRd7ShsNiP+gM5VZ7nzo/vTf/RYQa1vv4Hn9QnFVF9AXlOkCXmmIiHCFkr
         5VzN4KA99wkxe7BwgY2c+dDrDTKLVubSWxBEd5GtjmI0nXhznla4DBa0FarFv79uUxh0
         pSPfot7iP5L2/sX/COV4jnsbG+POYlXdHHG1Peq0hKV76HK8ifPxCZd+n1+fedbSkSJX
         sipst68+PjhY/cG7R0ubMWUyyxpoq9crcnmphsj2aISe5g1waYbRrKkoVJEzk3hh8k7I
         5QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775548100; x=1776152900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqeOhTHdWAUDurkfzU8G9NdSfZd1cydaJmMmKO+4GYM=;
        b=I/I72to1wE5/+EBaiVmrtusiHrMEKobANQyIJ+Vsb+knZVW825HgCxN8/9UOXVuwxm
         q9+J8EhgS0gk86fCKXM6aEMqvb9NEkDu/tXBkAzt01/6QGhbwNjL9cNk17r736wEqczF
         Us4Hn45ccFaJnUgoCKov3AwK2nshJA6NjbCmWYHIAkxtFYDmqyGKRSSjsYJ6HT5c0LdJ
         nbfk07XA6RZW2DgGk70FRa9OcogQvJyCbxxvnEhu9rSmfhhQQSVWUczEUtDSfvLenPyf
         OK5pTNyg1cn6+JsSFYRytXHdqk4QbPxLzHIhzvFAnZOSuLOUs1IMf506Er3/HAMoZrMU
         eaHg==
X-Forwarded-Encrypted: i=1; AJvYcCUIe1e14Ip3ZrciG/TEJvRnbIcYI+iAdlt7ZNK6Asa5Dq9NjWA64jWzf1n35tr3NMF9Jpn9HUMMvvrtPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAzbzS7PM3TBxJocuKy+hcUDEvlxuKPNgwPtTJY/xzjXIAdJ07
	xIW7VYc6uP1+duNuk3oPWACGvkduYzlSK2m7ZgA020mpC9yZjjkKhPiE
X-Gm-Gg: AeBDiescyl1GTGWPbKE/1g3nl7I981+/G/h8vHFJgkezBXILFBk9hQQej5zfnYfLmwS
	5+C8t9gyaBRIt8jP9pjXkA78EjeJjb/pZ6q1bTxKwNflaFYtWF8nbb2T5wbD9uQ0vY4e6QoOrAd
	6RVlvoG1YexyPOj8QllZZ8qfv5OlB5RkbGQ5ch9U/cqXZkp2GRz98SFWr/vANfCxZ1B4pn6LMGN
	16sKGkpn35l8dK+TA7ii3zvfShXQjQWzU5VnkptR53uspidQuD9faw5uqNHTM00gXJ47MfXicXS
	JwMMEZh0dResNrnE4hCGe6hOYwQoiyg3QD4ZmTr/Q4kiEOKU0ojIBl983Le6JV3KGFtgmqCyRUM
	PstViHVLGQskWFC46JJjbhtzUuU+6bDbGg3d4fOvkNpA89M+f/9TT93cgMnJ5FgYLmanr2rVXsf
	W7KjGeQgubGc5JzSjG+7LG7mBlGExn2fhawPQ=
X-Received: by 2002:a05:6a00:6c94:b0:829:9a7b:db84 with SMTP id d2e1a72fcca58-82d0dba35d7mr15634327b3a.49.1775548099671;
        Tue, 07 Apr 2026 00:48:19 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm22093716b3a.51.2026.04.07.00.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:48:18 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 0/3] staging: sm750fb: Rename CamelCase identifiers
Date: Tue,  7 Apr 2026 13:18:02 +0530
Message-ID: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6820-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.978];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 856A63AAF75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series renames a few remaining CamelCase-style identifiers in
drivers/staging/sm750fb to match kernel coding style.

Changes in v3:
- Fix patch 1/3 commit message to say "upper case" instead of "snake_case"


Shubham Chakraborty (3):
  staging: sm750fb: Rename sm750_pnltype enum values to upper case
  staging: sm750fb: Rename init_status members to snake_case
  staging: sm750fb: Rename sm750_dev members to snake_case

 drivers/staging/sm750fb/sm750.c    | 34 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 16 +++++++-------
 drivers/staging/sm750fb/sm750_hw.c | 26 +++++++++++------------
 3 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.53.0


