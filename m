Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197B41C8C2F
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 May 2020 15:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgEGN1S (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 May 2020 09:27:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:60550 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726235AbgEGN1P (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 7 May 2020 09:27:15 -0400
IronPort-SDR: FW2dTQvsMScoyjeFnPYdRURjO2QsGLjQNvpJSTt+C+RB9UvtcXUOlkdN9EdNZnX7nPkPh1oefa
 HpSWWfsSpLTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:27:15 -0700
IronPort-SDR: 93xM+XuvgcFNYuXbhLswDv4a6lVyqb0SQojjolNMdgJWGjwtiBFv+6fWjYbUXWqXFGLZBJvv5H
 XhlZBEn/K9YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="260528008"
Received: from plaurent-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.84.89])
  by orsmga003.jf.intel.com with ESMTP; 07 May 2020 06:27:14 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v11 05/14] drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
Date:   Thu,  7 May 2020 16:26:57 +0300
Message-Id: <20200507132706.2058969-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
References: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
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
index 93f8ae9471e7..172574a60ddd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13026,6 +13026,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
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

