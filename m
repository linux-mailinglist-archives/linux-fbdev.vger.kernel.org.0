Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D574A5119
	for <lists+linux-fbdev@lfdr.de>; Mon, 31 Jan 2022 22:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380495AbiAaVI4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 31 Jan 2022 16:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380546AbiAaVHI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 31 Jan 2022 16:07:08 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38EDC061759
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:53 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c192so11178237wma.4
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 13:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BL4fo+2WOVTby6QLKLV1nVWtvQ3JNOhu+8wB2s/+LIQ=;
        b=lLAk+I5V89CC9MFc55MMdOMjGF/tYWATRKVaKN+mU+U/Zp9rNdtcHwwA4O9ivim8U4
         uhebJSd0VSHz4+CYgUEh4M7+LU+xaEJZG+163OfCeS7yOE+ftK3RBaICg7lCK+O10tNI
         7MA38sqKnpewyjNRhdRuH71H/gnUy0kn0+j0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BL4fo+2WOVTby6QLKLV1nVWtvQ3JNOhu+8wB2s/+LIQ=;
        b=g4acAdNmvnmO1SrY96JjVVRDocamv+Lad9uf3x/aNPBHEgDqk5wrAjwdeIXUjEWrAP
         HpA/gxDbNdOiOunSA222bjZmwbhD5LKoKv+qlwDEPLOoaIz30cXVZf7Jgeu2WzYrMYPb
         kZuriVZHyf+hD6NWUzq1n7ItOMHwCUkgsgLwPZtvQmFvW65UaJTG56gYKo4LFwBJD/Zw
         sY2Fj9Mp7hU/gROCdh3tIKpFAVEZpKJ5TicOP4722VL7dtXHtbk/3orO71V4SnCE7ehz
         4yNs7Kso3X4p/pCBwHBESVark7fuo0OkjJE2v8wx6HG36MW1EaogrxNOl/PgdNhRUtjf
         pUQA==
X-Gm-Message-State: AOAM533tX8udQhkPlA3NpH8fBaCtVCosw5DXNpf8UWLloecHK4F/QPoc
        5SDjUC7gmJ85lTeDLpiGusPa9w==
X-Google-Smtp-Source: ABdhPJym9NA44EvixyMQWymA9HgMTQo3UEXCCeTnD39yMkLuzcB/0jUZ9xIYu3slC/yauz5ZL1NXmg==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr20179198wmc.99.1643663212301;
        Mon, 31 Jan 2022 13:06:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:06:51 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Claudio Suarez <cssk@net-c.es>, Du Cheng <ducheng2@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 19/21] fbcon: Maintain a private array of fb_info
Date:   Mon, 31 Jan 2022 22:05:50 +0100
Message-Id: <20220131210552.482606-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Accessing the one in fbmem.c without taking the right locks is a bad
idea. Instead maintain our own private copy, which is fully protected
by console_lock() (like everything else in fbcon.c). That copy is
serialized through fbcon_fb_registered/unregistered() calls.

Also this means we do not need to hold a full fb_info reference, which
is nice because doing so would mean a refcount loop between the
console and the fb_info. But it's also not nice since it means
console_lock() must be held absolutely everywhere. Well strictly
speaking we could still try to do some refcounting games again by
calling get_fb_info before we drop the console_lock. But things will
get tricky.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbcon.c | 82 +++++++++++++++++---------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 22581952b4fd..a0ca34b29615 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -86,10 +86,6 @@
  * - fbcon state itself is protected by the console_lock, and the code does a
  *   pretty good job at making sure that lock is held everywhere it's needed.
  *
- * - access to the registered_fb array is entirely unprotected. This should use
- *   proper object lifetime handling, i.e. get/put_fb_info. This also means
- *   switching from indices to proper pointers for fb_info everywhere.
- *
  * - fbcon doesn't bother with fb_lock/unlock at all. This is buggy, since it
  *   means concurrent access to the same fbdev from both fbcon and userspace
  *   will blow up. To fix this all fbcon calls from fbmem.c need to be moved out
@@ -107,6 +103,13 @@ enum {
 
 static struct fbcon_display fb_display[MAX_NR_CONSOLES];
 
+struct fb_info *fbcon_registered_fb[FB_MAX];
+int fbcon_num_registered_fb;
+
+#define fbcon_for_each_registered_fb(i)		\
+	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
+		if (!fbcon_registered_fb[i]) {} else
+
 static signed char con2fb_map[MAX_NR_CONSOLES];
 static signed char con2fb_map_boot[MAX_NR_CONSOLES];
 
@@ -114,12 +117,7 @@ static struct fb_info *fbcon_info_from_console(int console)
 {
 	WARN_CONSOLE_UNLOCKED();
 
-	/*
-	 * Note that only con2fb_map is protected by the console lock,
-	 * registered_fb is protected by a separate mutex. This lookup can
-	 * therefore race.
-	 */
-	return registered_fb[con2fb_map[console]];
+	return fbcon_registered_fb[con2fb_map[console]];
 }
 
 static int logo_lines;
@@ -516,7 +514,7 @@ static int do_fbcon_takeover(int show_logo)
 {
 	int err, i;
 
-	if (!num_registered_fb)
+	if (!fbcon_num_registered_fb)
 		return -ENODEV;
 
 	if (!show_logo)
@@ -822,7 +820,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 {
 	struct vc_data *vc = vc_cons[unit].d;
 	int oldidx = con2fb_map[unit];
-	struct fb_info *info = registered_fb[newidx];
+	struct fb_info *info = fbcon_registered_fb[newidx];
 	struct fb_info *oldinfo = NULL;
 	int found, err = 0, show_logo;
 
@@ -840,7 +838,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 	}
 
 	if (oldidx != -1)
-		oldinfo = registered_fb[oldidx];
+		oldinfo = fbcon_registered_fb[oldidx];
 
 	found = search_fb_in_map(newidx);
 
@@ -932,13 +930,13 @@ static const char *fbcon_startup(void)
 	 *  If num_registered_fb is zero, this is a call for the dummy part.
 	 *  The frame buffer devices weren't initialized yet.
 	 */
-	if (!num_registered_fb || info_idx == -1)
+	if (!fbcon_num_registered_fb || info_idx == -1)
 		return display_desc;
 	/*
 	 * Instead of blindly using registered_fb[0], we use info_idx, set by
 	 * fbcon_fb_registered();
 	 */
-	info = registered_fb[info_idx];
+	info = fbcon_registered_fb[info_idx];
 	if (!info)
 		return NULL;
 	
@@ -1153,9 +1151,9 @@ static void fbcon_release_all(void)
 	struct fb_info *info;
 	int i, j, mapped;
 
-	for_each_registered_fb(i) {
+	fbcon_for_each_registered_fb(i) {
 		mapped = 0;
-		info = registered_fb[i];
+		info = fbcon_registered_fb[i];
 
 		for (j = first_fb_vc; j <= last_fb_vc; j++) {
 			if (con2fb_map[j] == i) {
@@ -1182,7 +1180,7 @@ static void fbcon_deinit(struct vc_data *vc)
 	if (idx == -1)
 		goto finished;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 
 	if (!info)
 		goto finished;
@@ -2118,9 +2116,9 @@ static int fbcon_switch(struct vc_data *vc)
 	 *
 	 * info->currcon = vc->vc_num;
 	 */
-	for_each_registered_fb(i) {
-		if (registered_fb[i]->fbcon_par) {
-			struct fbcon_ops *o = registered_fb[i]->fbcon_par;
+	fbcon_for_each_registered_fb(i) {
+		if (fbcon_registered_fb[i]->fbcon_par) {
+			struct fbcon_ops *o = fbcon_registered_fb[i]->fbcon_par;
 
 			o->currcon = vc->vc_num;
 		}
@@ -2765,7 +2763,7 @@ int fbcon_mode_deleted(struct fb_info *info,
 		j = con2fb_map[i];
 		if (j == -1)
 			continue;
-		fb_info = registered_fb[j];
+		fb_info = fbcon_registered_fb[j];
 		if (fb_info != info)
 			continue;
 		p = &fb_display[i];
@@ -2821,7 +2819,7 @@ void fbcon_fb_unbind(struct fb_info *info)
 				set_con2fb_map(i, new_idx, 0);
 		}
 	} else {
-		struct fb_info *info = registered_fb[idx];
+		struct fb_info *info = fbcon_registered_fb[idx];
 
 		/* This is sort of like set_con2fb_map, except it maps
 		 * the consoles to no device and then releases the
@@ -2851,6 +2849,9 @@ void fbcon_fb_unregistered(struct fb_info *info)
 
 	console_lock();
 
+	fbcon_registered_fb[info->node] = NULL;
+	fbcon_num_registered_fb--;
+
 	if (deferred_takeover) {
 		console_unlock();
 		return;
@@ -2865,7 +2866,7 @@ void fbcon_fb_unregistered(struct fb_info *info)
 	if (idx == info_idx) {
 		info_idx = -1;
 
-		for_each_registered_fb(i) {
+		fbcon_for_each_registered_fb(i) {
 			info_idx = i;
 			break;
 		}
@@ -2881,7 +2882,7 @@ void fbcon_fb_unregistered(struct fb_info *info)
 	if (primary_device == idx)
 		primary_device = -1;
 
-	if (!num_registered_fb)
+	if (!fbcon_num_registered_fb)
 		do_unregister_con_driver(&fb_con);
 	console_unlock();
 }
@@ -2956,6 +2957,9 @@ int fbcon_fb_registered(struct fb_info *info)
 	else
 		atomic_inc(&ignore_console_lock_warning);
 
+	fbcon_registered_fb[info->node] = info;
+	fbcon_num_registered_fb++;
+
 	idx = info->node;
 	fbcon_select_primary(info);
 
@@ -3075,9 +3079,9 @@ int fbcon_set_con2fb_map_ioctl(void __user *argp)
 		return -EINVAL;
 	if (con2fb.framebuffer >= FB_MAX)
 		return -EINVAL;
-	if (!registered_fb[con2fb.framebuffer])
+	if (!fbcon_registered_fb[con2fb.framebuffer])
 		request_module("fb%d", con2fb.framebuffer);
-	if (!registered_fb[con2fb.framebuffer]) {
+	if (!fbcon_registered_fb[con2fb.framebuffer]) {
 		return -EINVAL;
 	}
 
@@ -3144,10 +3148,10 @@ static ssize_t store_rotate(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	rotate = simple_strtoul(buf, last, 0);
 	fbcon_rotate(info, rotate);
 err:
@@ -3166,10 +3170,10 @@ static ssize_t store_rotate_all(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	rotate = simple_strtoul(buf, last, 0);
 	fbcon_rotate_all(info, rotate);
 err:
@@ -3186,10 +3190,10 @@ static ssize_t show_rotate(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	rotate = fbcon_get_rotate(info);
 err:
 	console_unlock();
@@ -3206,10 +3210,10 @@ static ssize_t show_cursor_blink(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	ops = info->fbcon_par;
 
 	if (!ops)
@@ -3232,10 +3236,10 @@ static ssize_t store_cursor_blink(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 
 	if (!info->fbcon_par)
 		goto err;
@@ -3295,8 +3299,8 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
 	deferred_takeover = false;
 	logo_shown = FBCON_LOGO_DONTSHOW;
 
-	for_each_registered_fb(i)
-		fbcon_fb_registered(registered_fb[i]);
+	fbcon_for_each_registered_fb(i)
+		fbcon_fb_registered(fbcon_registered_fb[i]);
 
 	console_unlock();
 }
-- 
2.33.0

