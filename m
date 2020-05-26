Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25741D270E
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 08:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgENGHl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 02:07:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:40788 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgENGHl (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 02:07:41 -0400
IronPort-SDR: /T1warpzvuHVdwgCqnSyeeLieBOfqQh4roN7v608/8BOkK4v9UOrXb26NQ6wEw9ZE8Kti3zpiH
 +39eWzSIo4Kg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 23:07:40 -0700
IronPort-SDR: 4vugoUrLNZjCx+YXerUsXrS5R0KmTv3GzokI/tM/KNujOuXONeLcLlr+Axns7DXT490Ze9rhEC
 qeNn62OD3euQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="409956970"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.18.167])
  by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:38 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        jani.nikula@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ville.syrjala@linux.intel.com
Subject: [PATCH v12 02/14] drm/i915/dp: Read out DP SDPs
Date:   Thu, 14 May 2020 09:07:20 +0300
Message-Id: <20200514060732.3378396-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It adds code to read the DP SDPs from the video DIP and unpack them into
the crtc state.

It adds routines that read out DP VSC SDP and DP HDR Metadata Infoframe SDP
In order to unpack DP VSC SDP, it adds intel_dp_vsc_sdp_unpack() function.
It follows DP 1.4a spec. [Table 2-116: VSC SDP Header Bytes] and
[Table 2-117: VSC SDP Payload for DB16 through DB18]

In order to unpack DP HDR Metadata Infoframe SDP, it adds
intel_dp_hdr_metadata_infoframe_sdp_unpack(). And it follows DP 1.4a spec.
([Table 2-125: INFOFRAME SDP v1.2 Header Bytes] and
[Table 2-126: INFOFRAME SDP v1.2 Payload Data Bytes - DB0 through DB31])
and CTA-861-G spec. [Table-42 Dynamic Range and Mastering InfoFrame].

A naming rule and style of intel_read_dp_sdp() function references
intel_read_infoframe() function of intel_hdmi.c

v2: Minor style fix
v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
v4: Use struct drm_device logging macros
v5: Addressed review comments from Uma
  - Polish commit message and comments
  - Combine the if checks of sdp.HB2 and sdp.HB3
  - Add 6bpc to unpacking of VSC SDP

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 187 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h |   3 +
 2 files changed, 190 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 67723dede1d1..84c0105be61b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4971,6 +4971,193 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
 
+static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
+				   const void *buffer, size_t size)
+{
+	const struct dp_sdp *sdp = buffer;
+
+	if (size < sizeof(struct dp_sdp))
+		return -EINVAL;
+
+	memset(vsc, 0, size);
+
+	if (sdp->sdp_header.HB0 != 0)
+		return -EINVAL;
+
+	if (sdp->sdp_header.HB1 != DP_SDP_VSC)
+		return -EINVAL;
+
+	vsc->sdp_type = sdp->sdp_header.HB1;
+	vsc->revision = sdp->sdp_header.HB2;
+	vsc->length = sdp->sdp_header.HB3;
+
+	if ((sdp->sdp_header.HB2 == 0x2 && sdp->sdp_header.HB3 == 0x8) ||
+	    (sdp->sdp_header.HB2 == 0x4 && sdp->sdp_header.HB3 == 0xe)) {
+		/*
+		 * - HB2 = 0x2, HB3 = 0x8
+		 *   VSC SDP supporting 3D stereo + PSR
+		 * - HB2 = 0x4, HB3 = 0xe
+		 *   VSC SDP supporting 3D stereo + PSR2 with Y-coordinate of
+		 *   first scan line of the SU region (applies to eDP v1.4b
+		 *   and higher).
+		 */
+		return 0;
+	} else if (sdp->sdp_header.HB2 == 0x5 && sdp->sdp_header.HB3 == 0x13) {
+		/*
+		 * - HB2 = 0x5, HB3 = 0x13
+		 *   VSC SDP supporting 3D stereo + PSR2 + Pixel Encoding/Colorimetry
+		 *   Format.
+		 */
+		vsc->pixelformat = (sdp->db[16] >> 4) & 0xf;
+		vsc->colorimetry = sdp->db[16] & 0xf;
+		vsc->dynamic_range = (sdp->db[17] >> 7) & 0x1;
+
+		switch (sdp->db[17] & 0x7) {
+		case 0x0:
+			vsc->bpc = 6;
+			break;
+		case 0x1:
+			vsc->bpc = 8;
+			break;
+		case 0x2:
+			vsc->bpc = 10;
+			break;
+		case 0x3:
+			vsc->bpc = 12;
+			break;
+		case 0x4:
+			vsc->bpc = 16;
+			break;
+		default:
+			MISSING_CASE(sdp->db[17] & 0x7);
+			return -EINVAL;
+		}
+
+		vsc->content_type = sdp->db[18] & 0x7;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
+					   const void *buffer, size_t size)
+{
+	int ret;
+
+	const struct dp_sdp *sdp = buffer;
+
+	if (size < sizeof(struct dp_sdp))
+		return -EINVAL;
+
+	if (sdp->sdp_header.HB0 != 0)
+		return -EINVAL;
+
+	if (sdp->sdp_header.HB1 != HDMI_INFOFRAME_TYPE_DRM)
+		return -EINVAL;
+
+	/*
+	 * Least Significant Eight Bits of (Data Byte Count – 1)
+	 * 1Dh (i.e., Data Byte Count = 30 bytes).
+	 */
+	if (sdp->sdp_header.HB2 != 0x1D)
+		return -EINVAL;
+
+	/* Most Significant Two Bits of (Data Byte Count – 1), Clear to 00b. */
+	if ((sdp->sdp_header.HB3 & 0x3) != 0)
+		return -EINVAL;
+
+	/* INFOFRAME SDP Version Number */
+	if (((sdp->sdp_header.HB3 >> 2) & 0x3f) != 0x13)
+		return -EINVAL;
+
+	/* CTA Header Byte 2 (INFOFRAME Version Number) */
+	if (sdp->db[0] != 1)
+		return -EINVAL;
+
+	/* CTA Header Byte 3 (Length of INFOFRAME): HDMI_DRM_INFOFRAME_SIZE */
+	if (sdp->db[1] != HDMI_DRM_INFOFRAME_SIZE)
+		return -EINVAL;
+
+	ret = hdmi_drm_infoframe_unpack_only(drm_infoframe, &sdp->db[2],
+					     HDMI_DRM_INFOFRAME_SIZE);
+
+	return ret;
+}
+
+static void intel_read_dp_vsc_sdp(struct intel_encoder *encoder,
+				  struct intel_crtc_state *crtc_state,
+				  struct drm_dp_vsc_sdp *vsc)
+{
+	struct intel_digital_port *intel_dig_port = enc_to_dig_port(encoder);
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	unsigned int type = DP_SDP_VSC;
+	struct dp_sdp sdp = {};
+	int ret;
+
+	/* When PSR is enabled, VSC SDP is handled by PSR routine */
+	if (intel_psr_enabled(intel_dp))
+		return;
+
+	if ((crtc_state->infoframes.enable &
+	     intel_hdmi_infoframe_enable(type)) == 0)
+		return;
+
+	intel_dig_port->read_infoframe(encoder, crtc_state, type, &sdp, sizeof(sdp));
+
+	ret = intel_dp_vsc_sdp_unpack(vsc, &sdp, sizeof(sdp));
+
+	if (ret)
+		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP VSC SDP\n");
+}
+
+static void intel_read_dp_hdr_metadata_infoframe_sdp(struct intel_encoder *encoder,
+						     struct intel_crtc_state *crtc_state,
+						     struct hdmi_drm_infoframe *drm_infoframe)
+{
+	struct intel_digital_port *intel_dig_port = enc_to_dig_port(encoder);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	unsigned int type = HDMI_PACKET_TYPE_GAMUT_METADATA;
+	struct dp_sdp sdp = {};
+	int ret;
+
+	if ((crtc_state->infoframes.enable &
+	    intel_hdmi_infoframe_enable(type)) == 0)
+		return;
+
+	intel_dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
+				       sizeof(sdp));
+
+	ret = intel_dp_hdr_metadata_infoframe_sdp_unpack(drm_infoframe, &sdp,
+							 sizeof(sdp));
+
+	if (ret)
+		drm_dbg_kms(&dev_priv->drm,
+			    "Failed to unpack DP HDR Metadata Infoframe SDP\n");
+}
+
+void intel_read_dp_sdp(struct intel_encoder *encoder,
+		       struct intel_crtc_state *crtc_state,
+		       unsigned int type)
+{
+	switch (type) {
+	case DP_SDP_VSC:
+		intel_read_dp_vsc_sdp(encoder, crtc_state,
+				      &crtc_state->infoframes.vsc);
+		break;
+	case HDMI_PACKET_TYPE_GAMUT_METADATA:
+		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
+							 &crtc_state->infoframes.drm.drm);
+		break;
+	default:
+		MISSING_CASE(type);
+		break;
+	}
+}
+
 static void
 intel_dp_setup_vsc_sdp(struct intel_dp *intel_dp,
 		       const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 6659ce15a693..faa2a3c5ee4e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -117,6 +117,9 @@ void intel_dp_hdr_metadata_enable(struct intel_dp *intel_dp,
 void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state);
+void intel_read_dp_sdp(struct intel_encoder *encoder,
+		       struct intel_crtc_state *crtc_state,
+		       unsigned int type);
 bool intel_digital_port_connected(struct intel_encoder *encoder);
 void intel_dp_process_phy_request(struct intel_dp *intel_dp);
 
-- 
2.25.0

