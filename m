Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517206D6DD3
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Apr 2023 22:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbjDDUSw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 4 Apr 2023 16:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbjDDUSu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 4 Apr 2023 16:18:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D573C3B
        for <linux-fbdev@vger.kernel.org>; Tue,  4 Apr 2023 13:18:48 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-947a47eb908so44361366b.0
        for <linux-fbdev@vger.kernel.org>; Tue, 04 Apr 2023 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680639527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACDF47NjX/PbaEnShM8U5GURZxGYjBTw2NQeYznN0pY=;
        b=gT5lEL2OOmiZ0KBVkdq5FjmPIe2AsR/efdQgYXs4tGps1LpBvaPX9HxyY9hTqj20II
         W+eL+MuRuxdX0hgnXu1LJ0OR8I2NIA1sQlI6jbHlyjCe+q2gIMm94gP0SXrYBzZhlrqF
         GqN33zrvluDekjA369ecMvVU6LtCatJDNueu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680639527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACDF47NjX/PbaEnShM8U5GURZxGYjBTw2NQeYznN0pY=;
        b=G6wrcEK8ACdxm20zOzhPkf4Xs2RO9GOrYb7r0xubFFcYamO0brQaPC1qS78KRfVysP
         tEf22pVL16y7YMDpt+peJ7QbVFsx9ZbvUJK4ND18nMc4ziA9F98/LolQo4PVE6WRQTwc
         KKxISdg3wLfcU1MXfTC5LwIajRm79Kye0DJ37paVK8mREvTanUdKQ6+uyXbLvev1nbss
         NYr8EmufQfsfYbkN++UZQkVDjzdKji9Ac8LxORSdylFtuz1JQx2/M9jm3E15NA9SWPUQ
         e0BiWpnWBZTgCdDT4I3j2fUZT+WyaBI3OTcb/3Z28AwNnHBsQLJW9R3/gdY0s5pG1wnl
         Ew9A==
X-Gm-Message-State: AAQBX9e21e8219iM+Ccg3wRTeQPHEc7EQK3Rh6sDLLOYNhx1gB32JXCC
        ZKIJ60kV/16+bCkqlB+hfEO7Qg==
X-Google-Smtp-Source: AKy350aaGhrFD90BGSCUNxW/AmcPC/8PvXxI6/QJ6/HB99BtUbTqlTVNkz12X8+BXdpVDSQZZtYnHw==
X-Received: by 2002:a05:6402:27cc:b0:4bb:afe3:e0a with SMTP id c12-20020a05640227cc00b004bbafe30e0amr767839ede.3.1680639527344;
        Tue, 04 Apr 2023 13:18:47 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id u12-20020a50c04c000000b004d8d2735251sm6367986edd.43.2023.04.04.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 13:18:46 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Deepak Rawat <drawat.floss@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Emma Anholt <emma@anholt.net>, Helge Deller <deller@gmx.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-hyperv@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: [PATCH 3/8] drm/aperture: Remove primary argument
Date:   Tue,  4 Apr 2023 22:18:37 +0200
Message-Id: <20230404201842.567344-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Only really pci devices have a business setting this - it's for
figuring out whether the legacy vga stuff should be nuked too. And
with the preceeding two patches those are all using the pci version of
this.

Which means for all other callers primary == false and we can remove
it now.

v2:
- Reorder to avoid compile fail (Thomas)
- Include gma500, which retained it's called to the non-pci version.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Helge Deller <deller@gmx.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-hyperv@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
---
 drivers/gpu/drm/arm/hdlcd_drv.c             |  2 +-
 drivers/gpu/drm/armada/armada_drv.c         |  2 +-
 drivers/gpu/drm/drm_aperture.c              | 11 +++--------
 drivers/gpu/drm/gma500/psb_drv.c            |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  1 -
 drivers/gpu/drm/meson/meson_drv.c           |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c             |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  2 +-
 drivers/gpu/drm/stm/drv.c                   |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c           |  2 +-
 drivers/gpu/drm/tegra/drm.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c               |  2 +-
 include/drm/drm_aperture.h                  |  7 +++----
 13 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 9020bf820bc8..12f5a2c7f03d 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -285,7 +285,7 @@ static int hdlcd_drm_bind(struct device *dev)
 	 */
 	if (hdlcd_read(hdlcd, HDLCD_REG_COMMAND)) {
 		hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
-		drm_aperture_remove_framebuffers(false, &hdlcd_driver);
+		drm_aperture_remove_framebuffers(&hdlcd_driver);
 	}
 
 	drm_mode_config_reset(drm);
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..c99ec7078301 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -95,7 +95,7 @@ static int armada_drm_bind(struct device *dev)
 	}
 
 	/* Remove early framebuffers */
-	ret = drm_aperture_remove_framebuffers(false, &armada_drm_driver);
+	ret = drm_aperture_remove_framebuffers(&armada_drm_driver);
 	if (ret) {
 		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
 			__func__, ret);
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 3b8fdeeafd53..697cffbfd603 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -32,17 +32,13 @@
  *
  *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
  *	{
- *		bool primary = false;
  *		resource_size_t base, size;
  *		int ret;
  *
  *		base = pci_resource_start(pdev, 0);
  *		size = pci_resource_len(pdev, 0);
- *	#ifdef CONFIG_X86
- *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
- *	#endif
  *
- *		return drm_aperture_remove_conflicting_framebuffers(base, size, primary,
+ *		return drm_aperture_remove_conflicting_framebuffers(base, size,
  *		                                                    &example_driver);
  *	}
  *
@@ -161,7 +157,6 @@ EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
  * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
  * @base: the aperture's base address in physical memory
  * @size: aperture size in bytes
- * @primary: also kick vga16fb if present
  * @req_driver: requesting DRM driver
  *
  * This function removes graphics device drivers which use the memory range described by
@@ -171,9 +166,9 @@ EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
  * 0 on success, or a negative errno code otherwise
  */
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 bool primary, const struct drm_driver *req_driver)
+						 const struct drm_driver *req_driver)
 {
-	return aperture_remove_conflicting_devices(base, size, primary, req_driver->name);
+	return aperture_remove_conflicting_devices(base, size, false, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index f1e0eed8fea4..4bb06a89e48d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -428,7 +428,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
 	 *       might be able to read the framebuffer range from the device.
 	 */
-	ret = drm_aperture_remove_framebuffers(false, &driver);
+	ret = drm_aperture_remove_framebuffers(&driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index f830d62a5ce6..a7d2c92d6c6a 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -74,7 +74,6 @@ static int hyperv_setup_vram(struct hyperv_drm_device *hv,
 
 	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
 						     screen_info.lfb_size,
-						     false,
 						     &hyperv_driver);
 
 	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bb72fda9106d..ca6d1e59e5d9 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -285,7 +285,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
 	 * located anywhere in RAM
 	 */
-	ret = drm_aperture_remove_framebuffers(false, &meson_driver);
+	ret = drm_aperture_remove_framebuffers(&meson_driver);
 	if (ret)
 		goto free_drm;
 
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index d26aa52217ce..16652a5a7018 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -155,7 +155,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	}
 
 	/* the fw fb could be anywhere in memory */
-	ret = drm_aperture_remove_framebuffers(false, dev->driver);
+	ret = drm_aperture_remove_framebuffers(dev->driver);
 	if (ret)
 		goto fini;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 6e0788d14c10..d97f2edc646b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -140,7 +140,7 @@ static int rockchip_drm_bind(struct device *dev)
 	int ret;
 
 	/* Remove existing drivers that may own the framebuffer memory. */
-	ret = drm_aperture_remove_framebuffers(false, &rockchip_drm_driver);
+	ret = drm_aperture_remove_framebuffers(&rockchip_drm_driver);
 	if (ret) {
 		DRM_DEV_ERROR(dev,
 			      "Failed to remove existing framebuffers - %d.\n",
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 422220df7d8c..cb4404b3ce62 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -185,7 +185,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 
 	DRM_DEBUG("%s\n", __func__);
 
-	ret = drm_aperture_remove_framebuffers(false, &drv_driver);
+	ret = drm_aperture_remove_framebuffers(&drv_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index e49f78a6a8cf..daa7faf72a4b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -98,7 +98,7 @@ static int sun4i_drv_bind(struct device *dev)
 		goto unbind_all;
 
 	/* Remove early framebuffers (ie. simplefb) */
-	ret = drm_aperture_remove_framebuffers(false, &sun4i_drv_driver);
+	ret = drm_aperture_remove_framebuffers(&sun4i_drv_driver);
 	if (ret)
 		goto unbind_all;
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6ca9f396e55b..d11d259f9399 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1252,7 +1252,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_aperture_remove_framebuffers(false, &tegra_drm_driver);
+	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
 	if (err < 0)
 		goto hub;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c8bf954042e0..823395c23cc3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -350,7 +350,7 @@ static int vc4_drm_bind(struct device *dev)
 			return -EPROBE_DEFER;
 	}
 
-	ret = drm_aperture_remove_framebuffers(false, driver);
+	ret = drm_aperture_remove_framebuffers(driver);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index 7096703c3949..cbe33b49fd5d 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -13,14 +13,13 @@ int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t
 					resource_size_t size);
 
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 bool primary, const struct drm_driver *req_driver);
+						 const struct drm_driver *req_driver);
 
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						     const struct drm_driver *req_driver);
 
 /**
  * drm_aperture_remove_framebuffers - remove all existing framebuffers
- * @primary: also kick vga16fb if present
  * @req_driver: requesting DRM driver
  *
  * This function removes all graphics device drivers. Use this function on systems
@@ -30,9 +29,9 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
  * 0 on success, or a negative errno code otherwise
  */
 static inline int
-drm_aperture_remove_framebuffers(bool primary, const struct drm_driver *req_driver)
+drm_aperture_remove_framebuffers(const struct drm_driver *req_driver)
 {
-	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary,
+	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1,
 							    req_driver);
 }
 
-- 
2.40.0

