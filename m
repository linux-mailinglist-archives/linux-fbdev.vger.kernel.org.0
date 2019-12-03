Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69B721102F4
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfLCQyX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:54:23 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34965 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfLCQyX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Dec 2019 11:54:23 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so4606318wro.2
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Dec 2019 08:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DZnNhF0PGffENesjR3a7W8nq3Fea3LKDciTL3taQduc=;
        b=aVbb+i4GcawMxJI0SeJKfHIZqA++38iDHOS1yZwpY133M5tB27ysdG/B8LalFx+RRD
         PLZt+u5a60/xpdygl8x3rJUX9cvz3XoTLca2Dx86Q2Ewkb0W226vT8nLS359eAoORKEX
         T3j9lTdZY1fycNFoaikbnra/uUhPuvzKfcQDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DZnNhF0PGffENesjR3a7W8nq3Fea3LKDciTL3taQduc=;
        b=mCZXM2rkZj0zgZBggOk//+pqfyhxHIIo7UnoAWZ1BZQ/RzyCXpt7BH6NlFWPEFlgcR
         SWxVJGtNgjKvqXaFe3FCKmCOhtWcwVds1einnOSaITTKdC9RmT1T9izZ6iB/yz/0gNdr
         +OwCKH7vdx/6Szz/u0uJ0fyUib+rCPxw8gEIov5m10f2ifKPmL5lu2nMHpFODjJhyFAu
         wIiQ2oKViLn9cu0DHf41L9uVs9wgZNwLEoWreppSY4U4rZbVLBExIimKlPboZctVDLL+
         HDyb1fQpcyT4YyCs05mR4d+CGShvY32i3ftZu7ajwk+KoUgfvuYUxjlBVUYE3E8C/q7o
         jsqQ==
X-Gm-Message-State: APjAAAXZ01oQTv6UtA3dlVGACwSjBQxIzz7p34kzEnyIlJbrwNoty/sc
        96joc1+GLUVBc2SAxpC+g8jiDA==
X-Google-Smtp-Source: APXvYqxQDSzbn1ZA4cAevFXsXUipFT75YeKth0Y/+PDc/6X8aUrUWP2JkD6U8PuuGXip08Kr9V9x7Q==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr6437384wrn.239.1575392060922;
        Tue, 03 Dec 2019 08:54:20 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id h97sm4673935wrh.56.2019.12.03.08.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:54:20 -0800 (PST)
Date:   Tue, 3 Dec 2019 17:54:18 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 03/12] video: fbdev: nvidia: modify the
 static fb_ops directly
Message-ID: <20191203165418.GG624164@phenom.ffwll.local>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <9639e2305fd4d03311bf909b8914277b221ca582.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9639e2305fd4d03311bf909b8914277b221ca582.1575390740.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Dec 03, 2019 at 06:38:45PM +0200, Jani Nikula wrote:
> Avoid modifying the fb_ops via info->fbops to let us make the pointer
> const in the future.
> 
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/nvidia/nvidia.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> index fbeeed5afe35..c583c018304d 100644
> --- a/drivers/video/fbdev/nvidia/nvidia.c
> +++ b/drivers/video/fbdev/nvidia/nvidia.c
> @@ -607,6 +607,8 @@ static int nvidiafb_cursor(struct fb_info *info, struct fb_cursor *cursor)
>  	return 0;
>  }
>  
> +static struct fb_ops nvidia_fb_ops;

Ok this one is two independent flags, I'm not going to ask for a matrix.
Plus it's all in one file. Plus have you read the coding style used in
here. Plus ...

Well.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  static int nvidiafb_set_par(struct fb_info *info)
>  {
>  	struct nvidia_par *par = info->par;
> @@ -660,19 +662,19 @@ static int nvidiafb_set_par(struct fb_info *info)
>  	info->fix.line_length = (info->var.xres_virtual *
>  				 info->var.bits_per_pixel) >> 3;
>  	if (info->var.accel_flags) {
> -		info->fbops->fb_imageblit = nvidiafb_imageblit;
> -		info->fbops->fb_fillrect = nvidiafb_fillrect;
> -		info->fbops->fb_copyarea = nvidiafb_copyarea;
> -		info->fbops->fb_sync = nvidiafb_sync;
> +		nvidia_fb_ops.fb_imageblit = nvidiafb_imageblit;
> +		nvidia_fb_ops.fb_fillrect = nvidiafb_fillrect;
> +		nvidia_fb_ops.fb_copyarea = nvidiafb_copyarea;
> +		nvidia_fb_ops.fb_sync = nvidiafb_sync;
>  		info->pixmap.scan_align = 4;
>  		info->flags &= ~FBINFO_HWACCEL_DISABLED;
>  		info->flags |= FBINFO_READS_FAST;
>  		NVResetGraphics(info);
>  	} else {
> -		info->fbops->fb_imageblit = cfb_imageblit;
> -		info->fbops->fb_fillrect = cfb_fillrect;
> -		info->fbops->fb_copyarea = cfb_copyarea;
> -		info->fbops->fb_sync = NULL;
> +		nvidia_fb_ops.fb_imageblit = cfb_imageblit;
> +		nvidia_fb_ops.fb_fillrect = cfb_fillrect;
> +		nvidia_fb_ops.fb_copyarea = cfb_copyarea;
> +		nvidia_fb_ops.fb_sync = NULL;
>  		info->pixmap.scan_align = 1;
>  		info->flags |= FBINFO_HWACCEL_DISABLED;
>  		info->flags &= ~FBINFO_READS_FAST;
> @@ -1165,7 +1167,7 @@ static int nvidia_set_fbinfo(struct fb_info *info)
>  	info->pixmap.flags = FB_PIXMAP_SYSTEM;
>  
>  	if (!hwcur)
> -	    info->fbops->fb_cursor = NULL;
> +	    nvidia_fb_ops.fb_cursor = NULL;
>  
>  	info->var.accel_flags = (!noaccel);
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
