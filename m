Return-Path: <linux-fbdev+bounces-7527-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z9lwEdWCJGpQ7gEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7527-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 06 Jun 2026 22:28:05 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE664E3C6
	for <lists+linux-fbdev@lfdr.de>; Sat, 06 Jun 2026 22:28:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=runbox.com header.s=selector1 header.b="el9IRW d";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7527-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7527-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60B6130118C8
	for <lists+linux-fbdev@lfdr.de>; Sat,  6 Jun 2026 20:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5F53C819A;
	Sat,  6 Jun 2026 20:27:21 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDBC3B7753;
	Sat,  6 Jun 2026 20:27:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780777641; cv=none; b=p5vyNTIHN6V45lOiDG+sDfMSd8lhyvSKpJvBigitol557mvAYDrIGBcHdkTXVQfbJTriRGpciNzQUYCeNJP6OxP1jRpAGWDoCXS73tI/7a9jfj90bgpKF9mXVB+KWQ/xbXR0FFItaVXvgci2ra3lXdpuF/CcZGwhebgRgWUUNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780777641; c=relaxed/simple;
	bh=Y2y9wHJxVHrLuAnI8gdoVCTm+qh2aVPsQxQLWj8+Hs0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lngSFV6WN/i1f14VnOgJwdTDfKqdJ6c7BNgWEnoSy8RniWthx3YXH/faJDYGuWyw2xRbtV6JXHxHUR0ZGVC7IONSHTO39v22Ylf3wo/DCX734e0yhajLb5Wxk0CNmsBAwRTFEiYGZqCcrctwONbBBJUzKLnGG1HpA73QHbVlR2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=el9IRWdA; arc=none smtp.client-ip=185.226.149.37
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxbr-007NQ6-KM; Sat, 06 Jun 2026 22:27:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=GQRWb9tcfRli0dIbDrB6vkuNwQ7FvLjPZHROOcuMtfU=; b=el9IRW
	dAMwyavlsEkSqgQ0M2JWZCNqoLAZGpGtoU7Q5XGmJhqsIXO7k6cKHgdjiCL3e60w9FdAINpVzW5hf
	FIkha+jj/49X2fqhBBAjizFONBNBIjsfFjZV4kQU/cqiVGKz6Xp4pM0GJX5lHjlUmwydJROtefhGM
	r7Ps0APJjhgMclzQZnA6DvkvCQxaoPdX2ve/zgtzvw1GSPdDmw+MNaGSIOF1fLCdzGS4ZYbuD5gXN
	SpmvONmC+I6Ly5LdkYBRFEY8aZI/cinVChlKchHImF3aVAdIBhb2QAQNApBzmRTfybSZW9LfKhZiC
	AY70u5p7u7fV8IkNjpAH+c9UT/EA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxbq-0000tI-WD; Sat, 06 Jun 2026 22:27:11 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wVxbi-006V18-9A;
	Sat, 06 Jun 2026 22:27:02 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Helge Deller <deller@gmx.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/video/fbdev/atmel_lcdfb: Use strscpy() to copy device name
Date: Sat,  6 Jun 2026 21:26:16 +0100
Message-Id: <20260606202633.5018-22-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7527-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-fbdev@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,tuxon.dev,gmx.de,microchip.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:arnd@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:deller@gmx.de,m:nicolas.ferre@microchip.com,m:david.laight.linux@gmail.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[runbox.com:+];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[runbox.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84AE664E3C6

From: David Laight <david.laight.linux@gmail.com>

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
This is one of a group of patches that remove potentially unbounded
strcpy() calls.

They are mostly replaced by strscpy() or, when strlen() has just been
called, with memcpy() (usually including the '\0').

Calls with copy string literals into arrays are left unchanged.
They are safe and easily detected as such.

The changes were made by getting the compiler to detect the calls and
then fixing the code by hand.

Note that all the changes are only compile tested.

Some Makefiles were changed to allow files to contain strcpy().
As well as 'difficult to fix' files, this included 'show' functions
as they really need to use sysfs_emit() or seq_printf().

All the patches are being sent individually to avoid very long cc lists.
Apologies for the terse commit messages and likely unexpected tags.
(There are about 100 patches in total.)

 drivers/video/fbdev/atmel_lcdfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 9dfbc5310210..da3eb5f1b337 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1062,7 +1062,7 @@ static int atmel_lcdfb_probe(struct platform_device *pdev)
 	info->fbops = &atmel_lcdfb_ops;
 
 	info->fix = atmel_lcdfb_fix;
-	strcpy(info->fix.id, sinfo->pdev->name);
+	strscpy(info->fix.id, sinfo->pdev->name);
 
 	/* Enable LCDC Clocks */
 	sinfo->bus_clk = clk_get(dev, "hclk");
-- 
2.39.5


