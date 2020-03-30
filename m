Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA1F1980F4
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Mar 2020 18:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbgC3QXR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Mar 2020 12:23:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:60988 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730125AbgC3QXR (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Mar 2020 12:23:17 -0400
IronPort-SDR: nN6UcoQ3Q8HeHazkcZdfqGlga0bZGn7Jg81D8MqS/6WxkvXKddUdLmZHTWrO+1KVqtdXaW8lQg
 s9CwVGFidjEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 09:23:16 -0700
IronPort-SDR: Ba7MpsXN6EkDUSKzg48EcmngAXAhO2eLOUXiN1M3SzC7ZvIqMnABpGBFXjNzngx4HDwLgwjBxG
 KrCATQK4rSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="248753991"
Received: from niamhrya-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.1.242])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 09:23:14 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v9 07/14] drm/i915: Program DP SDPs with computed configs
Date:   Mon, 30 Mar 2020 19:23:49 +0300
Message-Id: <20200330162356.162361-8-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200330162356.162361-1-gwan-gyeong.mun@intel.com>
References: <20200330162356.162361-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In order to use computed config for DP SDPs (DP VSC SDP and DP HDR Metadata
Infoframe SDP), it replaces intel_dp_vsc_enable() function and
intel_dp_hdr_metadata_enable() function to intel_dp_set_infoframes()
function.
And it removes unused functions.

Before:
 intel_dp_vsc_enable() and intel_dp_hdr_metadata_enable() compute sdp
 configs and program sdp registers on enable callback of encoder.

After:
 It separates computing of sdp configs and programming of sdp register.
 The compute config callback of encoder calls computing sdp configs.
 The enable callback of encoder calls programming sdp register.

v3: Rebased
v5: Polish commit message [Uma]

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c |   3 +-
 drivers/gpu/drm/i915/display/intel_dp.c  | 226 -----------------------
 drivers/gpu/drm/i915/display/intel_dp.h  |   6 -
 3 files changed, 1 insertion(+), 234 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 916a802af788..feaa12c6a494 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3545,8 +3545,7 @@ static void intel_enable_ddi_dp(struct intel_encoder *encoder,
 
 	intel_edp_backlight_on(crtc_state, conn_state);
 	intel_psr_enable(intel_dp, crtc_state);
-	intel_dp_vsc_enable(intel_dp, crtc_state, conn_state);
-	intel_dp_hdr_metadata_enable(intel_dp, crtc_state, conn_state);
+	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
 	intel_edp_drrs_enable(intel_dp, crtc_state);
 
 	if (crtc_state->has_audio)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e34a6a75e97c..1f394d07d982 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5156,232 +5156,6 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
 	}
 }
 
-static void
-intel_dp_setup_vsc_sdp(struct intel_dp *intel_dp,
-		       const struct intel_crtc_state *crtc_state,
-		       const struct drm_connector_state *conn_state)
-{
-	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
-	struct dp_sdp vsc_sdp = {};
-
-	/* Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119 */
-	vsc_sdp.sdp_header.HB0 = 0;
-	vsc_sdp.sdp_header.HB1 = 0x7;
-
-	/*
-	 * VSC SDP supporting 3D stereo, PSR2, and Pixel Encoding/
-	 * Colorimetry Format indication.
-	 */
-	vsc_sdp.sdp_header.HB2 = 0x5;
-
-	/*
-	 * VSC SDP supporting 3D stereo, + PSR2, + Pixel Encoding/
-	 * Colorimetry Format indication (HB2 = 05h).
-	 */
-	vsc_sdp.sdp_header.HB3 = 0x13;
-
-	/* DP 1.4a spec, Table 2-120 */
-	switch (crtc_state->output_format) {
-	case INTEL_OUTPUT_FORMAT_YCBCR444:
-		vsc_sdp.db[16] = 0x1 << 4; /* YCbCr 444 : DB16[7:4] = 1h */
-		break;
-	case INTEL_OUTPUT_FORMAT_YCBCR420:
-		vsc_sdp.db[16] = 0x3 << 4; /* YCbCr 420 : DB16[7:4] = 3h */
-		break;
-	case INTEL_OUTPUT_FORMAT_RGB:
-	default:
-		/* RGB: DB16[7:4] = 0h */
-		break;
-	}
-
-	switch (conn_state->colorspace) {
-	case DRM_MODE_COLORIMETRY_BT709_YCC:
-		vsc_sdp.db[16] |= 0x1;
-		break;
-	case DRM_MODE_COLORIMETRY_XVYCC_601:
-		vsc_sdp.db[16] |= 0x2;
-		break;
-	case DRM_MODE_COLORIMETRY_XVYCC_709:
-		vsc_sdp.db[16] |= 0x3;
-		break;
-	case DRM_MODE_COLORIMETRY_SYCC_601:
-		vsc_sdp.db[16] |= 0x4;
-		break;
-	case DRM_MODE_COLORIMETRY_OPYCC_601:
-		vsc_sdp.db[16] |= 0x5;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
-	case DRM_MODE_COLORIMETRY_BT2020_RGB:
-		vsc_sdp.db[16] |= 0x6;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_YCC:
-		vsc_sdp.db[16] |= 0x7;
-		break;
-	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
-	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
-		vsc_sdp.db[16] |= 0x4; /* DCI-P3 (SMPTE RP 431-2) */
-		break;
-	default:
-		/* sRGB (IEC 61966-2-1) / ITU-R BT.601: DB16[0:3] = 0h */
-
-		/* RGB->YCBCR color conversion uses the BT.709 color space. */
-		if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
-			vsc_sdp.db[16] |= 0x1; /* 0x1, ITU-R BT.709 */
-		break;
-	}
-
-	/*
-	 * For pixel encoding formats YCbCr444, YCbCr422, YCbCr420, and Y Only,
-	 * the following Component Bit Depth values are defined:
-	 * 001b = 8bpc.
-	 * 010b = 10bpc.
-	 * 011b = 12bpc.
-	 * 100b = 16bpc.
-	 */
-	switch (crtc_state->pipe_bpp) {
-	case 24: /* 8bpc */
-		vsc_sdp.db[17] = 0x1;
-		break;
-	case 30: /* 10bpc */
-		vsc_sdp.db[17] = 0x2;
-		break;
-	case 36: /* 12bpc */
-		vsc_sdp.db[17] = 0x3;
-		break;
-	case 48: /* 16bpc */
-		vsc_sdp.db[17] = 0x4;
-		break;
-	default:
-		MISSING_CASE(crtc_state->pipe_bpp);
-		break;
-	}
-
-	/*
-	 * Dynamic Range (Bit 7)
-	 * 0 = VESA range, 1 = CTA range.
-	 * all YCbCr are always limited range
-	 */
-	vsc_sdp.db[17] |= 0x80;
-
-	/*
-	 * Content Type (Bits 2:0)
-	 * 000b = Not defined.
-	 * 001b = Graphics.
-	 * 010b = Photo.
-	 * 011b = Video.
-	 * 100b = Game
-	 * All other values are RESERVED.
-	 * Note: See CTA-861-G for the definition and expected
-	 * processing by a stream sink for the above contect types.
-	 */
-	vsc_sdp.db[18] = 0;
-
-	intel_dig_port->write_infoframe(&intel_dig_port->base,
-			crtc_state, DP_SDP_VSC, &vsc_sdp, sizeof(vsc_sdp));
-}
-
-static void
-intel_dp_setup_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
-					  const struct intel_crtc_state *crtc_state,
-					  const struct drm_connector_state *conn_state)
-{
-	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
-	struct dp_sdp infoframe_sdp = {};
-	struct hdmi_drm_infoframe drm_infoframe = {};
-	const int infoframe_size = HDMI_INFOFRAME_HEADER_SIZE + HDMI_DRM_INFOFRAME_SIZE;
-	unsigned char buf[HDMI_INFOFRAME_HEADER_SIZE + HDMI_DRM_INFOFRAME_SIZE];
-	ssize_t len;
-	int ret;
-
-	ret = drm_hdmi_infoframe_set_hdr_metadata(&drm_infoframe, conn_state);
-	if (ret) {
-		DRM_DEBUG_KMS("couldn't set HDR metadata in infoframe\n");
-		return;
-	}
-
-	len = hdmi_drm_infoframe_pack_only(&drm_infoframe, buf, sizeof(buf));
-	if (len < 0) {
-		DRM_DEBUG_KMS("buffer size is smaller than hdr metadata infoframe\n");
-		return;
-	}
-
-	if (len != infoframe_size) {
-		DRM_DEBUG_KMS("wrong static hdr metadata size\n");
-		return;
-	}
-
-	/*
-	 * Set up the infoframe sdp packet for HDR static metadata.
-	 * Prepare VSC Header for SU as per DP 1.4a spec,
-	 * Table 2-100 and Table 2-101
-	 */
-
-	/* Packet ID, 00h for non-Audio INFOFRAME */
-	infoframe_sdp.sdp_header.HB0 = 0;
-	/*
-	 * Packet Type 80h + Non-audio INFOFRAME Type value
-	 * HDMI_INFOFRAME_TYPE_DRM: 0x87,
-	 */
-	infoframe_sdp.sdp_header.HB1 = drm_infoframe.type;
-	/*
-	 * Least Significant Eight Bits of (Data Byte Count – 1)
-	 * infoframe_size - 1,
-	 */
-	infoframe_sdp.sdp_header.HB2 = 0x1D;
-	/* INFOFRAME SDP Version Number */
-	infoframe_sdp.sdp_header.HB3 = (0x13 << 2);
-	/* CTA Header Byte 2 (INFOFRAME Version Number) */
-	infoframe_sdp.db[0] = drm_infoframe.version;
-	/* CTA Header Byte 3 (Length of INFOFRAME): HDMI_DRM_INFOFRAME_SIZE */
-	infoframe_sdp.db[1] = drm_infoframe.length;
-	/*
-	 * Copy HDMI_DRM_INFOFRAME_SIZE size from a buffer after
-	 * HDMI_INFOFRAME_HEADER_SIZE
-	 */
-	BUILD_BUG_ON(sizeof(infoframe_sdp.db) < HDMI_DRM_INFOFRAME_SIZE + 2);
-	memcpy(&infoframe_sdp.db[2], &buf[HDMI_INFOFRAME_HEADER_SIZE],
-	       HDMI_DRM_INFOFRAME_SIZE);
-
-	/*
-	 * Size of DP infoframe sdp packet for HDR static metadata is consist of
-	 * - DP SDP Header(struct dp_sdp_header): 4 bytes
-	 * - Two Data Blocks: 2 bytes
-	 *    CTA Header Byte2 (INFOFRAME Version Number)
-	 *    CTA Header Byte3 (Length of INFOFRAME)
-	 * - HDMI_DRM_INFOFRAME_SIZE: 26 bytes
-	 *
-	 * Prior to GEN11's GMP register size is identical to DP HDR static metadata
-	 * infoframe size. But GEN11+ has larger than that size, write_infoframe
-	 * will pad rest of the size.
-	 */
-	intel_dig_port->write_infoframe(&intel_dig_port->base, crtc_state,
-					HDMI_PACKET_TYPE_GAMUT_METADATA,
-					&infoframe_sdp,
-					sizeof(struct dp_sdp_header) + 2 + HDMI_DRM_INFOFRAME_SIZE);
-}
-
-void intel_dp_vsc_enable(struct intel_dp *intel_dp,
-			 const struct intel_crtc_state *crtc_state,
-			 const struct drm_connector_state *conn_state)
-{
-	if (!intel_dp_needs_vsc_sdp(crtc_state, conn_state))
-		return;
-
-	intel_dp_setup_vsc_sdp(intel_dp, crtc_state, conn_state);
-}
-
-void intel_dp_hdr_metadata_enable(struct intel_dp *intel_dp,
-				  const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
-{
-	if (!conn_state->hdr_output_metadata)
-		return;
-
-	intel_dp_setup_hdr_metadata_infoframe_sdp(intel_dp,
-						  crtc_state,
-						  conn_state);
-}
-
 static u8 intel_dp_autotest_link_training(struct intel_dp *intel_dp)
 {
 	int status = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 4b0a1e9942f6..570bae0e84ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -108,12 +108,6 @@ int intel_dp_link_required(int pixel_clock, int bpp);
 int intel_dp_max_data_rate(int max_link_clock, int max_lanes);
 bool intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
-void intel_dp_vsc_enable(struct intel_dp *intel_dp,
-			 const struct intel_crtc_state *crtc_state,
-			 const struct drm_connector_state *conn_state);
-void intel_dp_hdr_metadata_enable(struct intel_dp *intel_dp,
-				  const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state);
 void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state);
-- 
2.25.0

