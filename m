Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EACE1ADCBD
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 13:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbgDQL6T (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 07:58:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:15803 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730436AbgDQL6T (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 07:58:19 -0400
IronPort-SDR: 8FG0m71m8d4itr1eKOetZA3uujx1hoBHPUDfK5UamrZG9r4msUVk4yKNpq67cnWs2VmB6KL9l5
 8LfLin4dnSTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 04:58:18 -0700
IronPort-SDR: HcWU0k1ul8F/0aec0XSISCh+midiA5Zm5aAUo8TY6PNDGFAdvKgTOzIgUXLXmZVELrk0xOOcSi
 rqfl9walLkvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="279491971"
Received: from elewis-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.94.8])
  by orsmga008.jf.intel.com with ESMTP; 17 Apr 2020 04:58:16 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v10 05/14] drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
Date:   Fri, 17 Apr 2020 15:00:31 +0300
Message-Id: <20200417120040.3432332-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
References: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
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
index b9bf9bce49d6..1c2814f753f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13004,6 +13004,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
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

