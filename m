Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A34DC1102E0
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfLCQu5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:50:57 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54136 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbfLCQu5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Dec 2019 11:50:57 -0500
Received: by mail-wm1-f66.google.com with SMTP id u18so3665100wmc.3
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Dec 2019 08:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BDA1lCsjT6jhjw1Inx/be+I6DupiQUhbWk3tyeWkfHQ=;
        b=FA4vtzg+fatOfdTrwPPlKYagWtjE0PaAooquhjXiIyVfvC4hCecsh/bzRqu9AlmFqN
         WCAh9pbxOtht6C8sXaCgoEd4fayYOMUWp/SQVwHA3dZ+jweZTJc/xbwqc0vcAU4ac0e0
         mzJCnt+d0JGva3eDMkYEBeTLygXUk6MslQOYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BDA1lCsjT6jhjw1Inx/be+I6DupiQUhbWk3tyeWkfHQ=;
        b=Aa84YMgMC/i117vwXLYexhPFWJ1P6/Z94fAyYWYzwRr3NRQ3sbCqdqIgXsGTpls6pr
         z34qAs8Er3xy8wVVwoV7j/8Ig5WqQ7NDwhRpcNtPu8ztY1LMZLwIeeFo9xI/f5seUK7J
         RTncmOmq5hnPk+aZurhEZuWWEaKVpW9f1SrNKXiDbukpCrfp+38/E244xDE9qlzWd/ty
         79wL8DC4g3tkt2L8V4O5fHi+qigGCjvIw6iKku+BcZ45ujRbXqmwyFn4Nu7FpBqMw/sB
         BsHvLxWq/kRVNFC30n1l+qTLmMz0LvgjML31iw6C9QhdoxI0ESKV5XVu7+DYCP947oKa
         Fj6g==
X-Gm-Message-State: APjAAAVj+r6AJcWlnHwhp/H4RmMT/sEB+aZKt7HGUOS7gQThyChmIrmu
        T6VKFMejHIjOVzKEuY8G1Cghng==
X-Google-Smtp-Source: APXvYqwQczem2bDVNpXQTdsF+miJoZFig5aiMHEctWtY8z3kSvnbr0ah02kiB/HNj0YleZkyEOCE1Q==
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr3167660wmm.57.1575391855165;
        Tue, 03 Dec 2019 08:50:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id u189sm2307696wmg.40.2019.12.03.08.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:50:54 -0800 (PST)
Date:   Tue, 3 Dec 2019 17:50:52 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 02/12] video: fbdev: mb862xx: modify the static fb_ops
 directly
Message-ID: <20191203165052.GF624164@phenom.ffwll.local>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <51f55c02ea4057cc46335ca5c447b92a55383f77.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f55c02ea4057cc46335ca5c447b92a55383f77.1575390740.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Dec 03, 2019 at 06:38:44PM +0200, Jani Nikula wrote:
> Avoid modifying the fb_ops via info->fbops to let us make the pointer
> const in the future. Drop the unnecessary EXPORT_SYMBOL() while at it.
> 
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/mb862xx/mb862xxfb.h       |  2 +-
>  drivers/video/fbdev/mb862xx/mb862xxfb_accel.c | 15 +++++++--------
>  drivers/video/fbdev/mb862xx/mb862xxfbdrv.c    |  4 +++-
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb.h b/drivers/video/fbdev/mb862xx/mb862xxfb.h
> index 50bc9b584ca1..52a77ea4e849 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfb.h
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfb.h
> @@ -89,7 +89,7 @@ struct mb862xxfb_par {
>  	u32			pseudo_palette[16];
>  };
>  
> -extern void mb862xxfb_init_accel(struct fb_info *info, int xres);
> +extern void mb862xxfb_init_accel(struct fb_info *info, struct fb_ops *fbops, int xres);
>  #ifdef CONFIG_FB_MB862XX_I2C
>  extern int mb862xx_i2c_init(struct mb862xxfb_par *par);
>  extern void mb862xx_i2c_exit(struct mb862xxfb_par *par);
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
> index f58ff900e82a..42569264801f 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c

/me cries in fbdev

> @@ -303,19 +303,19 @@ static void mb86290fb_fillrect(struct fb_info *info,
>  	mb862xxfb_write_fifo(7, cmd, info);
>  }
>  
> -void mb862xxfb_init_accel(struct fb_info *info, int xres)
> +void mb862xxfb_init_accel(struct fb_info *info, struct fb_ops *fbops, int xres)
>  {
>  	struct mb862xxfb_par *par = info->par;
>  
>  	if (info->var.bits_per_pixel == 32) {
> -		info->fbops->fb_fillrect = cfb_fillrect;
> -		info->fbops->fb_copyarea = cfb_copyarea;
> -		info->fbops->fb_imageblit = cfb_imageblit;
> +		fbops->fb_fillrect = cfb_fillrect;
> +		fbops->fb_copyarea = cfb_copyarea;
> +		fbops->fb_imageblit = cfb_imageblit;

Ok, so this just resets to the same values as mb862xxfb_ops.

>  	} else {
>  		outreg(disp, GC_L0EM, 3);
> -		info->fbops->fb_fillrect = mb86290fb_fillrect;
> -		info->fbops->fb_copyarea = mb86290fb_copyarea;
> -		info->fbops->fb_imageblit = mb86290fb_imageblit;
> +		fbops->fb_fillrect = mb86290fb_fillrect;
> +		fbops->fb_copyarea = mb86290fb_copyarea;
> +		fbops->fb_imageblit = mb86290fb_imageblit;

Which means if we'd copypaste that into an mb862xxfb_accel_ops we could do
this a bit cleaner, and leave the ops structs const.

>  	}
>  	outreg(draw, GDC_REG_DRAW_BASE, 0);
>  	outreg(draw, GDC_REG_MODE_MISC, 0x8000);
> @@ -326,6 +326,5 @@ void mb862xxfb_init_accel(struct fb_info *info, int xres)
>  	    FBINFO_HWACCEL_IMAGEBLIT;
>  	info->fix.accel = 0xff;	/*FIXME: add right define */
>  }
> -EXPORT_SYMBOL(mb862xxfb_init_accel);
>  
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> index 962c0171d271..52755b591c14 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -194,6 +194,8 @@ static int mb862xxfb_check_var(struct fb_var_screeninfo *var,
>  	return 0;
>  }
>  
> +static struct fb_ops mb862xxfb_ops;
> +
>  /*
>   * set display parameters
>   */
> @@ -204,7 +206,7 @@ static int mb862xxfb_set_par(struct fb_info *fbi)

set_par. It's called from set_par.

Ok not going to think about this more.
-Daniel

>  
>  	dev_dbg(par->dev, "%s\n", __func__);
>  	if (par->type == BT_CORALP)
> -		mb862xxfb_init_accel(fbi, fbi->var.xres);
> +		mb862xxfb_init_accel(fbi, &mb862xxfb_ops, fbi->var.xres);
>  
>  	if (par->pre_init)
>  		return 0;
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
