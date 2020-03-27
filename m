Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E781951EB
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 08:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgC0H2t (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 03:28:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:61770 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgC0H2t (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 03:28:49 -0400
IronPort-SDR: fxVLy7dmmbV/J80ZszWJhuAvoZ2Z2cXX8xf+m+r+e52V2rvz49pL97y6YK/LLE/AhRfyYc/sdM
 Q0e+z05d8M2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 00:28:49 -0700
IronPort-SDR: L3jDpuecUljYh55P0v+rutEogexKW/GrM5KXfwbWMDeN4Kfzw3CC0BDgTf19GcLHNzVsXYusy8
 /tul0ggL+9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="394292030"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.26.111])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:28:47 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com
Subject: [PATCH v8 05/14] drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
Date:   Fri, 27 Mar 2020 09:29:08 +0200
Message-Id: <20200327072917.3676391-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Dump out the DP HDR Metadata Infoframe SDP in the normal crtc state dump.

HDMI Dynamic Range and Mastering (DRM) infoframe and DP HDR Metadata
Infoframe SDP use the same member variable in infoframes of crtc state.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index abe9425d815f..ed331f4b78ac 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13076,6 +13076,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
+		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
 
 	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
-- 
2.25.0

