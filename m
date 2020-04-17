Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF71A1ADCC4
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 13:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730535AbgDQL6f (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 07:58:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:15818 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730510AbgDQL6e (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 07:58:34 -0400
IronPort-SDR: qV9Pm3h9bgWj31NN3Bp8owppWiJpYCMvDvlKvP7nv6B2rTO3Mj6/upUtxYejBNqpmo0LHBX/gd
 D4UpygieXyHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 04:58:34 -0700
IronPort-SDR: NZ8xWJgn+tsyq4IJEzEUc5ZPdGzPZvkF07Mpig5XY12r/FE2QTBMyu4wO1UlIlTcVMFxQClA6j
 RI0xW3/joeCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="279492058"
Received: from elewis-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.94.8])
  by orsmga008.jf.intel.com with ESMTP; 17 Apr 2020 04:58:32 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v10 12/14] drm/i915: Stop sending DP SDPs on ddi disable
Date:   Fri, 17 Apr 2020 15:00:38 +0300
Message-Id: <20200417120040.3432332-13-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
References: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
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
index 4334f516ba54..2d6ed59bf04b 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3459,6 +3459,8 @@ static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
 					  INTEL_OUTPUT_DP_MST);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 
+	intel_dp_set_infoframes(encoder, false, old_crtc_state, old_conn_state);
+
 	/*
 	 * Power down sink before disabling the port, otherwise we end
 	 * up getting interrupts from the sink on detecting link loss.
-- 
2.25.0

