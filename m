Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1AEF132A86
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jan 2020 16:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgAGP4P (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Jan 2020 10:56:15 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37041 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgAGP4O (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Jan 2020 10:56:14 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so41940539wru.4
        for <linux-fbdev@vger.kernel.org>; Tue, 07 Jan 2020 07:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=CvMm05V8g7+0q+Ui42OmT25y1ziIysK8ZY1Hix9SYOk=;
        b=b5zAbHoLeEnnKv5Pe2FO8SXc2DC9kOf7vi90pfVCVrAZTrEqSStlebOBOleTywwlu0
         L1b/R2sUnO88QH7MdQfYAwQKY5CQiKyAu450/ywdWpvDC9aV4+qVyu+F0elZsnXKGkGY
         x40SQaNAwyLjhSWVZzFNqi/j/WpUXI/vYyuEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=CvMm05V8g7+0q+Ui42OmT25y1ziIysK8ZY1Hix9SYOk=;
        b=lkyKKC8ZobaLVH4p0vg4I4A7TWVBUuVtuwVhs15DKpKQH5dBtHgVFH2Pi8gTpE/d4r
         u97tjKQXMb9ct3/3KvMKU/l7WpBwaQ8/qc6tpzRNTfC17/84vEO4bNl+N2dlUiNIsurr
         AkS2YIqmXDb+76wf9Ue5Nx1KIXjpaIn8LGd3+arhGns72Yfk2MCEOBd1coTjaM1M9MI1
         jzHo82wlifqnHzeDHzLiU6FW6stAGsJYc380egtv6G5ddGhycNqmLY5LmbJFFljl7FOh
         MgdZDU47OPY+PbOKECtK2dkfeGOdzRjcIX2Hpd8BR52+ATTqtp1J2yulcEsUGB9TPj4Q
         m9Dg==
X-Gm-Message-State: APjAAAV0VMmrclhz6+2Z+V2esqD0Vb2ggVev9l9zw88fMmjDaRJL2HEH
        HWprTssIcNMAkkdosZWXK3oh0Zq/AGU=
X-Google-Smtp-Source: APXvYqx3h6noxkt81i/cx6q7p6cU1GJPR1y287dcrhXYvOtvXcQFfcMZU3tI3SF9MlsEh+F8zLMl/w==
X-Received: by 2002:a5d:4a91:: with SMTP id o17mr32868608wrq.232.1578412572311;
        Tue, 07 Jan 2020 07:56:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id v17sm242529wrt.91.2020.01.07.07.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 07:56:11 -0800 (PST)
Date:   Tue, 7 Jan 2020 16:56:09 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Stefan Agner <stefan@agner.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/fb-helper: Round up bits_per_pixel if possible
Message-ID: <20200107155609.GC43062@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Stefan Agner <stefan@agner.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191230132734.4538-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230132734.4538-1-geert+renesas@glider.be>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Dec 30, 2019 at 02:27:34PM +0100, Geert Uytterhoeven wrote:
> When userspace requests a video mode parameter value that is not
> supported, frame buffer device drivers should round it up to a supported
> value, if possible, instead of just rejecting it.  This allows
> applications to quickly scan for supported video modes.
> 
> Currently this rule is not followed for the number of bits per pixel,
> causing e.g. "fbset -depth N" to fail, if N is smaller than the current
> number of bits per pixel.
> 
> Fix this by returning an error only if bits per pixel is too large, and
> setting it to the current value otherwise.
> 
> See also Documentation/fb/framebuffer.rst, Section 2 (Programmer's View
> of /dev/fb*").
> 
> Fixes: 865afb11949e5bf4 ("drm/fb-helper: reject any changes to the fbdev")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to drm-misc-fixes with a cc:stable.

Aside, would be really lovely if someone who cares about these fbdev
details would start to with some unit tests in the drm testsuite:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html?highlight=igt#testing-and-validation

The drm version is gearing up to be _the_ fbdev implementation, that way
we could make sure it wont break (e.g. intel gfx CI would run this stuff
if it's in igt).

Thanks, Daniel

> ---
> Against drm-misc#for-linux-next.
> Applies with some fuzz against v5.5-rc4.
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index f8e9051926083373..cae8fa74781c8db0 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1267,7 +1267,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>  	 * Changes struct fb_var_screeninfo are currently not pushed back
>  	 * to KMS, hence fail if different settings are requested.
>  	 */
> -	if (var->bits_per_pixel != fb->format->cpp[0] * 8 ||
> +	if (var->bits_per_pixel > fb->format->cpp[0] * 8 ||
>  	    var->xres > fb->width || var->yres > fb->height ||
>  	    var->xres_virtual > fb->width || var->yres_virtual > fb->height) {
>  		drm_dbg_kms(dev, "fb requested width/height/bpp can't fit in current fb "
> @@ -1292,6 +1292,11 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>  		drm_fb_helper_fill_pixel_fmt(var, fb->format->depth);
>  	}
>  
> +	/*
> +	 * Likewise, bits_per_pixel should be rounded up to a supported value.
> +	 */
> +	var->bits_per_pixel = fb->format->cpp[0] * 8;
> +
>  	/*
>  	 * drm fbdev emulation doesn't support changing the pixel format at all,
>  	 * so reject all pixel format changing requests.
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
