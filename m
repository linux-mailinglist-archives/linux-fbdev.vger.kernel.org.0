Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30AFE11031C
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 18:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfLCRD4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 12:03:56 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35319 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRD4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Dec 2019 12:03:56 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so4649120wro.2
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Dec 2019 09:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q0l9pXcuu7caGmmx9lkQ2u0xYl+DVYW7QBpf67H6kJ0=;
        b=NMc4vQbW9+U4AhoYIGNE+DdbZZGlo4owOG4fIghXP4wvP5gI1ffeVyx5ISxoWUI3h7
         DYjH9reUP037rIGfbgT5gFjaZWW6cyYc8XYuDpGPeA1WmvXxbostYyqtGb7GFASGImGC
         pY52L8bbFr0+MJQ4v2dgS8Eyz8SIQjNV4LAA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q0l9pXcuu7caGmmx9lkQ2u0xYl+DVYW7QBpf67H6kJ0=;
        b=AXFviERdWCOAiV+JjZUBYzPt+tGgXmmnseTH1Ctg2sT25phyiCGQgdSIsJ8iluvzl3
         A+DweZuUjOqWk9RmWYCEsxLwLxE3YGT8/hPZ2W1hpoJeqC61bwXRHvd2Jxk4ZxL5X1mL
         ntR9lfzAchFR5nmTwIzSEaZWm6JNQYi9llwTPGbSR/ze2vnMIuhdoUHs99tdp/tnZLLK
         Jy0kR1zv6ATQn8sceiJaGvoN1hovwmLhe/gBnX7Olg/d5WGp/OPDmnk+BY35zW5Q9lHY
         K0zgd1ZyPf7iNa0un2TWCOA19Z/VGipoY/X2pmEOHTlx/jZl2z2qUYpldPa9zYr1P/Iu
         gGTQ==
X-Gm-Message-State: APjAAAXy7Fp0InFnhJB7nGNWas98e5VPprGmmbTZV/rypdj6lhQquY5s
        YmKrmm23ZGAZC6iPDM7WjiJeuHNP4Tg=
X-Google-Smtp-Source: APXvYqz10d71sE1iEv6nWCjt2E1hm98B92GhJpmlHCcWM/+5H4Y6cF3GTdO16nfqN8ORoGFBp+cO8Q==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr6313389wrp.322.1575392634190;
        Tue, 03 Dec 2019 09:03:54 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id s10sm4424308wrw.12.2019.12.03.09.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:03:53 -0800 (PST)
Date:   Tue, 3 Dec 2019 18:03:51 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 04/12] video: fbdev: uvesafb: modify the
 static fb_ops directly
Message-ID: <20191203170351.GH624164@phenom.ffwll.local>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <af63cda5de9fee3acd28e7d264f920338298bc0a.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af63cda5de9fee3acd28e7d264f920338298bc0a.1575390740.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Dec 03, 2019 at 06:38:46PM +0200, Jani Nikula wrote:
> Avoid modifying the fb_ops via info->fbops to let us make the pointer
> const in the future.
> 
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/uvesafb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
> index 439565cae7ab..53d08d1b56f5 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -1440,7 +1440,7 @@ static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
>  
>  	/* Disable blanking if the user requested so. */
>  	if (!blank)
> -		info->fbops->fb_blank = NULL;
> +		uvesafb_ops.fb_blank = NULL;
>  
>  	/*
>  	 * Find out how much IO memory is required for the mode with
> @@ -1510,7 +1510,7 @@ static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
>  			(par->ypan ? FBINFO_HWACCEL_YPAN : 0);
>  
>  	if (!par->ypan)
> -		info->fbops->fb_pan_display = NULL;
> +		uvesafb_ops.fb_pan_display = NULL;
>  }

I read code.

I cried.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also, with more reading and more bad dreams I'll get about this, I'm
revising my take on patches 1&2 in this series. On those also

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

as-is.

Cheers, Daniel
>  
>  static void uvesafb_init_mtrr(struct fb_info *info)
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
