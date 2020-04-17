Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CA51ADCB8
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 13:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbgDQL6I (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 07:58:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:15803 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730436AbgDQL6I (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 07:58:08 -0400
IronPort-SDR: GscMFrVkS+uyZbggSHNkjNt5XeXFAGZeWduxaARIUSe/Ww1BEpsc+aNyR11L9GrOWlKuFxRy34
 w3YvggAtuD2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 04:58:07 -0700
IronPort-SDR: oPzffoD/xvtzehxbN+DpuD6KafShULTvJHrfM14Jf25fDpUU582Lfcznzd0DmMHcQAB8QZt+dN
 RkAnbrAUacDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="279491930"
Received: from elewis-mobl.ger.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.94.8])
  by orsmga008.jf.intel.com with ESMTP; 17 Apr 2020 04:58:05 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        uma.shankar@intel.com, laurent.pinchart@ideasonboard.com,
        jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v10 00/14] In order to readout DP SDPs, refactors the handling of DP SDPs 
Date:   Fri, 17 Apr 2020 15:00:26 +0300
Message-Id: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In order to readout DP SDPs (Secondary Data Packet: DP HDR Metadata
Infoframe SDP, DP VSC SDP), it refactors handling DP SDPs codes.
It adds new compute routines for DP HDR Metadata Infoframe SDP
and DP VSC SDP. 
And new writing routines of DP SDPs (Secondary Data Packet) that uses
computed configs.
New reading routines of DP SDPs are added for readout.
It adds a logging function for DP VSC SDP.
When receiving video it is very useful to be able to log DP VSC SDP.
This greatly simplifies debugging.
In order to use a common VSC SDP Colorimetry calculating code on PSR,
it uses a new psr vsc sdp compute routine.

v2: Minor style fix
v3: 
  - Add a new drm data structure for DP VSC SDP
  - Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
  - Move logging functions to drm core [Jani N]
    And use drm core's DP VSC SDP logging function
  - Explicitly disable unused DIPs (AVI, GCP, VS, SPD, DRM. They will be
    used for HDMI), when intel_dp_set_infoframes() function will be called.
v4:
  - Use struct drm_device logging macros
  - Rebased
v5:
  - Use intel_de_*() functions for register access
  - Add warning where a bpc is 6 and a pixel format is RGB.
  - Addressed review comments from Uma
    Add kernel docs for added data structures
    Rename enum dp_colorspace to dp_pixelformat
    Polish commit message and comments
    Combine the if checks of sdp.HB2 and sdp.HB3
    Add 6bpc to packining and unpacking of VSC SDP
v6: Fix enabled infoframe states of lspcon
v7: Fix the wrong check of combination bpc 6 and RGB pixelformat
v8: Rebased
v9: Add clear comments to hdmi_drm_infoframe_unpack_only() and
    hdmi_drm_infoframe_unpack() (Laurent Pinchart)
v10:
  - Fix packing of VSC SDP where Pixel Encoding/Colorimetry Format is not
    supported
  - When a PSR is enabled, it needs to add DP_SDP_VSC to infoframes.enable.
  - Change a checking of PSR state.
  - Skip checking of VSC SDP when a crtc config has psr.
  - Rebased

Gwan-gyeong Mun (14):
  video/hdmi: Add Unpack only function for DRM infoframe
  drm/i915/dp: Read out DP SDPs
  drm: Add logging function for DP VSC SDP
  drm/i915: Include HDMI DRM infoframe in the crtc state dump
  drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
  drm/i915: Include DP VSC SDP in the crtc state dump
  drm/i915: Program DP SDPs with computed configs
  drm/i915: Add state readout for DP HDR Metadata Infoframe SDP
  drm/i915: Add state readout for DP VSC SDP
  drm/i915: Fix enabled infoframe states of lspcon
  drm/i915: Program DP SDPs on pipe updates
  drm/i915: Stop sending DP SDPs on ddi disable
  drm/i915/dp: Add compute routine for DP PSR VSC SDP
  drm/i915/psr: Use new DP VSC SDP compute routine on PSR

 drivers/gpu/drm/drm_dp_helper.c              | 174 ++++++++
 drivers/gpu/drm/i915/display/intel_ddi.c     |  19 +-
 drivers/gpu/drm/i915/display/intel_display.c |  63 +++
 drivers/gpu/drm/i915/display/intel_dp.c      | 406 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h      |  15 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c     |  56 +--
 drivers/gpu/drm/i915/display/intel_psr.h     |   6 +-
 drivers/gpu/drm/i915/i915_drv.h              |   1 +
 drivers/video/hdmi.c                         |  65 ++-
 include/drm/drm_dp_helper.h                  |   3 +
 include/linux/hdmi.h                         |   2 +
 12 files changed, 549 insertions(+), 263 deletions(-)

-- 
2.25.0

