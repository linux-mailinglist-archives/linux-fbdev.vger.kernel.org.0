Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25D1F10B593
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 19:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfK0SXa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 13:23:30 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37156 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfK0SXa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 13:23:30 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so8724755wmf.2
        for <linux-fbdev@vger.kernel.org>; Wed, 27 Nov 2019 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BoN2Froyrpa4sxf6wnRpIvsjPMH3RI1f+q3b2fgGrcI=;
        b=Q4n5w2UlBh9LmNW/h6AN4cdgcTyD77m+ytmTFE8P69Q5XFUKkXy1LwWcrr7XD0cK3x
         DbyBRILi4PfM/BHwym7CvWhs0nV98UNfUUUBGMZ9pj98qUX1gtB5EZPB9caFH+5VuPjd
         Zj0CzIkRHnBKjxic0dYeSSnGH/Ue9uZF1O0ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BoN2Froyrpa4sxf6wnRpIvsjPMH3RI1f+q3b2fgGrcI=;
        b=nQulM11xDcW1+CJFGSEG6VDVkLjHCG9NSnVP/Nj171Ho0cwmMHr9Crql4izLxib+5v
         VWkuCTGwzjJvYf+S0IIsFBp07YzPZOLAVtGKZJ0IGy1gLorRi9gv9UBzcc+QPK1HWucK
         mg10AfZr7mqxlfZxpSdWVnOJ4tzcuLs3t6oFhd6ISDWmRwUZdDNYlZCU0OoRBXnxMbNP
         q5QdLQg1l8zNRdlwuQPKmnn4z2U3bF31DGyk17KrB0nR95BtSpy9k+B0MS2kg05Cshud
         FgbnH9ITkH2OGk5JrNLirm3qArX0nLiMajRHjnZDO9tOsDCVliXRL2wwLxGzuicO6t8J
         nryw==
X-Gm-Message-State: APjAAAV0F2JawVhM0YdU7RMNCrg9449JBNaR1FDnvTNRZzle/EmdMUV0
        5A3ayqyNJK/w7ZeJrvJrYGx/nw==
X-Google-Smtp-Source: APXvYqxzsCzv1nhGm1H97WAOm+Dvp+mv4P55Sd7pXBymVVe4tv430CMYzsqgPYjIsD+5A81a970+iw==
X-Received: by 2002:a05:600c:212:: with SMTP id 18mr5894529wmi.93.1574879006513;
        Wed, 27 Nov 2019 10:23:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id h97sm21858031wrh.56.2019.11.27.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 10:23:25 -0800 (PST)
Date:   Wed, 27 Nov 2019 19:23:24 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 05/13] video: fbdev: vesafb: modify the static fb_ops
 directly
Message-ID: <20191127182324.GL406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <07acc8c8ef93f36103c7a13dc98e12790c2847df.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07acc8c8ef93f36103c7a13dc98e12790c2847df.1574871797.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 27, 2019 at 06:32:01PM +0200, Jani Nikula wrote:
> Avoid modifying the fb_ops via info->fbops to let us make the pointer
> const in the future.
> 
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/vesafb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index d9c08f6c2155..a1fe24ea869b 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -447,15 +447,15 @@ static int vesafb_probe(struct platform_device *dev)
>  	       vesafb_fix.smem_start, info->screen_base,
>  	       size_remap/1024, size_total/1024);
>  
> +	if (!ypan)
> +		vesafb_ops.fb_pan_display = NULL;

vesafb at least has a guarantee that there's only ever one ...

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +
>  	info->fbops = &vesafb_ops;
>  	info->var = vesafb_defined;
>  	info->fix = vesafb_fix;
>  	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_MISC_FIRMWARE |
>  		(ypan ? FBINFO_HWACCEL_YPAN : 0);
>  
> -	if (!ypan)
> -		info->fbops->fb_pan_display = NULL;
> -
>  	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>  		err = -ENOMEM;
>  		goto err;
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
