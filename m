Return-Path: <linux-fbdev+bounces-1057-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7985190A
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 17:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24FC31F21E18
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 16:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F303D576;
	Mon, 12 Feb 2024 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V8q7JZzN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jhw3w7hV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V8q7JZzN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jhw3w7hV"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C93A3D546;
	Mon, 12 Feb 2024 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707755215; cv=none; b=uxWffxogIt4byGtHZ0ihVhNTpwjNunxp5WHFnLs2nvmXFIe27wJcS6wC4Uas44TvRQ44TVgFkis5Tx7EfSABomten5jjUs5HpSZkMdp1raRgIiYLzRS5hgnekPV5OAjcvH6ICWLxKcJ/tF+XvNyq7ZnidIX37dbr8RKRnwcgZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707755215; c=relaxed/simple;
	bh=5rRi1dfkRkL0wcQo6T211JgGKp7pgDrOQgsaD6MiGpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwibYRXCZcROcbbaJm3Crjp0XXF1kF26iyR8iA7AvxM2/pksUDJWo7/IcDMn4G0BKVSnxHRSk2p+tPmwzns7TOas9ounPy2+ESQXY6BM2IA3osQg6GMRy2IpUNt11OkjBPODMO3F+WCnz8IakksghQtv+GML8y/2at1d3mUF1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V8q7JZzN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jhw3w7hV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V8q7JZzN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jhw3w7hV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A5161FD5A;
	Mon, 12 Feb 2024 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707755212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V0RJP2AFYM7EHR/WrMMVdqLqHIA7RaYHlLIE7G5Jeog=;
	b=V8q7JZzNAeag89ZEoYZ7lzIPEWowTBPb2XTbdtIKHa6FanTzyBjOseDxx161CnDXsMDOF3
	Pxnrmc3pJQU0RCQQkHmL4/WKqyRZa9PS0xlTpDbjSa4PmXiOGbRuRnK5CruheuDkMBzzn3
	jhU+PA02SnCf05nTjkDCoM9eQwEvRmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707755212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V0RJP2AFYM7EHR/WrMMVdqLqHIA7RaYHlLIE7G5Jeog=;
	b=Jhw3w7hVMi18P9r5sp+XFRcHoc517ZN2taYr4YrFQ47c9UwW+rwcL7sSKnfmKPl3XFvwlI
	o+c6wkO7dkEBokDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707755212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V0RJP2AFYM7EHR/WrMMVdqLqHIA7RaYHlLIE7G5Jeog=;
	b=V8q7JZzNAeag89ZEoYZ7lzIPEWowTBPb2XTbdtIKHa6FanTzyBjOseDxx161CnDXsMDOF3
	Pxnrmc3pJQU0RCQQkHmL4/WKqyRZa9PS0xlTpDbjSa4PmXiOGbRuRnK5CruheuDkMBzzn3
	jhU+PA02SnCf05nTjkDCoM9eQwEvRmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707755212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V0RJP2AFYM7EHR/WrMMVdqLqHIA7RaYHlLIE7G5Jeog=;
	b=Jhw3w7hVMi18P9r5sp+XFRcHoc517ZN2taYr4YrFQ47c9UwW+rwcL7sSKnfmKPl3XFvwlI
	o+c6wkO7dkEBokDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id DCE4113A0E;
	Mon, 12 Feb 2024 16:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id wKTFNMtGymXmXgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 16:26:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/10] backlight: Add controls_device callback to struct backlight_ops
Date: Mon, 12 Feb 2024 17:16:43 +0100
Message-ID: <20240212162645.5661-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212162645.5661-1-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLbrmj4aennmrpd7btm9n9zy3k)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.10

Replace check_fb with controls_device in struct backlight_ops. The
new callback interface takes a Linux device instead of a framebuffer.
Resolves one of the dependencies of backlight.h on fb.h.

The few drivers that had custom implementations of check_fb can easily
use the framebuffer's Linux device instead. Update them accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c      |  2 +-
 drivers/video/backlight/bd6107.c         | 12 ++++++------
 drivers/video/backlight/gpio_backlight.c | 12 ++++++------
 drivers/video/backlight/lv5207lp.c       | 12 ++++++------
 include/linux/backlight.h                | 16 ++++++++--------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 48844a4f28ad3..18a0ac4bd6005 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -111,7 +111,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	if (!bd->ops)
 		goto out;
-	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
+	else if (bd->ops->controls_device && !bd->ops->controls_device(bd, info->device))
 		goto out;
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 	else if (info->bl_dev && info->bl_dev != bd)
diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index c95a12bf0ce26..d124ede084ef9 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -99,18 +99,18 @@ static int bd6107_backlight_update_status(struct backlight_device *backlight)
 	return 0;
 }
 
-static int bd6107_backlight_check_fb(struct backlight_device *backlight,
-				       struct fb_info *info)
+static bool bd6107_backlight_controls_device(struct backlight_device *backlight,
+					     struct device *display_dev)
 {
 	struct bd6107 *bd = bl_get_data(backlight);
 
-	return !bd->pdata->dev || bd->pdata->dev == info->device;
+	return !bd->pdata->dev || bd->pdata->dev == display_dev;
 }
 
 static const struct backlight_ops bd6107_backlight_ops = {
-	.options	= BL_CORE_SUSPENDRESUME,
-	.update_status	= bd6107_backlight_update_status,
-	.check_fb	= bd6107_backlight_check_fb,
+	.options	 = BL_CORE_SUSPENDRESUME,
+	.update_status	 = bd6107_backlight_update_status,
+	.controls_device = bd6107_backlight_controls_device,
 };
 
 static int bd6107_probe(struct i2c_client *client)
diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index d28c30b2a35d2..c0cff685ea848 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -30,18 +30,18 @@ static int gpio_backlight_update_status(struct backlight_device *bl)
 	return 0;
 }
 
-static int gpio_backlight_check_fb(struct backlight_device *bl,
-				   struct fb_info *info)
+static bool gpio_backlight_controls_device(struct backlight_device *bl,
+					   struct device *display_dev)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
 
-	return !gbl->dev || gbl->dev == info->device;
+	return !gbl->dev || gbl->dev == display_dev;
 }
 
 static const struct backlight_ops gpio_backlight_ops = {
-	.options	= BL_CORE_SUSPENDRESUME,
-	.update_status	= gpio_backlight_update_status,
-	.check_fb	= gpio_backlight_check_fb,
+	.options	 = BL_CORE_SUSPENDRESUME,
+	.update_status	 = gpio_backlight_update_status,
+	.controls_device = gpio_backlight_controls_device,
 };
 
 static int gpio_backlight_probe(struct platform_device *pdev)
diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
index 1f1d06b4e119a..0cf00fee0f605 100644
--- a/drivers/video/backlight/lv5207lp.c
+++ b/drivers/video/backlight/lv5207lp.c
@@ -62,18 +62,18 @@ static int lv5207lp_backlight_update_status(struct backlight_device *backlight)
 	return 0;
 }
 
-static int lv5207lp_backlight_check_fb(struct backlight_device *backlight,
-				       struct fb_info *info)
+static bool lv5207lp_backlight_controls_device(struct backlight_device *backlight,
+					       struct device *display_dev)
 {
 	struct lv5207lp *lv = bl_get_data(backlight);
 
-	return !lv->pdata->dev || lv->pdata->dev == info->device;
+	return !lv->pdata->dev || lv->pdata->dev == display_dev;
 }
 
 static const struct backlight_ops lv5207lp_backlight_ops = {
-	.options	= BL_CORE_SUSPENDRESUME,
-	.update_status	= lv5207lp_backlight_update_status,
-	.check_fb	= lv5207lp_backlight_check_fb,
+	.options	 = BL_CORE_SUSPENDRESUME,
+	.update_status	 = lv5207lp_backlight_update_status,
+	.controls_device = lv5207lp_backlight_controls_device,
 };
 
 static int lv5207lp_probe(struct i2c_client *client)
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 614653e07e3a8..2db4c70053c46 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -13,6 +13,7 @@
 #include <linux/fb.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/types.h>
 
 /**
  * enum backlight_update_reason - what method was used to update backlight
@@ -110,7 +111,6 @@ enum backlight_scale {
 };
 
 struct backlight_device;
-struct fb_info;
 
 /**
  * struct backlight_ops - backlight operations
@@ -160,18 +160,18 @@ struct backlight_ops {
 	int (*get_brightness)(struct backlight_device *);
 
 	/**
-	 * @check_fb: Check the framebuffer device.
+	 * @controls_device: Check against the display device
 	 *
-	 * Check if given framebuffer device is the one bound to this backlight.
-	 * This operation is optional and if not implemented it is assumed that the
-	 * fbdev is always the one bound to the backlight.
+	 * Check if the backlight controls the given display device. This
+	 * operation is optional and if not implemented it is assumed that
+	 * the display is always the one controlled by the backlight.
 	 *
 	 * RETURNS:
 	 *
-	 * If info is NULL or the info matches the fbdev bound to the backlight return true.
-	 * If info does not match the fbdev bound to the backlight return false.
+	 * If display_dev is NULL or display_dev matches the device controlled by
+	 * the backlight, return true. Otherwise return false.
 	 */
-	int (*check_fb)(struct backlight_device *bd, struct fb_info *info);
+	bool (*controls_device)(struct backlight_device *bd, struct device *display_dev);
 };
 
 /**
-- 
2.43.0


