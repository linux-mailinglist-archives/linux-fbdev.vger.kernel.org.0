Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1132FB3AF
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Nov 2019 16:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfKMP0s (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 Nov 2019 10:26:48 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:60833 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfKMP0r (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 Nov 2019 10:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=STND7ppMtYHEAvFWFNykvLeSriS2IF5Re1FLKaMiGiE=; b=Wf1KV3nYntBaHmmv1CRqmYz5os
        ZvIjGwRh97tw4x5I3D64AOQNhz5u3cNEmV4bG6VWr3aV1MStz+txzvPkHA3+F56Wp/uCDCPqbZ4G2
        FAq8gA4OzheKmG+bmMdEY3wV7s8d87XXzvx+M0InxjB8IiQnr+95BNorZkSJ+3eej6ipNeaSh6Ve4
        FQ5nUrUDyHk2Pe3TtSWai5DHCRy/T2G71kCh16BUCv++xLeAUMl+4JAAHcQ4I1dbPMs53wlz3aXjh
        PSL2O1Z42c8i2qsij40/pHd14BmgPlxcUAVd48zPjWf9eAanFzns6otoOFu5QsQW7L/9tD2p35FTL
        9GmNHpFg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58964 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iUuXd-0003Ij-93; Wed, 13 Nov 2019 16:26:45 +0100
Subject: Re: [PATCH v4 1/3] drm/udl: Replace fbdev code with generic emulation
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
        sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
        kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-2-tzimmermann@suse.de>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>
Date:   Wed, 13 Nov 2019 16:26:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113115233.18483-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 13.11.2019 12.52, skrev Thomas Zimmermann:
> The udl driver can use the generic fbdev implementation. Convert it.
> 
> v4:
> 	* hardcode console bpp to 16
> v3:
> 	* remove module parameter fb_bpp in favor of fbdev's video
> 	* call drm_fbdev_generic_setup() directly; remove udl_fbdev_init()
> 	* use default for struct drm_mode_config_funcs.output_poll_changed
> 	* use default for struct drm_driver.lastclose
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index 4e854e017390..3be0c0cec49e 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <drm/drm.h>
> +#include <drm/drm_fb_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -338,7 +339,7 @@ int udl_init(struct udl_device *udl)
>  	if (ret)
>  		goto err;
>  
> -	ret = udl_fbdev_init(dev);
> +	ret = drm_fbdev_generic_setup(dev, 16);

I suggest you put this after drm_dev_register() in _probe() since fbdev
is a client, a user of the driver, not part of it as such.

Either way you choose:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

Btw, nice diffstat!

>  	if (ret)
>  		goto err;
>  
> @@ -367,6 +368,4 @@ void udl_fini(struct drm_device *dev)
>  
>  	if (udl->urbs.count)
>  		udl_free_urb_list(dev);
> -
> -	udl_fbdev_cleanup(dev);
>  }
