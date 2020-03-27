Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D201951FB
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 08:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgC0H3F (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 03:29:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:61789 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbgC0H3F (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 03:29:05 -0400
IronPort-SDR: wVmF+B7UMyvZzh0JVo60/HV1sYKQZVek7Rs1sBiSOXad3yWhaLSjcdoHf+NohdCItE3DbcxYcy
 wqdvngG/GVUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 00:29:04 -0700
IronPort-SDR: f1lJopGqFDEskUF9+Mfua9mlevO/LwtyeYrbchxstjqOjEEqV0kLOe6e2MutUxVvdnsU0NPMYJ
 Mhs4nfPtVMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="394292114"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.26.111])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:29:03 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com
Subject: [PATCH v8 11/14] drm/i915: Program DP SDPs on pipe updates
Date:   Fri, 27 Mar 2020 09:29:14 +0200
Message-Id: <20200327072917.3676391-12-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
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
index f58a539d51c2..57def3ae53b4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3711,6 +3711,7 @@ static void intel_ddi_update_pipe_dp(struct intel_encoder *encoder,
 	intel_ddi_set_dp_msa(crtc_state, conn_state);
 
 	intel_psr_update(intel_dp, crtc_state);
+	intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
 	intel_edp_drrs_enable(intel_dp, crtc_state);
 
 	intel_panel_update_backlight(encoder, crtc_state, conn_state);
-- 
2.25.0

