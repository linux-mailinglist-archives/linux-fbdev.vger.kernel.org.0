Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F309614F3F9
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2020 22:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgAaVrL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jan 2020 16:47:11 -0500
Received: from mga17.intel.com ([192.55.52.151]:30307 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgAaVrL (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jan 2020 16:47:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jan 2020 13:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; 
   d="scan'208";a="262691456"
Received: from helsinki.fi.intel.com ([10.237.66.145])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 13:47:10 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 04/18] drm/i915/dp: Add compute routine for DP HDR Metadata Infoframe SDP
Date:   Fri, 31 Jan 2020 23:46:47 +0200
Message-Id: <20200131214701.1085737-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
References: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It stores computed dp hdr metadata infoframe sdp to infoframes.drm of
crtc state. It referenced intel_hdmi_compute_drm_infoframe().

While computing, we'll also fill out the inforames.enable bitmask
appropriately.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 705d36b548b1..64e697445085 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2463,6 +2463,26 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 					 &crtc_state->infoframes.vsc);
 }
 
+static void
+intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_crtc_state *crtc_state,
+					    const struct drm_connector_state *conn_state)
+{
+	int ret;
+	struct hdmi_drm_infoframe *drm_infoframe = &crtc_state->infoframes.drm.drm;
+
+	if (!conn_state->hdr_output_metadata)
+		return;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(drm_infoframe, conn_state);
+
+	if (ret) {
+		DRM_DEBUG_KMS("couldn't set HDR metadata in infoframe\n");
+		return;
+	}
+
+	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA);
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -2569,6 +2589,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 
 	intel_psr_compute_config(intel_dp, pipe_config);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
+	intel_dp_compute_hdr_metadata_infoframe_sdp(pipe_config, conn_state);
 
 	return 0;
 }
-- 
2.24.1

