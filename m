Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4689D1580D9
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Feb 2020 18:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgBJRKZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 10 Feb 2020 12:10:25 -0500
Received: from mga18.intel.com ([134.134.136.126]:40093 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728223AbgBJRKZ (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 10 Feb 2020 12:10:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 09:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; 
   d="scan'208";a="233168212"
Received: from helsinki.fi.intel.com ([10.237.66.159])
  by orsmga003.jf.intel.com with ESMTP; 10 Feb 2020 09:10:23 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v6 00/18] In order to readout DP SDPs, refactors the handling of DP SDPs 
Date:   Mon, 10 Feb 2020 19:10:03 +0200
Message-Id: <20200210171021.109684-1-gwan-gyeong.mun@intel.com>
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
v6:
  - Fix enabled infoframe states of lspcon

Gwan-gyeong Mun (18):
  drm: Add DP1.4 VSC SDP Payload related Data Structures
  drm/i915/dp: Add compute routine for DP VSC SDP
  drm/i915/dp: Add compute routine for DP HDR Metadata Infoframe SDP
  drm/i915/dp: Add writing of DP SDPs
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

 drivers/gpu/drm/drm_dp_helper.c               | 174 +++++
 drivers/gpu/drm/i915/display/intel_ddi.c      |  19 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  62 ++
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 636 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h       |  18 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  54 +-
 drivers/gpu/drm/i915/display/intel_psr.h      |   6 +-
 drivers/gpu/drm/i915/i915_drv.h               |   1 +
 drivers/video/hdmi.c                          |  58 +-
 include/drm/drm_dp_helper.h                   | 133 ++++
 include/linux/hdmi.h                          |   2 +
 13 files changed, 948 insertions(+), 218 deletions(-)

-- 
2.25.0

