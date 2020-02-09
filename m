Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30730156894
	for <lists+linux-fbdev@lfdr.de>; Sun,  9 Feb 2020 04:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbgBIDxv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 8 Feb 2020 22:53:51 -0500
Received: from mga04.intel.com ([192.55.52.120]:63111 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727550AbgBIDxv (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 8 Feb 2020 22:53:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Feb 2020 19:53:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,419,1574150400"; 
   d="scan'208";a="221210494"
Received: from rrcarnag-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.14.133])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2020 19:53:49 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v5 02/18] drm/i915/dp: Add compute routine for DP VSC SDP
Date:   Sun,  9 Feb 2020 05:53:29 +0200
Message-Id: <20200209035345.357436-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200209035345.357436-1-gwan-gyeong.mun@intel.com>
References: <20200209035345.357436-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In order to support state readout for DP VSC SDP, we need to have a
structure which holds DP VSC SDP payload data such as
"union hdmi_infoframe drm" which is used for DRM infoframe.
It adds a struct drm_dp_vsc_sdp vsc to intel_crtc_state.infoframes.

And it stores computed dp vsc sdp to infoframes.vsc of crtc state.
While computing we'll also fill out the inforames.enable bitmask
appropriately.

The compute routine follows DP 1.4 spec [Table 2-117: VSC SDP Payload for
DB16 through DB18].

v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
v5:
  - Rebased
  - Add warning where a bpc is 6 and a pixel format is RGB.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 7ae0bc8b80d1..7997c307026d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -997,6 +997,7 @@ struct intel_crtc_state {
 		union hdmi_infoframe spd;
 		union hdmi_infoframe hdmi;
 		union hdmi_infoframe drm;
+		struct drm_dp_vsc_sdp vsc;
 	} infoframes;
 
 	/* HDMI scrambling status */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f4dede6253f8..499377bf2891 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2372,6 +2372,103 @@ static bool intel_dp_port_has_audio(struct drm_i915_private *dev_priv,
 	return true;
 }
 
+static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc_state,
+					     const struct drm_connector_state *conn_state,
+					     struct drm_dp_vsc_sdp *vsc)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+
+	/*
+	 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
+	 * VSC SDP supporting 3D stereo, PSR2, and Pixel Encoding/
+	 * Colorimetry Format indication.
+	 */
+	vsc->revision = 0x5;
+	vsc->length = 0x13;
+
+	/* DP 1.4a spec, Table 2-120 */
+	switch (crtc_state->output_format) {
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		vsc->pixelformat = DP_PIXELFORMAT_YUV444;
+		break;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		vsc->pixelformat = DP_PIXELFORMAT_YUV420;
+		break;
+	case INTEL_OUTPUT_FORMAT_RGB:
+	default:
+		vsc->pixelformat = DP_PIXELFORMAT_RGB;
+	}
+
+	switch (conn_state->colorspace) {
+	case DRM_MODE_COLORIMETRY_BT709_YCC:
+		vsc->colorimetry = DP_COLORIMETRY_BT709_YCC;
+		break;
+	case DRM_MODE_COLORIMETRY_XVYCC_601:
+		vsc->colorimetry = DP_COLORIMETRY_XVYCC_601;
+		break;
+	case DRM_MODE_COLORIMETRY_XVYCC_709:
+		vsc->colorimetry = DP_COLORIMETRY_XVYCC_709;
+		break;
+	case DRM_MODE_COLORIMETRY_SYCC_601:
+		vsc->colorimetry = DP_COLORIMETRY_SYCC_601;
+		break;
+	case DRM_MODE_COLORIMETRY_OPYCC_601:
+		vsc->colorimetry = DP_COLORIMETRY_OPYCC_601;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
+		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_RGB:
+		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_YCC:
+		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
+		break;
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
+		vsc->colorimetry = DP_COLORIMETRY_DCI_P3_RGB;
+		break;
+	default:
+		/*
+		 * RGB->YCBCR color conversion uses the BT.709
+		 * color space.
+		 */
+		if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+			vsc->colorimetry = DP_COLORIMETRY_BT709_YCC;
+		else
+			vsc->colorimetry = DP_COLORIMETRY_DEFAULT;
+		break;
+	}
+
+	vsc->bpc = crtc_state->pipe_bpp / 3;
+	drm_WARN_ON(&dev_priv->drm, vsc->bpc == 6 &&
+				    vsc->pixelformat == DP_PIXELFORMAT_RGB);
+
+	/* all YCbCr are always limited range */
+	vsc->dynamic_range = DP_DYNAMIC_RANGE_CTA;
+	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
+}
+
+static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state,
+				     const struct drm_connector_state *conn_state)
+{
+	struct drm_dp_vsc_sdp *vsc = &crtc_state->infoframes.vsc;
+
+	/* When PSR is enabled, VSC SDP is handled by PSR routine */
+	if (intel_psr_enabled(intel_dp))
+		return;
+
+	if (!intel_dp_needs_vsc_sdp(crtc_state, conn_state))
+		return;
+
+	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
+	vsc->sdp_type = DP_SDP_VSC;
+	intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
+					 &crtc_state->infoframes.vsc);
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -2477,6 +2574,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		intel_dp_set_clock(encoder, pipe_config);
 
 	intel_psr_compute_config(intel_dp, pipe_config);
+	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 
 	return 0;
 }
-- 
2.24.1

