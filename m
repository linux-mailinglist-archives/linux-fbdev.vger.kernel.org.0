Return-Path: <linux-fbdev+bounces-1489-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385987AAB9
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 16:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49DE7283943
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 15:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452CF48CCC;
	Wed, 13 Mar 2024 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uPsFkixQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMxYHeFd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uPsFkixQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMxYHeFd"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5252548CC7
	for <linux-fbdev@vger.kernel.org>; Wed, 13 Mar 2024 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344946; cv=none; b=jWkUDxjIcD0il3dkqsOwqzcx2QtIHD4LHSuIfjM8ef8gzeBsjIzi2f66OSuEIOk7vv4ulV0RF9FPIj2db/Sb1iz7w8/BH1BcCQFKd8C1zxHGEX6Dgy3YFchnX2i6VLoK58pRJuilYL17jK8DeqkGGAuPZry769N1+q7i9YBXybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344946; c=relaxed/simple;
	bh=VipxtSSAlB2C29GwsEH1I4f1E69eon9Ytf923ii7xJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrWAVEveTlUCG6OEm818x+4O3g3XTdZ7aXxIxQ5Lv874MCqSXiWYLcBXJUMwG7pXcygROxy77iqODXhB7zy0l5jozbaaN4zJlbS0KDDJT/K17iVEZtOGof+81PF50mrer8CBmiD2Xw07yDsMn162LeIprkP8AG/7HZP2PBXqcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uPsFkixQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GMxYHeFd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uPsFkixQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GMxYHeFd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 63DAB21CA0;
	Wed, 13 Mar 2024 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710344942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNTFpCIhbEv6AiCLJXeXfgxMU9oTaefq+t2p8cOGrc4=;
	b=uPsFkixQXunThCRghG4AK9eeviUq1rP0sALORycVbm41gLnoNWZyyEGHIFVcvBZHqcscxj
	FtX3/WPGCszTEWLIexy+WXlyVJi1OoGFXmJi7+pfxiBG8qxLDKQyP/H/RF0QgcvvJCntOw
	MvEkWaHvZGOnP1CyXkgQiocM/KiT6XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710344942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNTFpCIhbEv6AiCLJXeXfgxMU9oTaefq+t2p8cOGrc4=;
	b=GMxYHeFd8NWOMNG1dWAOLKlxmGl0lXn0a5li+fyQluVYE2SkWuGHLVCRWlepBrAoSSnQ/Y
	Z2nIMM4v98190mAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710344942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNTFpCIhbEv6AiCLJXeXfgxMU9oTaefq+t2p8cOGrc4=;
	b=uPsFkixQXunThCRghG4AK9eeviUq1rP0sALORycVbm41gLnoNWZyyEGHIFVcvBZHqcscxj
	FtX3/WPGCszTEWLIexy+WXlyVJi1OoGFXmJi7+pfxiBG8qxLDKQyP/H/RF0QgcvvJCntOw
	MvEkWaHvZGOnP1CyXkgQiocM/KiT6XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710344942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNTFpCIhbEv6AiCLJXeXfgxMU9oTaefq+t2p8cOGrc4=;
	b=GMxYHeFd8NWOMNG1dWAOLKlxmGl0lXn0a5li+fyQluVYE2SkWuGHLVCRWlepBrAoSSnQ/Y
	Z2nIMM4v98190mAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BBCE139B1;
	Wed, 13 Mar 2024 15:49:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qB+CAe7K8WUhfQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 15:49:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Flavio Suligoi <f.suligoi@asem.it>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 6/6] backlight: Remove fb_blank from struct backlight_properties
Date: Wed, 13 Mar 2024 16:45:05 +0100
Message-ID: <20240313154857.12949-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313154857.12949-1-tzimmermann@suse.de>
References: <20240313154857.12949-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.de:email,asem.it:email,bootlin.com:email,tuxon.dev:email,microchip.com:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -2.10
X-Spam-Flag: NO

Remove the field fb_blank from struct backlight_properties and remove
all code that still sets or reads it. Backlight blank status is now
tracked exclusively in struct backlight_properties.state.

The core backlight code keeps the fb_blank and state fields in sync,
but doesn't do anything else with fb_blank. Several drivers initialize
fb_blank to FB_BLANK_UNBLANK to enable the backlight. This is already
the default for the state field. So we can delete the fb_blank code
from core and drivers and rely on the state field.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Flavio Suligoi <f.suligoi@asem.it>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/video/backlight/backlight.c           |  2 --
 drivers/video/backlight/mp3309c.c             |  1 -
 drivers/video/backlight/omap1_bl.c            |  1 -
 drivers/video/fbdev/atmel_lcdfb.c             |  1 -
 .../omap2/omapfb/displays/panel-dsi-cm.c      |  1 -
 .../omapfb/displays/panel-sony-acx565akm.c    |  1 -
 include/linux/backlight.h                     | 25 +------------------
 7 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 86e1cdc8e3697..691f1f3030e98 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -118,14 +118,12 @@ static int fb_notifier_callback(struct notifier_block *self,
 		bd->fb_bl_on[node] = true;
 		if (!bd->use_count++) {
 			bd->props.state &= ~BL_CORE_FBBLANK;
-			bd->props.fb_blank = FB_BLANK_UNBLANK;
 			backlight_update_status(bd);
 		}
 	} else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
 		bd->fb_bl_on[node] = false;
 		if (!(--bd->use_count)) {
 			bd->props.state |= BL_CORE_FBBLANK;
-			bd->props.fb_blank = fb_blank;
 			backlight_update_status(bd);
 		}
 	}
diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 34d71259fac1d..059f4ddbbc842 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -378,7 +378,6 @@ static int mp3309c_probe(struct i2c_client *client)
 	props.scale = BACKLIGHT_SCALE_LINEAR;
 	props.type = BACKLIGHT_RAW;
 	props.power = FB_BLANK_UNBLANK;
-	props.fb_blank = FB_BLANK_UNBLANK;
 	chip->bl = devm_backlight_device_register(chip->dev, "mp3309c",
 						  chip->dev, chip,
 						  &mp3309c_bl_ops, &props);
diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
index 3fd8bbb7f5877..fd4c080ef676d 100644
--- a/drivers/video/backlight/omap1_bl.c
+++ b/drivers/video/backlight/omap1_bl.c
@@ -142,7 +142,6 @@ static int omapbl_probe(struct platform_device *pdev)
 
 	omap_cfg_reg(PWL);	/* Conflicts with UART3 */
 
-	dev->props.fb_blank = FB_BLANK_UNBLANK;
 	dev->props.brightness = pdata->default_intensity;
 	omapbl_update_status(dev);
 
diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 9e391e5eaf9da..5574fb0361ee3 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -153,7 +153,6 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
 	sinfo->backlight = bl;
 
 	bl->props.power = FB_BLANK_UNBLANK;
-	bl->props.fb_blank = FB_BLANK_UNBLANK;
 	bl->props.brightness = atmel_bl_get_brightness(bl);
 }
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index 47683a6c00767..274bdf7b3b459 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -1215,7 +1215,6 @@ static int dsicm_probe(struct platform_device *pdev)
 
 		ddata->bldev = bldev;
 
-		bldev->props.fb_blank = FB_BLANK_UNBLANK;
 		bldev->props.power = FB_BLANK_UNBLANK;
 		bldev->props.brightness = 255;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 9d3ce234a7874..71d2e015960c7 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -753,7 +753,6 @@ static int acx565akm_probe(struct spi_device *spi)
 	}
 
 	memset(&props, 0, sizeof(props));
-	props.fb_blank = FB_BLANK_UNBLANK;
 	props.power = FB_BLANK_UNBLANK;
 	props.type = BACKLIGHT_RAW;
 
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 614653e07e3a8..31600b144d794 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -218,25 +218,6 @@ struct backlight_properties {
 	 */
 	int power;
 
-	/**
-	 * @fb_blank: The power state from the FBIOBLANK ioctl.
-	 *
-	 * When the FBIOBLANK ioctl is called @fb_blank is set to the
-	 * blank parameter and the update_status() operation is called.
-	 *
-	 * When the backlight device is enabled @fb_blank is set
-	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
-	 * @fb_blank is set to FB_BLANK_POWERDOWN.
-	 *
-	 * Backlight drivers should avoid using this property. It has been
-	 * replaced by state & BL_CORE_FBLANK (although most drivers should
-	 * use backlight_is_blank() as the preferred means to get the blank
-	 * state).
-	 *
-	 * fb_blank is deprecated and will be removed.
-	 */
-	int fb_blank;
-
 	/**
 	 * @type: The type of backlight supported.
 	 *
@@ -366,7 +347,6 @@ static inline int backlight_enable(struct backlight_device *bd)
 		return 0;
 
 	bd->props.power = FB_BLANK_UNBLANK;
-	bd->props.fb_blank = FB_BLANK_UNBLANK;
 	bd->props.state &= ~BL_CORE_FBBLANK;
 
 	return backlight_update_status(bd);
@@ -382,7 +362,6 @@ static inline int backlight_disable(struct backlight_device *bd)
 		return 0;
 
 	bd->props.power = FB_BLANK_POWERDOWN;
-	bd->props.fb_blank = FB_BLANK_POWERDOWN;
 	bd->props.state |= BL_CORE_FBBLANK;
 
 	return backlight_update_status(bd);
@@ -395,15 +374,13 @@ static inline int backlight_disable(struct backlight_device *bd)
  * Display is expected to be blank if any of these is true::
  *
  *   1) if power in not UNBLANK
- *   2) if fb_blank is not UNBLANK
- *   3) if state indicate BLANK or SUSPENDED
+ *   2) if state indicate BLANK or SUSPENDED
  *
  * Returns true if display is expected to be blank, false otherwise.
  */
 static inline bool backlight_is_blank(const struct backlight_device *bd)
 {
 	return bd->props.power != FB_BLANK_UNBLANK ||
-	       bd->props.fb_blank != FB_BLANK_UNBLANK ||
 	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
 }
 
-- 
2.44.0


