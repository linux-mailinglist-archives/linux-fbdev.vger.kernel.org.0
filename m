Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD57E4A50F0
	for <lists+linux-fbdev@lfdr.de>; Mon, 31 Jan 2022 22:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380568AbiAaVHJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 31 Jan 2022 16:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379721AbiAaVGu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 31 Jan 2022 16:06:50 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A49C06175E
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:46 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l25so27814724wrb.13
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6wfZA3tFd16Wtm8S/Dh1qu27uVxdzEk758J89g6umwA=;
        b=IJD+m3Kxr+r+xmupJ1J+uzZNue3hzbe3JLMQ24+wok5XgdzjDqsg0K1ZUktgzTW/bq
         CR93sjoSXr9ksqso1GkmJtRyHkXp6dXn87C7hQQaM1WEB68XrwrR2Ii5qNDTMGv8Ani1
         3cM3S7Y23qfL4LABSgltvAprTFhSHdc2w1+B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6wfZA3tFd16Wtm8S/Dh1qu27uVxdzEk758J89g6umwA=;
        b=Qg2vIyfxq7TsBH2Co8UmuTkFV2Q+2UpB59Aolb5wxAJkGs6urBCoV1jABxpYm3K9rO
         mwNM+AEM/FypVKRWMzKThoEOJN+JHkoF2d1jd5BNOXuOdvA+eM52uyTmCjpq0y+csK6Q
         Zfie0LfAE1FCct5kN50zgTeJH2odzo89/RwBLQz9dJFzcDO7E8nBRc/h5MF9WoFPjhxT
         kunj2hi5R49gA45OgSKKH53IG3hWiU5eOHdUKSt0yLbqhxok6c9UW3UmpkMUALRSq5CD
         ZrB/63qgvou/CBzDeA+Lvh0Q8T+VayOH48LnYtz/pcigVgZdTCC4i3EsHgYED4niRLB3
         EK4Q==
X-Gm-Message-State: AOAM531Qoimef6lsX2SmKdcpCW93A1QRCzQ1rKM/hxLXjv9pasMSSBbM
        PjJQwRA8vuUYv50xw2Ci6bJFFg==
X-Google-Smtp-Source: ABdhPJwOtD4ta20T1lJZOY42qm42b9pZtXBcPDQBEXfwqq5jZUkp0DdIWb26xD0pncVtAPxrGP15iw==
X-Received: by 2002:a5d:6090:: with SMTP id w16mr18830782wrt.476.1643663205056;
        Mon, 31 Jan 2022 13:06:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:06:44 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Claudio Suarez <cssk@net-c.es>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Du Cheng <ducheng2@gmail.com>
Subject: [PATCH 11/21] fbcon: Extract fbcon_open/release helpers
Date:   Mon, 31 Jan 2022 22:05:42 +0100
Message-Id: <20220131210552.482606-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There's two minor behaviour changes in here:
- in error paths we now consistently call fb_ops->fb_release
- fb_release really can't fail (fbmem.c ignores it too) and there's no
  reasonable cleanup we can do anyway.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Du Cheng <ducheng2@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 107 +++++++++++++++----------------
 1 file changed, 53 insertions(+), 54 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index fa30e1909164..eea2ee14b64c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -680,19 +680,37 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
 
 #endif /* CONFIG_MISC_TILEBLITTING */
 
+static int fbcon_open(struct fb_info *info)
+{
+	if (!try_module_get(info->fbops->owner))
+		return -ENODEV;
+
+	if (info->fbops->fb_open &&
+	    info->fbops->fb_open(info, 0)) {
+		module_put(info->fbops->owner);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void fbcon_release(struct fb_info *info)
+{
+	if (info->fbops->fb_release)
+		info->fbops->fb_release(info, 0);
+
+	module_put(info->fbops->owner);
+}
 
 static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 				  int unit, int oldidx)
 {
 	struct fbcon_ops *ops = NULL;
-	int err = 0;
-
-	if (!try_module_get(info->fbops->owner))
-		err = -ENODEV;
+	int err;
 
-	if (!err && info->fbops->fb_open &&
-	    info->fbops->fb_open(info, 0))
-		err = -ENODEV;
+	err = fbcon_open(info);
+	if (err)
+		return err;
 
 	if (!err) {
 		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
@@ -713,7 +731,7 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 
 	if (err) {
 		con2fb_map[unit] = oldidx;
-		module_put(info->fbops->owner);
+		fbcon_release(info);
 	}
 
 	return err;
@@ -724,45 +742,34 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 				  int oldidx, int found)
 {
 	struct fbcon_ops *ops = oldinfo->fbcon_par;
-	int err = 0, ret;
+	int ret;
 
-	if (oldinfo->fbops->fb_release &&
-	    oldinfo->fbops->fb_release(oldinfo, 0)) {
-		con2fb_map[unit] = oldidx;
-		if (!found && newinfo->fbops->fb_release)
-			newinfo->fbops->fb_release(newinfo, 0);
-		if (!found)
-			module_put(newinfo->fbops->owner);
-		err = -ENODEV;
-	}
+	fbcon_release(oldinfo);
 
-	if (!err) {
-		fbcon_del_cursor_work(oldinfo);
-		kfree(ops->cursor_state.mask);
-		kfree(ops->cursor_data);
-		kfree(ops->cursor_src);
-		kfree(ops->fontbuffer);
-		kfree(oldinfo->fbcon_par);
-		oldinfo->fbcon_par = NULL;
-		module_put(oldinfo->fbops->owner);
-		/*
-		  If oldinfo and newinfo are driving the same hardware,
-		  the fb_release() method of oldinfo may attempt to
-		  restore the hardware state.  This will leave the
-		  newinfo in an undefined state. Thus, a call to
-		  fb_set_par() may be needed for the newinfo.
-		*/
-		if (newinfo && newinfo->fbops->fb_set_par) {
-			ret = newinfo->fbops->fb_set_par(newinfo);
+	fbcon_del_cursor_work(oldinfo);
+	kfree(ops->cursor_state.mask);
+	kfree(ops->cursor_data);
+	kfree(ops->cursor_src);
+	kfree(ops->fontbuffer);
+	kfree(oldinfo->fbcon_par);
+	oldinfo->fbcon_par = NULL;
+	/*
+	  If oldinfo and newinfo are driving the same hardware,
+	  the fb_release() method of oldinfo may attempt to
+	  restore the hardware state.  This will leave the
+	  newinfo in an undefined state. Thus, a call to
+	  fb_set_par() may be needed for the newinfo.
+	*/
+	if (newinfo && newinfo->fbops->fb_set_par) {
+		ret = newinfo->fbops->fb_set_par(newinfo);
 
-			if (ret)
-				printk(KERN_ERR "con2fb_release_oldinfo: "
-					"detected unhandled fb_set_par error, "
-					"error code %d\n", ret);
-		}
+		if (ret)
+			printk(KERN_ERR "con2fb_release_oldinfo: "
+				"detected unhandled fb_set_par error, "
+				"error code %d\n", ret);
 	}
 
-	return err;
+	return 0;
 }
 
 static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
@@ -917,7 +924,6 @@ static const char *fbcon_startup(void)
 	struct fbcon_display *p = &fb_display[fg_console];
 	struct vc_data *vc = vc_cons[fg_console].d;
 	const struct font_desc *font = NULL;
-	struct module *owner;
 	struct fb_info *info = NULL;
 	struct fbcon_ops *ops;
 	int rows, cols;
@@ -936,17 +942,12 @@ static const char *fbcon_startup(void)
 	if (!info)
 		return NULL;
 	
-	owner = info->fbops->owner;
-	if (!try_module_get(owner))
+	if (fbcon_open(info))
 		return NULL;
-	if (info->fbops->fb_open && info->fbops->fb_open(info, 0)) {
-		module_put(owner);
-		return NULL;
-	}
 
 	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
 	if (!ops) {
-		module_put(owner);
+		fbcon_release(info);
 		return NULL;
 	}
 
@@ -3331,10 +3332,6 @@ static void fbcon_exit(void)
 		}
 
 		if (mapped) {
-			if (info->fbops->fb_release)
-				info->fbops->fb_release(info, 0);
-			module_put(info->fbops->owner);
-
 			if (info->fbcon_par) {
 				struct fbcon_ops *ops = info->fbcon_par;
 
@@ -3344,6 +3341,8 @@ static void fbcon_exit(void)
 				kfree(info->fbcon_par);
 				info->fbcon_par = NULL;
 			}
+
+			fbcon_release(info);
 		}
 	}
 }
-- 
2.33.0

