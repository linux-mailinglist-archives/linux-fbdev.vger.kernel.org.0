Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97C99156892
	for <lists+linux-fbdev@lfdr.de>; Sun,  9 Feb 2020 04:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgBIDxs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 8 Feb 2020 22:53:48 -0500
Received: from mga04.intel.com ([192.55.52.120]:63111 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727550AbgBIDxs (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 8 Feb 2020 22:53:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Feb 2020 19:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,419,1574150400"; 
   d="scan'208";a="221210491"
Received: from rrcarnag-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.252.14.133])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2020 19:53:46 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v5 00/18] In order to readout DP SDPs, refactors the handling of DP SDPs 
Date:   Sun,  9 Feb 2020 05:53:27 +0200
Message-Id: <20200209035345.357436-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
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
  - Add disabling DIPs(Data Island Packets) when LSPCON is used
    When LSPCON is used, DIPs(Data Island Packets of DP or HDMI) will not
    be used. Therefore it explicitly disables DIPs on encoder->pre_enable
    callback.
  - Use intel_de_*() functions for register access
  - Add warning where a bpc is 6 and a pixel format is RGB.
  - Addressed review comments from Uma
    Add kernel docs for added data structures
    Rename enum dp_colorspace to dp_pixelformat
    Polish commit message and comments
    Combine the if checks of sdp.HB2 and sdp.HB3
    Add 6bpc to packining and unpacking of VSC SDP

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
  drm/i915: Disable DIPs when LSPCON is used
  drm/i915: Program DP SDPs on pipe updates
  drm/i915: Stop sending DP SDPs on ddi disable
  drm/i915/dp: Add compute routine for DP PSR VSC SDP
  drm/i915/psr: Use new DP VSC SDP compute routine on PSR

 drivers/gpu/drm/drm_dp_helper.c               | 174 +++++
 drivers/gpu/drm/i915/display/intel_ddi.c      |  42 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  62 ++
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 636 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h       |  18 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  54 +-
 drivers/gpu/drm/i915/display/intel_psr.h      |   6 +-
 drivers/gpu/drm/i915/i915_drv.h               |   1 +
 drivers/video/hdmi.c                          |  58 +-
 include/drm/drm_dp_helper.h                   | 133 ++++
 include/linux/hdmi.h                          |   2 +
 12 files changed, 970 insertions(+), 217 deletions(-)

-- 
2.24.1

