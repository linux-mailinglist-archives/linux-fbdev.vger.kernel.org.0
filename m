Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5419E50FC6D
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 Apr 2022 14:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349744AbiDZMHM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 26 Apr 2022 08:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346290AbiDZMHL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 26 Apr 2022 08:07:11 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1826FD5EB8
        for <linux-fbdev@vger.kernel.org>; Tue, 26 Apr 2022 05:04:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 81D83210F4;
        Tue, 26 Apr 2022 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1650974641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0JNOx2g/+bX17yTNiiXtLxX5NEkWKKzVtOd4okZJadk=;
        b=LlT26UeObBTT18SEjyRsHyMckfhHt2rbQYhQdvJgZmr0PanLEnIMXRCdvRcGKfgBE9AeFh
        aHthRRvl+11NpVrKk4qRuFL3CUbe/kBMgJL3CnivhP5xq5QBskHNDFYv1ApURV+HAn+Ehh
        3M11s+2jKzY8aGfS8lJdUrKlbRKf+3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1650974641;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0JNOx2g/+bX17yTNiiXtLxX5NEkWKKzVtOd4okZJadk=;
        b=eLEalJcofTgybSJ1l3Wwp2Z7vsrIZkQjdUMJRL7zb3TTk9BsPBAo3Um0QlLg+xBL9u63tT
        9E/l/ISQqUEnKECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58C2E13AE0;
        Tue, 26 Apr 2022 12:04:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GM/HFLHfZ2KqBQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 12:04:01 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de,
        airlied@linux.ie, maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/5] fbdev: Put mmap for deferred I/O into drivers
Date:   Tue, 26 Apr 2022 14:03:55 +0200
Message-Id: <20220426120359.17437-2-tzimmermann@suse.de>
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

The fbdev mmap function fb_mmap() unconditionally overrides the
driver's implementation if deferred I/O has been activated. This
makes it hard to implement mmap with anything but a vmalloc()'ed
software buffer. That is specifically a problem for DRM, where
video memory is maintained by a memory manager.

Leave the mmap handling to drivers and expect them to call the
helper for deferred I/O by thmeselves.

v3:
	* fix warning if fb_mmap is missing (kernel test robot)
v2:
	* print a helpful error message if the defio setup is
	  incorrect (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c        |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  1 +
 drivers/hid/hid-picolcd_fb.c           |  1 +
 drivers/staging/fbtft/fbtft-core.c     |  1 +
 drivers/video/fbdev/broadsheetfb.c     |  1 +
 drivers/video/fbdev/core/fb_defio.c    |  1 +
 drivers/video/fbdev/core/fbmem.c       | 21 +++++++++++----------
 drivers/video/fbdev/hecubafb.c         |  1 +
 drivers/video/fbdev/hyperv_fb.c        |  1 +
 drivers/video/fbdev/metronomefb.c      |  1 +
 drivers/video/fbdev/sh_mobile_lcdcfb.c |  6 ++++++
 drivers/video/fbdev/smscufx.c          |  3 +++
 drivers/video/fbdev/ssd1307fb.c        |  1 +
 drivers/video/fbdev/udlfb.c            |  3 +++
 drivers/video/fbdev/xen-fbfront.c      |  1 +
 15 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d265a73313c9..d06ce0e92d66 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2118,7 +2118,9 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 
-	if (fb_helper->dev->driver->gem_prime_mmap)
+	if (drm_fbdev_use_shadow_fb(fb_helper))
+		return fb_deferred_io_mmap(info, vma);
+	else if (fb_helper->dev->driver->gem_prime_mmap)
 		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
 	else
 		return -ENODEV;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index adf17c740656..02a4a4fa3da3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -619,6 +619,7 @@ static const struct fb_ops vmw_fb_ops = {
 	.fb_imageblit = vmw_fb_imageblit,
 	.fb_pan_display = vmw_fb_pan_display,
 	.fb_blank = vmw_fb_blank,
+	.fb_mmap = fb_deferred_io_mmap,
 };
 
 int vmw_fb_init(struct vmw_private *vmw_priv)
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index 33c102a60992..78515e6bacf0 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -428,6 +428,7 @@ static const struct fb_ops picolcdfb_ops = {
 	.fb_imageblit = picolcd_fb_imageblit,
 	.fb_check_var = picolcd_fb_check_var,
 	.fb_set_par   = picolcd_set_par,
+	.fb_mmap      = fb_deferred_io_mmap,
 };
 
 
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9c4d797e7ae4..d4e14f7c9d57 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -652,6 +652,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	fbops->fb_imageblit =      fbtft_fb_imageblit;
 	fbops->fb_setcolreg =      fbtft_fb_setcolreg;
 	fbops->fb_blank     =      fbtft_fb_blank;
+	fbops->fb_mmap      =      fb_deferred_io_mmap;
 
 	fbdefio->delay =           HZ / fps;
 	fbdefio->sort_pagelist =   true;
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index b9054f658838..528bc0902338 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1055,6 +1055,7 @@ static const struct fb_ops broadsheetfb_ops = {
 	.fb_fillrect	= broadsheetfb_fillrect,
 	.fb_copyarea	= broadsheetfb_copyarea,
 	.fb_imageblit	= broadsheetfb_imageblit,
+	.fb_mmap	= fb_deferred_io_mmap,
 };
 
 static struct fb_deferred_io broadsheetfb_defio = {
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 6aaf6d0abf39..6924d489a289 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -181,6 +181,7 @@ int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	vma->vm_private_data = info;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(fb_deferred_io_mmap);
 
 /* workqueue callback */
 static void fb_deferred_io_work(struct work_struct *work)
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 84427470367b..e6b625548927 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1334,7 +1334,6 @@ static int
 fb_mmap(struct file *file, struct vm_area_struct * vma)
 {
 	struct fb_info *info = file_fb_info(file);
-	int (*fb_mmap_fn)(struct fb_info *info, struct vm_area_struct *vma);
 	unsigned long mmio_pgoff;
 	unsigned long start;
 	u32 len;
@@ -1343,14 +1342,7 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
 		return -ENODEV;
 	mutex_lock(&info->mm_lock);
 
-	fb_mmap_fn = info->fbops->fb_mmap;
-
-#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
-	if (info->fbdefio)
-		fb_mmap_fn = fb_deferred_io_mmap;
-#endif
-
-	if (fb_mmap_fn) {
+	if (info->fbops->fb_mmap) {
 		int res;
 
 		/*
@@ -1358,9 +1350,18 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
 		 * SME protection is removed ahead of the call
 		 */
 		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-		res = fb_mmap_fn(info, vma);
+		res = info->fbops->fb_mmap(info, vma);
 		mutex_unlock(&info->mm_lock);
 		return res;
+#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
+	} else if (info->fbdefio) {
+		/*
+		 * FB deferred I/O wants you to handle mmap in your drivers. At a
+		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
+		 */
+		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O.\n");
+		return -ENODEV;
+#endif
 	}
 
 	/*
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index 00d77105161a..2c483e2cf9ec 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -204,6 +204,7 @@ static const struct fb_ops hecubafb_ops = {
 	.fb_fillrect	= hecubafb_fillrect,
 	.fb_copyarea	= hecubafb_copyarea,
 	.fb_imageblit	= hecubafb_imageblit,
+	.fb_mmap	= fb_deferred_io_mmap,
 };
 
 static struct fb_deferred_io hecubafb_defio = {
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index c8e0ea27caf1..d7f6abf827b9 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -909,6 +909,7 @@ static const struct fb_ops hvfb_ops = {
 	.fb_copyarea = hvfb_cfb_copyarea,
 	.fb_imageblit = hvfb_cfb_imageblit,
 	.fb_blank = hvfb_blank,
+	.fb_mmap = fb_deferred_io_mmap,
 };
 
 
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index af858dd23ea6..2541f2fe065b 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -564,6 +564,7 @@ static const struct fb_ops metronomefb_ops = {
 	.fb_fillrect	= metronomefb_fillrect,
 	.fb_copyarea	= metronomefb_copyarea,
 	.fb_imageblit	= metronomefb_imageblit,
+	.fb_mmap	= fb_deferred_io_mmap,
 };
 
 static struct fb_deferred_io metronomefb_defio = {
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index aa4ebe3192ec..1dc5079e4518 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1483,6 +1483,9 @@ sh_mobile_lcdc_overlay_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct sh_mobile_lcdc_overlay *ovl = info->par;
 
+	if (info->fbdefio)
+		return fb_deferred_io_mmap(info, vma);
+
 	return dma_mmap_coherent(ovl->channel->lcdc->dev, vma, ovl->fb_mem,
 				 ovl->dma_handle, ovl->fb_size);
 }
@@ -1957,6 +1960,9 @@ sh_mobile_lcdc_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct sh_mobile_lcdc_chan *ch = info->par;
 
+	if (info->fbdefio)
+		return fb_deferred_io_mmap(info, vma);
+
 	return dma_mmap_coherent(ch->lcdc->dev, vma, ch->fb_mem,
 				 ch->dma_handle, ch->fb_size);
 }
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 28768c272b73..9383f8d0914c 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -779,6 +779,9 @@ static int ufx_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
 	unsigned long page, pos;
 
+	if (info->fbdefio)
+		return fb_deferred_io_mmap(info, vma);
+
 	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
 		return -EINVAL;
 	if (size > info->fix.smem_len)
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index c6d5df31111d..7547b4628afc 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -368,6 +368,7 @@ static const struct fb_ops ssd1307fb_ops = {
 	.fb_fillrect	= ssd1307fb_fillrect,
 	.fb_copyarea	= ssd1307fb_copyarea,
 	.fb_imageblit	= ssd1307fb_imageblit,
+	.fb_mmap	= fb_deferred_io_mmap,
 };
 
 static void ssd1307fb_deferred_io(struct fb_info *info,
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b6ec0b8e2b72..9e5a33396ef9 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -326,6 +326,9 @@ static int dlfb_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
 	unsigned long page, pos;
 
+	if (info->fbdefio)
+		return fb_deferred_io_mmap(info, vma);
+
 	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
 		return -EINVAL;
 	if (size > info->fix.smem_len)
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 6826f986da43..6c8846eba2fb 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -338,6 +338,7 @@ static const struct fb_ops xenfb_fb_ops = {
 	.fb_imageblit	= xenfb_imageblit,
 	.fb_check_var	= xenfb_check_var,
 	.fb_set_par     = xenfb_set_par,
+	.fb_mmap	= fb_deferred_io_mmap,
 };
 
 static irqreturn_t xenfb_event_handler(int rq, void *dev_id)
-- 
2.36.0

