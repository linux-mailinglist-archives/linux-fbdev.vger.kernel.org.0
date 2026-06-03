Return-Path: <linux-fbdev+bounces-7501-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NTJeDpbZH2pPrAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7501-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 03 Jun 2026 09:36:54 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0D635469
	for <lists+linux-fbdev@lfdr.de>; Wed, 03 Jun 2026 09:36:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="i/2TzDlJ";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7501-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7501-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B5893014AAB
	for <lists+linux-fbdev@lfdr.de>; Wed,  3 Jun 2026 07:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AD9400E1D;
	Wed,  3 Jun 2026 07:34:28 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427CC3FF1D9
	for <linux-fbdev@vger.kernel.org>; Wed,  3 Jun 2026 07:34:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472068; cv=none; b=UVqLGOyAzdn3eqWTrkgqB8Baj1l97ORnvwgzW/IBBpQBv5R++b1aU6qhEKnfgbnCQ+/V3JsHUxD1pFyQSG+TWIX/m6ZXwC3QnKu1aatEvzoKvqZUyXeUVeIAHjO5kWvt6WwYPO7/GhJ1XRQEvRxoINfzm4lxvl7NKUnFyG3O4Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472068; c=relaxed/simple;
	bh=08RidtlahiJ8c10vz6uXOCC0lnAJVvKCOPsHPm83Rbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dO2vcK04qH1QH6NecAF3QjW7sjejJucFBJkn7vsewrKKy8MN+Nx4HWEkWl0pNAzSbI6+LLHrpIacAc7Rz+d32kgmwX4aK9J13DIo3B4eMj5W12t00Cuuc5Isht/C29u63jik4aUDzUXnu/vQuUIynknnt6M151oft6hs9bD/mPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/2TzDlJ; arc=none smtp.client-ip=209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so6556366a12.1
        for <linux-fbdev@vger.kernel.org>; Wed, 03 Jun 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472065; x=1781076865; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPiXO1dCCP98YnBjWC02+T/M/Rv7LEFPOyMbOWtK8IE=;
        b=i/2TzDlJw3YyMuL06BYvYuUywWByQ/Sm6zwf9L4uSYtdHI+IWCxZ3wHtyL46XIBrT6
         zc11fqi61VKGe8SePKulQvOZnaB7tkc4AXmvkK3/3gjcYQJZpTgNOLSMY/TACeGUPw0e
         sOsSLP83PYFxFb2pNIKFKh0xl/ck+fztQQrrSN7h8r11ptCMnaOTP4Uh2rnDGLRCQbxu
         uQmTkjUDGDGGk0byTRoK3HOgxWKduSr7O0boFf4mFrDFYzram8neQk3WabQy53AsgsW6
         kJOMW4fOE379qCaFCM2mba6gSciAYGYBcqjU4LogULbE+N//EvV9XX2YV/4LntTxF12M
         xpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472065; x=1781076865;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPiXO1dCCP98YnBjWC02+T/M/Rv7LEFPOyMbOWtK8IE=;
        b=qdiYh9CU3nBZNNrfUpZoSh1P1qei0yDcp9cSZOJsPwm0Ho8iBq1dipX8ySdDA2ffcX
         YvWPAGcfGCKYKsxb/zV+bYYaj9QMZR1vtZe+Kl9u5wx+WCfp+7d/KoDHXK9O6FoPWuj8
         dl6UDY/Wmr1fMSEBTO6IhtFwPnjWC+4u25i4t+a5aw0MRFAaP7PX3KQXDCVz4MX+Jhv/
         4wkXQJ+GJZIxnTCMnZ6fSqOJUt9OkAfwHU4B2+ogKTG8b+Zllf6QS3iO4iV+nWZjRmf5
         NGq4aBQ31bSabDSSO5tOFrUy+cNc6wxDp+9csFFTy9NEp0uG+6Oa7dVV0i2ofPmxCetK
         2CHg==
X-Forwarded-Encrypted: i=1; AFNElJ+cvQ3JoSV9zJiM/JPlXZoak91SRu7mAG83iIe/eZlVEo76hS4y5wQ7O8wyafkmJlzmsNq1Jyx4XD9uRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0lb1/vEoji9Ihg2qUdaE2EiN2Ov/teUYyOhrw6hgEh69qAJj
	Nol1FgdOTw7w458fW1hz7NRBsu9h0/0YqW2D005CDRgEY81nVH0/68/w
X-Gm-Gg: Acq92OEB6V0E2LQLPDEfFgDOip/HE6fUCp/lHG8dYrdcgcHQc2d/52UoCWj48dM11D2
	x0hjgD4RMt0pe8xNkOG2b0Zrnm7/JpxXSM8rOqp6uE05cnM1ai4WA7nuOXrYEXdQp0GHQqZpX5M
	1PaTxjjZXWBGpE/9lIr3M2p6IuU4pp5BqR716EXJJKbB5rrZHKyFRD2a9xT9chl6H6gqnsRpk3H
	xvR5e23oS05Bns23xXXsmnPvXKsb30LvasMkUCBhZ4mta+QFPdWtyMKeHnqBVHQRA7c1KXRHNhy
	BpoZzbZrvxnB7M7UI7l0/z8JksPYOni0TsiTRbhotKWOw25UISQyRstagQFdMSQuZNF8MKrGZY/
	BEkhBA6fQUMkD/0JjI0LFgFaiB2XcmaS6m69Pn5A7UgHOztKRDZV+tSKnaBLQXyglgWlxKQgKyG
	zwve68DxNJqVNX/BgrzRVNha2EtMr+hQ==
X-Received: by 2002:a17:906:f58d:b0:bec:64d4:3869 with SMTP id a640c23a62f3a-bf0b0fdda85mr96495066b.4.1780472064614;
        Wed, 03 Jun 2026 00:34:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm102019166b.9.2026.06.03.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:34:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:34:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chintan Patel <chintanlike@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: fbtft: Use sysfs_emit_at() to print to sysfs file
Message-ID: <ah_Y_Y2RtqeGxchF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7501-lists,linux-fbdev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.petazzoni@free-electrons.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:tzimmermann@suse.de,m:chintanlike@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmx.de,suse.de,gmail.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,stanley.mountain:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBC0D635469

This scnprintf() uses the wrong limit.  It should be "PAGE_SIZE - len"
instead of just PAGE_SIZE.  We're not going to hit the limit in real
life since we are printing at most FBTFT_GAMMA_MAX_VALUES_TOTAL (128)
u32 values, however, it's still worth fixing.

Use sysfs_emit_at() to fix this since this is a sysfs file.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/staging/fbtft/fbtft-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index d05599d80011..343545e83a37 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -98,7 +98,7 @@ sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 	mutex_lock(&par->gamma.lock);
 	for (i = 0; i < par->gamma.num_curves; i++) {
 		for (j = 0; j < par->gamma.num_values; j++)
-			len += scnprintf(&buf[len], PAGE_SIZE,
+			len += sysfs_emit_at(buf, len,
 			     "%04x ", curves[i * par->gamma.num_values + j]);
 		buf[len - 1] = '\n';
 	}
-- 
2.53.0


