Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72FB95820D8
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Jul 2022 09:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiG0HNN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Jul 2022 03:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiG0HNG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Jul 2022 03:13:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C027B3D59A;
        Wed, 27 Jul 2022 00:13:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B60861520;
        Wed, 27 Jul 2022 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9FEC433D6;
        Wed, 27 Jul 2022 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658905983;
        bh=MSQbTiQFr2MCrq3clKgkD2bcbwG6ugJnVYD4QBdlIJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nfoOYSfzjUcuGHiocDDfCwIcou9/iJboWfFFcig6ZOi1tY4lcwf17aCxHcrD7nTGO
         kbmsM0L/EMnAJz0jZ/QCAr/ZB72ypYqFNLO47oprq+ySDGwXAuQVOj4bQeuZeIgSZ4
         90EyMxKC+kT4f/slBQHKbr5gaP/IV2hL5YYtJ/gU=
Date:   Wed, 27 Jul 2022 09:13:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Suti <peter.suti@streamunlimited.com>
Cc:     chuansheng.liu@intel.com, dan.carpenter@oracle.com,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: core: set smem_len before
 fb_deferred_io_init call
Message-ID: <YuDlfLeossnntH/C@kroah.com>
References: <20220726161347.GR2338@kadam>
 <20220727070723.1489599-1-peter.suti@streamunlimited.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727070723.1489599-1-peter.suti@streamunlimited.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 27, 2022 at 09:07:23AM +0200, Peter Suti wrote:
> The fbtft_framebuffer_alloc() calls fb_deferred_io_init() before
> initializing info->fix.smem_len.  It is set to zero by the
> framebuffer_alloc() function.  It will trigger a WARN_ON() at the
> start of fb_deferred_io_init() and the function will not do anything.
> 
> Fixes: 856082f021a2 ("fbdev: defio: fix the pagelist corruption")
> 
> Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 9b3eaed80cdd..afaba94d1d1c 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -654,7 +654,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  	fbdefio->delay =            HZ / fps;
>  	fbdefio->sort_pagereflist = true;
>  	fbdefio->deferred_io =      fbtft_deferred_io;
> -	fb_deferred_io_init(info);
>  
>  	snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
>  	info->fix.type =           FB_TYPE_PACKED_PIXELS;
> @@ -665,6 +664,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  	info->fix.line_length =    width * bpp / 8;
>  	info->fix.accel =          FB_ACCEL_NONE;
>  	info->fix.smem_len =       vmem_size;
> +	fb_deferred_io_init(info);
>  
>  	info->var.rotate =         pdata->rotate;
>  	info->var.xres =           width;
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
