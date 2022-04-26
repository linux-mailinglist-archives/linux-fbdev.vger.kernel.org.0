Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E7350FC70
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 Apr 2022 14:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbiDZMHO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 26 Apr 2022 08:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349734AbiDZMHM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 26 Apr 2022 08:07:12 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A07D8909
        for <linux-fbdev@vger.kernel.org>; Tue, 26 Apr 2022 05:04:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 586301F38D;
        Tue, 26 Apr 2022 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1650974642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WNRij0NkQCz7Y6lfWUpFic/qf+bGCGIhY2fVjhlw9tQ=;
        b=kmPijrNm/2O1MiZ6Kdm9U32B4kTQ/6gxMmVxOeKiRhpkvHMsQU3htLw54E5CDNvpRyvPKc
        i9cAg6Y7TLoxuCu0+I7dlDGsfBgRvHnXGCPO6xnMZAXlhj/XCtqNIvno2zxDdVcvIoN2+k
        4U2zaWhW78ukfAA85vRAYRrtxbk5sqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1650974642;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WNRij0NkQCz7Y6lfWUpFic/qf+bGCGIhY2fVjhlw9tQ=;
        b=8HO0jdvaaMVb3ksxfk5pNTHz6UC+EgDlc2E3X8yeIiOcwOnMqRUOB0RZck6xnA6T3myLEA
        +eWkl3epzTCXeeCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EA4913AE0;
        Tue, 26 Apr 2022 12:04:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wGx9CrLfZ2KqBQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 12:04:02 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de,
        airlied@linux.ie, maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 5/5] fbdev: Use pageref offset for deferred-I/O writeback
Date:   Tue, 26 Apr 2022 14:03:59 +0200
Message-Id: <20220426120359.17437-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426120359.17437-1-tzimmermann@suse.de>
References: <20220426120359.17437-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Use pageref->offset instead of page->index for deferred-I/O writeback
where appropriate. Distinguishes between file-mapping offset and video-
memory offset. While at it, also remove unnecessary references to
struct page.

Fbdev's deferred-I/O code uses the two related page->index and
pageref->offset. The former is the page offset in the mapped file,
the latter is the byte offset in the video memory (or fbdev screen
buffer). It's the same value for fbdev drivers, but for DRM the values
can be different. Because GEM buffer objects are mapped at an offset
in the DRM device file, page->index has this offset added to it as well.
We currently don't hit this case in DRM, because all affected mappings
of GEM memory are performed with an internal, intermediate shadow buffer.

The value of page->index is required by page_mkclean(), which we
call to reset the mappings during the writeback phase of the deferred
I/O. The value of pageref->offset is for conveniently getting an offset
into video memory in fb helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  3 +--
 drivers/staging/fbtft/fbtft-core.c     |  9 +++------
 drivers/video/fbdev/broadsheetfb.c     | 13 ++++++-------
 drivers/video/fbdev/hyperv_fb.c        |  3 +--
 drivers/video/fbdev/metronomefb.c      |  9 ++++-----
 drivers/video/fbdev/sh_mobile_lcdcfb.c |  3 +--
 drivers/video/fbdev/smscufx.c          |  3 +--
 drivers/video/fbdev/udlfb.c            |  6 ++----
 drivers/video/fbdev/xen-fbfront.c      |  3 +--
 9 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 9a3dc5c4eec8..0ba9739f406d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -327,8 +327,7 @@ static void vmw_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 	min = ULONG_MAX;
 	max = 0;
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *page = pageref->page;
-		start = page->index << PAGE_SHIFT;
+		start = pageref->offset;
 		end = start + PAGE_SIZE - 1;
 		min = min(min, start);
 		max = max(max, end);
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8774bffe94cc..60b2278d8b16 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -327,7 +327,6 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 	struct fbtft_par *par = info->par;
 	unsigned int dirty_lines_start, dirty_lines_end;
 	struct fb_deferred_io_pageref *pageref;
-	unsigned long index;
 	unsigned int y_low = 0, y_high = 0;
 	int count = 0;
 
@@ -341,14 +340,12 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 
 	/* Mark display lines as dirty */
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *page = pageref->page;
 		count++;
-		index = page->index << PAGE_SHIFT;
-		y_low = index / info->fix.line_length;
-		y_high = (index + PAGE_SIZE - 1) / info->fix.line_length;
+		y_low = pageref->offset / info->fix.line_length;
+		y_high = (pageref->offset + PAGE_SIZE - 1) / info->fix.line_length;
 		dev_dbg(info->device,
 			"page->index=%lu y_low=%d y_high=%d\n",
-			page->index, y_low, y_high);
+			pageref->page->index, y_low, y_high);
 		if (y_high > info->var.yres - 1)
 			y_high = info->var.yres - 1;
 		if (y_low < dirty_lines_start)
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 883a3ac03189..55e62dd96f9b 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -932,7 +932,7 @@ static void broadsheetfb_dpy_update(struct broadsheetfb_par *par)
 static void broadsheetfb_dpy_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	u16 y1 = 0, h = 0;
-	int prev_index = -1;
+	unsigned long prev_offset = ULONG_MAX;
 	struct fb_deferred_io_pageref *pageref;
 	int h_inc;
 	u16 yres = info->var.yres;
@@ -943,22 +943,21 @@ static void broadsheetfb_dpy_deferred_io(struct fb_info *info, struct list_head
 
 	/* walk the written page list and swizzle the data */
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *cur = pageref->page;
-		if (prev_index < 0) {
+		if (prev_offset == ULONG_MAX) {
 			/* just starting so assign first page */
-			y1 = (cur->index << PAGE_SHIFT) / xres;
+			y1 = pageref->offset / xres;
 			h = h_inc;
-		} else if ((prev_index + 1) == cur->index) {
+		} else if ((prev_offset + PAGE_SIZE) == pageref->offset) {
 			/* this page is consecutive so increase our height */
 			h += h_inc;
 		} else {
 			/* page not consecutive, issue previous update first */
 			broadsheetfb_dpy_update_pages(info->par, y1, y1 + h);
 			/* start over with our non consecutive page */
-			y1 = (cur->index << PAGE_SHIFT) / xres;
+			y1 = pageref->offset / xres;
 			h = h_inc;
 		}
-		prev_index = cur->index;
+		prev_offset = pageref->offset;
 	}
 
 	/* if we still have any pages to update we do so now */
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 550cf0990070..8359a513b600 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -437,8 +437,7 @@ static void synthvid_deferred_io(struct fb_info *p, struct list_head *pagereflis
 	 * value to yres.
 	 */
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *page = pageref->page;
-		start = page->index << PAGE_SHIFT;
+		start = pageref->offset;
 		end = start + PAGE_SIZE - 1;
 		y1 = start / p->fix.line_length;
 		y2 = end / p->fix.line_length;
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index f581c73d39df..9fd4bb85d735 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -473,11 +473,10 @@ static void metronomefb_dpy_deferred_io(struct fb_info *info, struct list_head *
 
 	/* walk the written page list and swizzle the data */
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *cur = pageref->page;
-		cksum = metronomefb_dpy_update_page(par,
-					(cur->index << PAGE_SHIFT));
-		par->metromem_img_csum -= par->csum_table[cur->index];
-		par->csum_table[cur->index] = cksum;
+		unsigned long pgoffset = pageref->offset >> PAGE_SHIFT;
+		cksum = metronomefb_dpy_update_page(par, pageref->offset);
+		par->metromem_img_csum -= par->csum_table[pgoffset];
+		par->csum_table[pgoffset] = cksum;
 		par->metromem_img_csum += cksum;
 	}
 
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index d36c2e63f516..de86a04782fd 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -445,8 +445,7 @@ static int sh_mobile_lcdc_sginit(struct fb_info *info, struct list_head *pageref
 	sg_init_table(ch->sglist, nr_pages_max);
 
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *page = pageref->page;
-		sg_set_page(&ch->sglist[nr_pages++], page, PAGE_SIZE, 0);
+		sg_set_page(&ch->sglist[nr_pages++], pageref->page, PAGE_SIZE, 0);
 	}
 
 	return nr_pages;
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 7f00605bc0d1..d7aa5511c361 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -970,10 +970,9 @@ static void ufx_dpy_deferred_io(struct fb_info *info, struct list_head *pagerefl
 	list_for_each_entry(pageref, pagereflist, list) {
 		/* create a rectangle of full screen width that encloses the
 		 * entire dirty framebuffer page */
-		struct page *cur = pageref->page;
 		const int x = 0;
 		const int width = dev->info->var.xres;
-		const int y = (cur->index << PAGE_SHIFT) / (width * 2);
+		const int y = pageref->offset / (width * 2);
 		int height = (PAGE_SIZE / (width * 2)) + 1;
 		height = min(height, (int)(dev->info->var.yres - y));
 
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index c3758613abff..e19cb8cc7a66 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -810,11 +810,9 @@ static void dlfb_dpy_deferred_io(struct fb_info *info, struct list_head *pageref
 
 	/* walk the written page list and render each to device */
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *cur = pageref->page;
-
 		if (dlfb_render_hline(dlfb, &urb, (char *) info->fix.smem_start,
-				  &cmd, cur->index << PAGE_SHIFT,
-				  PAGE_SIZE, &bytes_identical, &bytes_sent))
+				      &cmd, pageref->offset, PAGE_SIZE,
+				      &bytes_identical, &bytes_sent))
 			goto error;
 		bytes_rendered += PAGE_SIZE;
 	}
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index bc8244b9ce03..3bed357a9870 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -191,8 +191,7 @@ static void xenfb_deferred_io(struct fb_info *fb_info, struct list_head *pageref
 	miny = INT_MAX;
 	maxy = 0;
 	list_for_each_entry(pageref, pagereflist, list) {
-		struct page *page = pageref->page;
-		beg = page->index << PAGE_SHIFT;
+		beg = pageref->offset;
 		end = beg + PAGE_SIZE - 1;
 		y1 = beg / fb_info->fix.line_length;
 		y2 = end / fb_info->fix.line_length;
-- 
2.36.0

