Return-Path: <linux-fbdev+bounces-1490-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920987AABA
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 16:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C92B1C20D9A
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 15:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1B9495E5;
	Wed, 13 Mar 2024 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CB6Si6yP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qXc8TWau";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CB6Si6yP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qXc8TWau"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1AE47A7C
	for <linux-fbdev@vger.kernel.org>; Wed, 13 Mar 2024 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344946; cv=none; b=OEiB3zec3c6EHTsHTfOve1oU89os6no0AlDlHGbQ8W4sZfFPXSPUHzP+8TZ91wPsoFetlas/3vEE7+EDsTzDl9+30BUQYMXHFtwJSGZKdcy7SPT+CJPeGigCzMY1jLcRfNgTgC8vt5lQ75cRfS3et2rgowXy++EaJezr7aniYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344946; c=relaxed/simple;
	bh=bz2369fO5egRM97p0xzze78iGeY1pwRTmS0pjLe0mXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCrrM4H62JEeMAhJQh2T5r67dylN1bB29RGzryaZtS8UEr/veazNEWiiV3w8VTCQlVfqu+GQxF0N7aQMXsUh66E9FNJH8hO0SrVpm4mkjI3rs4iXG7kD4toRAMhoRj6trLVv9vAY2Bihjxa3+5D9V+Hbz/yz2yhABjlNNiBMqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CB6Si6yP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qXc8TWau; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CB6Si6yP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qXc8TWau; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DDAB21C95;
	Wed, 13 Mar 2024 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710344941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUl7RM8pQSDLJcba+A10kl49yP/390cYF3cmxjxvIHg=;
	b=CB6Si6yPSpqmPCe8FGfZmrspJjJbjTpE3+sZgmwewcVotiglq/0TXPex1Wo1tjLRk7t8mi
	67YH41y3+ItgTvyynazp/nljQa66C7epyyeAsGYs4nEJc1oDSCKILEGrSSrJfDQv3tbCQx
	GuXBCF2KinGTJKhjVO0+eaIHmbltTpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710344941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUl7RM8pQSDLJcba+A10kl49yP/390cYF3cmxjxvIHg=;
	b=qXc8TWauJO/M7JOO5O/03ir0/lrg+Say4XkDe4zDtn3eoxEjE/jrZ5OmmfHTNFunZY+tm5
	3SSvJwUKJyLbGsCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710344941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUl7RM8pQSDLJcba+A10kl49yP/390cYF3cmxjxvIHg=;
	b=CB6Si6yPSpqmPCe8FGfZmrspJjJbjTpE3+sZgmwewcVotiglq/0TXPex1Wo1tjLRk7t8mi
	67YH41y3+ItgTvyynazp/nljQa66C7epyyeAsGYs4nEJc1oDSCKILEGrSSrJfDQv3tbCQx
	GuXBCF2KinGTJKhjVO0+eaIHmbltTpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710344941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUl7RM8pQSDLJcba+A10kl49yP/390cYF3cmxjxvIHg=;
	b=qXc8TWauJO/M7JOO5O/03ir0/lrg+Say4XkDe4zDtn3eoxEjE/jrZ5OmmfHTNFunZY+tm5
	3SSvJwUKJyLbGsCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D7551397F;
	Wed, 13 Mar 2024 15:49:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mAu3Ce3K8WUhfQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 15:49:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/6] backlight/omap1-bl: Replace FB_BLANK_ states with simple on/off
Date: Wed, 13 Mar 2024 16:45:02 +0100
Message-ID: <20240313154857.12949-4-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [0.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.de:email];
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
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[50.14%]
X-Spam-Score: 0.89
X-Spam-Flag: NO

The backlight is on for fb_blank eq FB_BLANK_UNBLANK, or off for
any other value in fb_blank. But the field fb_blank in struct
backlight_properties is deprecated and should not be used any
longer.

Replace the test for fb_blank in omap's backlight code with a
simple boolean parameter and push the test into the update_status
helper. Instead of reading fb_blank directly, decode the backlight
device's status with backlight_is_blank().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/omap1_bl.c | 46 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
index 84d148f385951..3fd8bbb7f5877 100644
--- a/drivers/video/backlight/omap1_bl.c
+++ b/drivers/video/backlight/omap1_bl.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/slab.h>
 #include <linux/platform_data/omap1_bl.h>
@@ -20,7 +19,7 @@
 #define OMAPBL_MAX_INTENSITY		0xff
 
 struct omap_backlight {
-	int powermode;
+	bool power;
 	int current_intensity;
 
 	struct device *dev;
@@ -37,21 +36,14 @@ static inline void omapbl_send_enable(int enable)
 	omap_writeb(enable, OMAP_PWL_CLK_ENABLE);
 }
 
-static void omapbl_blank(struct omap_backlight *bl, int mode)
+static void omapbl_power(struct omap_backlight *bl, bool on)
 {
-	switch (mode) {
-	case FB_BLANK_NORMAL:
-	case FB_BLANK_VSYNC_SUSPEND:
-	case FB_BLANK_HSYNC_SUSPEND:
-	case FB_BLANK_POWERDOWN:
-		omapbl_send_intensity(0);
-		omapbl_send_enable(0);
-		break;
-
-	case FB_BLANK_UNBLANK:
+	if (on) {
 		omapbl_send_intensity(bl->current_intensity);
 		omapbl_send_enable(1);
-		break;
+	} else {
+		omapbl_send_intensity(0);
+		omapbl_send_enable(0);
 	}
 }
 
@@ -61,7 +53,7 @@ static int omapbl_suspend(struct device *dev)
 	struct backlight_device *bl_dev = dev_get_drvdata(dev);
 	struct omap_backlight *bl = bl_get_data(bl_dev);
 
-	omapbl_blank(bl, FB_BLANK_POWERDOWN);
+	omapbl_power(bl, false);
 	return 0;
 }
 
@@ -70,33 +62,37 @@ static int omapbl_resume(struct device *dev)
 	struct backlight_device *bl_dev = dev_get_drvdata(dev);
 	struct omap_backlight *bl = bl_get_data(bl_dev);
 
-	omapbl_blank(bl, bl->powermode);
+	omapbl_power(bl, bl->power);
 	return 0;
 }
 #endif
 
-static int omapbl_set_power(struct backlight_device *dev, int state)
+static void omapbl_set_power(struct backlight_device *dev, bool on)
 {
 	struct omap_backlight *bl = bl_get_data(dev);
 
-	omapbl_blank(bl, state);
-	bl->powermode = state;
-
-	return 0;
+	omapbl_power(bl, on);
+	bl->power = on;
 }
 
 static int omapbl_update_status(struct backlight_device *dev)
 {
 	struct omap_backlight *bl = bl_get_data(dev);
+	bool power;
 
 	if (bl->current_intensity != dev->props.brightness) {
-		if (bl->powermode == FB_BLANK_UNBLANK)
+		if (bl->power)
 			omapbl_send_intensity(dev->props.brightness);
 		bl->current_intensity = dev->props.brightness;
 	}
 
-	if (dev->props.fb_blank != bl->powermode)
-		omapbl_set_power(dev, dev->props.fb_blank);
+	if (backlight_is_blank(dev))
+		power = false;
+	else
+		power = true;
+
+	if (power != bl->power)
+		omapbl_set_power(dev, power);
 
 	return 0;
 }
@@ -136,7 +132,7 @@ static int omapbl_probe(struct platform_device *pdev)
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-	bl->powermode = FB_BLANK_POWERDOWN;
+	bl->power = false;
 	bl->current_intensity = 0;
 
 	bl->pdata = pdata;
-- 
2.44.0


