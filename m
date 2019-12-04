Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8B61122E5
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Dec 2019 07:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfLDGbD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 4 Dec 2019 01:31:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:60193 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbfLDGbD (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 4 Dec 2019 01:31:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 22:31:02 -0800
X-IronPort-AV: E=Sophos;i="5.69,276,1571727600"; 
   d="scan'208";a="205276496"
Received: from huberth-mobl4.ger.corp.intel.com (HELO localhost) ([10.252.34.172])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 22:30:59 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 04/12] video: fbdev: uvesafb: modify the static fb_ops directly
In-Reply-To: <20191203170351.GH624164@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com> <af63cda5de9fee3acd28e7d264f920338298bc0a.1575390740.git.jani.nikula@intel.com> <20191203170351.GH624164@phenom.ffwll.local>
Date:   Wed, 04 Dec 2019 08:31:06 +0200
Message-ID: <87muc8haad.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 03 Dec 2019, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Dec 03, 2019 at 06:38:46PM +0200, Jani Nikula wrote:
>> Avoid modifying the fb_ops via info->fbops to let us make the pointer
>> const in the future.
>> 
>> Cc: linux-fbdev@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/video/fbdev/uvesafb.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
>> index 439565cae7ab..53d08d1b56f5 100644
>> --- a/drivers/video/fbdev/uvesafb.c
>> +++ b/drivers/video/fbdev/uvesafb.c
>> @@ -1440,7 +1440,7 @@ static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
>>  
>>  	/* Disable blanking if the user requested so. */
>>  	if (!blank)
>> -		info->fbops->fb_blank = NULL;
>> +		uvesafb_ops.fb_blank = NULL;
>>  
>>  	/*
>>  	 * Find out how much IO memory is required for the mode with
>> @@ -1510,7 +1510,7 @@ static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
>>  			(par->ypan ? FBINFO_HWACCEL_YPAN : 0);
>>  
>>  	if (!par->ypan)
>> -		info->fbops->fb_pan_display = NULL;
>> +		uvesafb_ops.fb_pan_display = NULL;
>>  }
>
> I read code.
>
> I cried.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Also, with more reading and more bad dreams I'll get about this, I'm
> revising my take on patches 1&2 in this series. On those also
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> as-is.

Thanks. I feel you.

And remember, all I ever wanted to do was

-static struct fb_ops intelfb_ops = {
+static const struct fb_ops intelfb_ops = {

in drivers/gpu/drm/i915/display/intel_fbdev.c.


BR,
Jani.


>
> Cheers, Daniel
>>  
>>  static void uvesafb_init_mtrr(struct fb_info *info)
>> -- 
>> 2.20.1
>> 
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
