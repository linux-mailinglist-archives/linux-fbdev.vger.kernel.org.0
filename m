Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C157D6F4F
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2019 07:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfJOFs5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Oct 2019 01:48:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:59912 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725810AbfJOFs5 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Oct 2019 01:48:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 501C8B48C;
        Tue, 15 Oct 2019 05:48:55 +0000 (UTC)
Subject: Re: [PATCH v2 05/15] drm/fbconv: Add DRM <-> fbdev pixel-format
 conversion
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
        airlied@linux.ie, gregkh@linuxfoundation.org, michel@daenzer.net,
        corbet@lwn.net, malat@debian.org, dri-devel@lists.freedesktop.org,
        sean@poorly.run
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-6-tzimmermann@suse.de>
 <20191014203007.GA4373@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9f0e6195-eac3-7055-c1ec-5157f8411e15@suse.de>
Date:   Tue, 15 Oct 2019 07:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191014203007.GA4373@ravnborg.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi

Am 14.10.19 um 22:30 schrieb Sam Ravnborg:
> Hi Thomas.
> 
> On Mon, Oct 14, 2019 at 04:04:06PM +0200, Thomas Zimmermann wrote:
>> DRM uses FOURCC constants to describe pixel formats, fbdev uses a
>> per-component bitfield structure. The functions in this patch convert
>> between the two.
>>
> 
> A few nits below.
> 
> 
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_fbconv_helper.c | 435 ++++++++++++++++++++++++++++
>>   include/drm/drm_fbconv_helper.h     |  23 ++
>>   2 files changed, 458 insertions(+)
>>   create mode 100644 include/drm/drm_fbconv_helper.h
>>
>> diff --git a/drivers/gpu/drm/drm_fbconv_helper.c b/drivers/gpu/drm/drm_fbconv_helper.c
>> index 0cb46d2c98c3..af45358a156a 100644
>> --- a/drivers/gpu/drm/drm_fbconv_helper.c
>> +++ b/drivers/gpu/drm/drm_fbconv_helper.c
>> @@ -1 +1,436 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +#include <asm/byteorder.h>
>> +
>> +#include <linux/fb.h>
> 
> <asm/*> after <linux/*>
> So we in this way pick the more general include file first.

Ok.

>> +
>> +struct format_map {
>> +	bool (*is_format)(const struct fb_var_screeninfo *fb_var);
>> +	uint32_t format;
>> +};
> We are in the kernel - where I think u32 is preferred over the longer
> uint32_t.
> If I grep in drm/* then they seems be be equally popular, so feel free
> to ignore this comment.

I generally use types that are used by related interfaces. Here it's 
uint32_t because most other places use uint32_t for storing DRM_FORMAT 
constants.

> 
>> +static void set_fb_bitfield(struct fb_bitfield *bits, __u32 offset,
>> +			    __u32 length)
> 
> This is not uapi - so u32 is preferred.

Same as above. The __u32 comes from the fb_bitfield structure.

Best regards
Thomas

> Both comments apply to the whole file.
> 
> I did not see that this was wired into the kernel-doc in Documentation/
> but maybe I just missed it.
> 
> With my comments considered you can add:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> All code looks sane, but as I have not grasped the bigger picture
> this can hardly be a review.
> 
> 	Sam
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
