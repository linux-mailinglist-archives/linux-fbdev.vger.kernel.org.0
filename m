Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53FCA1D2722
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 08:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgENGIC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 02:08:02 -0400
Received: from mga14.intel.com ([192.55.52.115]:40825 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgENGIB (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 02:08:01 -0400
IronPort-SDR: vsoOyZS9cmck93Oy+t+CggdgfbqJD2vM7aSYh+Rer09W73ZkV2R0QYuuEUzdqLnwFg7zOjwJhK
 rsLS5FayzvfQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 23:08:01 -0700
IronPort-SDR: N2FbQnU58cNmSW29bYWyrsAuNvejJ2Cu2B3A+STFGiO60u3MfL4Ivl1l3V2FMw/sfmMFZRiVJb
 RZ2II4LDLq2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="409957029"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.18.167])
  by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:59 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        jani.nikula@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ville.syrjala@linux.intel.com
Subject: [PATCH v12 11/14] drm/i915: Program DP SDPs on pipe updates
Date:   Thu, 14 May 2020 09:07:29 +0300
Message-Id: <20200514060732.3378396-12-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
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
index 2b54ea47e822..e3f5db787343 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3864,6 +3864,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
 	intel_ddi_set_dp_msa(crtc_state, conn_state);
 
 	intel_psr_update(intel_dp, crtc_state);
+	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
 	intel_edp_drrs_enable(intel_dp, crtc_state);
 
 	intel_panel_update_backlight(state, encoder, crtc_state, conn_state);
-- 
2.25.0

