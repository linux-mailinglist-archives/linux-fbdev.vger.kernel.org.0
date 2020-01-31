Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3531714F407
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2020 22:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgAaVrY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jan 2020 16:47:24 -0500
Received: from mga17.intel.com ([192.55.52.151]:30307 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgAaVrY (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jan 2020 16:47:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jan 2020 13:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; 
   d="scan'208";a="262691493"
Received: from helsinki.fi.intel.com ([10.237.66.145])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 13:47:23 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 13/18] drm/i915: Add state readout for DP HDR Metadata Infoframe SDP
Date:   Fri, 31 Jan 2020 23:46:56 +0200
Message-Id: <20200131214701.1085737-14-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
References: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Added state readout for DP HDR Metadata Infoframe SDP.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 374ab6a3757c..a9eaf7a6bc15 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4322,6 +4322,9 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 				      pipe_config->fec_enable);
 		}
 
+		pipe_config->infoframes.enable |=
+			intel_hdmi_infoframes_enabled(encoder, pipe_config);
+
 		break;
 	case TRANS_DDI_MODE_SELECT_DP_MST:
 		pipe_config->output_types |= BIT(INTEL_OUTPUT_DP_MST);
@@ -4333,6 +4336,9 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 					REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, temp);
 
 		intel_dp_get_m_n(intel_crtc, pipe_config);
+
+		pipe_config->infoframes.enable |=
+			intel_hdmi_infoframes_enabled(encoder, pipe_config);
 		break;
 	default:
 		break;
@@ -4383,6 +4389,8 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 	intel_read_infoframe(encoder, pipe_config,
 			     HDMI_INFOFRAME_TYPE_DRM,
 			     &pipe_config->infoframes.drm);
+
+	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
 
 static enum intel_output_type
-- 
2.24.1

