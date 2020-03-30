Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBB71980EF
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Mar 2020 18:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgC3QXQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Mar 2020 12:23:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:63541 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbgC3QXP (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Mar 2020 12:23:15 -0400
IronPort-SDR: AUEFRr60d2e+VAqB6skm4QpW6ac889G15PjlaSRK9YfpQM6deuh9Vrj8w+F6VPO1DGnrmyIWDj
 +R6XaL3UO8nA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 09:23:15 -0700
IronPort-SDR: oWbeGWVjnrEYIpBLKFr1JeV1F1yzN26MbCaXroca/BKenHJLUenINafOajUNl0WQJSCebmSkII
 wPX4FwGgn9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="248753973"
Received: from niamhrya-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.1.242])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 09:23:09 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v9 05/14] drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
Date:   Mon, 30 Mar 2020 19:23:47 +0300
Message-Id: <20200330162356.162361-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200330162356.162361-1-gwan-gyeong.mun@intel.com>
References: <20200330162356.162361-1-gwan-gyeong.mun@intel.com>
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
index 7fb60312d262..6f4f17a2ec1f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12986,6 +12986,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
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

