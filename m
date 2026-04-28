Return-Path: <linux-fbdev+bounces-7121-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL5xNpUf8WmRdgEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7121-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Apr 2026 22:59:01 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F348C208
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Apr 2026 22:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 636A63067178
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Apr 2026 20:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AAB340A59;
	Tue, 28 Apr 2026 20:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="hNotqIgw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net [178.154.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E1133ADA9;
	Tue, 28 Apr 2026 20:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409556; cv=none; b=JWkOjT/ZzYY+zxOoqZNJzPMOZYPWfBZQJtOckvsBfnILlv8Ml5dFxJpf3MuG/NPYOyVMWdy6y4t3Gku9Q3hE0p01w8Q6/1gCX1pxjvaMXRnDwnndmqrZYqeuloiv30ob0OX4IOesQzvGtVYiFnpiKvBhwe7Cd6BCHjB+Krj7eOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409556; c=relaxed/simple;
	bh=F/OmEEhKAmmu4QalJ/slS3LVVrJMytLXKdajWueqpf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7fBZJBCjrBEUBDqNEOkK4+kATzg2xE0CMZJpNRa01WHeSlJMBhoSaE2Pblp1GS4mZE8jkDeTfpg7Z5x++MD0IWPTgolQ+groCdafYDQZKYDt9InFaPbp0RnEa0q4JI3KhNiYJ7GtfHUOwlfnsGxvvQ+Qxd+5hNJMctEjRO5hWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=hNotqIgw; arc=none smtp.client-ip=178.154.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward200a.mail.yandex.net (Yandex) with ESMTPS id F0918C523B;
	Tue, 28 Apr 2026 23:44:29 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net [IPv6:2a02:6b8:c18:31e:0:640:f144:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 40163C03BC;
	Tue, 28 Apr 2026 23:44:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (smtp) with ESMTPSA id Iig5pN5S3mI0-WyHfxO9D;
	Tue, 28 Apr 2026 23:44:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1777409061;
	bh=kizDuhpz/ZW0XbVGAZ4ZeGP8avn86nvPk7wLDHXIDP4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=hNotqIgw7K4QMghY1XfdeM1qwDgSnHot+0ZyR4SiAnYe5z0m+C8TslOafjDwNLcd7
	 HLiRk42CK+Xus1cc8eahvWsXRvomkVpqhdVv9fDwiqr2TpEU4Kd7Pr93xN+lSms7SX
	 Nxgp+IMa4Mowbww8r/3J8vC55FO3f6ZcEhmegD3U=
Authentication-Results: mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH] staging: sm750fb: remove double space in fb_ops entries
Date: Tue, 28 Apr 2026 20:44:16 +0000
Message-ID: <20260428204416.55374-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5C6F348C208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7121-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sezginduran.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sezginduran.net:email,sezginduran.net:dkim,sezginduran.net:mid]

Remove extra space after '=' in .fb_check_var assignments.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8f43eea2868b..fadba95850be 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -670,7 +670,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 static const struct fb_ops lynxfb_ops = {
 	.owner = THIS_MODULE,
 	FB_DEFAULT_IOMEM_OPS,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
@@ -680,7 +680,7 @@ static const struct fb_ops lynxfb_ops = {
 static const struct fb_ops lynxfb_ops_with_cursor = {
 	.owner = THIS_MODULE,
 	FB_DEFAULT_IOMEM_OPS,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
@@ -691,7 +691,7 @@ static const struct fb_ops lynxfb_ops_with_cursor = {
 static const struct fb_ops lynxfb_ops_accel = {
 	.owner = THIS_MODULE,
 	__FB_DEFAULT_IOMEM_OPS_RDWR,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
@@ -705,7 +705,7 @@ static const struct fb_ops lynxfb_ops_accel = {
 static const struct fb_ops lynxfb_ops_accel_with_cursor = {
 	.owner = THIS_MODULE,
 	__FB_DEFAULT_IOMEM_OPS_RDWR,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
-- 
2.53.0


