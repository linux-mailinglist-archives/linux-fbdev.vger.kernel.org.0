Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C32A91535A7
	for <lists+linux-fbdev@lfdr.de>; Wed,  5 Feb 2020 17:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBEQyq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Wed, 5 Feb 2020 11:54:46 -0500
Received: from mga07.intel.com ([134.134.136.100]:28968 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgBEQyp (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 5 Feb 2020 11:54:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 08:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; 
   d="scan'208";a="225011223"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2020 08:54:40 -0800
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:54:40 -0800
Received: from bgsmsx155.gar.corp.intel.com (10.224.48.102) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:54:39 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX155.gar.corp.intel.com ([169.254.12.108]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 22:24:37 +0530
From:   "Shankar, Uma" <uma.shankar@intel.com>
To:     "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3 12/17] drm/i915: Add state readout for DP
 HDR Metadata Infoframe SDP
Thread-Topic: [Intel-gfx] [PATCH v3 12/17] drm/i915: Add state readout for
 DP HDR Metadata Infoframe SDP
Thread-Index: AQHV2uiaisB08sao0kiVFKLuCD13SKgM0+Pg
Date:   Wed, 5 Feb 2020 16:54:36 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DD0D0@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-13-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-13-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTQ3Yzc2Y2ItY2UzOS00YzZhLTg3Y2EtYzNlOGRiZDgzYWQwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiblFxNkoxRXdEWVZhaUNCYTBiTzVqMnVaTU5EKyt2XC9WeGlRN2ZjempUeFZ3VkJiZmM1ZU9ERm4rRFBUNWFWRWsifQ==
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Gwan-
> gyeong Mun
> Sent: Tuesday, February 4, 2020 4:50 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v3 12/17] drm/i915: Add state readout for DP HDR
> Metadata Infoframe SDP
> 
> Added state readout for DP HDR Metadata Infoframe SDP.

Looks good.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 374ab6a3757c..a9eaf7a6bc15 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4322,6 +4322,9 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
>  				      pipe_config->fec_enable);
>  		}
> 
> +		pipe_config->infoframes.enable |=
> +			intel_hdmi_infoframes_enabled(encoder, pipe_config);
> +
>  		break;
>  	case TRANS_DDI_MODE_SELECT_DP_MST:
>  		pipe_config->output_types |= BIT(INTEL_OUTPUT_DP_MST); @@ -
> 4333,6 +4336,9 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
> 
> 	REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, temp);
> 
>  		intel_dp_get_m_n(intel_crtc, pipe_config);
> +
> +		pipe_config->infoframes.enable |=
> +			intel_hdmi_infoframes_enabled(encoder, pipe_config);
>  		break;
>  	default:
>  		break;
> @@ -4383,6 +4389,8 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
>  	intel_read_infoframe(encoder, pipe_config,
>  			     HDMI_INFOFRAME_TYPE_DRM,
>  			     &pipe_config->infoframes.drm);
> +
> +	intel_read_dp_sdp(encoder, pipe_config,
> +HDMI_PACKET_TYPE_GAMUT_METADATA);
>  }
> 
>  static enum intel_output_type
> --
> 2.24.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
