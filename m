Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4A91533A4
	for <lists+linux-fbdev@lfdr.de>; Wed,  5 Feb 2020 16:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgBEPKG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Wed, 5 Feb 2020 10:10:06 -0500
Received: from mga14.intel.com ([192.55.52.115]:4147 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgBEPKG (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 5 Feb 2020 10:10:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 07:10:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; 
   d="scan'208";a="343669299"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
  by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2020 07:10:05 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 07:10:04 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 5 Feb 2020 07:08:21 -0800
Received: from bgsmsx154.gar.corp.intel.com (10.224.48.47) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 5 Feb 2020 07:08:20 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX154.gar.corp.intel.com ([169.254.7.238]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 20:36:56 +0530
From:   "Shankar, Uma" <uma.shankar@intel.com>
To:     "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 03/17] drm/i915/dp: Add compute routine for DP HDR
 Metadata Infoframe SDP
Thread-Topic: [PATCH v3 03/17] drm/i915/dp: Add compute routine for DP HDR
 Metadata Infoframe SDP
Thread-Index: AQHV2uiMDE8we7SfPkCKcmmWhS6BNKgMtS+A
Date:   Wed, 5 Feb 2020 15:06:55 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DCE62@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-4-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-4-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmMyNDZlOWMtNDE5Mi00ZjQxLWE4NDgtNTAyNzA4ZGY4MGQyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRndDTXgxMVwvd3V0dDNQbUR3bmJ6M3ArNlFseGxaZWcwbXpxbzhqelFZaTJQbFUxUXB3NlJnaDlcL2NUQmpRdk5tIn0=
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
> Subject: [PATCH v3 03/17] drm/i915/dp: Add compute routine for DP HDR Metadata
> Infoframe SDP
> 
> It stores computed dp hdr metadata infoframe sdp to infoframes.drm of crtc state.
> It referenced intel_hdmi_compute_drm_infoframe().
> 
> While computing, we'll also fill out the inforames.enable bitmask appropriately.

Typo in infoframes

With the above fixed, this is
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> 
> v2: Wrap a long line.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 2bdc43c80e03..b265b5c599f2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2463,6 +2463,27 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp
> *intel_dp,
>  					 &crtc_state->infoframes.vsc);
>  }
> 
> +static void
> +intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_crtc_state
> *crtc_state,
> +					    const struct drm_connector_state
> *conn_state) {
> +	int ret;
> +	struct hdmi_drm_infoframe *drm_infoframe =
> +&crtc_state->infoframes.drm.drm;
> +
> +	if (!conn_state->hdr_output_metadata)
> +		return;
> +
> +	ret = drm_hdmi_infoframe_set_hdr_metadata(drm_infoframe, conn_state);
> +
> +	if (ret) {
> +		DRM_DEBUG_KMS("couldn't set HDR metadata in infoframe\n");
> +		return;
> +	}
> +
> +	crtc_state->infoframes.enable |=
> +
> 	intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA);
> +}
> +
>  int
>  intel_dp_compute_config(struct intel_encoder *encoder,
>  			struct intel_crtc_state *pipe_config, @@ -2569,6 +2590,7
> @@ intel_dp_compute_config(struct intel_encoder *encoder,
> 
>  	intel_psr_compute_config(intel_dp, pipe_config);
>  	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
> +	intel_dp_compute_hdr_metadata_infoframe_sdp(pipe_config, conn_state);
> 
>  	return 0;
>  }
> --
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
