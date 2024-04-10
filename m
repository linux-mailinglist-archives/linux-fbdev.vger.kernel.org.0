Return-Path: <linux-fbdev+bounces-1901-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6489F35D
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 15:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825EB1F298E2
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Apr 2024 13:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197CE15E1FD;
	Wed, 10 Apr 2024 13:06:06 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5D15B99B
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Apr 2024 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754366; cv=none; b=srzZD5M430Qa9hZ4ji3oUg5yufeMduo+cqTnS0rgoinNC5te5m0bdCS+9LiJs4kLCyi4diEBCGHWvgPQlw1P5vtFQYtYWUQwexRYq7xaW6dzXTpMl9+7wPz7aMwWwBnpq8dvl8Pd+xz1BVrVKMcrkvXLVzOmnV50EfCk0xBAaTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754366; c=relaxed/simple;
	bh=G06u+/l3hSGZZh1ihRYIdYGx1UEiFWzYAVDPioIxWyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elSjfEzdtLtmfyW2nbIuO23a7XR2TPNjUuRQiAvKUlLWqa4gW8wgsggvR9yXtWcd7PSxWcPY6slUEoLzcOSH9Qvcx80oVjsdVyOhE0UIhvw6BR5qhFczAtzbxwAnvTqzJCKwE5CJqFvLGPfUm62UATU45wESjtTIvkIHV3uCgZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 49DDB5CDA5;
	Wed, 10 Apr 2024 13:06:01 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1866113A94;
	Wed, 10 Apr 2024 13:06:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id mE3KBLmOFmYdEgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/43] drm/fbdev: Add fbdev-shmem
Date: Wed, 10 Apr 2024 15:02:04 +0200
Message-ID: <20240410130557.31572-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410130557.31572-1-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 49DDB5CDA5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

Add an fbdev emulation for SHMEM-based memory managers. The code is
similar to fbdev-generic, but does not require an addition shadow
buffer for mmap(). Fbdev-shmem operates directly on the buffer object's
SHMEM pages. Fbdev's deferred-I/O mechanism updates the hardware state
on write operations.

v2:
- use drm_driver_legacy_fb_format() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile          |   1 +
 drivers/gpu/drm/drm_fbdev_shmem.c | 316 ++++++++++++++++++++++++++++++
 include/drm/drm_fbdev_shmem.h     |  15 ++
 3 files changed, 332 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_fbdev_shmem.c
 create mode 100644 include/drm/drm_fbdev_shmem.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a73c04d2d7a39..50a2f0cffdac2 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -107,6 +107,7 @@ drm_dma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_dma_helper.o
 obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
 
 drm_shmem_helper-y := drm_gem_shmem_helper.o
+drm_shmem_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_shmem.o
 obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
 
 drm_suballoc_helper-y := drm_suballoc.o
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
new file mode 100644
index 0000000000000..a85a8a8e2eb8b
--- /dev/null
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/fb.h>
+
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+
+#include <drm/drm_fbdev_shmem.h>
+
+/*
+ * struct fb_ops
+ */
+
+static int drm_fbdev_shmem_fb_open(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	/* No need to take a ref for fbcon because it unbinds on unregister */
+	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int drm_fbdev_shmem_fb_release(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (user)
+		module_put(fb_helper->dev->driver->fops->owner);
+
+	return 0;
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_shmem,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area);
+
+static int drm_fbdev_shmem_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_framebuffer *fb = fb_helper->fb;
+	struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, 0);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	if (shmem->map_wc)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	return fb_deferred_io_mmap(info, vma);
+}
+
+static void drm_fbdev_shmem_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (!fb_helper->dev)
+		return;
+
+	drm_fb_helper_fini(fb_helper);
+
+	drm_client_buffer_vunmap(fb_helper->buffer);
+	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_release(&fb_helper->client);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
+}
+
+static const struct fb_ops drm_fbdev_shmem_fb_ops = {
+	.owner = THIS_MODULE,
+	.fb_open = drm_fbdev_shmem_fb_open,
+	.fb_release = drm_fbdev_shmem_fb_release,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(drm_fbdev_shmem),
+	DRM_FB_HELPER_DEFAULT_OPS,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(drm_fbdev_shmem),
+	.fb_mmap = drm_fbdev_shmem_fb_mmap,
+	.fb_destroy = drm_fbdev_shmem_fb_destroy,
+};
+
+static struct page *drm_fbdev_shmem_get_page(struct fb_info *info, unsigned long offset)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_framebuffer *fb = fb_helper->fb;
+	struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, 0);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	unsigned int i = offset >> PAGE_SHIFT;
+	struct page *page;
+
+	if (fb_WARN_ON_ONCE(info, offset > obj->size))
+		return NULL;
+
+	page = shmem->pages[i]; // protected by active vmap
+	if (page)
+		get_page(page);
+	fb_WARN_ON_ONCE(info, !page);
+
+	return page;
+}
+
+/*
+ * struct drm_fb_helper
+ */
+
+static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_helper,
+					   struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_client_buffer *buffer;
+	struct drm_gem_shmem_object *shmem;
+	struct drm_framebuffer *fb;
+	struct fb_info *info;
+	u32 format;
+	struct iosys_map map;
+	int ret;
+
+	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
+		    sizes->surface_width, sizes->surface_height,
+		    sizes->surface_bpp);
+
+	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp, sizes->surface_depth);
+	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+					       sizes->surface_height, format);
+	if (IS_ERR(buffer))
+		return PTR_ERR(buffer);
+	shmem = to_drm_gem_shmem_obj(buffer->gem);
+
+	fb = buffer->fb;
+
+	ret = drm_client_buffer_vmap(buffer, &map);
+	if (ret) {
+		goto err_drm_client_buffer_delete;
+	} else if (drm_WARN_ON(dev, map.is_iomem)) {
+		ret = -ENODEV; /* I/O memory not supported; use generic emulation */
+		goto err_drm_client_buffer_delete;
+	}
+
+	fb_helper->buffer = buffer;
+	fb_helper->fb = fb;
+
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info)) {
+		ret = PTR_ERR(info);
+		goto err_drm_client_buffer_vunmap;
+	}
+
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
+
+	info->fbops = &drm_fbdev_shmem_fb_ops;
+
+	/* screen */
+	info->flags |= FBINFO_VIRTFB; /* system memory */
+	if (!shmem->map_wc)
+		info->flags |= FBINFO_READS_FAST; /* signal caching */
+	info->screen_size = sizes->surface_height * fb->pitches[0];
+	info->screen_buffer = map.vaddr;
+	info->fix.smem_len = info->screen_size;
+
+	/* deferred I/O */
+	fb_helper->fbdefio.delay = HZ / 20;
+	fb_helper->fbdefio.get_page = drm_fbdev_shmem_get_page;
+	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+	info->fbdefio = &fb_helper->fbdefio;
+	ret = fb_deferred_io_init(info);
+	if (ret)
+		goto err_drm_fb_helper_release_info;
+
+	return 0;
+
+err_drm_fb_helper_release_info:
+	drm_fb_helper_release_info(fb_helper);
+err_drm_client_buffer_vunmap:
+	fb_helper->fb = NULL;
+	fb_helper->buffer = NULL;
+	drm_client_buffer_vunmap(buffer);
+err_drm_client_buffer_delete:
+	drm_client_framebuffer_delete(buffer);
+	return ret;
+}
+
+static int drm_fbdev_shmem_helper_fb_dirty(struct drm_fb_helper *helper,
+					   struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct drm_fb_helper_funcs drm_fbdev_shmem_helper_funcs = {
+	.fb_probe = drm_fbdev_shmem_helper_fb_probe,
+	.fb_dirty = drm_fbdev_shmem_helper_fb_dirty,
+};
+
+/*
+ * struct drm_client_funcs
+ */
+
+static void drm_fbdev_shmem_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (fb_helper->info) {
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
+
+static int drm_fbdev_shmem_client_restore(struct drm_client_dev *client)
+{
+	drm_fb_helper_lastclose(client->dev);
+
+	return 0;
+}
+
+static int drm_fbdev_shmem_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
+	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "fbdev-shmem: Failed to setup emulation (ret=%d)\n", ret);
+	return ret;
+}
+
+static const struct drm_client_funcs drm_fbdev_shmem_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= drm_fbdev_shmem_client_unregister,
+	.restore	= drm_fbdev_shmem_client_restore,
+	.hotplug	= drm_fbdev_shmem_client_hotplug,
+};
+
+/**
+ * drm_fbdev_shmem_setup() - Setup fbdev emulation for GEM SHMEM helpers
+ * @dev: DRM device
+ * @preferred_bpp: Preferred bits per pixel for the device.
+ *                 32 is used if this is zero.
+ *
+ * This function sets up fbdev emulation for GEM DMA drivers that support
+ * dumb buffers with a virtual address and that can be mmap'ed.
+ * drm_fbdev_shmem_setup() shall be called after the DRM driver registered
+ * the new DRM device with drm_dev_register().
+ *
+ * Restore, hotplug events and teardown are all taken care of. Drivers that do
+ * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
+ * Simple drivers might use drm_mode_config_helper_suspend().
+ *
+ * This function is safe to call even when there are no connectors present.
+ * Setup will be retried on the next hotplug event.
+ *
+ * The fbdev is destroyed by drm_dev_unregister().
+ */
+void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int preferred_bpp)
+{
+	struct drm_fb_helper *fb_helper;
+	int ret;
+
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
+
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
+		return;
+	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_shmem_helper_funcs);
+
+	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_shmem_client_funcs);
+	if (ret) {
+		drm_err(dev, "Failed to register client: %d\n", ret);
+		goto err_drm_client_init;
+	}
+
+	drm_client_register(&fb_helper->client);
+
+	return;
+
+err_drm_client_init:
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
+}
+EXPORT_SYMBOL(drm_fbdev_shmem_setup);
diff --git a/include/drm/drm_fbdev_shmem.h b/include/drm/drm_fbdev_shmem.h
new file mode 100644
index 0000000000000..fb43cadd1950c
--- /dev/null
+++ b/include/drm/drm_fbdev_shmem.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_FBDEV_SHMEM_H
+#define DRM_FBDEV_SHMEM_H
+
+struct drm_device;
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int preferred_bpp);
+#else
+static inline void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int preferred_bpp)
+{ }
+#endif
+
+#endif
-- 
2.44.0


