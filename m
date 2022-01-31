Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDB94A50E0
	for <lists+linux-fbdev@lfdr.de>; Mon, 31 Jan 2022 22:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380212AbiAaVG6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 31 Jan 2022 16:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379872AbiAaVGt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 31 Jan 2022 16:06:49 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD0DC06173B
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:43 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a13so27908563wrh.9
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AGFhDGryxjuBc9pLIOSfx0xFgTrTTX1sIqhqyt/kJz8=;
        b=k4RCrbw2SzASAe0fFcoeoFRDLS+QUlQzEZQGK+mgi5w94n2tRyrosagvguSOBMTayW
         cix/RUsFZwPt185f+02AQeMrThDpNBY6n/t2Jzf8mROm3DdJ0y8rtDN5jBvFCtMr2M3X
         olDb26S4XtUepgHpZ2zYxleHGUBVNLrRM3ibg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AGFhDGryxjuBc9pLIOSfx0xFgTrTTX1sIqhqyt/kJz8=;
        b=LmDKoAjxxW/MDY+fEi/JSAj5iUVmi6rclQzCNJN9MnyI88gig+PK5MHRCkw7GsND+a
         YTWx76OM5OdShkpft5L91UAMbtA26/Y2+mxp/mJRWgz9GfmuuEPUev7ZsAD9EDoqV34O
         W4yDKRsZuYFKPIrGX2meFBKAx+0ZD1JRNJKMlEQv28gU301clmk3Ly44QEUWci2I+cVd
         x5ZQUKtlD4gwKEy/WnsPiJ3/OiEDd5szdKKSZ4fxaFLELbL5XZb4L2hv3oRXpA9bLPUr
         lgI/Iii2Ohg1Iaxqziul9STTpvEfib0aECXTiPQT9EoO02Z8XxqKFbj5T9uXmjh2Sjuh
         jlEw==
X-Gm-Message-State: AOAM530QBtZqLzmJ4Xhl9f/btfFOT6KLs/nXLIf5cI9yMaZ71li0UJGH
        dIb7hTaM4H23DlO9cZaZXtPduMhjrlT3JQ==
X-Google-Smtp-Source: ABdhPJxZZ1xhuWVtSzpEobDrhChDtXcf2nVaPsVwPmajZXySVFdry9xQXezcJiObqHaPqFMFr0Y7Mg==
X-Received: by 2002:a5d:6f10:: with SMTP id ay16mr19478357wrb.205.1643663202537;
        Mon, 31 Jan 2022 13:06:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:06:42 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Claudio Suarez <cssk@net-c.es>, Du Cheng <ducheng2@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH 08/21] fbcon: Use delayed work for cursor
Date:   Mon, 31 Jan 2022 22:05:39 +0100
Message-Id: <20220131210552.482606-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Allows us to delete a bunch of hand-rolled stuff. Also to simplify the
code we initialize the cursor_work completely when we allocate the
fbcon_ops structure, instead of trying to cope with console
re-initialization.

The motiviation here is that fbcon code stops using the fb_info.queue,
which helps with locking issues around cleanup and all that in a later
patch.

Also note that this allows us to ditch the hand-rolled work cleanup in
fbcon_exit - we already call fbcon_del_cursor_timer, which takes care
of everything. Plus this was racy anyway.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/video/fbdev/core/fbcon.c | 85 +++++++++++++-------------------
 drivers/video/fbdev/core/fbcon.h |  4 +-
 2 files changed, 35 insertions(+), 54 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 814b648e8f09..affb40658fee 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -348,8 +348,8 @@ static int get_color(struct vc_data *vc, struct fb_info *info,
 
 static void fb_flashcursor(struct work_struct *work)
 {
-	struct fb_info *info = container_of(work, struct fb_info, queue);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon_ops *ops = container_of(work, struct fbcon_ops, cursor_work.work);
+	struct fb_info *info;
 	struct vc_data *vc = NULL;
 	int c;
 	int mode;
@@ -362,7 +362,10 @@ static void fb_flashcursor(struct work_struct *work)
 	if (ret == 0)
 		return;
 
-	if (ops && ops->currcon != -1)
+	/* protected by console_lock */
+	info = ops->info;
+
+	if (ops->currcon != -1)
 		vc = vc_cons[ops->currcon].d;
 
 	if (!vc || !con_is_visible(vc) ||
@@ -378,42 +381,25 @@ static void fb_flashcursor(struct work_struct *work)
 	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
 		    get_color(vc, info, c, 0));
 	console_unlock();
-}
 
-static void cursor_timer_handler(struct timer_list *t)
-{
-	struct fbcon_ops *ops = from_timer(ops, t, cursor_timer);
-	struct fb_info *info = ops->info;
-
-	queue_work(system_power_efficient_wq, &info->queue);
-	mod_timer(&ops->cursor_timer, jiffies + ops->cur_blink_jiffies);
+	queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
+			   ops->cur_blink_jiffies);
 }
 
-static void fbcon_add_cursor_timer(struct fb_info *info)
+static void fbcon_add_cursor_work(struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if ((!info->queue.func || info->queue.func == fb_flashcursor) &&
-	    !(ops->flags & FBCON_FLAGS_CURSOR_TIMER) &&
-	    !fbcon_cursor_noblink) {
-		if (!info->queue.func)
-			INIT_WORK(&info->queue, fb_flashcursor);
-
-		timer_setup(&ops->cursor_timer, cursor_timer_handler, 0);
-		mod_timer(&ops->cursor_timer, jiffies + ops->cur_blink_jiffies);
-		ops->flags |= FBCON_FLAGS_CURSOR_TIMER;
-	}
+	if (!fbcon_cursor_noblink)
+		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
+				   ops->cur_blink_jiffies);
 }
 
-static void fbcon_del_cursor_timer(struct fb_info *info)
+static void fbcon_del_cursor_work(struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if (info->queue.func == fb_flashcursor &&
-	    ops->flags & FBCON_FLAGS_CURSOR_TIMER) {
-		del_timer_sync(&ops->cursor_timer);
-		ops->flags &= ~FBCON_FLAGS_CURSOR_TIMER;
-	}
+	cancel_delayed_work_sync(&ops->cursor_work);
 }
 
 #ifndef MODULE
@@ -712,6 +698,8 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
 		if (!ops)
 			err = -ENOMEM;
+
+		INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
 	}
 
 	if (!err) {
@@ -749,7 +737,7 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 	}
 
 	if (!err) {
-		fbcon_del_cursor_timer(oldinfo);
+		fbcon_del_cursor_work(oldinfo);
 		kfree(ops->cursor_state.mask);
 		kfree(ops->cursor_data);
 		kfree(ops->cursor_src);
@@ -865,7 +853,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 				 logo_shown != FBCON_LOGO_DONTSHOW);
 
 		if (!found)
-			fbcon_add_cursor_timer(info);
+			fbcon_add_cursor_work(info);
 		con2fb_map_boot[unit] = newidx;
 		con2fb_init_display(vc, info, unit, show_logo);
 	}
@@ -962,6 +950,8 @@ static const char *fbcon_startup(void)
 		return NULL;
 	}
 
+	INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
+
 	ops->currcon = -1;
 	ops->graphics = 1;
 	ops->cur_rotate = -1;
@@ -1004,7 +994,7 @@ static const char *fbcon_startup(void)
 		 info->var.yres,
 		 info->var.bits_per_pixel);
 
-	fbcon_add_cursor_timer(info);
+	fbcon_add_cursor_work(info);
 	return display_desc;
 }
 
@@ -1194,7 +1184,7 @@ static void fbcon_deinit(struct vc_data *vc)
 		goto finished;
 
 	if (con_is_visible(vc))
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 
 	ops->flags &= ~FBCON_FLAGS_INIT;
 finished:
@@ -1320,9 +1310,9 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
 		return;
 
 	if (vc->vc_cursor_type & CUR_SW)
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	else
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 
 	ops->cursor_flash = (mode == CM_ERASE) ? 0 : 1;
 
@@ -2149,14 +2139,14 @@ static int fbcon_switch(struct vc_data *vc)
 		}
 
 		if (old_info != info)
-			fbcon_del_cursor_timer(old_info);
+			fbcon_del_cursor_work(old_info);
 	}
 
 	if (fbcon_is_inactive(vc, info) ||
 	    ops->blank_state != FB_BLANK_UNBLANK)
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	else
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 
 	set_blitting_type(vc, info);
 	ops->cursor_reset = 1;
@@ -2264,9 +2254,9 @@ static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 
 	if (mode_switch || fbcon_is_inactive(vc, info) ||
 	    ops->blank_state != FB_BLANK_UNBLANK)
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	else
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 
 	return 0;
 }
@@ -3198,7 +3188,7 @@ static ssize_t show_cursor_blink(struct device *device,
 	if (!ops)
 		goto err;
 
-	blink = (ops->flags & FBCON_FLAGS_CURSOR_TIMER) ? 1 : 0;
+	blink = delayed_work_pending(&ops->cursor_work);
 err:
 	console_unlock();
 	return snprintf(buf, PAGE_SIZE, "%d\n", blink);
@@ -3227,10 +3217,10 @@ static ssize_t store_cursor_blink(struct device *device,
 
 	if (blink) {
 		fbcon_cursor_noblink = 0;
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 	} else {
 		fbcon_cursor_noblink = 1;
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	}
 
 err:
@@ -3331,15 +3321,9 @@ static void fbcon_exit(void)
 #endif
 
 	for_each_registered_fb(i) {
-		int pending = 0;
-
 		mapped = 0;
 		info = registered_fb[i];
 
-		if (info->queue.func)
-			pending = cancel_work_sync(&info->queue);
-		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" : "no"));
-
 		for (j = first_fb_vc; j <= last_fb_vc; j++) {
 			if (con2fb_map[j] == i) {
 				mapped = 1;
@@ -3355,15 +3339,12 @@ static void fbcon_exit(void)
 			if (info->fbcon_par) {
 				struct fbcon_ops *ops = info->fbcon_par;
 
-				fbcon_del_cursor_timer(info);
+				fbcon_del_cursor_work(info);
 				kfree(ops->cursor_src);
 				kfree(ops->cursor_state.mask);
 				kfree(info->fbcon_par);
 				info->fbcon_par = NULL;
 			}
-
-			if (info->queue.func == fb_flashcursor)
-				info->queue.func = NULL;
 		}
 	}
 }
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 5246d0f2574b..dce5ce41093e 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -14,11 +14,11 @@
 #include <linux/types.h>
 #include <linux/vt_buffer.h>
 #include <linux/vt_kern.h>
+#include <linux/workqueue.h>
 
 #include <asm/io.h>
 
 #define FBCON_FLAGS_INIT         1
-#define FBCON_FLAGS_CURSOR_TIMER 2
 
    /*
     *    This is the interface between the low-level console driver and the
@@ -66,7 +66,7 @@ struct fbcon_ops {
 	int  (*update_start)(struct fb_info *info);
 	int  (*rotate_font)(struct fb_info *info, struct vc_data *vc);
 	struct fb_var_screeninfo var;  /* copy of the current fb_var_screeninfo */
-	struct timer_list cursor_timer; /* Cursor timer */
+	struct delayed_work cursor_work; /* Cursor timer */
 	struct fb_cursor cursor_state;
 	struct fbcon_display *p;
 	struct fb_info *info;
-- 
2.33.0

