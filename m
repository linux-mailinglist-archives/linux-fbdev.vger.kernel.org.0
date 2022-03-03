Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDBC4CC765
	for <lists+linux-fbdev@lfdr.de>; Thu,  3 Mar 2022 21:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbiCCU7b (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 3 Mar 2022 15:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236371AbiCCU7a (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 3 Mar 2022 15:59:30 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EFD43ECE
        for <linux-fbdev@vger.kernel.org>; Thu,  3 Mar 2022 12:58:43 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E3C75218D9;
        Thu,  3 Mar 2022 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1646341121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vTpeCqYs3LvzLMXvyo/gYF/QEXjQg1Ay9sWjS0CBM4M=;
        b=Jo1QkPb+U6du7DJCbcvcEbKXSfplWh69hBHXLv4A9Yr/SMCDxxmDXwB6RBm6pLdxBg1irj
        DdJ2BwZiHrZY8zZJplcx3n8EI5q5KT0/uJm3eNNSW44e3WtSgZFT+1Rwu840AwzTWpKx1+
        4BzB/epiKRiejJHkj33gOggUPA4i6P4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1646341121;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vTpeCqYs3LvzLMXvyo/gYF/QEXjQg1Ay9sWjS0CBM4M=;
        b=y4aEeh8947XHH/4K4QyPn3OG6cZSb6MZBu1uqaVwxGrcysq+S24WLO+uSwvuDPtvOU6/qb
        LD6M/KYx2PpOS8CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF3F4139B5;
        Thu,  3 Mar 2022 20:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KIrYKQEsIWJoHAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:41 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, deller@gmx.de,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] fbdev: Put mmap for deferred I/O into drivers
Date:   Thu,  3 Mar 2022 21:58:32 +0100
Message-Id: <20220303205839.28484-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
References: <20220303205839.28484-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c        |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  1 +
 drivers/hid/hid-picolcd_fb.c           |  1 +
 drivers/staging/fbtft/fbtft-core.c     |  1 +
 drivers/video/fbdev/broadsheetfb.c     |  1 +
 drivers/video/fbdev/core/fb_defio.c    |  1 +
 drivers/video/fbdev/core/fbmem.c       | 19 +++++++++----------
 drivers/video/fbdev/hecubafb.c         |  1 +
 drivers/video/fbdev/hyperv_fb.c        |  1 +
 drivers/video/fbdev/metronomefb.c      |  1 +
 drivers/video/fbdev/sh_mobile_lcdcfb.c |  6 ++++++
 drivers/video/fbdev/smscufx.c          |  3 +++
 drivers/video/fbdev/ssd1307fb.c        |  1 +
 drivers/video/fbdev/udlfb.c            |  3 +++
 drivers/video/fbdev/xen-fbfront.c      |  1 +
 15 files changed, 34 insertions(+), 11 deletions(-)

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
index 8ee34576c7d0..33f355907fbb 100644
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
index 4a35347b3020..60c55451e414 100644
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
index 98b0f23bf5e2..662bb5d2b872 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -189,6 +189,7 @@ int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	vma->vm_private_data = info;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(fb_deferred_io_mmap);
 
 /* workqueue callback */
 static void fb_deferred_io_work(struct work_struct *work)
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index ad9aac06427a..6d89e65592a8 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1338,7 +1338,6 @@ static int
 fb_mmap(struct file *file, struct vm_area_struct * vma)
 {
 	struct fb_info *info = file_fb_info(file);
-	int (*fb_mmap_fn)(struct fb_info *info, struct vm_area_struct *vma);
 	unsigned long mmio_pgoff;
 	unsigned long start;
 	u32 len;
@@ -1347,14 +1346,7 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
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
@@ -1362,11 +1354,18 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
 		 * SME protection is removed ahead of the call
 		 */
 		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-		res = fb_mmap_fn(info, vma);
+		res = info->fbops->fb_mmap(info, vma);
 		mutex_unlock(&info->mm_lock);
 		return res;
 	}
 
+	/*
+	 * FB deferred I/O want you to handle mmap in your drivers. At a
+	 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
+	 */
+	if (WARN_ON_ONCE(info->fbdefio))
+		return -ENODEV;
+
 	/*
 	 * Ugh. This can be either the frame buffer mapping, or
 	 * if pgoff points past it, the mmio mapping.
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
index bfac3ee4a642..10eb56feff0a 100644
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
index 1e2f71c2f8a8..5eed08bb165b 100644
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
index 184bb8433b78..d7f02b935eb2 100644
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
2.35.1

