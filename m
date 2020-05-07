Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7081D1C8C35
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 May 2020 15:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgEGN1X (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 May 2020 09:27:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:60566 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726235AbgEGN1X (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 7 May 2020 09:27:23 -0400
IronPort-SDR: HBYp/n4w/PFpc+tajZA8XUe7tVoxQNDPq3pF1G/eCh2EazoxWdt89aESi6xBQw03BTOCq9XAMM
 tJ9w3hLchp3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:27:22 -0700
IronPort-SDR: JOvgsRbJEqeP8wtJ8lTG1F3DVdrrlIADmY6/V/yOcy2MxC+hauAhNmr5WvnVbZOfdojjI6hgE1
 K338Jcr7FFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="260528025"
Received: from plaurent-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.84.89])
  by orsmga003.jf.intel.com with ESMTP; 07 May 2020 06:27:21 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v11 10/14] drm/i915: Fix enabled infoframe states of lspcon
Date:   Thu,  7 May 2020 16:27:02 +0300
Message-Id: <20200507132706.2058969-11-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
References: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
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

