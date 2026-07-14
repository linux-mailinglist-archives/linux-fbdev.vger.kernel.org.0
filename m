Return-Path: <linux-fbdev+bounces-7972-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7UiHClM6VmpN1wAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7972-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 15:32:03 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F9755293
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 15:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LZf1aXd0;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7972-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7972-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 130B83095067
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 13:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361D7336881;
	Tue, 14 Jul 2026 13:27:03 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04173191CE
	for <linux-fbdev@vger.kernel.org>; Tue, 14 Jul 2026 13:27:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035622; cv=pass; b=GhKz7AZomLUxx3pYgmX+825QAnKVzPrSpxxCHPmn3caum5mu/nqW35qLXwbpeXL2e7DfQMBpum6U4J0cJ9ePHYUCDql/QpiRmBp3mdO+2c5C4FUOekgR5mQSUDEF9FpMCRkHvAICBzZWYUHu4rMkftMktZyQPbGhhQiXeESNb84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035622; c=relaxed/simple;
	bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFnzIWid98sfbPkMThkmqP27uP+3w6MUjqRt9cYVEu5lxMVWQm3Tfvi5zoOduNuGUMV7GRTYxQgU5804P8WnXO1vCSj15/nqf3/w1wbs+Dbw1gyfxg/ayjzqh6BzCciGofWjlClYkFb+ElxvLFnQds/aQxjtPIWczA1EXvlPJDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZf1aXd0; arc=pass smtp.client-ip=209.85.215.172
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca913a601fbso2967434a12.3
        for <linux-fbdev@vger.kernel.org>; Tue, 14 Jul 2026 06:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035621; cv=none;
        d=google.com; s=arc-20260327;
        b=JKgK4vUKuJo5JRXC2wo6MVa4wX7oSsu/3eD+luOMyrChCaUTxvns3Ddf1FejUjoaNg
         07OOVwSrkmi81Q5ji7NR3XKHIo51JpiO8fsK6r1kanZxQk0w6GJ3MF4qJqVWU65FA3D+
         zgLMKDXG8cjBoXC+YCEPxBesrdzg8LMy05g8UD94g/ps1T9kZKG4oGdouNlmZCg3G0Np
         X9mSXzeFyWnRCu2aEVg7RVKIWvQn2hRuxkyQptdfhJNPALhgaCiobvPuU1aXOCjvbJx9
         xedioQOZvK5p/m+itC8ISV/8yXFCyEsPRA28lDOUjOh46Art/J8599DdyQ7SSXF4KuLY
         B0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        fh=vZRys+7bKqcq/pz1kZ6opIOQMJWb/RWE9pLuOup6PT0=;
        b=VSpFLTBVq2JVtuCSEIjJcUpN8UKFbVVKZRa4EsOQgmrTxAV1dUWIu69OLRRlNm99Qi
         bKOq13WdlFhaM7BMtLMjdhhUIUgvmSU/vj+xIZMPsKH1JH47CtplJ42doVZmkfX0bbtk
         SaJbA4g/agB2nbg/cIckf5NeknFfvXxtN1vQgJ8yBUj/UGzNwEPjrU2yHZYRouEWcvCT
         VPjbymSqTUfvDGB/M+sQTgrg79HaPcv8GoOIiTGxg5Iu/kJ10duYxQnyCfTP8Gk5tUf3
         +LLmAWyCN3ZINhLNH+IMLazjKLie1MnTGXJCWEASJP4eKZDzRrhXuWObQ9y1JqyWwGE6
         na3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035621; x=1784640421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        b=LZf1aXd0NDZy+HyoV9fvHRsX5BLLkFdBKmoUP+hsams104OkhJru3dmMG/oz6E0o9P
         0rBAvVrCSCSIhCrYr1gNqDhOAvm3PLyO58snWKTApbRtlPeiTym32NPpIKOblXD7z4Au
         XPt5nXHEqkOwfqPqyrJhnwospmkSKWhwS0H/L5pvhr62cA74ZAcmldmq8cvN3/FhWLda
         ubfOxB4awH73kFJIDmWFoVzv1PT8p7cjjTzZTp67yTxK32oHIm+PEFbUlkuQtf0pJRUo
         ZYu+Ih1/KqqwSaHohotBUtpxiEb1E2iGPgYnM25zKGGTr25K0BBTuVvChnaBs+5J/TMp
         A2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035621; x=1784640421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        b=snrqDHw2Qr9Yp0r7GghZhk/2NWf7y3w8RRH88o2HY3JVSOztD7Ie910e6kKIvLA9KO
         OBZAgece3MZNJzrWP/URg3sVWsDzBimFwYtQO8CkTwu//B/7yTgVM12PX+68IKDu/Ji5
         AGSqfWvFdi4i8sj1aXE6JzXvzmLU9M0CDxf4SO+r1W5aXM0hSPNzGwKIIhgSySbbyQtd
         zNL2UzpZ21RRVfIPeVC/x/4T4dzIs8ThC8nGEnjK4JajfFGhc0pOiqTXXWSsfOCJjcmq
         nQPe1k8b3xuJCr/wE/PnHtwefPz9Pt2QcXzq+igHnG8pRRtgwrekIPqWpRpkignsmnBD
         NCXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Yb85gTh60E0FfdbmEbgpZJ96CjifSjZjECLqpKzBpobrB6j+LyV7CwDiv9KS7qIwkpu4Z65Y6S3HBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKW0WAoxfPoV99aHPjWst4CcNRoqJC4vRXz+FklkSFxsyBN3PA
	ovRpZJb2S6tgpaMatWjTeZE7c5wGWFHas1f94GoZGkM7US68sTzzii49cFecH9YT6X49G7nC2ho
	AKzUkeGRLSiW7Zco4sc39XSZz9Rk04dY=
X-Gm-Gg: AfdE7cmPa+b7rmb66mWdyk9ROhnmYeiYidzxjPXp1jPmLYSoekd+hycrOzFX3Xh/ii8
	LW2UldhLGyMaQYWpg8M/y8u3gWBM1j3cKU/9KHfbEy22ejB5nZORUAPYyLm5M2YvyVHQcZfo+Ci
	jLOhuZIebMZDjLBCVKunm7DU0ZBWU3kSz5F8oisCrVYaU5DlNz1aeAAtsXpZjJ337cACicldxlB
	kerf14lcRBxRyW/Hg76gsCLDyicX7XU6b9YRMnjnpxANNvW9NZeT1kcl/a9sT08XvLeONGqKv+f
	AzA/ArNZdczWuFGEQu/8oWKneqwBDA==
X-Received: by 2002:a05:6a21:730e:b0:3c1:279c:526c with SMTP id
 adf61e73a8af0-3c3576426d3mr2584439637.63.1784035620851; Tue, 14 Jul 2026
 06:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-3-clamor95@gmail.com>
 <akeEd0GcHSqScGIl@hovoldconsulting.com>
In-Reply-To: <akeEd0GcHSqScGIl@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:26:49 +0300
X-Gm-Features: AUfX_mylEu9Yyzm1iZHwnL_3qQ4wX-qy21nMalz6S1BYQvhN4kmLF8d5IT5che8
Message-ID: <CAPVz0n1aYREgo9Mqb2fioQKTKa478rhMYPJJjcUagjCGNTzMgw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] mfd: lm3533: Remove driver specific regmap wrappers
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-7972-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F4F9755293

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:44 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:19AM +0300, Svyatoslav Ryhel wrote:
> > Remove driver-specific regmap wrappers in favor of using regmap helpers
> > directly.
>
> The commit message should explain why you think this is a good idea.
>

Removing custom wrappers over standard regmap helpers is always a good
idea, that is self explanatory.

> Based on a quick look you lose the errnos that were logged on errors and
> also the register debugging provided by those helpers.
>

That is not true, regmap helpers will provide logging and you should
not include debug stuff into the final submitted driver unless you
have a extremely valid justification for this, debug logs should have
been removed once the driver development was completed.

> Johan

