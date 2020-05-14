Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA171D2719
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 08:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgENGHz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 02:07:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:40825 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbgENGHz (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 02:07:55 -0400
IronPort-SDR: J/E0riFzwXoP/w454yT6sKmMSNqTp044/ZNsfrSd0RfNZ7jMxbrgbsfrDJSHnz9UmoZQjkT6pR
 rhghVNPQ9JrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 23:07:54 -0700
IronPort-SDR: HZLBfpAUnfuMCZ8KdC9bc7JSuphbC+2bkqSfilmKY3/b87gjVqojjrpUGQUQrL7P/xWVMXTrdq
 XwdrOYInBTDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="409957012"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.18.167])
  by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:52 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        jani.nikula@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ville.syrjala@linux.intel.com
Subject: [PATCH v12 08/14] drm/i915: Add state readout for DP HDR Metadata Infoframe SDP
Date:   Thu, 14 May 2020 09:07:26 +0300
Message-Id: <20200514060732.3378396-9-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Added state readout for DP HDR Metadata Infoframe SDP.

v9: Rebased
v10: Rebased

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 75c7ffb1874c..f2bb7527ba0c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4234,6 +4234,9 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 				    pipe_config->fec_enable);
 		}
 
+		pipe_config->infoframes.enable |=
+			intel_hdmi_infoframes_enabled(encoder, pipe_config);
+
 		break;
 	case TRANS_DDI_MODE_SELECT_DP_MST:
 		pipe_config->output_types |= BIT(INTEL_OUTPUT_DP_MST);
@@ -4245,6 +4248,9 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 					REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, temp);
 
 		intel_dp_get_m_n(intel_crtc, pipe_config);
+
+		pipe_config->infoframes.enable |=
+			intel_hdmi_infoframes_enabled(encoder, pipe_config);
 		break;
 	default:
 		break;
@@ -4299,6 +4305,8 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 
 	if (INTEL_GEN(dev_priv) >= 8)
 		bdw_get_trans_port_sync_config(pipe_config);
+
+	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
 
 static enum intel_output_type
-- 
2.25.0

