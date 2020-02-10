Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A711580F4
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Feb 2020 18:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgBJRKv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 10 Feb 2020 12:10:51 -0500
Received: from mga18.intel.com ([134.134.136.126]:40099 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728017AbgBJRKv (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 10 Feb 2020 12:10:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 09:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; 
   d="scan'208";a="233168274"
Received: from helsinki.fi.intel.com ([10.237.66.159])
  by orsmga003.jf.intel.com with ESMTP; 10 Feb 2020 09:10:49 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v6 14/18] drm/i915: Fix enabled infoframe states of lspcon
Date:   Mon, 10 Feb 2020 19:10:17 +0200
Message-Id: <20200210171021.109684-15-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210171021.109684-1-gwan-gyeong.mun@intel.com>
References: <20200210171021.109684-1-gwan-gyeong.mun@intel.com>
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

