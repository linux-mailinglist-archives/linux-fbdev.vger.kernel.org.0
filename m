Return-Path: <linux-fbdev+bounces-2841-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C78958280
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Aug 2024 11:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6328E28323A
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Aug 2024 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EF418C349;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aoDWDqjR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UkFUG//u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aoDWDqjR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UkFUG//u"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0B318C03A;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146505; cv=none; b=RdrL+GmK/zG27uaK9OuYmgjPnlr8/Mdv7Bw9YyXEh2djNmE4BoRKYlRqa0mRPIXTCiX9AEm4wdZjXSmsNZaf1XK3DhxlExAKDNlSbUbxZUVMUqqG58zbhkGAatL2Lq0K0EQW0Uoi0SjiW5wwym/fgNvjD6NuEc9G3SjPjfcsMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146505; c=relaxed/simple;
	bh=zwTqRzqpTVRe+7T2EeH4gb/ECL5IzfVFuQtaj2mE3u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biBfLcVFr2k4H+W73h1eswJ/gwNDKANzhyTq56WD+pAw20n1pYnuYiAj7C+Vtb/fd5gKz+7wg/GX8M1JBv120hRnkopwVVhWE3YQayiR4FyRo1lfq/R4b/9tuyZDewjvwRElzREV4T0Pmj5+QJ24Xy4/oUNlZXb9n3PGz1Ag+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aoDWDqjR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UkFUG//u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aoDWDqjR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UkFUG//u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 51497224AC;
	Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGZ+ViguUmUpMrae3BhjsSznkdXVFzEDIrQ+3tfdhD0=;
	b=aoDWDqjRWIeUII8IfE9ROjhSVnf7FQJHUeLpL31lJFacEzlmnXVbpOQ8Qe3dTx3j+Wl2lo
	HjeDLL6rzNHJQjj4sS4mtWigkwdsWTp21oKIfuUQotTDmZaPuRlNuFMbMNbkCQ9xQVYxri
	N4V9fVbPbR8pN2Kn62IRtfuDsot0ZMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGZ+ViguUmUpMrae3BhjsSznkdXVFzEDIrQ+3tfdhD0=;
	b=UkFUG//ub26wG9UlNLN50ue3G5FM0BeNeQkuP1rI34pDvQsfiUC0Hbx2bmko2Z+IOURScW
	P33pIwmYNGlRVZCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aoDWDqjR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="UkFUG//u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGZ+ViguUmUpMrae3BhjsSznkdXVFzEDIrQ+3tfdhD0=;
	b=aoDWDqjRWIeUII8IfE9ROjhSVnf7FQJHUeLpL31lJFacEzlmnXVbpOQ8Qe3dTx3j+Wl2lo
	HjeDLL6rzNHJQjj4sS4mtWigkwdsWTp21oKIfuUQotTDmZaPuRlNuFMbMNbkCQ9xQVYxri
	N4V9fVbPbR8pN2Kn62IRtfuDsot0ZMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGZ+ViguUmUpMrae3BhjsSznkdXVFzEDIrQ+3tfdhD0=;
	b=UkFUG//ub26wG9UlNLN50ue3G5FM0BeNeQkuP1rI34pDvQsfiUC0Hbx2bmko2Z+IOURScW
	P33pIwmYNGlRVZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E418413770;
	Tue, 20 Aug 2024 09:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4Nd/NkRjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	bonbons@linux-vserver.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	shc_work@mail.ru,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/28] backlight: corgi_lcd: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:42 +0200
Message-ID: <20240820093452.68270-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 51497224AC
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/corgi_lcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index e4fcfbe38dc6..35c3fd3281ca 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -24,7 +24,7 @@
 #include <linux/slab.h>
 #include <asm/mach/sharpsl_param.h>
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 /* Register Addresses */
 #define RESCTL_ADRS     0x00
@@ -455,7 +455,7 @@ static int corgi_lcd_suspend(struct device *dev)
 
 	corgibl_flags |= CORGIBL_SUSPENDED;
 	corgi_bl_set_intensity(lcd, 0);
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_POWERDOWN);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_OFF);
 	return 0;
 }
 
@@ -464,7 +464,7 @@ static int corgi_lcd_resume(struct device *dev)
 	struct corgi_lcd *lcd = dev_get_drvdata(dev);
 
 	corgibl_flags &= ~CORGIBL_SUSPENDED;
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_UNBLANK);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_ON);
 	backlight_update_status(lcd->bl_dev);
 	return 0;
 }
@@ -513,7 +513,7 @@ static int corgi_lcd_probe(struct spi_device *spi)
 	if (IS_ERR(lcd->lcd_dev))
 		return PTR_ERR(lcd->lcd_dev);
 
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 	lcd->mode = (pdata) ? pdata->init_mode : CORGI_LCD_MODE_VGA;
 
 	memset(&props, 0, sizeof(struct backlight_properties));
@@ -535,7 +535,7 @@ static int corgi_lcd_probe(struct spi_device *spi)
 	lcd->kick_battery = pdata->kick_battery;
 
 	spi_set_drvdata(spi, lcd);
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_UNBLANK);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_ON);
 	backlight_update_status(lcd->bl_dev);
 
 	lcd->limit_mask = pdata->limit_mask;
@@ -550,7 +550,7 @@ static void corgi_lcd_remove(struct spi_device *spi)
 	lcd->bl_dev->props.power = BACKLIGHT_POWER_ON;
 	lcd->bl_dev->props.brightness = 0;
 	backlight_update_status(lcd->bl_dev);
-	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_POWERDOWN);
+	corgi_lcd_set_power(lcd->lcd_dev, LCD_POWER_OFF);
 }
 
 static struct spi_driver corgi_lcd_driver = {
-- 
2.46.0


