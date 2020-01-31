Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F0614F404
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2020 22:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgAaVrW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jan 2020 16:47:22 -0500
Received: from mga17.intel.com ([192.55.52.151]:30307 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgAaVrW (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jan 2020 16:47:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jan 2020 13:47:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; 
   d="scan'208";a="262691482"
Received: from helsinki.fi.intel.com ([10.237.66.145])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 13:47:20 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 11/18] drm/i915: Include DP VSC SDP in the crtc state dump
Date:   Fri, 31 Jan 2020 23:46:54 +0200
Message-Id: <20200131214701.1085737-12-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
References: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Dump out the DP VSC SDP in the normal crtc state dump

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 593c63f51210..7d298f14799d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12878,6 +12878,16 @@ intel_dump_infoframe(struct drm_i915_private *dev_priv,
 	hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, frame);
 }
 
+static void
+intel_dump_dp_vsc_sdp(struct drm_i915_private *dev_priv,
+		      const struct intel_dp_vsc_sdp *vsc)
+{
+	if (!drm_debug_enabled(DRM_UT_KMS))
+		return;
+
+	intel_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, vsc);
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

