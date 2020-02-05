Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83768153510
	for <lists+linux-fbdev@lfdr.de>; Wed,  5 Feb 2020 17:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgBEQPY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Wed, 5 Feb 2020 11:15:24 -0500
Received: from mga12.intel.com ([192.55.52.136]:34635 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgBEQPY (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 5 Feb 2020 11:15:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 08:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; 
   d="scan'208";a="430202745"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
  by fmsmga005.fm.intel.com with ESMTP; 05 Feb 2020 08:15:24 -0800
Received: from bgsmsx151.gar.corp.intel.com (10.224.48.42) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:15:23 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX151.gar.corp.intel.com ([169.254.3.195]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 21:45:20 +0530
From:   "Shankar, Uma" <uma.shankar@intel.com>
To:     "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3 05/17] video/hdmi: Add Unpack only
 function for DRM infoframe
Thread-Topic: [Intel-gfx] [PATCH v3 05/17] video/hdmi: Add Unpack only
 function for DRM infoframe
Thread-Index: AQHV2uiUnKzAl91bA0m5gXp/wgTk0qgMyJig
Date:   Wed, 5 Feb 2020 16:15:20 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DCFBC@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-6-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-6-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmVkMDcwZmQtYTY0YS00MDM0LTlkYzUtMWRkNjIxNTIwZTU2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNjUxN2huTEg4N3A3MkhQXC9MSHRNNEtJXC9iRkFETCtxQzljTnpxbkFcL1dJRGQra2gyWVdDMUNuXC9WeTBFbGs4clgifQ==
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
> Subject: [Intel-gfx] [PATCH v3 05/17] video/hdmi: Add Unpack only function for DRM
> infoframe
> 
> It adds an unpack only function for DRM infoframe for dynamic range and mastering
> infoframe readout.
> It unpacks the information data block contained in the binary buffer into a structured
> frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
> 
> In contrast to hdmi_drm_infoframe_unpack() function, it does not verify a
> checksum.
> 
> It can be used for unpacking a DP HDR Metadata Infoframe SDP case.
> DP HDR Metadata Infoframe SDP uses the same Dynamic Range and Mastering
> (DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
> But DP SDP header and payload structure are different from HDMI DRM Infoframe.
> Therefore unpacking DRM infoframe for DP requires skipping of a verifying
> checksum.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/video/hdmi.c | 58 +++++++++++++++++++++++++++++++-------------
>  include/linux/hdmi.h |  2 ++
>  2 files changed, 43 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c index
> 9c82e2a0a411..9818836d82b7 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -1775,20 +1775,18 @@ hdmi_vendor_any_infoframe_unpack(union
> hdmi_vendor_any_infoframe *frame,  }
> 
>  /**
> - * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
> + * hdmi_drm_infoframe_unpack_only() - unpack binary buffer to a HDMI
> + DRM infoframe
>   * @frame: HDMI DRM infoframe
>   * @buffer: source buffer
>   * @size: size of buffer
>   *
> - * Unpacks the information contained in binary @buffer into a structured
> + * Unpacks the information data block contained in binary @buffer into
> + a structured
>   * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
> - * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
> - * specification.
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
> -static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> -				     const void *buffer, size_t size)
> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> +				   const void *buffer, size_t size)
>  {
>  	const u8 *ptr = buffer;
>  	const u8 *temp;
> @@ -1797,23 +1795,13 @@ static int hdmi_drm_infoframe_unpack(struct
> hdmi_drm_infoframe *frame,
>  	int ret;
>  	int i;
> 
> -	if (size < HDMI_INFOFRAME_SIZE(DRM))
> -		return -EINVAL;
> -
> -	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> -	    ptr[1] != 1 ||
> -	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> -		return -EINVAL;
> -
> -	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
> +	if (size < HDMI_DRM_INFOFRAME_SIZE)
>  		return -EINVAL;
> 
>  	ret = hdmi_drm_infoframe_init(frame);
>  	if (ret)
>  		return ret;
> 
> -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> -
>  	frame->eotf = ptr[0] & 0x7;
>  	frame->metadata_type = ptr[1] & 0x7;
> 
> @@ -1837,6 +1825,42 @@ static int hdmi_drm_infoframe_unpack(struct
> hdmi_drm_infoframe *frame,
> 
>  	return 0;
>  }
> +EXPORT_SYMBOL(hdmi_drm_infoframe_unpack_only);
> +
> +/**
> + * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM
> +infoframe
> + * @frame: HDMI DRM infoframe
> + * @buffer: source buffer
> + * @size: size of buffer
> + *
> + * Unpacks the information contained in binary @buffer into a
> +structured
> + * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
> + * Also verifies the checksum as required by section 5.3.5 of the HDMI
> +1.4
> + * specification.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> +				     const void *buffer, size_t size) {
> +	const u8 *ptr = buffer;
> +	int ret;
> +
> +	if (size < HDMI_INFOFRAME_SIZE(DRM))
> +		return -EINVAL;
> +
> +	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> +	    ptr[1] != 1 ||
> +	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> +		return -EINVAL;
> +
> +	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
> +		return -EINVAL;
> +
> +	ret = hdmi_drm_infoframe_unpack_only(frame, ptr +
> HDMI_INFOFRAME_HEADER_SIZE,
> +					     size - HDMI_INFOFRAME_HEADER_SIZE);
> +	return ret;
> +}
> 
>  /**
>   * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI infoframe diff --git
> a/include/linux/hdmi.h b/include/linux/hdmi.h index 9918a6c910c5..afb43efc03e0
> 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct
> hdmi_drm_infoframe *frame, void *buffer,  ssize_t
> hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe *frame,
>  				     void *buffer, size_t size);
>  int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe *frame);
> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> +				   const void *buffer, size_t size);
> 
>  enum hdmi_spd_sdi {
>  	HDMI_SPD_SDI_UNKNOWN,
> --
> 2.24.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
