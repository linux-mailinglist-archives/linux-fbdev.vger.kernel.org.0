Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E3B2C256
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbfE1JDs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:03:48 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43710 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbfE1JDs (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:48 -0400
Received: by mail-ed1-f68.google.com with SMTP id w33so27264824edb.10
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cTKR1bWS92y6jx6235i5jk8TVLc5SUi6voiWrgnxv1k=;
        b=OHI09ErVKCCmMw4Q30PsUkK6DLxfVjZA/v6bgqkrsxPD+SkwEMnDS4vf/ltiyIINaj
         Ztss2ZLiyE5rSM5QHY5CO2EJUbNv2J8wR3rHcRdLG5/VJS4lIsTYR6xFu9TJvBrksi6M
         Bj3zaD4xeBsKjtCVcB/MjLtt13R0cup4wCy24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cTKR1bWS92y6jx6235i5jk8TVLc5SUi6voiWrgnxv1k=;
        b=NkQd8yP9E0t7F0SFSgvEW2Ryf9HtfLTjjBUlzpboefzJh7kLa7jy8LVA/3AcfqJgFn
         pKab11CK+hWR3R3ELjs009kxd2weXEMtR4vlmol+RQk4R2mHjBvKejNosVbd9hGMgZa2
         dgaR+jvqgscZyZ/BiwwreL+TrhjRn/T0IcfC2Cp6q/uRyfPxo/wIZPHVOr5yFV7ARIMA
         lmV6lTZKlZZ8pxApt4THqCfSwnCiuUd5BcEkJpZQA4AUAGmz2IEGF3EMN9DF9HTrEUrC
         opF72n0ZhLaKVhnmniQgmC+Q5NzYW5nSmUnugWv5xgGayaig/PkQRVyhxr0rD6OWl+ZP
         kTew==
X-Gm-Message-State: APjAAAWH/bmGvtIqXunz4LGt+HQErm86xFeA02KGY0cHzJiE2VJDZbRF
        vAUrk8ttyU71Yp2mtnkK7G1aXA==
X-Google-Smtp-Source: APXvYqw0UlMJtntWrCQdXZs42SphN4v03iode4I9FwSIGIRrtr2+bmQmVcbINRSwPmSdFt+oMljvkg==
X-Received: by 2002:aa7:dd03:: with SMTP id i3mr90707826edv.93.1559034226420;
        Tue, 28 May 2019 02:03:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:45 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Richard Purdie <rpurdie@rpsys.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>
Subject: [PATCH 24/33] Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
Date:   Tue, 28 May 2019 11:02:55 +0200
Message-Id: <20190528090304.9388-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This reverts commit 994efacdf9a087b52f71e620b58dfa526b0cf928.

The justification is that if hw blanking fails (i.e. fbops->fb_blank)
fails, then we still want to shut down the backlight. Which is exactly
_not_ what fb_blank() does and so rather inconsistent if we end up
with different behaviour between fbcon and direct fbdev usage. Given
that the entire notifier maze is getting in the way anyway I figured
it's simplest to revert this not well justified commit.

v2: Add static inline to the dummy version.

Cc: Richard Purdie <rpurdie@rpsys.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Yisheng Xie <ysxie@foxmail.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/backlight/backlight.c |  2 +-
 drivers/video/fbdev/core/fbcon.c    | 14 +-------------
 drivers/video/fbdev/core/fbmem.c    |  1 +
 include/linux/fb.h                  |  4 +---
 include/linux/fbcon.h               |  2 ++
 5 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 1ef8b6fd62ac..5dc07106a59e 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -47,7 +47,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 	int fb_blank = 0;
 
 	/* If we aren't interested in this event, skip it immediately ... */
-	if (event != FB_EVENT_BLANK && event != FB_EVENT_CONBLANK)
+	if (event != FB_EVENT_BLANK)
 		return 0;
 
 	bd = container_of(self, struct backlight_device, fb_notif);
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index ef69bd4ad343..a4617067ff24 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2350,8 +2350,6 @@ static int fbcon_switch(struct vc_data *vc)
 static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 				int blank)
 {
-	struct fb_event event;
-
 	if (blank) {
 		unsigned short charmask = vc->vc_hi_font_mask ?
 			0x1ff : 0xff;
@@ -2362,13 +2360,6 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 		fbcon_clear(vc, 0, 0, vc->vc_rows, vc->vc_cols);
 		vc->vc_video_erase_char = oldc;
 	}
-
-
-	lock_fb_info(info);
-	event.info = info;
-	event.data = &blank;
-	fb_notifier_call_chain(FB_EVENT_CONBLANK, &event);
-	unlock_fb_info(info);
 }
 
 static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
@@ -3240,7 +3231,7 @@ int fbcon_fb_registered(struct fb_info *info)
 	return ret;
 }
 
-static void fbcon_fb_blanked(struct fb_info *info, int blank)
+void fbcon_fb_blanked(struct fb_info *info, int blank)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct vc_data *vc;
@@ -3344,9 +3335,6 @@ static int fbcon_event_notify(struct notifier_block *self,
 		con2fb = event->data;
 		con2fb->framebuffer = con2fb_map[con2fb->console - 1];
 		break;
-	case FB_EVENT_BLANK:
-		fbcon_fb_blanked(info, *(int *)event->data);
-		break;
 	case FB_EVENT_REMAP_ALL_CONSOLE:
 		idx = info->node;
 		fbcon_remap_all(idx);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index ddc0c16b8bbf..9366fbe99a58 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1068,6 +1068,7 @@ fb_blank(struct fb_info *info, int blank)
 	event.data = &blank;
 
 	early_ret = fb_notifier_call_chain(FB_EARLY_EVENT_BLANK, &event);
+	fbcon_fb_blanked(info, blank);
 
 	if (info->fbops->fb_blank)
  		ret = info->fbops->fb_blank(blank, info);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 0d86aa31bf8d..1e66fac3124f 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -137,12 +137,10 @@ struct fb_cursor_user {
 #define FB_EVENT_GET_CONSOLE_MAP        0x07
 /*      CONSOLE-SPECIFIC: set console to framebuffer mapping */
 #define FB_EVENT_SET_CONSOLE_MAP        0x08
-/*      A hardware display blank change occurred */
+/*      A display blank is requested       */
 #define FB_EVENT_BLANK                  0x09
 /*      Private modelist is to be replaced */
 #define FB_EVENT_MODE_CHANGE_ALL	0x0B
-/*	A software display blank change occurred */
-#define FB_EVENT_CONBLANK               0x0C
 /*      CONSOLE-SPECIFIC: remap all consoles to new fb - for vga_switcheroo */
 #define FB_EVENT_REMAP_ALL_CONSOLE      0x0F
 /*      A hardware display blank early change occurred */
diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
index 305e4f2eddac..d67d7ec51ef9 100644
--- a/include/linux/fbcon.h
+++ b/include/linux/fbcon.h
@@ -14,6 +14,7 @@ int fbcon_mode_deleted(struct fb_info *info,
 void fbcon_new_modelist(struct fb_info *info);
 void fbcon_get_requirement(struct fb_info *info,
 			   struct fb_blit_caps *caps);
+void fbcon_fb_blanked(struct fb_info *info, int blank);
 #else
 static inline void fb_console_init(void) {}
 static inline void fb_console_exit(void) {}
@@ -27,6 +28,7 @@ static inline int fbcon_mode_deleted(struct fb_info *info,
 static inline void fbcon_new_modelist(struct fb_info *info) {}
 static inline void fbcon_get_requirement(struct fb_info *info,
 					 struct fb_blit_caps *caps) {}
+static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {}
 #endif
 
 #endif /* _LINUX_FBCON_H */
-- 
2.20.1

