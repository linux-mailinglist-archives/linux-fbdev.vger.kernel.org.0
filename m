Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAB5151347
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Feb 2020 00:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgBCXcg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Feb 2020 18:32:36 -0500
Received: from mga06.intel.com ([134.134.136.31]:12343 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727170AbgBCXcf (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 3 Feb 2020 18:32:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 15:20:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
   d="scan'208";a="310866860"
Received: from helsinki.fi.intel.com ([10.237.66.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2020 15:20:32 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3 10/17] drm/i915: Include DP VSC SDP in the crtc state dump
Date:   Tue,  4 Feb 2020 01:20:07 +0200
Message-Id: <20200203232014.906651-11-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Dump out the DP VSC SDP in the normal crtc state dump

v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
    Use drm core's DP VSC SDP logging function

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 593c63f51210..4f187fd330e8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12878,6 +12878,16 @@ intel_dump_infoframe(struct drm_i915_private *dev_priv,
 	hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, frame);
 }
 
+static void
+intel_dump_dp_vsc_sdp(struct drm_i915_private *dev_priv,
+		      const struct drm_dp_vsc_sdp *vsc)
+{
+	if (!drm_debug_enabled(DRM_UT_KMS))
+		return;
+
+	drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, vsc);
+}
+
 #define OUTPUT_TYPE(x) [INTEL_OUTPUT_ ## x] = #x
 
 static const char * const output_type_str[] = {
@@ -13036,6 +13046,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
+		intel_dump_dp_vsc_sdp(dev_priv, &pipe_config->infoframes.vsc);
 
 	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
-- 
2.24.1

