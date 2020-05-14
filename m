Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755FF1D2E1F
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 13:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgENLT3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 07:19:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:27953 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgENLT3 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 07:19:29 -0400
IronPort-SDR: sFSjo0UwVUeHhVhqBNMgeQV14KVv8r9jRefhRodJy2f57sVrHIBpKaJ2NbNjtYusNudA0o6ttj
 W0tjfQJ3+LJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 04:19:28 -0700
IronPort-SDR: T/9E/clvfkcfmrudsl3Ktg4mE8EfkEMb5IruAQHfs4jdk5Lcvbrkt5++8Mp0mC44m5cEcmUipl
 AtALqGTn8sjA==
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; 
   d="scan'208";a="410036713"
Received: from oalgaze-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.39.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 04:19:25 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, ville.syrjala@linux.intel.com,
        daniel.vetter@ffwll.ch
Subject: Re: [PATCH v12 00/14] In order to readout DP SDPs, refactors the handling of DP SDPs
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
Date:   Thu, 14 May 2020 14:19:23 +0300
Message-ID: <87eerm4vd0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 14 May 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> In order to readout DP SDPs (Secondary Data Packet: DP HDR Metadata
> Infoframe SDP, DP VSC SDP), it refactors handling DP SDPs codes.
> It adds new compute routines for DP HDR Metadata Infoframe SDP
> and DP VSC SDP. 
> And new writing routines of DP SDPs (Secondary Data Packet) that uses
> computed configs.
> New reading routines of DP SDPs are added for readout.
> It adds a logging function for DP VSC SDP.
> When receiving video it is very useful to be able to log DP VSC SDP.
> This greatly simplifies debugging.
> In order to use a common VSC SDP Colorimetry calculating code on PSR,
> it uses a new psr vsc sdp compute routine.

Pushed the series to drm-intel-next-queued with Daniel's irc ack for
merging the two non-i915 patches that route too.

Thanks for the patches and review!

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
