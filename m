Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3082C1951ED
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 08:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgC0H2v (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 03:28:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:61770 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgC0H2v (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 03:28:51 -0400
IronPort-SDR: qIq6Fq5y6jECOSmAZ+fkH7Q57z7a2mDEniBms269ub0qK1WAvuJWi3Hpyrs6Y44sazLVuhuPkl
 WfCod3l8BGHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 00:28:51 -0700
IronPort-SDR: dZVEeNbnRMLUtptjtjjn7PUrcGC17OoWSXF893HP/1SS1vA/lqiwmuPMiGk/t2B3I2qFQKM5Xx
 YNXgNN9Ra+ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="394292040"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.26.111])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:28:49 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com
Subject: [PATCH v8 06/14] drm/i915: Include DP VSC SDP in the crtc state dump
Date:   Fri, 27 Mar 2020 09:29:09 +0200
Message-Id: <20200327072917.3676391-7-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
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
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ed331f4b78ac..caa8fdeb9c33 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12921,6 +12921,16 @@ intel_dump_infoframe(struct drm_i915_private *dev_priv,
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
@@ -13079,6 +13089,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
+		intel_dump_dp_vsc_sdp(dev_priv, &pipe_config->infoframes.vsc);
 
 	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
-- 
2.25.0

