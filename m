Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0C715134A
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Feb 2020 00:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgBCXco (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Feb 2020 18:32:44 -0500
Received: from mga06.intel.com ([134.134.136.31]:12350 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727183AbgBCXco (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 3 Feb 2020 18:32:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 15:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
   d="scan'208";a="310866876"
Received: from helsinki.fi.intel.com ([10.237.66.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2020 15:20:35 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3 12/17] drm/i915: Add state readout for DP HDR Metadata Infoframe SDP
Date:   Tue,  4 Feb 2020 01:20:09 +0200
Message-Id: <20200203232014.906651-13-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
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

