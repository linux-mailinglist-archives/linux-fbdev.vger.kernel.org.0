Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF821AE1B6
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 17:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgDQP5C (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 11:57:02 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:34491 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729606AbgDQP5C (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 11:57:02 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MMGZM-1jievn0oMg-00JN2M; Fri, 17 Apr 2020 17:56:25 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     dri-devel@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-fbdev@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Saeed Mahameed <saeedm@mellanox.com>, masahiroy@kernel.org,
        Laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@zonque.org, haojian.zhuang@gmail.com,
        robert.jarzmik@free.fr, daniel@ffwll.ch, marex@denx.de,
        stefan@agner.ch, linux-graphics-maintainer@vmware.com,
        thellstrom@vmware.com, jfrederich@gmail.com, dsd@laptop.org,
        geert@linux-m68k.org
Subject: [PATCH 5/8] drm/vmwgfx: make framebuffer support optional
Date:   Fri, 17 Apr 2020 17:55:50 +0200
Message-Id: <20200417155553.675905-6-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u6Q1bnM+EnY5/jd2R9vjncEyS7mGp02CUsjYYeJPl/ZfuPSiFVa
 gk1q2+VpIMQLvU1T5PK1QRkQ0KYA7kgR5f9/7T+YFjeryJxSwBTcuOw9Ry2purwcMKgV0tg
 zim7UtuCwVmfxb+q9g4c56QgB+rglG7RieqlXDxB/6rSqm8Vy2Tb/qTb4oicWanXec01s4j
 RRapYoivY8GzFl1mfMDKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I8f0G9hikho=:KTGhkcpfCtK2+sSrXzpOre
 2Nd6vycMtqFoQaYtkNrp0mVgb7mgisTqOc6SydTmZha5QuHbNxulHzy/fjIChxEwAAEs+rorl
 dt2+t0X5+tIfLZyFA9HQblEUDKYXVZ8NDiO1AFkpAYCgf5kO1RDdYsMndAwPlWnVaCFwyCKGV
 AHOTVtVt2gqUPm7cbL0ro7ZIvBA/YbZKd+H584/fSw+nUo9bRTRb9Y5OXn+0NciATlkU2+2B+
 8T1Ay+hP/Eb6cRxUuPTYu0jmC82Y2q4OrTweU3uVjeY8kqWKxDrfG6lYhUMJ/sGSMyV7gSQLx
 NABnJ6midPm9OFDBYWjJDD7MSmChWpjNO+grq3UmbS/YcL3BBu0xHx58jR3agLuqPPgGPvz8V
 zFVN3D2CLbM7KgxB6td456He3uz/qHGS9dCEPm82XZmmTaLC/m7+awf9KQmLkYzjMUGAxDNmI
 1yO7oADvkyELX8hGiMw6rf8ody00LxgXDryG9XBPBbHdqnckDi0Ccy7cSArRvxxrAbLZrZH8l
 UyMmBP5f/sSDhSSlG20hPtysFvM4qfvkRcuWySO0nQswfLUSRYYTyPxXA473HNS5ercZhGOX3
 8OD8ScV8zFO570CSji2dVQZV5PBSvOeaYA/FOlg1lQqG4GcpuwuJCwGSteiAARFtReGe/U4if
 aNPVSj2iW64x5QdiZJXvQwbP1KKurwzSR2M6t7SaCoGjCkWCkbvtZQ0z1v+Xj65HAhJJf1mCF
 OO1EJs7aiVw2xS4uW0GZxl3Tt1uzOtXpBsoda/K1ooHmLoRAHqbNGArw+UGtZ9FLC1KWqGFsd
 LVWvRdDWJ1i2vHCHzzd+eiJm6Iq+94zX5Zm1TVwL71lNWRenJM=
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

CONFIG_FB causes unnecessary Kconfig dependency problems when selected
from another driver. Since it is already optional in vmwgfx at runtime,
turn this into a compile-time dependency so the support can be completely
left out of the driver and enabled only if CONFIG_FB is explicitly
selected in the configuration.

When the FB support is built into the driver, it is turned on by
default, but can still be disabled when loading the module.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/vmwgfx/Kconfig      | 17 +++++++-------
 drivers/gpu/drm/vmwgfx/Makefile     |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 35 +++++++++++++++++++----------
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index 15acdf2a7c0f..b2835636991b 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -2,12 +2,7 @@
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
 	depends on DRM && PCI && X86 && MMU
-	select FB_DEFERRED_IO
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select DRM_TTM
-	select FB
 	select MAPPING_DIRTY_HELPERS
 	# Only needed for the transitional use of drm_crtc_init - can be removed
 	# again once vmwgfx sets up the primary plane itself.
@@ -20,9 +15,15 @@ config DRM_VMWGFX
 	  The compiled module will be called "vmwgfx.ko".
 
 config DRM_VMWGFX_FBCON
-	depends on DRM_VMWGFX && FB
-	bool "Enable framebuffer console under vmwgfx by default"
+	bool "Enable framebuffer console under vmwgfx"
+	depends on DRM_VMWGFX
+	depends on FB=y || FB=DRM_VMWGFX
+	select FB_DEFERRED_IO
+	select FB_CFB_FILLRECT
+	select FB_CFB_COPYAREA
+	select FB_CFB_IMAGEBLIT
 	help
 	   Choose this option if you are shipping a new vmwgfx
-	   userspace driver that supports using the kernel driver.
+	   userspace driver that supports using the kernel driver
+	   and you have framebuffer support enabled.
 
diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index 31f85f09f1fc..905ebabc79fc 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
-	    vmwgfx_fb.o vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
+	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
 	    vmwgfx_fifo.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
 	    vmwgfx_overlay.o vmwgfx_marker.o vmwgfx_gmrid_manager.o \
 	    vmwgfx_fence.o vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
@@ -11,5 +11,7 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
 	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
 	    ttm_object.o ttm_lock.o
 
+vmwgfx-$(CONFIG_DRM_VMWGFX_FBCON) += vmwgfx_fb.o
+
 vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
 obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index c2247a893ed4..a471a659b89d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -258,7 +258,6 @@ static const struct pci_device_id vmw_pci_id_list[] = {
 };
 MODULE_DEVICE_TABLE(pci, vmw_pci_id_list);
 
-static int enable_fbdev = IS_ENABLED(CONFIG_DRM_VMWGFX_FBCON);
 static int vmw_force_iommu;
 static int vmw_restrict_iommu;
 static int vmw_force_coherent;
@@ -269,8 +268,21 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+#ifdef CONFIG_DRM_VMWGFX_FBCON
+static int enable_fbdev = 1;
 MODULE_PARM_DESC(enable_fbdev, "Enable vmwgfx fbdev");
 module_param_named(enable_fbdev, enable_fbdev, int, 0600);
+static inline bool vmw_fb_enabled(struct vmw_private *dev_priv)
+{
+	return dev_priv->enable_fb;
+}
+#else
+#define enable_fbdev 0
+static inline bool vmw_fb_enabled(struct vmw_private *dev_priv)
+{
+	return false;
+}
+#endif
 MODULE_PARM_DESC(force_dma_api, "Force using the DMA API for TTM pages");
 module_param_named(force_dma_api, vmw_force_iommu, int, 0600);
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
@@ -669,7 +681,6 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	dev_priv->mmio_start = pci_resource_start(dev->pdev, 2);
 
 	dev_priv->assume_16bpp = !!vmw_assume_16bpp;
-
 	dev_priv->enable_fb = enable_fbdev;
 
 	vmw_write(dev_priv, SVGA_REG_ID, SVGA_ID_2);
@@ -945,7 +956,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 		VMWGFX_DRIVER_PATCHLEVEL);
 	vmw_host_log(host_log);
 
-	if (dev_priv->enable_fb) {
+	if (vmw_fb_enabled(dev_priv)) {
 		vmw_fifo_resource_inc(dev_priv);
 		vmw_svga_enable(dev_priv);
 		vmw_fb_init(dev_priv);
@@ -1001,7 +1012,7 @@ static void vmw_driver_unload(struct drm_device *dev)
 	if (dev_priv->ctx.res_ht_initialized)
 		drm_ht_remove(&dev_priv->ctx.res_ht);
 	vfree(dev_priv->ctx.cmd_bounce);
-	if (dev_priv->enable_fb) {
+	if (vmw_fb_enabled(dev_priv)) {
 		vmw_fb_off(dev_priv);
 		vmw_fb_close(dev_priv);
 		vmw_fifo_resource_dec(dev_priv);
@@ -1149,7 +1160,7 @@ static void vmw_master_drop(struct drm_device *dev,
 	struct vmw_private *dev_priv = vmw_priv(dev);
 
 	vmw_kms_legacy_hotspot_clear(dev_priv);
-	if (!dev_priv->enable_fb)
+	if (vmw_fb_enabled(dev_priv))
 		vmw_svga_disable(dev_priv);
 }
 
@@ -1347,7 +1358,7 @@ static int vmw_pm_freeze(struct device *kdev)
 		DRM_ERROR("Failed to freeze modesetting.\n");
 		return ret;
 	}
-	if (dev_priv->enable_fb)
+	if (vmw_fb_enabled(dev_priv))
 		vmw_fb_off(dev_priv);
 
 	ttm_suspend_lock(&dev_priv->reservation_sem);
@@ -1355,18 +1366,18 @@ static int vmw_pm_freeze(struct device *kdev)
 	vmw_resource_evict_all(dev_priv);
 	vmw_release_device_early(dev_priv);
 	ttm_bo_swapout_all(&dev_priv->bdev);
-	if (dev_priv->enable_fb)
+	if (vmw_fb_enabled(dev_priv))
 		vmw_fifo_resource_dec(dev_priv);
 	if (atomic_read(&dev_priv->num_fifo_resources) != 0) {
 		DRM_ERROR("Can't hibernate while 3D resources are active.\n");
-		if (dev_priv->enable_fb)
+		if (vmw_fb_enabled(dev_priv))
 			vmw_fifo_resource_inc(dev_priv);
 		WARN_ON(vmw_request_device_late(dev_priv));
 		dev_priv->suspend_locked = false;
 		ttm_suspend_unlock(&dev_priv->reservation_sem);
 		if (dev_priv->suspend_state)
 			vmw_kms_resume(dev);
-		if (dev_priv->enable_fb)
+		if (vmw_fb_enabled(dev_priv))
 			vmw_fb_on(dev_priv);
 		return -EBUSY;
 	}
@@ -1388,14 +1399,14 @@ static int vmw_pm_restore(struct device *kdev)
 	vmw_write(dev_priv, SVGA_REG_ID, SVGA_ID_2);
 	(void) vmw_read(dev_priv, SVGA_REG_ID);
 
-	if (dev_priv->enable_fb)
+	if (vmw_fb_enabled(dev_priv))
 		vmw_fifo_resource_inc(dev_priv);
 
 	ret = vmw_request_device(dev_priv);
 	if (ret)
 		return ret;
 
-	if (dev_priv->enable_fb)
+	if (vmw_fb_enabled(dev_priv))
 		__vmw_svga_enable(dev_priv);
 
 	vmw_fence_fifo_up(dev_priv->fman);
@@ -1404,7 +1415,7 @@ static int vmw_pm_restore(struct device *kdev)
 	if (dev_priv->suspend_state)
 		vmw_kms_resume(dev_priv->dev);
 
-	if (dev_priv->enable_fb)
+	if (vmw_fb_enabled(dev_priv))
 		vmw_fb_on(dev_priv);
 
 	return 0;
-- 
2.26.0

