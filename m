Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1952F22EC0
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 May 2019 10:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfETIXc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 May 2019 04:23:32 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35634 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731422AbfETIWv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 May 2019 04:22:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id p26so22581734edr.2
        for <linux-fbdev@vger.kernel.org>; Mon, 20 May 2019 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x0uiCAq3Li2jmdjeGJIkAlmGEMtkmYpl25F5Y5tcPEI=;
        b=djo0cym2t1KuMxhaRwhFWYnGaZTJCP+pizxY/JnHkioQBN4SWmlvh67DPMZwR1fGG8
         L7MlysiCtzI4sWtb106pG6Mt+D56BHU3PlJgId5A3yiI3aSu34OYNlMYt5xnJLu3ujxr
         LcWmlt+5ld45Stq2rnP6pizhYdJNfJZnaPjlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x0uiCAq3Li2jmdjeGJIkAlmGEMtkmYpl25F5Y5tcPEI=;
        b=jZjU+pRI0bEWArkovDZkCUXOb+WZwKOchan0wqvm2grZBDht3FQCMPz6AODMOZgEd/
         sKQe4GmCbXWO+L/0uQCt4XhU4GrFuktYaRBdPIjESLNEQuf6ay5TWq1mo/EP1sK5R8B/
         HnrV0I6ADdkyzuV/qDnGeaqSfFznmQ6s4UUyPe1hXdcSzXXyekeJy8c+mhUW4k1/m1Hv
         r+JMzoAUwnOkhLjRUlAFj9Y5YbQBCKw5qlzBjllf1DSXpW8NjRrCcjza5vOU6OR5JHKH
         9vUY/KpVhtwTGiNfSI6lIB2Pazkbyyb7HSNhR0aNpYG3paKceyxW4u/zIc0w8Nj1Fvif
         vaTg==
X-Gm-Message-State: APjAAAWaluraZp/ivtsohdgnOekwxsqXJwzs2Q/xsB5funjXXgNUm3VP
        LkSbmlylb5iJAiaHyMTxIyzJwQ==
X-Google-Smtp-Source: APXvYqwI+OpydatmXSdYfJ99bNAPZnD9oXbel3F0KmXboiBBb6YqzsGXX+aKXgaec/2AvFVYsEA6JQ==
X-Received: by 2002:a50:9025:: with SMTP id b34mr73941343eda.145.1558340569542;
        Mon, 20 May 2019 01:22:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 01:22:49 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Yisheng Xie <ysxie@foxmail.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Mikulas Patocka <mpatocka@redhat.com>,
        linux-fbdev@vger.kernel.org
Subject: [PATCH 23/33] fbdev: Call fbcon_get_requirement directly
Date:   Mon, 20 May 2019 10:22:06 +0200
Message-Id: <20190520082216.26273-24-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Pretty simple case really.

v2: Forgot to remove a break;

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: Prarit Bhargava <prarit@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Yisheng Xie <ysxie@foxmail.com>
Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
Cc: Peter Rosin <peda@axentia.se>
Cc: Mikulas Patocka <mpatocka@redhat.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/core/fbcon.c | 9 ++-------
 drivers/video/fbdev/core/fbmem.c | 5 +----
 include/linux/fb.h               | 2 --
 include/linux/fbcon.h            | 4 ++++
 4 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 5635acb4b11c..58b876718d81 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3279,8 +3279,8 @@ void fbcon_new_modelist(struct fb_info *info)
 	}
 }
 
-static void fbcon_get_requirement(struct fb_info *info,
-				  struct fb_blit_caps *caps)
+void fbcon_get_requirement(struct fb_info *info,
+			   struct fb_blit_caps *caps)
 {
 	struct vc_data *vc;
 	struct fbcon_display *p;
@@ -3321,7 +3321,6 @@ static int fbcon_event_notify(struct notifier_block *self,
 	struct fb_event *event = data;
 	struct fb_info *info = event->info;
 	struct fb_con2fbmap *con2fb;
-	struct fb_blit_caps *caps;
 	int idx, ret = 0;
 
 	switch(action) {
@@ -3344,10 +3343,6 @@ static int fbcon_event_notify(struct notifier_block *self,
 	case FB_EVENT_BLANK:
 		fbcon_fb_blanked(info, *(int *)event->data);
 		break;
-	case FB_EVENT_GET_REQ:
-		caps = event->data;
-		fbcon_get_requirement(info, caps);
-		break;
 	case FB_EVENT_REMAP_ALL_CONSOLE:
 		idx = info->node;
 		fbcon_remap_all(idx);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 96d280228746..d428d08c358a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -932,16 +932,13 @@ EXPORT_SYMBOL(fb_pan_display);
 static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 			 u32 activate)
 {
-	struct fb_event event;
 	struct fb_blit_caps caps, fbcaps;
 	int err = 0;
 
 	memset(&caps, 0, sizeof(caps));
 	memset(&fbcaps, 0, sizeof(fbcaps));
 	caps.flags = (activate & FB_ACTIVATE_ALL) ? 1 : 0;
-	event.info = info;
-	event.data = &caps;
-	fb_notifier_call_chain(FB_EVENT_GET_REQ, &event);
+	fbcon_get_requirement(info, &caps);
 	info->fbops->fb_get_caps(info, &fbcaps, var);
 
 	if (((fbcaps.x ^ caps.x) & caps.x) ||
diff --git a/include/linux/fb.h b/include/linux/fb.h
index e6595a381792..e76185244593 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -136,8 +136,6 @@ struct fb_cursor_user {
 #define FB_EVENT_MODE_CHANGE_ALL	0x0B
 /*	A software display blank change occurred */
 #define FB_EVENT_CONBLANK               0x0C
-/*      Get drawing requirements        */
-#define FB_EVENT_GET_REQ                0x0D
 /*      CONSOLE-SPECIFIC: remap all consoles to new fb - for vga_switcheroo */
 #define FB_EVENT_REMAP_ALL_CONSOLE      0x0F
 /*      A hardware display blank early change occurred */
diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
index 42b06848b459..7f0a530a913c 100644
--- a/include/linux/fbcon.h
+++ b/include/linux/fbcon.h
@@ -12,6 +12,8 @@ void fbcon_resumed(struct fb_info *info);
 int fbcon_mode_deleted(struct fb_info *info,
 		       struct fb_videomode *mode);
 void fbcon_new_modelist(struct fb_info *info);
+void fbcon_get_requirement(struct fb_info *info,
+			   struct fb_blit_caps *caps);
 #else
 static inline void fb_console_init(void) {}
 static inline void fb_console_exit(void) {}
@@ -23,6 +25,8 @@ static inline void fbcon_resumed(void) {}
 int fbcon_mode_deleted(struct fb_info *info,
 		       struct fb_videomode *mode) { return 0; }
 void fbcon_new_modelist(struct fb_info *info) {}
+void fbcon_get_requirement(struct fb_info *info,
+			   struct fb_blit_caps *caps) {}
 #endif
 
 #endif /* _LINUX_FBCON_H */
-- 
2.20.1

