Return-Path: <linux-fbdev+bounces-2756-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 575D8942F9E
	for <lists+linux-fbdev@lfdr.de>; Wed, 31 Jul 2024 15:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891941C23D06
	for <lists+linux-fbdev@lfdr.de>; Wed, 31 Jul 2024 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136981B151B;
	Wed, 31 Jul 2024 13:01:39 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6C51A7F7E
	for <linux-fbdev@vger.kernel.org>; Wed, 31 Jul 2024 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430899; cv=none; b=HyTfm9ImywQVbWDEPJJc93yMn4CasvoMU4Vcf3oWz23MaI1lK9JJodMSfLn0EmPDfhCikHclHaFPXzOP8eX7KNODtljYKwBVHKOLh1nXSPWjyJBzgey2ASG5gMFVuzkDZ2/IUFNHrfm+5Wm7HM2Q/K9muxim8NbI1GG5eJIQvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430899; c=relaxed/simple;
	bh=htFulFtTFCvEQvVVDlKY3RWeKyLnQHshfyV0J+OtM2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOSs3ceY3rDPlsiY1f4r+HGAmpOmXXM2C463vIEJ6qBoKZsseODxf/vMbTR/jz1q+4XnJXWfqQW6hdvc+1oVfVWE3/97Vac/Fax63KrXA022HxgjuZ2z2U2nVPOo3dMlqTEYv5udlBC6OaMgtsFUGJ/pYrmFxkA2ebjeazBwIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFE8B21B70;
	Wed, 31 Jul 2024 13:01:35 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9135913AD8;
	Wed, 31 Jul 2024 13:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SMQ1Iq81qmYzWQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 13:01:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] staging: fbtft: Use backlight power constants
Date: Wed, 31 Jul 2024 14:58:51 +0200
Message-ID: <20240731130130.1148153-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731130130.1148153-1-tzimmermann@suse.de>
References: <20240731130130.1148153-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BFE8B21B70
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/fbtft/fb_ssd1351.c | 2 +-
 drivers/staging/fbtft/fbtft-core.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index ca2cba2185ae..cee4cecb23a5 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -213,7 +213,7 @@ static void register_onboard_backlight(struct fbtft_par *par)
 	struct backlight_properties bl_props = { 0, };
 
 	bl_props.type = BACKLIGHT_RAW;
-	bl_props.power = FB_BLANK_POWERDOWN;
+	bl_props.power = BACKLIGHT_POWER_OFF;
 
 	bd = backlight_device_register(dev_driver_string(par->info->device),
 				       par->info->device, par, &bl_ops,
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8e2fd0c0fee2..ab53698dae32 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -152,7 +152,7 @@ static int fbtft_backlight_get_brightness(struct backlight_device *bd)
 void fbtft_unregister_backlight(struct fbtft_par *par)
 {
 	if (par->info->bl_dev) {
-		par->info->bl_dev->props.power = FB_BLANK_POWERDOWN;
+		par->info->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 		backlight_update_status(par->info->bl_dev);
 		backlight_device_unregister(par->info->bl_dev);
 		par->info->bl_dev = NULL;
@@ -178,7 +178,7 @@ void fbtft_register_backlight(struct fbtft_par *par)
 
 	bl_props.type = BACKLIGHT_RAW;
 	/* Assume backlight is off, get polarity from current state of pin */
-	bl_props.power = FB_BLANK_POWERDOWN;
+	bl_props.power = BACKLIGHT_POWER_OFF;
 	if (!gpiod_get_value(par->gpio.led[0]))
 		par->polarity = true;
 
@@ -801,7 +801,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-		fb_info->bl_dev->props.power = FB_BLANK_UNBLANK;
+		fb_info->bl_dev->props.power = BACKLIGHT_POWER_ON;
 		fb_info->bl_dev->ops->update_status(fb_info->bl_dev);
 	}
 
-- 
2.45.2


