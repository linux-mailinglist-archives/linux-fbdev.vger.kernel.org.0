Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8FF1951F9
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 08:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgC0H3D (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 03:29:03 -0400
Received: from mga14.intel.com ([192.55.52.115]:61789 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgC0H3D (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 03:29:03 -0400
IronPort-SDR: lmiSHPTcngICpaTYa0VywIvzjcGF/+6lU9PNVYizIgCip3fyk2Zkak7LYaynAD+uq0lEszZwcK
 n/QClIhHQRRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 00:29:02 -0700
IronPort-SDR: 552GJBPrnWhxjEu4FjKpyc8r9oBL/l8zXqhgkM7lVBUMSA/Nb9b5cu31YoYlmOjTeklC3vxdhc
 ckgnzayFfZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="394292097"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.26.111])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:29:00 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com
Subject: [PATCH v8 10/14] drm/i915: Fix enabled infoframe states of lspcon
Date:   Fri, 27 Mar 2020 09:29:13 +0200
Message-Id: <20200327072917.3676391-11-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
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

