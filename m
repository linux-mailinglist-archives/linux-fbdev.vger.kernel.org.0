Return-Path: <linux-fbdev+bounces-7615-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C71FNFUKL2rg7QQAu9opvQ
	(envelope-from <linux-fbdev+bounces-7615-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sun, 14 Jun 2026 22:08:53 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F32B36821E2
	for <lists+linux-fbdev@lfdr.de>; Sun, 14 Jun 2026 22:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cifjGXJd;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7615-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7615-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15B4630011BC
	for <lists+linux-fbdev@lfdr.de>; Sun, 14 Jun 2026 20:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324D8307481;
	Sun, 14 Jun 2026 20:08:45 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DFC28C869
	for <linux-fbdev@vger.kernel.org>; Sun, 14 Jun 2026 20:08:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467725; cv=none; b=IVkYcarij3B/pKdYRbELIeZFdeHtiGFa8hxZIBR8fWG40ih/UUpXyExvOB6u0Ia2uWhR2o3Wom+xY6wVfoCNtkomN9yS8S8NY2J5Db4dKcyCOSfQ2RBhUuwUfO13Com9jisSj+ElBz9McnnaE+43CIOJNfEtKuiJo42jj4bKuIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467725; c=relaxed/simple;
	bh=t9hJB0O2AbpQy0bG9J3Vr3qulzMoJf9YIfoqR60+/aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gS/PlRq+914WvbYUkNlw8aaaqN9pY66yQFTG/kLfNJHKHscLjMQ5exM8hjOrP17bQgmk0nfDK9GyQXZtBrJ2CKbruparXLlVIhtbq+ED5L/LMMeAJbfEGtl/I232EeEhl8cojKQ9UBN78LGVjXrcrHFBtv4lgWHQORXsATtFN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cifjGXJd; arc=none smtp.client-ip=209.85.219.43
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ccf181a52bso29546966d6.3
        for <linux-fbdev@vger.kernel.org>; Sun, 14 Jun 2026 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781467721; x=1782072521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qu5+bIQSk8l7rGQCe26ymBQKDA4my8QPuaUxaRTH6o=;
        b=cifjGXJdDJqH0T0TuLV/sp4GMNsUU6l5dO7TySP65bZQ4TFzA4ulUFYqgHedJ9lfyI
         sa4wiT+Ddc9C0t3mj/wQYW3pZam2QQLMSIY8207mXCIe7ieb1IKQN74FmjFYLPP44oSq
         pKRK7JBpIHmycjY+nEEwv7ZmywupQWJDjc8p2F5AetpnieG7YwN0yk8gQPm9C0GheQ7P
         +pEXZKFBJuWWLzbF7jCKZtqqxJMrUS9jabsE4pKUcwpVDby6pf1Rl00RnM6kag6zXvRq
         zsiVTlYblFMpEdVmJ5Yh+7MOYI5ka5neLfZOjEQMkSzFnll4VNsH4aTj2K3JAaAb/J6X
         e+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781467721; x=1782072521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Qu5+bIQSk8l7rGQCe26ymBQKDA4my8QPuaUxaRTH6o=;
        b=M7aEKqNasALeFKqvB22Sp6E0L5ta0Rn0pHzQ5DsJ5/7Br/CF+jMmlkViybi+m1Hqmh
         IbqUzMFbDLZFGWDUymw/h3tKOlnud1fSuhJeDadA1Ml9g4RmrlVjo7vSUxfhx3cZAxKe
         /p7TM5PrkPBqChUv8WGk83w2Ie8FTfoOJW+cmaHisuTY56qCwAgnDZ2go7cIjNbMiTRV
         yH2q5MVWKjRkdpplo2LqQrZsBcSxPmEYWc2WtfnxjY5qEr/fWKw45Li7poSmdSOz10I3
         JLPK/pTAcdhwu3VDuKQ1x4orrIq9aWHQxAiJPDQsYlynEbkdDaN7FWZ9l9xgaj8s+/dL
         pFBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+owORD1inv/a2ibla5lcKfi/EU8BYalRWZNQWDkoebfhsvp8iugQyvHnqzVCG988+gr99xLY3G9gfH4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4VS4gS7pI1VdOomH0cvGWOkkbg1kRwn4+u2IM7+hUcjrKJC1
	M3CqPu6b1Bz7/iMNga7Vha7FNc+2Qcputy604B8tY+DZqfSqSOyyyxKd
X-Gm-Gg: Acq92OHU8A4MQxC6Wr8Bo+0zvqawy1rh8SY8f1XI+fylcpvR5stqXJqh7hxIfVCSyJM
	d3W4TEVI5WNvDgO5MyGM/s5JA2yQVAnXf4DKIwkHXCTitRZoYG6LHqovxt1LNnYyZdPdLIYsSnb
	W2vWkOgYLN50+Vi5taiDbCMDq3Yxk6qND82SVR9fZKEZlrBIdo/21dPIZ1NRPSIjm+jYq2OJLJ4
	35ysku+atjVwe3X57mSSQhmeQQUGFigbLG6mb0WHAis/6EtbU7LHFaq+SccWLxus3neI9w3Ls0L
	OF8jer8m17buD5JnIX2mLX933PVSlFvmu2Iz88+C8x3ayqbKYPUtxFWazrwUvapy4ozXCxx9BPj
	Q8SCMAwUqpDL+MNPNncjlSs6JcmQLIJO48/wTkcgmVabtMypsC6eF2ta8EB/tmb7ObRrzJTngVo
	9tmMvY1MiI8OemkjV+v14cwx2Fgu7Y6Pb4l1O4dCG+GXl8hMcQ6k4NSZA=
X-Received: by 2002:a05:6214:3189:b0:8ce:cc38:e496 with SMTP id 6a1803df08f44-8d32e30f3f0mr196398416d6.22.1781467721402;
        Sun, 14 Jun 2026 13:08:41 -0700 (PDT)
Received: from localhost.localdomain ([38.174.6.30])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d300f6af40sm90192986d6.8.2026.06.14.13.08.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:08:40 -0700 (PDT)
From: Keefe Reeves <reeveskeefe@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: abdun.nihaal@gmail.com,
	error27@gmail.com,
	chintanlike@gmail.com,
	namcao@linutronix.de,
	niejianglei2021@163.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
Subject: [PATCH] staging: fbtft: use %pe for backlight errors
Date: Sun, 14 Jun 2026 17:08:37 -0300
Message-ID: <20260614200837.17908-1-reeveskeefe@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7615-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER(0.00)[reeveskeefe@gmail.com,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linutronix.de,163.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,users.noreply.github.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:abdun.nihaal@gmail.com,m:error27@gmail.com,m:chintanlike@gmail.com,m:namcao@linutronix.de,m:niejianglei2021@163.com,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:229415268+reeveskeefe@users.noreply.github.com,m:abdunnihaal@gmail.com,m:229415268@users.noreply.github.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[reeveskeefe@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,reeveskeefe];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F32B36821E2

From: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>

Coccinelle found two places where backlight registration errors are
printed by passing PTR_ERR() to dev_err().

Use %pe instead so the error pointer can be printed directly. This keeps
the behavior the same and just makes the error printing cleaner.

Signed-off-by: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
---
 drivers/staging/fbtft/fb_ssd1351.c | 4 ++--
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..b6cb60f20b11 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -218,8 +218,8 @@ static void register_onboard_backlight(struct fbtft_par *par)
 				       &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n",
+			bd);
 		return;
 	}
 	par->info->bl_dev = bd;
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3da42c8ca6e3..b6a846ada3e0 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -187,8 +187,8 @@ void fbtft_register_backlight(struct fbtft_par *par)
 				       &fbtft_bl_ops, &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n",
+			bd);
 		return;
 	}
 	par->info->bl_dev = bd;
-- 
2.54.0


