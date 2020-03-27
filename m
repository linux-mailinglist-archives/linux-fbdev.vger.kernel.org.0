Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77B41951E4
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 08:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgC0H2n (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 03:28:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:61770 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgC0H2n (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 03:28:43 -0400
IronPort-SDR: m6ZHtMdufzf0me+nvTODGEFnhyjBOfB+3fe8n3CIFnvPm11LDdqyMD09a3BIJsQvuBt7kFiwnD
 vsDb9xDxBPSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 00:28:43 -0700
IronPort-SDR: gw3devUKRzo1D6uLlmmEAPY3RD76jJYsHTsKTlS4c+QLQz7iwUH1h0lcMC2DDRkec5VtQVbKVJ
 50l7o09clmzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="394291990"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.26.111])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:28:40 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com
Subject: [PATCH v8 02/14] drm/i915/dp: Read out DP SDPs
Date:   Fri, 27 Mar 2020 09:29:05 +0200
Message-Id: <20200327072917.3676391-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
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
v8: Rebased

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 191 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h |   3 +
 2 files changed, 194 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7f1a4e55cda1..8d0a7ba53f26 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4967,6 +4967,197 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
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
+	ret = hdmi_drm_infoframe_init(drm_infoframe);
+	if (ret)
+		return ret;
+
+	ret = cta_drm_infoframe_unpack_databytes(drm_infoframe, &sdp->db[2],
+						 HDMI_DRM_INFOFRAME_SIZE);
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
index 9632978e8c24..4b0a1e9942f6 100644
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
 
 static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
-- 
2.25.0

