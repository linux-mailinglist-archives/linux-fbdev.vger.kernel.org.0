Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC95914FDED
	for <lists+linux-fbdev@lfdr.de>; Sun,  2 Feb 2020 16:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgBBPtl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 2 Feb 2020 10:49:41 -0500
Received: from mga01.intel.com ([192.55.52.88]:25229 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbgBBPtl (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 2 Feb 2020 10:49:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Feb 2020 07:49:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,394,1574150400"; 
   d="scan'208";a="430899883"
Received: from jghithan-mobl.amr.corp.intel.com (HELO helsinki.ger.corp.intel.com) ([10.251.88.23])
  by fmsmga006.fm.intel.com with ESMTP; 02 Feb 2020 07:49:39 -0800
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 00/18] In order to readout DP SDPs, refactors the handling of DP SDPs 
Date:   Sun,  2 Feb 2020 17:49:20 +0200
Message-Id: <20200202154938.1129610-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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

Gwan-gyeong Mun (18):
  drm: add DP 1.4 VSC SDP Payload related enums
  drm/i915: Add DP VSC SDP payload data to intel_crtc_state.infoframes
  drm/i915/dp: Add compute routine for DP VSC SDP
  drm/i915/dp: Add compute routine for DP HDR Metadata Infoframe SDP
  drm/i915/dp: Add writing of DP SDPs (Secondary Data Packet)
  video/hdmi: Add Unpack only function for DRM infoframe
  drm/i915/dp: Read out DP SDPs (Secondary Data Packet)
  drm/i915/dp: Add logging function for DP VSC SDP
  drm/i915: Include HDMI DRM infoframe in the crtc state dump
  drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
  drm/i915: Include DP VSC SDP in the crtc state dump
  drm/i915: Program DP SDPs with computed configs
  drm/i915: Add state readout for DP HDR Metadata Infoframe SDP
  drm/i915: Add state readout for DP VSC SDP
  drm/i915: Program DP SDPs on pipe updates
  drm/i915: Stop sending DP SDPs on intel_ddi_post_disable_dp()
  drm/i915/dp: Add compute routine for DP PSR VSC SDP
  drm/i915/psr: Use new DP VSC SDP compute routine on PSR

 drivers/gpu/drm/i915/display/intel_ddi.c      |  19 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  61 ++
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 777 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h       |  21 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  54 +-
 drivers/gpu/drm/i915/display/intel_psr.h      |   6 +-
 drivers/gpu/drm/i915/i915_drv.h               |  12 +
 drivers/video/hdmi.c                          |  58 +-
 include/drm/drm_dp_helper.h                   |  45 +
 include/linux/hdmi.h                          |   2 +
 11 files changed, 838 insertions(+), 218 deletions(-)

-- 
2.24.1

