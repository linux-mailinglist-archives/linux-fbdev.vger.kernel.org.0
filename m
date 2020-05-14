Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB371D2724
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 08:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgENGIE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 02:08:04 -0400
Received: from mga14.intel.com ([192.55.52.115]:40825 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgENGIE (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 02:08:04 -0400
IronPort-SDR: MJvEmPFEgx4nlT5Q3NT8AAGUcBBqiXFn5+4nck2Bc9QNtIEMksSjWXyOz5VVJnUW7ADmsLOqUl
 AlvB4PN4pYzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 23:08:04 -0700
IronPort-SDR: rk3dKCZKQ1AprvKki0l+klBidhBSeLBhd4Ygg6+GhJURGfeU+jl3tAEzmwsUkO76MWkb3uOlS+
 lq0d5y/UUUWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="409957039"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.18.167])
  by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:08:01 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        jani.nikula@linux.intel.com, laurent.pinchart@ideasonboard.com,
        ville.syrjala@linux.intel.com
Subject: [PATCH v12 12/14] drm/i915: Stop sending DP SDPs on ddi disable
Date:   Thu, 14 May 2020 09:07:30 +0300
Message-Id: <20200514060732.3378396-13-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
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
index e3f5db787343..a5eb8b89946b 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3472,6 +3472,8 @@ static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
 					  INTEL_OUTPUT_DP_MST);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 
+	intel_dp_set_infoframes(encoder, false, old_crtc_state, old_conn_state);
+
 	/*
 	 * Power down sink before disabling the port, otherwise we end
 	 * up getting interrupts from the sink on detecting link loss.
-- 
2.25.0

