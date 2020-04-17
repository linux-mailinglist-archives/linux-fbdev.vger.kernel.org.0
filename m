Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732CD1ADCC3
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 13:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbgDQL6d (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 07:58:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:15818 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730510AbgDQL6c (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 07:58:32 -0400
IronPort-SDR: wUj9JE8GLYtB3EvUnwC4NLo15MqWAwUYE+b1OKO2H4CZ91yDWEJzgH9VduvAl1MhdX0osXAiM6
 usQDGzAf4uMQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 04:58:32 -0700
IronPort-SDR: QBIVGR02mcGjY4GL+vqR9tGKNPjm309GicnR1DRwb/p1yvdRI7pDrHW4a0sGKYuc4sGvGW2DML
 NMqNagdVqKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="279492051"
Received: from elewis-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.94.8])
  by orsmga008.jf.intel.com with ESMTP; 17 Apr 2020 04:58:30 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v10 11/14] drm/i915: Program DP SDPs on pipe updates
Date:   Fri, 17 Apr 2020 15:00:37 +0300
Message-Id: <20200417120040.3432332-12-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
References: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Call intel_dp_set_infoframes() function on pipe updates to make sure
that we send VSC SDP and HDR Metadata Infoframe SDP (when applicable)
on fastsets.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bb26ea665540..4334f516ba54 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3849,6 +3849,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
 	intel_ddi_set_dp_msa(crtc_state, conn_state);
 
 	intel_psr_update(intel_dp, crtc_state);
+	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
 	intel_edp_drrs_enable(intel_dp, crtc_state);
 
 	intel_panel_update_backlight(state, encoder, crtc_state, conn_state);
-- 
2.25.0

