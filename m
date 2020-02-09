Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788CB1568A6
	for <lists+linux-fbdev@lfdr.de>; Sun,  9 Feb 2020 04:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbgBIDyJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 8 Feb 2020 22:54:09 -0500
Received: from mga04.intel.com ([192.55.52.120]:63111 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727550AbgBIDyJ (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 8 Feb 2020 22:54:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Feb 2020 19:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,419,1574150400"; 
   d="scan'208";a="221210569"
Received: from rrcarnag-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.14.133])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2020 19:54:07 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v5 14/18] drm/i915: Disable DIPs when LSPCON is used
Date:   Sun,  9 Feb 2020 05:53:41 +0200
Message-Id: <20200209035345.357436-15-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200209035345.357436-1-gwan-gyeong.mun@intel.com>
References: <20200209035345.357436-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When LSPCON is used, DIPs(Data Island Packets of DP or HDMI) will not be
used. Therefore it explicitly disables DIPs on encoder->pre_enable
callback.

It resolves below issue
 - reproduce step of issue
 1) Boot or Pause & Resume system
 2) Do not enable SPD (Source Product Description) DIP
 3) When driver tries to read a DIP Ctl register,
    it is written that SDP DIP is enabled.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 7f29b08ea202..195e66744c1e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3627,6 +3627,22 @@ static void intel_ddi_pre_enable_hdmi(struct intel_encoder *encoder,
 				       crtc_state, conn_state);
 }
 
+static void intel_ddi_disable_dips(struct intel_encoder *encoder,
+				   const struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
+	u32 dip_enable = VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
+			 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
+			 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
+			 VIDEO_DIP_ENABLE_DRM_GLK;
+	u32 val = intel_de_read(dev_priv, reg);
+
+	val &= ~dip_enable;
+	intel_de_write(dev_priv, reg, val);
+	intel_de_posting_read(dev_priv, reg);
+}
+
 static void intel_ddi_pre_enable(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state)
@@ -3666,6 +3682,13 @@ static void intel_ddi_pre_enable(struct intel_encoder *encoder,
 			struct intel_digital_port *dig_port =
 					enc_to_dig_port(encoder);
 
+			/*
+			 * When LSPCON is used, DIPs (Data Island Packets of DP
+			 * or HDMI) will not be used.
+			 * Therefore we explicitly disable DIPs here.
+			 */
+			intel_ddi_disable_dips(encoder, crtc_state);
+
 			dig_port->set_infoframes(encoder,
 						 crtc_state->has_infoframe,
 						 crtc_state, conn_state);
-- 
2.24.1

