Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA191D2716
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 08:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgENGHu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 02:07:50 -0400
Received: from mga14.intel.com ([192.55.52.115]:40788 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgENGHu (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 02:07:50 -0400
IronPort-SDR: drI/GbMefcUOKubLFh23dL/WCbXrWAG9ErpJwxHtL9M5kTIZzflDIlg4Jj/7X2WqZZZ/ddHWU7
 G8lCC+ymAXxQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 23:07:49 -0700
IronPort-SDR: dH5LOujCUdfZaazYDrzWTfmYBayy6DCNa1OzIL6aB/UK7GvY0yLBPROshJDNS2ypit/HbIEqXS
 syLoQsJcy18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="409956995"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.18.167])
  by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:47 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        jani.nikula@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ville.syrjala@linux.intel.com
Subject: [PATCH v12 06/14] drm/i915: Include DP VSC SDP in the crtc state dump
Date:   Thu, 14 May 2020 09:07:24 +0300
Message-Id: <20200514060732.3378396-7-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
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
index eb3ab77bc559..5484c8f3f8ff 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12866,6 +12866,16 @@ intel_dump_infoframe(struct drm_i915_private *dev_priv,
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
@@ -13029,6 +13039,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
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

