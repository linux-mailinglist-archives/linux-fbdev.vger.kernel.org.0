Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC2F14F3F6
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2020 22:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgAaVrI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jan 2020 16:47:08 -0500
Received: from mga17.intel.com ([192.55.52.151]:30307 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgAaVrI (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jan 2020 16:47:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jan 2020 13:47:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; 
   d="scan'208";a="262691449"
Received: from helsinki.fi.intel.com ([10.237.66.145])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 13:47:06 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 02/18] drm/i915: Add DP VSC SDP payload data to intel_crtc_state.infoframes
Date:   Fri, 31 Jan 2020 23:46:45 +0200
Message-Id: <20200131214701.1085737-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
References: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In order to support state readout for DP VSC SDP, we need to have a
structure which holds DP VSC SDP payload data such as
"union hdmi_infoframe drm" which is used for DRM infoframe.

And In order to support DP HDR10, we have to support VSC SDP and
HDR Metadata Infoframe SDP. As we will use drm member variable of
intel_crtc_state.infoframes, we only need to add vsc sdp member variable
to intel_crtc_state.infoframes.

Because DP SDP payload type does not have common structure like as
"union hdmi_infoframe", it adds "struct intel_dp_vsc_sdp"
to intel_display_types.h

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 33ba93863488..81112d63342c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -780,6 +780,17 @@ enum intel_output_format {
 	INTEL_OUTPUT_FORMAT_YCBCR444,
 };
 
+struct intel_dp_vsc_sdp {
+	unsigned char sdp_type; /* Secondary-data Packet Type */
+	unsigned char revision; /* Revision Number */
+	unsigned char length; /* Number of Valid Data Bytes */
+	enum dp_colorspace colorspace;
+	enum dp_colorimetry colorimetry;
+	int bpc;
+	enum dp_dynamic_range dynamic_range;
+	enum dp_content_type content_type;
+};
+
 struct intel_crtc_state {
 	/*
 	 * uapi (drm) state. This is the software state shown to userspace.
@@ -1021,6 +1032,7 @@ struct intel_crtc_state {
 		union hdmi_infoframe spd;
 		union hdmi_infoframe hdmi;
 		union hdmi_infoframe drm;
+		struct intel_dp_vsc_sdp vsc;
 	} infoframes;
 
 	/* HDMI scrambling status */
-- 
2.24.1

