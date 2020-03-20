Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E156218CD07
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Mar 2020 12:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgCTLcU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Mar 2020 07:32:20 -0400
Received: from mga11.intel.com ([192.55.52.93]:48941 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726814AbgCTLcU (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Mar 2020 07:32:20 -0400
IronPort-SDR: pGYARFUv8qU5elypiqI4xTiLTEELCu13Ju9ZL35gBCN5pu8g0IyfuIm6EChIhLGQLb+DRycNi/
 N+fUsfv/ZpNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 04:32:19 -0700
IronPort-SDR: +5QzuMkcKoZDSgul7aiXXzOqkseTtVHhEmIXaq8ypBAqPEhgnB0uEfgFjDqqbdHMqYBb3MFyng
 Cq8kcbs4ZJjw==
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; 
   d="scan'208";a="418686722"
Received: from rkamins1-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.41.98])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 04:32:16 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only function for DRM infoframe
In-Reply-To: <87k13fcm8w.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com> <20200211074657.231405-6-gwan-gyeong.mun@intel.com> <87k13fcm8w.fsf@intel.com>
Date:   Fri, 20 Mar 2020 13:32:17 +0200
Message-ID: <87h7yjcldq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 20 Mar 2020, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 11 Feb 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
>> It adds an unpack only function for DRM infoframe for dynamic range and
>> mastering infoframe readout.
>> It unpacks the information data block contained in the binary buffer into
>> a structured frame of the HDMI Dynamic Range and Mastering (DRM)
>> information frame.
>>
>> In contrast to hdmi_drm_infoframe_unpack() function, it does not verify
>> a checksum.
>>
>> It can be used for unpacking a DP HDR Metadata Infoframe SDP case.
>> DP HDR Metadata Infoframe SDP uses the same Dynamic Range and Mastering
>> (DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
>> But DP SDP header and payload structure are different from HDMI DRM
>> Infoframe. Therefore unpacking DRM infoframe for DP requires skipping of
>> a verifying checksum.
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>
> Bartlomiej, can I have your ack for merging this via drm-intel along
> with the rest of the series, please?

Or Hans or Laurent, from v4l/video point of view.

Thanks,
Jani.

>
> BR,
> Jani.
>
>
>> ---
>>  drivers/video/hdmi.c | 58 +++++++++++++++++++++++++++++++-------------
>>  include/linux/hdmi.h |  2 ++
>>  2 files changed, 43 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
>> index 9c82e2a0a411..9818836d82b7 100644
>> --- a/drivers/video/hdmi.c
>> +++ b/drivers/video/hdmi.c
>> @@ -1775,20 +1775,18 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
>>  }
>>  
>>  /**
>> - * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
>> + * hdmi_drm_infoframe_unpack_only() - unpack binary buffer to a HDMI DRM infoframe
>>   * @frame: HDMI DRM infoframe
>>   * @buffer: source buffer
>>   * @size: size of buffer
>>   *
>> - * Unpacks the information contained in binary @buffer into a structured
>> + * Unpacks the information data block contained in binary @buffer into a structured
>>   * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
>> - * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
>> - * specification.
>>   *
>>   * Returns 0 on success or a negative error code on failure.
>>   */
>> -static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
>> -				     const void *buffer, size_t size)
>> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
>> +				   const void *buffer, size_t size)
>>  {
>>  	const u8 *ptr = buffer;
>>  	const u8 *temp;
>> @@ -1797,23 +1795,13 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
>>  	int ret;
>>  	int i;
>>  
>> -	if (size < HDMI_INFOFRAME_SIZE(DRM))
>> -		return -EINVAL;
>> -
>> -	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
>> -	    ptr[1] != 1 ||
>> -	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
>> -		return -EINVAL;
>> -
>> -	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
>> +	if (size < HDMI_DRM_INFOFRAME_SIZE)
>>  		return -EINVAL;
>>  
>>  	ret = hdmi_drm_infoframe_init(frame);
>>  	if (ret)
>>  		return ret;
>>  
>> -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
>> -
>>  	frame->eotf = ptr[0] & 0x7;
>>  	frame->metadata_type = ptr[1] & 0x7;
>>  
>> @@ -1837,6 +1825,42 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL(hdmi_drm_infoframe_unpack_only);
>> +
>> +/**
>> + * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
>> + * @frame: HDMI DRM infoframe
>> + * @buffer: source buffer
>> + * @size: size of buffer
>> + *
>> + * Unpacks the information contained in binary @buffer into a structured
>> + * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
>> + * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
>> + * specification.
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>> + */
>> +static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
>> +				     const void *buffer, size_t size)
>> +{
>> +	const u8 *ptr = buffer;
>> +	int ret;
>> +
>> +	if (size < HDMI_INFOFRAME_SIZE(DRM))
>> +		return -EINVAL;
>> +
>> +	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
>> +	    ptr[1] != 1 ||
>> +	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
>> +		return -EINVAL;
>> +
>> +	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
>> +		return -EINVAL;
>> +
>> +	ret = hdmi_drm_infoframe_unpack_only(frame, ptr + HDMI_INFOFRAME_HEADER_SIZE,
>> +					     size - HDMI_INFOFRAME_HEADER_SIZE);
>> +	return ret;
>> +}
>>  
>>  /**
>>   * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI infoframe
>> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
>> index 9918a6c910c5..afb43efc03e0 100644
>> --- a/include/linux/hdmi.h
>> +++ b/include/linux/hdmi.h
>> @@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct hdmi_drm_infoframe *frame, void *buffer,
>>  ssize_t hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe *frame,
>>  				     void *buffer, size_t size);
>>  int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe *frame);
>> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
>> +				   const void *buffer, size_t size);
>>  
>>  enum hdmi_spd_sdi {
>>  	HDMI_SPD_SDI_UNKNOWN,

-- 
Jani Nikula, Intel Open Source Graphics Center
