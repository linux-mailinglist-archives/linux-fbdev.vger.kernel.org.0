Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17C875C80F
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jul 2023 15:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjGUNnS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jul 2023 09:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjGUNnS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jul 2023 09:43:18 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2425E1722;
        Fri, 21 Jul 2023 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689946997; x=1721482997;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y9NwNsAvvJdmVT4QE057QDIVHB4LGSYtYpCb0IL6g84=;
  b=V7cmpBxSdrQTcPePu3paLZNO1EmDCure8gzkBEo6N8G2Z6CsBkzbWtf7
   p9P2dyWMFGsOJDV+JyEDPkB+9qFTaiAm0JGNRfqba+6CVB+30ESR0i3SC
   zJWV9r3//VH5L1FdCuJHHhpynmeSDGXNZUBPG4ROlIO71j3V+XiiuJQbg
   Zm2/r/Mj+RIkfEkQi8/BMRbsmTkP9uo0Wl5P4SH8TVAfgPZcyTqAxt73D
   jYJVuIT4MHmovmITG3MAwpBIvC2ZcWDsycwkuKp15uC6wEx52L0S3nQu+
   QsqC0LnxU3i4xKJ5bNk39vd+JgJAukYM0E3+4MOekvGF6BF/WP4vRJHAg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430816233"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="430816233"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 06:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848826421"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="848826421"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 06:43:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0E01F370; Fri, 21 Jul 2023 16:43:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Helge Deller <deller@gmx.de>, Stephen Boyd <sboyd@kernel.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Nikita Shubin via B4 Relay 
        <devnull+nikita.shubin.maquefel.me@kernel.org>
Subject: [PATCH v1 1/1] drm/i915: Move abs_diff() to math.h
Date:   Fri, 21 Jul 2023 16:42:35 +0300
Message-Id: <20230721134235.15517-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

abs_diff() belongs to math.h. Move it there.
This will allow others to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |  7 -------
 drivers/gpu/ipu-v3/ipu-image-convert.c        | 14 ++++++--------
 drivers/video/fbdev/core/svgalib.c            |  7 +------
 include/linux/math.h                          |  6 ++++++
 5 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 6b2d8a1e2aa9..290e856fe9e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/math.h>
 #include <linux/string_helpers.h>
 
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index ba62eb5d7c51..04e6810954b2 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -29,13 +29,6 @@
 
 #include "intel_wakeref.h"
 
-/*FIXME: Move this to a more appropriate place. */
-#define abs_diff(a, b) ({			\
-	typeof(a) __a = (a);			\
-	typeof(b) __b = (b);			\
-	(void) (&__a == &__b);			\
-	__a > __b ? (__a - __b) : (__b - __a); })
-
 enum tc_port;
 struct drm_i915_private;
 struct intel_atomic_state;
diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index af1612044eef..420992ac2ecd 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -8,6 +8,8 @@
 #include <linux/interrupt.h>
 #include <linux/dma-mapping.h>
 #include <video/imx-ipu-image-convert.h>
+#include <linux/math.h>
+
 #include "ipu-prv.h"
 
 /*
@@ -543,7 +545,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		unsigned int in_pos;
 		unsigned int in_pos_aligned;
 		unsigned int in_pos_rounded;
-		unsigned int abs_diff;
+		unsigned int diff;
 
 		/*
 		 * Tiles in the right row / bottom column may not be allowed to
@@ -575,15 +577,11 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		    (in_edge - in_pos_rounded) % in_burst)
 			continue;
 
-		if (in_pos < in_pos_aligned)
-			abs_diff = in_pos_aligned - in_pos;
-		else
-			abs_diff = in_pos - in_pos_aligned;
-
-		if (abs_diff < min_diff) {
+		diff = abs_diff(in_pos, in_pos_aligned);
+		if (diff < min_diff) {
 			in_seam = in_pos_rounded;
 			out_seam = out_pos;
-			min_diff = abs_diff;
+			min_diff = diff;
 		}
 	}
 
diff --git a/drivers/video/fbdev/core/svgalib.c b/drivers/video/fbdev/core/svgalib.c
index 9e01322fabe3..2cba158888ea 100644
--- a/drivers/video/fbdev/core/svgalib.c
+++ b/drivers/video/fbdev/core/svgalib.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/math.h>
 #include <linux/svga.h>
 #include <asm/types.h>
 #include <asm/io.h>
@@ -372,12 +373,6 @@ EXPORT_SYMBOL(svga_get_caps);
  *  F_VCO = (F_BASE * M) / N
  *  F_OUT = F_VCO / (2^R)
  */
-
-static inline u32 abs_diff(u32 a, u32 b)
-{
-	return (a > b) ? (a - b) : (b - a);
-}
-
 int svga_compute_pll(const struct svga_pll *pll, u32 f_wanted, u16 *m, u16 *n, u16 *r, int node)
 {
 	u16 am, an, ar;
diff --git a/include/linux/math.h b/include/linux/math.h
index 449a29b73f6d..45a21b51f183 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -157,6 +157,12 @@ __STRUCT_FRACT(u32)
 	__builtin_types_compatible_p(typeof(x), unsigned type),		\
 	({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
 
+#define abs_diff(a, b) ({			\
+	typeof(a) __a = (a);			\
+	typeof(b) __b = (b);			\
+	(void) (&__a == &__b);			\
+	__a > __b ? (__a - __b) : (__b - __a); })
+
 /**
  * reciprocal_scale - "scale" a value into range [0, ep_ro)
  * @val: value
-- 
2.40.0.1.gaa8946217a0b

