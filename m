Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D047F10D7D1
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 16:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfK2PWl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 10:22:41 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36979 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfK2PWk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 10:22:40 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so15510231wmf.2
        for <linux-fbdev@vger.kernel.org>; Fri, 29 Nov 2019 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=F/Q8DCEQHxipt0D809lFJ1ZaQIeTBrtpgHJwkLpYboQ=;
        b=dz7QEhPlpcx0Lq5GK/rlPwe/mDkO6pvPhOHrMlDpbXQgj/QLgnpS8sXzfGOxXzVh1D
         CiZb4sKcEl42usn9Gi7cT7gIpneT6qHePWVWUfdbtN2SWaf3DXQq4GT56XZmweXLyBQs
         vM65/ZHrJVjVRrqFScUMHbsRpXBz5k9Jq9XOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F/Q8DCEQHxipt0D809lFJ1ZaQIeTBrtpgHJwkLpYboQ=;
        b=Xrc+a2JWdzF2fANn7wMu8Ht6wc4+STB8caeXZO80LjbNhsadxsnbQlFz8Cjdm0sNAC
         EdcBzh+wj4qxLMVzrYkKFL6AkCLqh4dWhMTjFkwTESO7GcxL/PTHXidxG2gxBemqQKzY
         PMk6d1oVn5s2ZOeouSfQJnDH2VyBf3nUjaKj7cG3MLACRoHqoHQvXzpx0aAVf1beb5/L
         o7yccgO3aBnDqvis3scFlbQRDcTrcn62d1MpJNkEFNg94YGk+4dtr+7xPRkUENEhS4bM
         80RqseJKTvXu0fNG8YlhfMwCUXXfLtPNfrwrksgrbCN5zClPswp5WMBBWMyqMgC1gg7N
         PSmA==
X-Gm-Message-State: APjAAAWmwh2OgLg0L+7m3ls34D96OPVvJSLwynO+Nq3kP4abU84IDRGJ
        ofF+sjXum4azUee2NyMEz/+SdA==
X-Google-Smtp-Source: APXvYqwv+qUWfUvPlwhsbTw+GSuqKACcjSIji4gM5DzWTQ0B4B1vAyEIyU6RSflfsgvRveAEZVzzQg==
X-Received: by 2002:a1c:2e8f:: with SMTP id u137mr15635844wmu.105.1575040956343;
        Fri, 29 Nov 2019 07:22:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id r2sm14461823wma.44.2019.11.29.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 07:22:35 -0800 (PST)
Date:   Fri, 29 Nov 2019 16:22:33 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
        Jaya Kumar <jayalk@intworks.biz>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 01/14] video: fb_defio: preserve user fb_ops
Message-ID: <20191129152233.GF624164@phenom.ffwll.local>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <022c82429da15d6450ff9ac1a897322ec3124db4.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <022c82429da15d6450ff9ac1a897322ec3124db4.1575022735.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Nov 29, 2019 at 12:29:31PM +0200, Jani Nikula wrote:
> Modifying fb_ops directly to override fb_mmap with fb_deferred_io_mmap
> and then resetting it to NULL afterwards causes problems all over the
> place. First, it prevents making the fbops member of struct fb_info a
> const pointer, which means we can't make struct fb_ops const
> anywhere. Second, a few places have to go out of their way to restore
> the original fb_mmap pointer that gets reset to NULL.
> 
> Since the only user of the fbops->fb_mmap hook is fb_mmap() in fbmem.c,
> call fb_deferred_io_mmap() directly when deferred IO is enabled, and
> avoid modifying fb_ops altogether.
> 
> Simply use info->fbdefio to determine whether deferred IO should be used
> or not. This should be accurate enough for all use cases, although
> perhaps not pedantically correct.
> 
> v2: Simplify considerably by calling fb_deferred_io_mmap() directly
>     (Daniel, Ville)
> 
> Cc: Jaya Kumar <jayalk@intworks.biz>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/core/fb_defio.c |  3 ---
>  drivers/video/fbdev/core/fbmem.c    | 15 +++++++++++----
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index 82c20c6047b0..a591d291b231 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -171,7 +171,6 @@ int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  	vma->vm_private_data = info;
>  	return 0;
>  }
> -EXPORT_SYMBOL(fb_deferred_io_mmap);
>  
>  /* workqueue callback */
>  static void fb_deferred_io_work(struct work_struct *work)
> @@ -206,7 +205,6 @@ void fb_deferred_io_init(struct fb_info *info)
>  
>  	BUG_ON(!fbdefio);
>  	mutex_init(&fbdefio->lock);
> -	info->fbops->fb_mmap = fb_deferred_io_mmap;
>  	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
>  	INIT_LIST_HEAD(&fbdefio->pagelist);
>  	if (fbdefio->delay == 0) /* set a default of 1 s */
> @@ -237,7 +235,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>  		page->mapping = NULL;
>  	}
>  
> -	info->fbops->fb_mmap = NULL;
>  	mutex_destroy(&fbdefio->lock);
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 86b06a599f96..990550930a8e 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1332,16 +1332,23 @@ static int
>  fb_mmap(struct file *file, struct vm_area_struct * vma)
>  {
>  	struct fb_info *info = file_fb_info(file);
> -	struct fb_ops *fb;
> +	int (*fb_mmap_fn)(struct fb_info *info, struct vm_area_struct *vma);

Oh I function pointer for tidier control flow, neato.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	unsigned long mmio_pgoff;
>  	unsigned long start;
>  	u32 len;
>  
>  	if (!info)
>  		return -ENODEV;
> -	fb = info->fbops;
>  	mutex_lock(&info->mm_lock);
> -	if (fb->fb_mmap) {
> +
> +	fb_mmap_fn = info->fbops->fb_mmap;
> +
> +#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> +	if (info->fbdefio)
> +		fb_mmap_fn = fb_deferred_io_mmap;
> +#endif
> +
> +	if (fb_mmap_fn) {
>  		int res;
>  
>  		/*
> @@ -1349,7 +1356,7 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
>  		 * SME protection is removed ahead of the call
>  		 */
>  		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> -		res = fb->fb_mmap(info, vma);
> +		res = fb_mmap_fn(info, vma);
>  		mutex_unlock(&info->mm_lock);
>  		return res;
>  	}
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
