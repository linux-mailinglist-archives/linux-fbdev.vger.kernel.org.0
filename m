Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB1410C858
	for <lists+linux-fbdev@lfdr.de>; Thu, 28 Nov 2019 13:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfK1MF2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Thu, 28 Nov 2019 07:05:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:16677 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfK1MF1 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 28 Nov 2019 07:05:27 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Nov 2019 04:05:27 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; 
   d="scan'208";a="203417398"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Nov 2019 04:05:25 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 02/13] drm/fb-helper: don't preserve fb_ops across deferred IO use
In-Reply-To: <f8292d00-5d62-cd3c-9d17-37a3feebd74b@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1574871797.git.jani.nikula@intel.com> <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com> <f8292d00-5d62-cd3c-9d17-37a3feebd74b@tronnes.org>
Date:   Thu, 28 Nov 2019 14:05:22 +0200
Message-ID: <87lfs0mcjh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 28 Nov 2019, Noralf Trønnes <noralf@tronnes.org> wrote:
> Den 27.11.2019 17.31, skrev Jani Nikula:
>> Deferred IO now preserves the fb_ops.
>> 
>> Cc: Noralf Trønnes <noralf@tronnes.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_fb_helper.c | 18 ++----------------
>>  1 file changed, 2 insertions(+), 16 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index 0c088ea70ad0..a5a2a538d085 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -1954,7 +1954,6 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
>>  static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
>>  {
>>  	struct fb_info *fbi = fb_helper->fbdev;
>> -	struct fb_ops *fbops = NULL;
>>  	void *shadow = NULL;
>>  
>>  	if (!fb_helper->dev)
>> @@ -1963,15 +1962,11 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
>>  	if (fbi && fbi->fbdefio) {
>>  		fb_deferred_io_cleanup(fbi);
>>  		shadow = fbi->screen_buffer;
>> -		fbops = fbi->fbops;
>>  	}
>>  
>>  	drm_fb_helper_fini(fb_helper);
>>  
>> -	if (shadow) {
>> -		vfree(shadow);
>> -		kfree(fbops);
>> -	}
>> +	vfree(shadow);
>>  
>>  	drm_client_framebuffer_delete(fb_helper->buffer);
>>  }
>> @@ -2062,23 +2057,14 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>>  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
>>  
>>  	if (drm_fbdev_use_shadow_fb(fb_helper)) {
>> -		struct fb_ops *fbops;
>>  		void *shadow;
>>  
>> -		/*
>> -		 * fb_deferred_io_cleanup() clears &fbops->fb_mmap so a per
>> -		 * instance version is necessary.
>> -		 */
>> -		fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
>>  		shadow = vzalloc(fbi->screen_size);
>> -		if (!fbops || !shadow) {
>> -			kfree(fbops);
>> +		if (!shadow) {
>>  			vfree(shadow);
>
> This vfree can is a no-op now and can be dropped. With that:

D'oh!

With that I think I'd also drop the shadow local variable and assign to
fbi->screen_buffer directly. Fine with that?

Thanks.

BR,
Jani.

>
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
>
>>  			return -ENOMEM;
>>  		}
>>  
>> -		*fbops = *fbi->fbops;
>> -		fbi->fbops = fbops;
>>  		fbi->screen_buffer = shadow;
>>  		fbi->fbdefio = &drm_fbdev_defio;
>>  
>> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
