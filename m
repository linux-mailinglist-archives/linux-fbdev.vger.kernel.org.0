Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800DD75138
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jul 2019 16:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387499AbfGYOcb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jul 2019 10:32:31 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:36256 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387532AbfGYOcb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jul 2019 10:32:31 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id C94DF804EF;
        Thu, 25 Jul 2019 16:32:25 +0200 (CEST)
Date:   Thu, 25 Jul 2019 16:32:24 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190725143224.GB31803@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
        a=hD80L64hAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8
        a=VwQbUJbxAAAA:8 a=_UGc_VUiAAAA:8 a=ncPXX6QU26INqb4OGQsA:9
        a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
        a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
        a=x1x7-7IuMbAoE1UvoNSZ:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There was no users left - so drop the code to support EARLY_FB_BLANK.
This patch removes the support in backlight,
and drop the notifier in fbmem.

That EARLY_FB_BLANK is not used can be verified that no driver set any of:

    lcd_ops.early_set_power()
    lcd_ops.r_early_set_power()

Noticed while browsing backlight code for other reasons.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
Cc: Peter Rosin <peda@axentia.se>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
---

Build tested with various architectures, configs.

Lee, Daniel - OK to commit to drm-misc-next where fbdev stuff is
maintained today?

Patch needs ack from Bartlomiej first of course.

	Sam

 drivers/video/backlight/lcd.c    |  8 --------
 drivers/video/fbdev/core/fbmem.c | 12 +-----------
 include/linux/fb.h               |  4 ----
 include/linux/lcd.h              | 10 ----------
 4 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index d6b653aa4ee9..78b033358625 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -39,14 +39,6 @@ static int fb_notifier_callback(struct notifier_block *self,
 		if (event == FB_EVENT_BLANK) {
 			if (ld->ops->set_power)
 				ld->ops->set_power(ld, *(int *)evdata->data);
-		} else if (event == FB_EARLY_EVENT_BLANK) {
-			if (ld->ops->early_set_power)
-				ld->ops->early_set_power(ld,
-						*(int *)evdata->data);
-		} else if (event == FB_R_EARLY_EVENT_BLANK) {
-			if (ld->ops->r_early_set_power)
-				ld->ops->r_early_set_power(ld,
-						*(int *)evdata->data);
 		} else {
 			if (ld->ops->set_mode)
 				ld->ops->set_mode(ld, evdata->data);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 00fe0efeaee9..e6a1c805064f 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1058,7 +1058,7 @@ int
 fb_blank(struct fb_info *info, int blank)
 {	
 	struct fb_event event;
-	int ret = -EINVAL, early_ret;
+	int ret = -EINVAL;
 
  	if (blank > FB_BLANK_POWERDOWN)
  		blank = FB_BLANK_POWERDOWN;
@@ -1066,21 +1066,11 @@ fb_blank(struct fb_info *info, int blank)
 	event.info = info;
 	event.data = &blank;
 
-	early_ret = fb_notifier_call_chain(FB_EARLY_EVENT_BLANK, &event);
-
 	if (info->fbops->fb_blank)
  		ret = info->fbops->fb_blank(blank, info);
 
 	if (!ret)
 		fb_notifier_call_chain(FB_EVENT_BLANK, &event);
-	else {
-		/*
-		 * if fb_blank is failed then revert effects of
-		 * the early blank event.
-		 */
-		if (!early_ret)
-			fb_notifier_call_chain(FB_R_EARLY_EVENT_BLANK, &event);
-	}
 
  	return ret;
 }
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 50948e519897..756706b666a1 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -135,10 +135,6 @@ struct fb_cursor_user {
 
 /*      A display blank is requested       */
 #define FB_EVENT_BLANK                  0x09
-/*      A hardware display blank early change occurred */
-#define FB_EARLY_EVENT_BLANK		0x10
-/*      A hardware display blank revert early change occurred */
-#define FB_R_EARLY_EVENT_BLANK		0x11
 
 struct fb_event {
 	struct fb_info *info;
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index 851eee8fff25..238fb1dfed98 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -41,16 +41,6 @@ struct lcd_ops {
 	/* Get the LCD panel power status (0: full on, 1..3: controller
 	   power on, flat panel power off, 4: full off), see FB_BLANK_XXX */
 	int (*get_power)(struct lcd_device *);
-	/*
-	 * Enable or disable power to the LCD(0: on; 4: off, see FB_BLANK_XXX)
-	 * and this callback would be called proir to fb driver's callback.
-	 *
-	 * P.S. note that if early_set_power is not NULL then early fb notifier
-	 *	would be registered.
-	 */
-	int (*early_set_power)(struct lcd_device *, int power);
-	/* revert the effects of the early blank event. */
-	int (*r_early_set_power)(struct lcd_device *, int power);
 	/* Enable or disable power to the LCD (0: on; 4: off, see FB_BLANK_XXX) */
 	int (*set_power)(struct lcd_device *, int power);
 	/* Get the current contrast setting (0-max_contrast) */
-- 
2.20.1

