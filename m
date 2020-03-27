Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2ECC1951FF
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 08:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgC0H3H (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 03:29:07 -0400
Received: from mga14.intel.com ([192.55.52.115]:61789 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbgC0H3H (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 03:29:07 -0400
IronPort-SDR: k4wdKfVLN+Hf9WZojsmu1ow63ikwrqjsoBu/NGU7o1KmcikFXD/4vQNn4EePGQGyyzPHUl4k2S
 5CSu0pUHxnTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 00:29:06 -0700
IronPort-SDR: ohEgynh0zq5BL9X6EuyUuPb2M4Hy58pbOeVSfXx7wI8fRcPqq8Tsm/seO5sBf2sI9k/fZgpmWH
 5oUVdk2dfP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="394292124"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.26.111])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:29:05 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com
Subject: [PATCH v8 12/14] drm/i915: Stop sending DP SDPs on ddi disable
Date:   Fri, 27 Mar 2020 09:29:15 +0200
Message-Id: <20200327072917.3676391-13-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Call intel_dp_set_infoframes(false) function on intel_ddi_post_disable_dp()
to make sure not to send VSC SDP and HDR Metadata Infoframe SDP.

v5: Polish commit message [Uma]

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 57def3ae53b4..af66f3528a74 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3351,6 +3351,8 @@ static void intel_ddi_post_disable_dp(struct intel_encoder *encoder,
 					  INTEL_OUTPUT_DP_MST);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 
+	intel_dp_set_infoframes(encoder, false, old_crtc_state, old_conn_state);
+
 	/*
 	 * Power down sink before disabling the port, otherwise we end
 	 * up getting interrupts from the sink on detecting link loss.
-- 
2.25.0

