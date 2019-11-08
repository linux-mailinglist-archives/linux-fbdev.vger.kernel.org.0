Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09F6F4FE4
	for <lists+linux-fbdev@lfdr.de>; Fri,  8 Nov 2019 16:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfKHPhM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 8 Nov 2019 10:37:12 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:39361 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHPhL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 8 Nov 2019 10:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YxKUGlbherO5GSkie41wppSHH0iMnBLHKxSZel2jrX0=; b=WNeZYfY1CV4GhUAbsXd1d4c9ZH
        +7o5l5+8iLLjaimkM1dp0EK9f17u1hFj1CKx9iF9oLnOMJozXLTFyQHu8stVhx9zhf2j25i4RFCXN
        IUySsoBET3LpHrzPJ4cNN89/MAbb/xN8VcSQ1Ns/XbVxkUlBL+nkuSEmUDuOAllUg13AIEd1xuqsZ
        d4+SofiaNPC0apiiKb7T0XBuzpfNp/PxR2FpCDjH/gTp0Djov/BmA/UjFGKiddANoq5nQVoHTXl8X
        +3fYk75+tBWqSxp6o6NNVpfAb0L0O7pgM66rKWUqtu880F5P157ld/z6BErG5HMzePpscjrN6UIFn
        GjfzUwVg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62684 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iT6Jx-0001hw-01; Fri, 08 Nov 2019 16:37:09 +0100
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
        sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
        kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
Date:   Fri, 8 Nov 2019 16:37:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191108123333.25274-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 08.11.2019 13.33, skrev Thomas Zimmermann:
> The udl driver can use the generic fbdev implementation. Convert it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 563cc5809e56..55c0f9dfee29 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c

> @@ -47,6 +48,8 @@ static struct drm_driver driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM,
>  	.release = udl_driver_release,
>  
> +	.lastclose = drm_fb_helper_lastclose,
> +

No need to set this, it's already wired up:

drm_lastclose -> drm_client_dev_restore -> drm_fbdev_client_restore ->
drm_fb_helper_lastclose

>  	/* gem hooks */
>  	.gem_create_object = udl_driver_gem_create_object,
>  

> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
> index f8153b726343..afe74f892a2b 100644
> --- a/drivers/gpu/drm/udl/udl_fb.c
> +++ b/drivers/gpu/drm/udl/udl_fb.c
> @@ -20,19 +20,9 @@
>  
>  #include "udl_drv.h"
>  
> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in jiffies */
> -
> -static int fb_defio = 0;  /* Optionally enable experimental fb_defio mmap support */
>  static int fb_bpp = 16;
>  
>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);

Maybe fb_bpp can be dropped too?

It's possible to set it on the command line:

video=<xres>x<yres>-<bpp>

I haven't tried it so I can't say for certain that it actually works.

Ref: Documentation/fb/modedb.rst and drm_fb_helper_single_fb_probe()

> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> -

> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index bc1ab6060dc6..1517d5e881b8 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c

> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *dev)
>  
>  static const struct drm_mode_config_funcs udl_mode_funcs = {
>  	.fb_create = udl_fb_user_fb_create,
> -	.output_poll_changed = NULL,
> +	.output_poll_changed = drm_fb_helper_output_poll_changed,

No need to set this, it's already wired up:

drm_kms_helper_hotplug_event -> drm_client_dev_hotplug ->
drm_fbdev_client_hotplug -> drm_fb_helper_hotplug_event

Noralf.

>  };
>  
>  int udl_modeset_init(struct drm_device *dev)
> 
