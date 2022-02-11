Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7FDE4B2265
	for <lists+linux-fbdev@lfdr.de>; Fri, 11 Feb 2022 10:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348701AbiBKJqq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 11 Feb 2022 04:46:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343993AbiBKJqp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 11 Feb 2022 04:46:45 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7254F10A3
        for <linux-fbdev@vger.kernel.org>; Fri, 11 Feb 2022 01:46:44 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0E0611F3A8;
        Fri, 11 Feb 2022 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644572803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qVKrwMsROLRcrUgnApcZT+Kuuo7mg1Slm+pq26/e1xo=;
        b=yMVxM1b4vPkydKV1sG/wHJP8GwBYHSXaM1Jsor1cglL713lo0dfpnmLEUNFL9Og0qbig5l
        6uYUaAR0ZLC2uDkROjh3N6W4NRgA9lB4N02oGRceSonxsv85/R9pEqoyfaLNRj7voC8CIv
        +1utKgOVHPqitvznO3rKnZfX/Q6aHng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644572803;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qVKrwMsROLRcrUgnApcZT+Kuuo7mg1Slm+pq26/e1xo=;
        b=wHtvpwJWzEL4aXU6he3rjD4Suk7MazL76AgbhA7tT1OP2xrGLCw6yVESITaQrtPjZhqq5y
        ogUbBEJcwDrkUoDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE44E13BC3;
        Fri, 11 Feb 2022 09:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wIB4LYIwBmKMHQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 09:46:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, noralf@tronnes.org,
        andriy.shevchenko@linux.intel.com, deller@gmx.de,
        bernie@plugable.com, jayalk@intworks.biz
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/2] fbdev: Don't sorting deferred-I/O pages by default
Date:   Fri, 11 Feb 2022 10:46:40 +0100
Message-Id: <20220211094640.21632-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211094640.21632-1-tzimmermann@suse.de>
References: <20220211094640.21632-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fbdev's deferred I/O sorts all dirty pages by default, which incurs a
significant overhead. Make the sorting step optional and update the few
drivers that require it. Use a FIFO list by default.

Most fbdev drivers with deferred I/O build a bounding rectangle around
the dirty pages or simply flush the whole screen. The only two affected
DRM drivers, generic fbdev and vmwgfx, both use a bounding rectangle.
In those cases, the exact order of the pages doesn't matter. The other
drivers look at the page index or handle pages one-by-one. The patch
sets the sort_pagelist flag for those, even though some of them would
probably work correctly without sorting. Driver maintainers should update
their driver accordingly.

Sorting pages by memory offset for deferred I/O performs an implicit
bubble-sort step on the list of dirty pages. The algorithm goes through
the list of dirty pages and inserts each new page according to its
index field. Even worse, list traversal always starts at the first
entry. As video memory is most likely updated scanline by scanline, the
algorithm traverses through the complete list for each updated page.

For example, with 1024x768x32bpp each page covers exactly one scanline.
Writing a single screen update from top to bottom requires updating
768 pages. With an average list length of 384 entries, a screen update
creates (768 * 384 =) 294912 compare operation.

Fix this by making the sorting step opt-in and update the few drivers
that require it. All other drivers work with unsorted page lists. Pages
are appended to the list. Therefore, in the common case of writing the
framebuffer top to bottom, pages are still sorted by offset, which may
have a positive effect on performance.

Playing a video [1] in mplayer's benchmark mode shows the difference
(i7-4790, FullHD, simpledrm, kernel with debugging).

  mplayer -benchmark -nosound -vo fbdev ./big_buck_bunny_720p_stereo.ogg

With sorted page lists:

  BENCHMARKs: VC:  32.960s VO:  73.068s A:   0.000s Sys:   2.413s =  108.441s
  BENCHMARK%: VC: 30.3947% VO: 67.3802% A:  0.0000% Sys:  2.2251% = 100.0000%

With unsorted page lists:

  BENCHMARKs: VC:  31.005s VO:  42.889s A:   0.000s Sys:   2.256s =   76.150s
  BENCHMARK%: VC: 40.7156% VO: 56.3219% A:  0.0000% Sys:  2.9625% = 100.0000%

VC shows the overhead of video decoding, VO shows the overhead of the
video output. Using unsorted page lists reduces the benchmark's run time
by ~32s/~25%.

v2:
	* Make sorted pagelists the special case (Sam)
	* Comment on drivers' use of pagelist (Sam)
	* Warn about the overhead in comment

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_stereo.ogg # [1]
---
 drivers/staging/fbtft/fbtft-core.c  |  1 +
 drivers/video/fbdev/broadsheetfb.c  |  1 +
 drivers/video/fbdev/core/fb_defio.c | 24 +++++++++++++++++-------
 drivers/video/fbdev/metronomefb.c   |  1 +
 drivers/video/fbdev/udlfb.c         |  1 +
 include/linux/fb.h                  |  1 +
 6 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f2684d2d6851..4a35347b3020 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -654,6 +654,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	fbops->fb_blank     =      fbtft_fb_blank;
 
 	fbdefio->delay =           HZ / fps;
+	fbdefio->sort_pagelist =   true;
 	fbdefio->deferred_io =     fbtft_deferred_io;
 	fb_deferred_io_init(info);
 
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index fd66f4d4a621..b9054f658838 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1059,6 +1059,7 @@ static const struct fb_ops broadsheetfb_ops = {
 
 static struct fb_deferred_io broadsheetfb_defio = {
 	.delay		= HZ/4,
+	.sort_pagelist	= true,
 	.deferred_io	= broadsheetfb_dpy_deferred_io,
 };
 
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 169a81c8172b..98b0f23bf5e2 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -96,7 +96,7 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	struct page *page = vmf->page;
 	struct fb_info *info = vmf->vma->vm_private_data;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
-	struct page *cur;
+	struct list_head *pos = &fbdefio->pagelist;
 
 	/* this is a callback we get when userspace first tries to
 	write to the page. we schedule a workqueue. that workqueue
@@ -137,14 +137,24 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	if (!list_empty(&page->lru))
 		goto page_already_added;
 
-	/* we loop through the pagelist before adding in order
-	to keep the pagelist sorted */
-	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
-		if (cur->index > page->index)
-			break;
+	if (unlikely(fbdefio->sort_pagelist)) {
+		/*
+		 * We loop through the pagelist before adding in order to
+		 * keep the pagelist sorted. This has significant overhead
+		 * of O(n^2) with n being the number of written pages. If
+		 * possible, drivers should try to work with unsorted page
+		 * lists instead.
+		 */
+		struct page *cur;
+
+		list_for_each_entry(cur, &fbdefio->pagelist, lru) {
+			if (cur->index > page->index)
+				break;
+		}
+		pos = &cur->lru;
 	}
 
-	list_add_tail(&page->lru, &cur->lru);
+	list_add_tail(&page->lru, pos);
 
 page_already_added:
 	mutex_unlock(&fbdefio->lock);
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 952826557a0c..af858dd23ea6 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -568,6 +568,7 @@ static const struct fb_ops metronomefb_ops = {
 
 static struct fb_deferred_io metronomefb_defio = {
 	.delay		= HZ,
+	.sort_pagelist	= true,
 	.deferred_io	= metronomefb_dpy_deferred_io,
 };
 
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b9cdd02c1000..184bb8433b78 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -980,6 +980,7 @@ static int dlfb_ops_open(struct fb_info *info, int user)
 
 		if (fbdefio) {
 			fbdefio->delay = DL_DEFIO_WRITE_DELAY;
+			fbdefio->sort_pagelist = true;
 			fbdefio->deferred_io = dlfb_dpy_deferred_io;
 		}
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3d7306c9a706..9a77ab615c36 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -204,6 +204,7 @@ struct fb_pixmap {
 struct fb_deferred_io {
 	/* delay between mkwrite and deferred handler */
 	unsigned long delay;
+	bool sort_pagelist; /* sort pagelist by offset */
 	struct mutex lock; /* mutex that protects the page list */
 	struct list_head pagelist; /* list of touched pages */
 	/* callback */
-- 
2.34.1

