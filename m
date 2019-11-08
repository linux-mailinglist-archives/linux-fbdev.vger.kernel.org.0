Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2662AF4BA1
	for <lists+linux-fbdev@lfdr.de>; Fri,  8 Nov 2019 13:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfKHMdj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 8 Nov 2019 07:33:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:50578 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726200AbfKHMdj (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 8 Nov 2019 07:33:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5B001B220;
        Fri,  8 Nov 2019 12:33:36 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
        b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
        sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
Date:   Fri,  8 Nov 2019 13:33:30 +0100
Message-Id: <20191108123333.25274-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108123333.25274-1-tzimmermann@suse.de>
References: <20191108123333.25274-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The udl driver can use the generic fbdev implementation. Convert it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.c     |   4 +-
 drivers/gpu/drm/udl/udl_drv.h     |   5 -
 drivers/gpu/drm/udl/udl_fb.c      | 270 +-----------------------------
 drivers/gpu/drm/udl/udl_main.c    |   2 -
 drivers/gpu/drm/udl/udl_modeset.c |   3 +-
 5 files changed, 7 insertions(+), 277 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 563cc5809e56..55c0f9dfee29 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
@@ -47,6 +48,8 @@ static struct drm_driver driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM,
 	.release = udl_driver_release,
 
+	.lastclose = drm_fb_helper_lastclose,
+
 	/* gem hooks */
 	.gem_create_object = udl_driver_gem_create_object,
 
@@ -119,7 +122,6 @@ static void udl_usb_disconnect(struct usb_interface *interface)
 	struct drm_device *dev = usb_get_intfdata(interface);
 
 	drm_kms_helper_poll_disable(dev);
-	udl_fbdev_unplug(dev);
 	udl_drop_usb(dev);
 	drm_dev_unplug(dev);
 	drm_dev_put(dev);
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 987d99ae2dfa..5bdc57779f95 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -47,8 +47,6 @@ struct urb_list {
 	size_t size;
 };
 
-struct udl_fbdev;
-
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
@@ -62,7 +60,6 @@ struct udl_device {
 	struct urb_list urbs;
 	atomic_t lost_pixels; /* 1 = a render op failed. Need screen refresh */
 
-	struct udl_fbdev *fbdev;
 	char mode_buf[1024];
 	uint32_t mode_buf_len;
 	atomic_t bytes_rendered; /* raw pixel-bytes driver asked to render */
@@ -98,8 +95,6 @@ int udl_init(struct udl_device *udl);
 void udl_fini(struct drm_device *dev);
 
 int udl_fbdev_init(struct drm_device *dev);
-void udl_fbdev_cleanup(struct drm_device *dev);
-void udl_fbdev_unplug(struct drm_device *dev);
 struct drm_framebuffer *
 udl_fb_user_fb_create(struct drm_device *dev,
 		      struct drm_file *file,
diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
index f8153b726343..afe74f892a2b 100644
--- a/drivers/gpu/drm/udl/udl_fb.c
+++ b/drivers/gpu/drm/udl/udl_fb.c
@@ -20,19 +20,9 @@
 
 #include "udl_drv.h"
 
-#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in jiffies */
-
-static int fb_defio = 0;  /* Optionally enable experimental fb_defio mmap support */
 static int fb_bpp = 16;
 
 module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
-module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
-
-struct udl_fbdev {
-	struct drm_fb_helper helper; /* must be first */
-	struct udl_framebuffer ufb;
-	int fb_count;
-};
 
 #define DL_ALIGN_UP(x, a) ALIGN(x, a)
 #define DL_ALIGN_DOWN(x, a) ALIGN_DOWN(x, a)
@@ -156,123 +146,6 @@ int udl_handle_damage(struct udl_framebuffer *fb, int x, int y,
 	return 0;
 }
 
-static int udl_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	unsigned long start = vma->vm_start;
-	unsigned long size = vma->vm_end - vma->vm_start;
-	unsigned long offset;
-	unsigned long page, pos;
-
-	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
-		return -EINVAL;
-
-	offset = vma->vm_pgoff << PAGE_SHIFT;
-
-	if (offset > info->fix.smem_len || size > info->fix.smem_len - offset)
-		return -EINVAL;
-
-	pos = (unsigned long)info->fix.smem_start + offset;
-
-	pr_debug("mmap() framebuffer addr:%lu size:%lu\n",
-		  pos, size);
-
-	/* We don't want the framebuffer to be mapped encrypted */
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-
-	while (size > 0) {
-		page = vmalloc_to_pfn((void *)pos);
-		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
-			return -EAGAIN;
-
-		start += PAGE_SIZE;
-		pos += PAGE_SIZE;
-		if (size > PAGE_SIZE)
-			size -= PAGE_SIZE;
-		else
-			size = 0;
-	}
-
-	/* VM_IO | VM_DONTEXPAND | VM_DONTDUMP are set by remap_pfn_range() */
-	return 0;
-}
-
-/*
- * It's common for several clients to have framebuffer open simultaneously.
- * e.g. both fbcon and X. Makes things interesting.
- * Assumes caller is holding info->lock (for open and release at least)
- */
-static int udl_fb_open(struct fb_info *info, int user)
-{
-	struct udl_fbdev *ufbdev = info->par;
-	struct drm_device *dev = ufbdev->ufb.base.dev;
-	struct udl_device *udl = to_udl(dev);
-
-	/* If the USB device is gone, we don't accept new opens */
-	if (drm_dev_is_unplugged(&udl->drm))
-		return -ENODEV;
-
-	ufbdev->fb_count++;
-
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (fb_defio && (info->fbdefio == NULL)) {
-		/* enable defio at last moment if not disabled by client */
-
-		struct fb_deferred_io *fbdefio;
-
-		fbdefio = kzalloc(sizeof(struct fb_deferred_io), GFP_KERNEL);
-
-		if (fbdefio) {
-			fbdefio->delay = DL_DEFIO_WRITE_DELAY;
-			fbdefio->deferred_io = drm_fb_helper_deferred_io;
-		}
-
-		info->fbdefio = fbdefio;
-		fb_deferred_io_init(info);
-	}
-#endif
-
-	pr_debug("open /dev/fb%d user=%d fb_info=%p count=%d\n",
-		  info->node, user, info, ufbdev->fb_count);
-
-	return 0;
-}
-
-
-/*
- * Assumes caller is holding info->lock mutex (for open and release at least)
- */
-static int udl_fb_release(struct fb_info *info, int user)
-{
-	struct udl_fbdev *ufbdev = info->par;
-
-	ufbdev->fb_count--;
-
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	if ((ufbdev->fb_count == 0) && (info->fbdefio)) {
-		fb_deferred_io_cleanup(info);
-		kfree(info->fbdefio);
-		info->fbdefio = NULL;
-		info->fbops->fb_mmap = udl_fb_mmap;
-	}
-#endif
-
-	pr_debug("released /dev/fb%d user=%d count=%d\n",
-		info->node, user, ufbdev->fb_count);
-
-	return 0;
-}
-
-static struct fb_ops udlfb_ops = {
-	.owner = THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_fillrect = drm_fb_helper_sys_fillrect,
-	.fb_copyarea = drm_fb_helper_sys_copyarea,
-	.fb_imageblit = drm_fb_helper_sys_imageblit,
-	.fb_mmap = udl_fb_mmap,
-	.fb_open = udl_fb_open,
-	.fb_release = udl_fb_release,
-};
-
 static int udl_user_framebuffer_dirty(struct drm_framebuffer *fb,
 				      struct drm_file *file,
 				      unsigned flags, unsigned color,
@@ -347,154 +220,15 @@ udl_framebuffer_init(struct drm_device *dev,
 	return ret;
 }
 
-
-static int udlfb_create(struct drm_fb_helper *helper,
-			struct drm_fb_helper_surface_size *sizes)
-{
-	struct udl_fbdev *ufbdev =
-		container_of(helper, struct udl_fbdev, helper);
-	struct drm_device *dev = ufbdev->helper.dev;
-	struct fb_info *info;
-	struct drm_framebuffer *fb;
-	struct drm_mode_fb_cmd2 mode_cmd;
-	struct drm_gem_shmem_object *shmem;
-	void *vaddr;
-	uint32_t size;
-	int ret = 0;
-
-	if (sizes->surface_bpp == 24)
-		sizes->surface_bpp = 32;
-
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = mode_cmd.width * ((sizes->surface_bpp + 7) / 8);
-
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
-
-	size = mode_cmd.pitches[0] * mode_cmd.height;
-	size = ALIGN(size, PAGE_SIZE);
-
-	shmem = drm_gem_shmem_create(dev, size);
-	if (IS_ERR(shmem)) {
-		ret = PTR_ERR(shmem);
-		goto out;
-	}
-
-	vaddr = drm_gem_shmem_vmap(&shmem->base);
-	if (IS_ERR(vaddr)) {
-		ret = PTR_ERR(vaddr);
-		DRM_ERROR("failed to vmap fb\n");
-		goto out_gfree;
-	}
-
-	info = drm_fb_helper_alloc_fbi(helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto out_gfree;
-	}
-
-	ret = udl_framebuffer_init(dev, &ufbdev->ufb, &mode_cmd, shmem);
-	if (ret)
-		goto out_gfree;
-
-	fb = &ufbdev->ufb.base;
-
-	ufbdev->helper.fb = fb;
-
-	info->screen_base = vaddr;
-	info->fix.smem_len = size;
-	info->fix.smem_start = (unsigned long)vaddr;
-
-	info->fbops = &udlfb_ops;
-	drm_fb_helper_fill_info(info, &ufbdev->helper, sizes);
-
-	DRM_DEBUG_KMS("allocated %dx%d vmal %p\n",
-		      fb->width, fb->height,
-		      ufbdev->ufb.shmem->vaddr);
-
-	return ret;
-out_gfree:
-	drm_gem_object_put_unlocked(&ufbdev->ufb.shmem->base);
-out:
-	return ret;
-}
-
-static const struct drm_fb_helper_funcs udl_fb_helper_funcs = {
-	.fb_probe = udlfb_create,
-};
-
-static void udl_fbdev_destroy(struct drm_device *dev,
-			      struct udl_fbdev *ufbdev)
-{
-	drm_fb_helper_unregister_fbi(&ufbdev->helper);
-	drm_fb_helper_fini(&ufbdev->helper);
-	if (ufbdev->ufb.shmem) {
-		drm_framebuffer_unregister_private(&ufbdev->ufb.base);
-		drm_framebuffer_cleanup(&ufbdev->ufb.base);
-		drm_gem_object_put_unlocked(&ufbdev->ufb.shmem->base);
-	}
-}
-
 int udl_fbdev_init(struct drm_device *dev)
 {
-	struct udl_device *udl = to_udl(dev);
 	int bpp_sel = fb_bpp;
-	struct udl_fbdev *ufbdev;
 	int ret;
 
-	ufbdev = kzalloc(sizeof(struct udl_fbdev), GFP_KERNEL);
-	if (!ufbdev)
-		return -ENOMEM;
-
-	udl->fbdev = ufbdev;
-
-	drm_fb_helper_prepare(dev, &ufbdev->helper, &udl_fb_helper_funcs);
-
-	ret = drm_fb_helper_init(dev, &ufbdev->helper, 1);
-	if (ret)
-		goto free;
-
-	ret = drm_fb_helper_single_add_all_connectors(&ufbdev->helper);
-	if (ret)
-		goto fini;
-
-	/* disable all the possible outputs/crtcs before entering KMS mode */
-	drm_helper_disable_unused_functions(dev);
-
-	ret = drm_fb_helper_initial_config(&ufbdev->helper, bpp_sel);
+	ret = drm_fbdev_generic_setup(dev, bpp_sel);
 	if (ret)
-		goto fini;
-
+		return ret;
 	return 0;
-
-fini:
-	drm_fb_helper_fini(&ufbdev->helper);
-free:
-	kfree(ufbdev);
-	return ret;
-}
-
-void udl_fbdev_cleanup(struct drm_device *dev)
-{
-	struct udl_device *udl = to_udl(dev);
-	if (!udl->fbdev)
-		return;
-
-	udl_fbdev_destroy(dev, udl->fbdev);
-	kfree(udl->fbdev);
-	udl->fbdev = NULL;
-}
-
-void udl_fbdev_unplug(struct drm_device *dev)
-{
-	struct udl_device *udl = to_udl(dev);
-	struct udl_fbdev *ufbdev;
-	if (!udl->fbdev)
-		return;
-
-	ufbdev = udl->fbdev;
-	drm_fb_helper_unlink_fbi(&ufbdev->helper);
 }
 
 struct drm_framebuffer *
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 4e854e017390..2a6399290f09 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -367,6 +367,4 @@ void udl_fini(struct drm_device *dev)
 
 	if (udl->urbs.count)
 		udl_free_urb_list(dev);
-
-	udl_fbdev_cleanup(dev);
 }
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index bc1ab6060dc6..1517d5e881b8 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -10,6 +10,7 @@
  */
 
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_vblank.h>
 
@@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *dev)
 
 static const struct drm_mode_config_funcs udl_mode_funcs = {
 	.fb_create = udl_fb_user_fb_create,
-	.output_poll_changed = NULL,
+	.output_poll_changed = drm_fb_helper_output_poll_changed,
 };
 
 int udl_modeset_init(struct drm_device *dev)
-- 
2.23.0

