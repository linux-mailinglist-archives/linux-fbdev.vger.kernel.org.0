Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2653415357D
	for <lists+linux-fbdev@lfdr.de>; Wed,  5 Feb 2020 17:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgBEQoc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Wed, 5 Feb 2020 11:44:32 -0500
Received: from mga01.intel.com ([192.55.52.88]:59619 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727085AbgBEQob (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 5 Feb 2020 11:44:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 08:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; 
   d="scan'208";a="311421483"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2020 08:44:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:44:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 5 Feb 2020 08:44:29 -0800
Received: from bgsmsx155.gar.corp.intel.com (10.224.48.102) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 5 Feb 2020 08:44:28 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX155.gar.corp.intel.com ([169.254.12.108]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 22:14:26 +0530
From:   "Shankar, Uma" <uma.shankar@intel.com>
To:     "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 09/17] drm/i915: Include DP HDR Metadata Infoframe
 SDP in the crtc state dump
Thread-Topic: [PATCH v3 09/17] drm/i915: Include DP HDR Metadata Infoframe
 SDP in the crtc state dump
Thread-Index: AQHV2uiXBmNkPWLEKEqzigU+QA6776gM0Qdg
Date:   Wed, 5 Feb 2020 16:44:26 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DD072@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-10-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-10-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2IyYTI4OTktZjM5OC00NmFiLTkzYWQtM2M1NmEzMWY5NDRmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTFRraHF1WmtuakxMZzcyK0xLRVN2T1JwQmt5ZHJ2ZEZjdHI4OTFEV1d5K0ZYenErNjI2RUc2MFNKcGtOWGpuUyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Gwan-
> gyeong Mun
> Sent: Tuesday, February 4, 2020 4:50 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v3 09/17] drm/i915: Include DP HDR Metadata Infoframe SDP in the
> crtc state dump
> 
> Dump out the DP HDR Metadata Infoframe SDP in the normal crtc state dump.
> 
> HDMI Dynamic Range and Mastering (DRM) infoframe and DP HDR Metadata
> Infoframe SDP use the same member variable in infoframes of crtc state.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 239861bcedba..593c63f51210 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -13033,6 +13033,9 @@ static void intel_dump_pipe_config(const struct
> intel_crtc_state *pipe_config,
>  	if (pipe_config->infoframes.enable &
>  	    intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM))
>  		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
> +	if (pipe_config->infoframes.enable &
> +	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
> +		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
> 
>  	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
>  	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
> --
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
