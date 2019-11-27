Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7FC10B560
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 19:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfK0SRr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 13:17:47 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40909 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfK0SRr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 13:17:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id y5so8683008wmi.5
        for <linux-fbdev@vger.kernel.org>; Wed, 27 Nov 2019 10:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8W4UzLRRVqZjZovqwyUPdB69HtmGKGL+pSaC3t3RdVI=;
        b=MeA9U8ra9+730VFZbjSdTVsr3SJ1cFBrCP8uEnSramABqrJeaR+X4+w8ow18fD+xYQ
         QPaXdXha9FKM8yShs0DOXj85giMBgirZ6+0O0CW3bz3vVUTxoNYHi25nI+oa3H7Dl7jL
         XFV9FMmNJflRKJ86DH/jwS70TAqehNempDkBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8W4UzLRRVqZjZovqwyUPdB69HtmGKGL+pSaC3t3RdVI=;
        b=EZafM1c9WGDzGcnKRW3PRjxe6gvxYfNgvprYJUKXctIaOgy52sqGvsz+u+eOIXfLQv
         YycXI8q2Cmo+qzwf4VTIhgxvVBCUZanzgxKafsyBZzuLPBO5t/7j0eSrvFARgmNnCKP3
         deUCK/+WEEuuGD5MPJ7OamhpWk3Gb2Nl0dydCVw90EcfzdP+SSjQKbp+uj9k9DemZohA
         fhuyK8nsRp2DmiFwWezWVppOcKScgpHjxez53NAgaiN9ULMaa5BQSM+32k56FFnhgPXi
         dIwna4gfQhBeF9wgBjQZvE17XnyxFoLJGWxk5pCHLgc8v9b/QwrGfmv14c2f/H4jKHkA
         iMgw==
X-Gm-Message-State: APjAAAWz0cXPLNoi9vjPNe2DlRadxghi2nFE1I792+9/5czE/cSN7mMU
        xWJd8fb5iDJwnO9Cp3iKBLgh0g==
X-Google-Smtp-Source: APXvYqwVeXrYeKnInUQDGxdT18cEsZhen7k7JyXbvcHK8W3XcR58NbTnmrNGbvfoZxdT0QwuVtiaYQ==
X-Received: by 2002:a05:600c:21c6:: with SMTP id x6mr5471781wmj.156.1574878664236;
        Wed, 27 Nov 2019 10:17:44 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id m1sm19863435wrv.37.2019.11.27.10.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 10:17:43 -0800 (PST)
Date:   Wed, 27 Nov 2019 19:17:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Subject: Re: [Intel-gfx] [PATCH 01/13] video: fb_defio: preserve user fb_ops
Message-ID: <20191127181741.GG406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <448995ffd954e0cd2287089cb686e351cc095834.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <448995ffd954e0cd2287089cb686e351cc095834.1574871797.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 27, 2019 at 06:31:57PM +0200, Jani Nikula wrote:
> Modifying fb_ops directly to override fb_mmap with fb_deferred_io_mmap
> and then resetting it to NULL afterwards causes problems all over the
> place. First, it prevents making the fbops member of struct fb_info a
> const pointer, which means we can't make struct fb_ops const
> anywhere. Second, a few places have to go out of their way to restore
> the original fb_mmap pointer that gets reset to NULL.
> 
> Preserve the passed in fb_ops by making a copy of it and modifying that
> instead. Add a deferred_io_private member to struct fb_info to store the
> pointer to the old fb_ops, and restore that at cleanup.
> 
> Cc: Jaya Kumar <jayalk@intworks.biz>
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Note: If the approach is acceptable, we'll also need to handle the error
> returns on memory allocation failures at fb_deferred_io_init() call
> sites. There are 13.

it's fbdev defio, I think we can do worse with less effort. Just embed a
copy of fb_ops into fb_info, and use that, and tada! no memory allocation
needed :-)

I'd totally r-b that patch.

Or do what Ville suggested, add an fb_info->fbdefio.enabled, set that in
the _init function and in fb_mmap call fb_deferred_io_mmap for that case
instead of the driver's fb_ops->fb_mmap. There's only one caller of that
in the entire tree, in fbmem.c. Also, we could/should nuke the
EXPORT_SYMBOL(fb_deferred_io_mmap) I think.

That version would also get my r-b stamp. So up to you what you prefer.
-Daniel

> ---
>  drivers/video/fbdev/core/fb_defio.c | 25 ++++++++++++++++++++++---
>  include/linux/fb.h                  |  3 ++-
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index 82c20c6047b0..36697844c1e0 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -200,13 +200,23 @@ static void fb_deferred_io_work(struct work_struct *work)
>  	mutex_unlock(&fbdefio->lock);
>  }
>  
> -void fb_deferred_io_init(struct fb_info *info)
> +int fb_deferred_io_init(struct fb_info *info)
>  {
>  	struct fb_deferred_io *fbdefio = info->fbdefio;
> +	struct fb_ops *fbops;
>  
>  	BUG_ON(!fbdefio);
> +
> +	fbops = kmemdup(info->fbops, sizeof(*fbops), GFP_KERNEL);
> +	if (!fbops)
> +		return -ENOMEM;
> +
> +	fbops->fb_mmap = fb_deferred_io_mmap;
> +	info->deferred_io_private = info->fbops;
> +	info->fbops = fbops;
> +
>  	mutex_init(&fbdefio->lock);
> -	info->fbops->fb_mmap = fb_deferred_io_mmap;
> +
>  	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
>  	INIT_LIST_HEAD(&fbdefio->pagelist);
>  	if (fbdefio->delay == 0) /* set a default of 1 s */
> @@ -229,6 +239,12 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>  	int i;
>  
>  	BUG_ON(!fbdefio);
> +
> +	/* sanity check against misuse */
> +	if (WARN_ON(!info->deferred_io_private ||
> +		    info->fbops->fb_mmap != fb_deferred_io_mmap))
> +		return;
> +
>  	cancel_delayed_work_sync(&info->deferred_work);
>  
>  	/* clear out the mapping that we setup */
> @@ -237,7 +253,10 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>  		page->mapping = NULL;
>  	}
>  
> -	info->fbops->fb_mmap = NULL;
> +	kfree(info->fbops);
> +	info->fbops = info->deferred_io_private;
> +	info->deferred_io_private = NULL;
> +
>  	mutex_destroy(&fbdefio->lock);
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index a6ad528990de..65f2abd47745 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -470,6 +470,7 @@ struct fb_info {
>  #ifdef CONFIG_FB_DEFERRED_IO
>  	struct delayed_work deferred_work;
>  	struct fb_deferred_io *fbdefio;
> +	void *deferred_io_private;
>  #endif
>  
>  	struct fb_ops *fbops;
> @@ -658,7 +659,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
>  
>  /* drivers/video/fb_defio.c */
>  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
> -extern void fb_deferred_io_init(struct fb_info *info);
> +extern int fb_deferred_io_init(struct fb_info *info);
>  extern void fb_deferred_io_open(struct fb_info *info,
>  				struct inode *inode,
>  				struct file *file);
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
