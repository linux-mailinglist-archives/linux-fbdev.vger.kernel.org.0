Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E230318CD4E
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Mar 2020 12:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgCTL5q (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Mar 2020 07:57:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32780 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgCTL5q (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Mar 2020 07:57:46 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93864504;
        Fri, 20 Mar 2020 12:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584705463;
        bh=Ou+nzGoOd8xdUtbv+CRwMh/oE5toLK4NAR8Q/UsVWog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jcf3U/rxojyDc9uklUkLPU9F0InK3RiAu4mkJ7anWp5v8OP9DLOOM9wuf+5WoGUno
         01rgWVSOccccwttI7bpWARmjw/J8BqpFAoHQHy0ahVxju37OTBnMQtvg3m/Ct8eHeS
         EvKMv68lu74z8cqk9s9HaynQDZHamIn6MK0TLiY4=
Date:   Fri, 20 Mar 2020 13:57:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only
 function for DRM infoframe
Message-ID: <20200320115737.GF5193@pendragon.ideasonboard.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
 <20200211074657.231405-6-gwan-gyeong.mun@intel.com>
 <87k13fcm8w.fsf@intel.com>
 <87h7yjcldq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h7yjcldq.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Jani,

On Fri, Mar 20, 2020 at 01:32:17PM +0200, Jani Nikula wrote:
> On Fri, 20 Mar 2020, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Tue, 11 Feb 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> >> It adds an unpack only function for DRM infoframe for dynamic range and
> >> mastering infoframe readout.
> >> It unpacks the information data block contained in the binary buffer into
> >> a structured frame of the HDMI Dynamic Range and Mastering (DRM)
> >> information frame.
> >>
> >> In contrast to hdmi_drm_infoframe_unpack() function, it does not verify
> >> a checksum.
> >>
> >> It can be used for unpacking a DP HDR Metadata Infoframe SDP case.
> >> DP HDR Metadata Infoframe SDP uses the same Dynamic Range and Mastering
> >> (DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
> >> But DP SDP header and payload structure are different from HDMI DRM
> >> Infoframe. Therefore unpacking DRM infoframe for DP requires skipping of
> >> a verifying checksum.
> >>
> >> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> >> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> >
> > Bartlomiej, can I have your ack for merging this via drm-intel along
> > with the rest of the series, please?
> 
> Or Hans or Laurent, from v4l/video point of view.

I'm no expert on InfoFrame, I'll only comment on the API below.

> >> ---
> >>  drivers/video/hdmi.c | 58 +++++++++++++++++++++++++++++++-------------
> >>  include/linux/hdmi.h |  2 ++
> >>  2 files changed, 43 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> >> index 9c82e2a0a411..9818836d82b7 100644
> >> --- a/drivers/video/hdmi.c
> >> +++ b/drivers/video/hdmi.c
> >> @@ -1775,20 +1775,18 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
> >>  }
> >>  
> >>  /**
> >> - * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
> >> + * hdmi_drm_infoframe_unpack_only() - unpack binary buffer to a HDMI DRM infoframe
> >>   * @frame: HDMI DRM infoframe
> >>   * @buffer: source buffer
> >>   * @size: size of buffer
> >>   *
> >> - * Unpacks the information contained in binary @buffer into a structured
> >> + * Unpacks the information data block contained in binary @buffer into a structured

Line wrap please.

This needs to be clarified to explain exactly what the buffer points to.

Also, as this is applicable to DP too, shouldn't we drop the hdmi_
prefix ? Is there another prefix that could be used for functions that
are application to infoframe handling shared by different display
interfaces ? A bit of refactoring would help making all this clear.

> >>   * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
> >> - * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
> >> - * specification.
> >>   *
> >>   * Returns 0 on success or a negative error code on failure.
> >>   */
> >> -static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> >> -				     const void *buffer, size_t size)
> >> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> >> +				   const void *buffer, size_t size)
> >>  {
> >>  	const u8 *ptr = buffer;
> >>  	const u8 *temp;
> >> @@ -1797,23 +1795,13 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> >>  	int ret;
> >>  	int i;
> >>  
> >> -	if (size < HDMI_INFOFRAME_SIZE(DRM))
> >> -		return -EINVAL;
> >> -
> >> -	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> >> -	    ptr[1] != 1 ||
> >> -	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> >> -		return -EINVAL;
> >> -
> >> -	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
> >> +	if (size < HDMI_DRM_INFOFRAME_SIZE)
> >>  		return -EINVAL;
> >>  
> >>  	ret = hdmi_drm_infoframe_init(frame);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> >> -
> >>  	frame->eotf = ptr[0] & 0x7;
> >>  	frame->metadata_type = ptr[1] & 0x7;
> >>  
> >> @@ -1837,6 +1825,42 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> >>  
> >>  	return 0;
> >>  }
> >> +EXPORT_SYMBOL(hdmi_drm_infoframe_unpack_only);
> >> +
> >> +/**
> >> + * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
> >> + * @frame: HDMI DRM infoframe
> >> + * @buffer: source buffer
> >> + * @size: size of buffer
> >> + *
> >> + * Unpacks the information contained in binary @buffer into a structured

Same here. The difference between the two functions is "information data
block" vs. "information", it's very unclear to the reader without
looking at either the commit message or the implementation.

> >> + * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
> >> + * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
> >> + * specification.
> >> + *
> >> + * Returns 0 on success or a negative error code on failure.
> >> + */
> >> +static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> >> +				     const void *buffer, size_t size)
> >> +{
> >> +	const u8 *ptr = buffer;
> >> +	int ret;
> >> +
> >> +	if (size < HDMI_INFOFRAME_SIZE(DRM))
> >> +		return -EINVAL;
> >> +
> >> +	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> >> +	    ptr[1] != 1 ||
> >> +	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> >> +		return -EINVAL;
> >> +
> >> +	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
> >> +		return -EINVAL;
> >> +
> >> +	ret = hdmi_drm_infoframe_unpack_only(frame, ptr + HDMI_INFOFRAME_HEADER_SIZE,
> >> +					     size - HDMI_INFOFRAME_HEADER_SIZE);
> >> +	return ret;
> >> +}
> >>  
> >>  /**
> >>   * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI infoframe
> >> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> >> index 9918a6c910c5..afb43efc03e0 100644
> >> --- a/include/linux/hdmi.h
> >> +++ b/include/linux/hdmi.h
> >> @@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct hdmi_drm_infoframe *frame, void *buffer,
> >>  ssize_t hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe *frame,
> >>  				     void *buffer, size_t size);
> >>  int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe *frame);
> >> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> >> +				   const void *buffer, size_t size);
> >>  
> >>  enum hdmi_spd_sdi {
> >>  	HDMI_SPD_SDI_UNKNOWN,

-- 
Regards,

Laurent Pinchart
