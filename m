Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427581980FB
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Mar 2020 18:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgC3QXZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Mar 2020 12:23:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:60988 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728626AbgC3QXY (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Mar 2020 12:23:24 -0400
IronPort-SDR: 8KQGqpwl3ViB7hJmBPeUbyBVtFSWhRDUGNmafnoV3xlzK5PRZjyiQ7Rb9vi3TEq/wTB2KC1gHD
 mP6CKpc7MeBQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 09:23:24 -0700
IronPort-SDR: jBON76bdAKf03df5jSlrAVHiu/9KFh9zOPcWiCgObb9C4qkB+Z87gNYKSp2FrRrDNxG9LsksbX
 18rCnIudGD4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="248754018"
Received: from niamhrya-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.1.242])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 09:23:22 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v9 10/14] drm/i915: Fix enabled infoframe states of lspcon
Date:   Mon, 30 Mar 2020 19:23:52 +0300
Message-Id: <20200330162356.162361-11-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200330162356.162361-1-gwan-gyeong.mun@intel.com>
References: <20200330162356.162361-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Compared to implementation of DP and HDMI's encoder->infoframes_enabled,
the lspcon's implementation returns its active state. (we expect enabled
infoframe states of HW.) It leads to pipe state mismatch error
when ddi_get_config is called.

Because the current implementation of lspcon is not ready to support
readout infoframes, we need to return 0 here.

In order to support readout to lspcon, we need to implement read_infoframe
and infoframes_enabled. And set_infoframes also have to set an appropriate
bit on crtc_state->infoframes.enable

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index d807c5648c87..6ff7b226f0a1 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -522,7 +522,7 @@ u32 lspcon_infoframes_enabled(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *pipe_config)
 {
 	/* FIXME actually read this from the hw */
-	return enc_to_intel_lspcon(encoder)->active;
+	return 0;
 }
 
 void lspcon_resume(struct intel_lspcon *lspcon)
-- 
2.25.0

