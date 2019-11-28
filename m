Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE8410CA11
	for <lists+linux-fbdev@lfdr.de>; Thu, 28 Nov 2019 15:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfK1ODy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 28 Nov 2019 09:03:54 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:46591 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1ODx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 28 Nov 2019 09:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nvJP6Jz4RDMtaJnCRzBV01F/F1vdDhvbXGhtYZx1GcA=; b=MeKKMMmlj6jgpVKdYU0nkAanUp
        uu0svRRVgX4xK4c3Pve96wA02MYhH3L72ttIxus1A7T/ifWHLxK0Z50KX4TlZF+g0sipde8vdA26I
        ER8YXvmrdiK1eCBA9wovdNX3XBuepim1Gb+qf1FYy3uEn/Qq5zoRhV4oLVOp+D+yq4T0qlz7refI5
        D2XeCB2DVx40zrr02Cgqs2CIRmxY8VX/VYXS1T/MgUjcVclsmQOY1RDEZVDTpn/Qx72tOdV6yASwa
        O/QJH8rqJy2CM/VU34rYxyPcZFSbxkgWRfk6C5BV9wF1ryb2vMBaLG5OmQ22G5jXihBJe/ZFKinWF
        i4B6rUdA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60986 helo=[192.168.10.174])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iaKOd-0004AZ-3s; Thu, 28 Nov 2019 15:03:51 +0100
Subject: Re: [Intel-gfx] [PATCH 02/13] drm/fb-helper: don't preserve fb_ops
 across deferred IO use
To:     Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org
References: <cover.1574871797.git.jani.nikula@intel.com>
 <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
 <f8292d00-5d62-cd3c-9d17-37a3feebd74b@tronnes.org> <87lfs0mcjh.fsf@intel.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a725ccfb-1da9-6659-c3ab-1187077897d6@tronnes.org>
Date:   Thu, 28 Nov 2019 15:03:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <87lfs0mcjh.fsf@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 28.11.2019 13.05, skrev Jani Nikula:
> On Thu, 28 Nov 2019, Noralf Trønnes <noralf@tronnes.org> wrote:
>> Den 27.11.2019 17.31, skrev Jani Nikula:
>>> Deferred IO now preserves the fb_ops.
>>>
>>> Cc: Noralf Trønnes <noralf@tronnes.org>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_fb_helper.c | 18 ++----------------
>>>  1 file changed, 2 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>>> index 0c088ea70ad0..a5a2a538d085 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -1954,7 +1954,6 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
>>>  static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
>>>  {
>>>  	struct fb_info *fbi = fb_helper->fbdev;
>>> -	struct fb_ops *fbops = NULL;
>>>  	void *shadow = NULL;
>>>  
>>>  	if (!fb_helper->dev)
>>> @@ -1963,15 +1962,11 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
>>>  	if (fbi && fbi->fbdefio) {
>>>  		fb_deferred_io_cleanup(fbi);
>>>  		shadow = fbi->screen_buffer;
>>> -		fbops = fbi->fbops;
>>>  	}
>>>  
>>>  	drm_fb_helper_fini(fb_helper);
>>>  
>>> -	if (shadow) {
>>> -		vfree(shadow);
>>> -		kfree(fbops);
>>> -	}
>>> +	vfree(shadow);
>>>  
>>>  	drm_client_framebuffer_delete(fb_helper->buffer);
>>>  }
>>> @@ -2062,23 +2057,14 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>>>  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
>>>  
>>>  	if (drm_fbdev_use_shadow_fb(fb_helper)) {
>>> -		struct fb_ops *fbops;
>>>  		void *shadow;
>>>  
>>> -		/*
>>> -		 * fb_deferred_io_cleanup() clears &fbops->fb_mmap so a per
>>> -		 * instance version is necessary.
>>> -		 */
>>> -		fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
>>>  		shadow = vzalloc(fbi->screen_size);
>>> -		if (!fbops || !shadow) {
>>> -			kfree(fbops);
>>> +		if (!shadow) {
>>>  			vfree(shadow);
>>
>> This vfree can is a no-op now and can be dropped. With that:
> 
> D'oh!
> 
> With that I think I'd also drop the shadow local variable and assign to
> fbi->screen_buffer directly. Fine with that?

Sure, that's even better.

Noralf.

> 
> Thanks.
> 
> BR,
> Jani.
> 
>>
>> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
>>
>>>  			return -ENOMEM;
>>>  		}
>>>  
>>> -		*fbops = *fbi->fbops;
>>> -		fbi->fbops = fbops;
>>>  		fbi->screen_buffer = shadow;
>>>  		fbi->fbdefio = &drm_fbdev_defio;
>>>  
>>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
