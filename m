Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 985D2110290
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfLCQji (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:39:38 -0500
Received: from mga11.intel.com ([192.55.52.93]:4773 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbfLCQji (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Dec 2019 11:39:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:37 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; 
   d="scan'208";a="361252013"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:39:34 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 06/12] drm: constify fb ops across all drivers
Date:   Tue,  3 Dec 2019 18:38:48 +0200
Message-Id: <59b43629ac60031c5bbf961d8c49695019bc9c6f.1575390740.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Now that the fbops member of struct fb_info is const, we can start
making the ops const as well.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c            | 2 +-
 drivers/gpu/drm/armada/armada_fbdev.c             | 2 +-
 drivers/gpu/drm/drm_fb_helper.c                   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c         | 2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c | 2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c        | 2 +-
 drivers/gpu/drm/msm/msm_fbdev.c                   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c           | 4 ++--
 drivers/gpu/drm/omapdrm/omap_fbdev.c              | 2 +-
 drivers/gpu/drm/radeon/radeon_fb.c                | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c     | 2 +-
 drivers/gpu/drm/tegra/fb.c                        | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 143753d237e7..2672dc64a310 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -69,7 +69,7 @@ amdgpufb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-static struct fb_ops amdgpufb_ops = {
+static const struct fb_ops amdgpufb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = amdgpufb_open,
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 090cc0d699ae..ac8a78bfda03 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -16,7 +16,7 @@
 #include "armada_fb.h"
 #include "armada_gem.h"
 
-static /*const*/ struct fb_ops armada_fb_ops = {
+static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1751bb9ee8d8..fb9bff0f4581 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1997,7 +1997,7 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		return -ENODEV;
 }
 
-static struct fb_ops drm_fbdev_fb_ops = {
+static const struct fb_ops drm_fbdev_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open	= drm_fbdev_fb_open,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index b0877b97291c..647a1fd1d815 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -60,7 +60,7 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
 	return 0;
 }
 
-static struct fb_ops exynos_drm_fb_ops = {
+static const struct fb_ops exynos_drm_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_mmap        = exynos_drm_fb_mmap,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
index b4c1cea051e8..1d15560ccb6e 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
@@ -38,7 +38,7 @@ static int hibmcfb_create_object(
 	return ret;
 }
 
-static struct fb_ops hibmc_drm_fb_ops = {
+static const struct fb_ops hibmc_drm_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var = drm_fb_helper_check_var,
 	.fb_set_par = drm_fb_helper_set_par,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 48c960ca12fb..1e98e432c9fa 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -100,7 +100,7 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return ret;
 }
 
-static struct fb_ops intelfb_ops = {
+static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_set_par = intel_fbdev_set_par,
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index cff198b2f470..db48867df47d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -26,7 +26,7 @@ struct msm_fbdev {
 	struct drm_framebuffer *fb;
 };
 
-static struct fb_ops msm_fb_ops = {
+static const struct fb_ops msm_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index f439f0a5b43a..0c5cdda3c336 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -203,7 +203,7 @@ nouveau_fbcon_release(struct fb_info *info, int user)
 	return 0;
 }
 
-static struct fb_ops nouveau_fbcon_ops = {
+static const struct fb_ops nouveau_fbcon_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = nouveau_fbcon_open,
@@ -214,7 +214,7 @@ static struct fb_ops nouveau_fbcon_ops = {
 	.fb_sync = nouveau_fbcon_sync,
 };
 
-static struct fb_ops nouveau_fbcon_sw_ops = {
+static const struct fb_ops nouveau_fbcon_sw_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = nouveau_fbcon_open,
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 58f53946ee4d..b06e5cbfd03a 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -70,7 +70,7 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return drm_fb_helper_pan_display(var, fbi);
 }
 
-static struct fb_ops omap_fb_ops = {
+static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
 
 	.fb_check_var	= drm_fb_helper_check_var,
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index 2c564f4f3468..8a93fcce40e5 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -73,7 +73,7 @@ radeonfb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-static struct fb_ops radeonfb_ops = {
+static const struct fb_ops radeonfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = radeonfb_open,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
index 02be6c5ff857..521fe42ac5e2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
@@ -27,7 +27,7 @@ static int rockchip_fbdev_mmap(struct fb_info *info,
 	return rockchip_gem_mmap_buf(private->fbdev_bo, vma);
 }
 
-static struct fb_ops rockchip_drm_fbdev_ops = {
+static const struct fb_ops rockchip_drm_fbdev_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_mmap	= rockchip_fbdev_mmap,
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 7cea89f29a5c..84f0e01e3428 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -192,7 +192,7 @@ static int tegra_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return __tegra_gem_mmap(&bo->gem, vma);
 }
 
-static struct fb_ops tegra_fb_ops = {
+static const struct fb_ops tegra_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_fillrect = drm_fb_helper_sys_fillrect,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index ea29953e0b08..c59806d40e15 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -624,7 +624,7 @@ static int vmw_fb_set_par(struct fb_info *info)
 }
 
 
-static struct fb_ops vmw_fb_ops = {
+static const struct fb_ops vmw_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var = vmw_fb_check_var,
 	.fb_set_par = vmw_fb_set_par,
-- 
2.20.1

