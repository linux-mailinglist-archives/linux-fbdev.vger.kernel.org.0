Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0E7158A99
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Feb 2020 08:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgBKHrG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 11 Feb 2020 02:47:06 -0500
Received: from mga11.intel.com ([192.55.52.93]:32361 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727697AbgBKHrG (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 11 Feb 2020 02:47:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 23:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="312993662"
Received: from helsinki.fi.intel.com ([10.237.66.159])
  by orsmga001.jf.intel.com with ESMTP; 10 Feb 2020 23:47:04 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v7 03/18] drm/i915/dp: Add compute routine for DP HDR Metadata Infoframe SDP
Date:   Tue, 11 Feb 2020 09:46:42 +0200
Message-Id: <20200211074657.231405-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It stores computed dp hdr metadata infoframe sdp to infoframes.drm of
crtc state. It referenced intel_hdmi_compute_drm_infoframe().

While computing, we'll also fill out the infoframes.enable bitmask
appropriately.

v2: Wrap a long line.
v4: Use struct drm_device logging macros
v5: Fix typo [Uma]

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index bab802a7b3f3..fb008168ca83 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2471,6 +2471,29 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 					 &crtc_state->infoframes.vsc);
 }
 
+static void
+intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
+					    struct intel_crtc_state *crtc_state,
+					    const struct drm_connector_state *conn_state)
+{
+	int ret;
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct hdmi_drm_infoframe *drm_infoframe = &crtc_state->infoframes.drm.drm;
+
+	if (!conn_state->hdr_output_metadata)
+		return;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(drm_infoframe, conn_state);
+
+	if (ret) {
+		drm_dbg_kms(&dev_priv->drm, "couldn't set HDR metadata in infoframe\n");
+		return;
+	}
+
+	crtc_state->infoframes.enable |=
+		intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA);
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -2577,6 +2600,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 
 	intel_psr_compute_config(intel_dp, pipe_config);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
+	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
 
 	return 0;
 }
-- 
2.25.0

