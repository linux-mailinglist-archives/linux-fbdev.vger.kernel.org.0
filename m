Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0DD610D7D8
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 16:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfK2PZR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 10:25:17 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37247 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfK2PZR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 10:25:17 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so4702412wru.4
        for <linux-fbdev@vger.kernel.org>; Fri, 29 Nov 2019 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NfIQXcdozugtzYoTDKIImmzqG3maCz2CoIDCOXQtwKA=;
        b=IlpxAo9JyKZWDoJPcVLrHd2C9iiTZDh5a4GlEJBbUQrK4PP72JPiMyJAh5HMNUzdMK
         d4pdl2A1A/KeCDHoZAnHX5vmrN2EdaBW18VK5bY8oza9W4rpMNuJ/ddYr+B2QIKFyQSa
         Ik5kN4eZExRnrmzQrPEEOSGv0kyaslOTRXcTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NfIQXcdozugtzYoTDKIImmzqG3maCz2CoIDCOXQtwKA=;
        b=oxyT03jLj2M2DkGNYusex0+/yiDmJ0lQ0AqFfPIyHNiWf/6LoTbIUeD6zZ1oCr+Qj4
         jIgoL/rD1yyobsxI2vNvY/b9wmjMKVG1WS1RebqnPoaqbr9m2BAnv11WHU9cKx2sVuLg
         l65ZlT0QfHaOFLX1GNXETmnuEU4tsktsIBo41t7QA9mS0DLe482HnyFYpaLaCRLxwhPQ
         Pva/h5YxpeU009rsZup688a1RHaEKB3iY2ZeOujSo/rFxo+9Kw85G+0AmhhLkEFdFvME
         vOPYme8OOrP5s8rTNz36vnrXHZ+mMCUT7/5RSu3+aHt5B3u0Amv5LWpDWUbdOt9RWblJ
         IzpA==
X-Gm-Message-State: APjAAAUvFxegKBS2ibBAPo2BSJyf2eN548AsORiSxUCGXl4WUAQAxNd6
        +ZbE58Nhnge9erT5F+Ws8igghg==
X-Google-Smtp-Source: APXvYqwYcjfLBlDoCGuyjFgcZcIRf/VPa77jmwGiv41FA9qxjZUz6ppL6hNxbql5t4jkHlgBJxekFw==
X-Received: by 2002:adf:82e7:: with SMTP id 94mr14670764wrc.60.1575041114921;
        Fri, 29 Nov 2019 07:25:14 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id w19sm13615825wmk.36.2019.11.29.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 07:25:13 -0800 (PST)
Date:   Fri, 29 Nov 2019 16:25:11 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 06/14] video: fbmem: use const pointer for
 fb_ops
Message-ID: <20191129152511.GH624164@phenom.ffwll.local>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <3a27f95b424a67b3542b5906c660741daf1d4ea6.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a27f95b424a67b3542b5906c660741daf1d4ea6.1575022735.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Nov 29, 2019 at 12:29:36PM +0200, Jani Nikula wrote:
> Use const for fb_ops to let us make the info->fbops pointer const in the
> future.
> 
> v2: rebase
> 
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I guess my r-b got lost on this, not sure, anyway.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/fbmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 990550930a8e..7ddeb90337bc 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1079,7 +1079,7 @@ EXPORT_SYMBOL(fb_blank);
>  static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  			unsigned long arg)
>  {
> -	struct fb_ops *fb;
> +	const struct fb_ops *fb;
>  	struct fb_var_screeninfo var;
>  	struct fb_fix_screeninfo fix;
>  	struct fb_cmap cmap_from;
> @@ -1292,7 +1292,7 @@ static long fb_compat_ioctl(struct file *file, unsigned int cmd,
>  			    unsigned long arg)
>  {
>  	struct fb_info *info = file_fb_info(file);
> -	struct fb_ops *fb;
> +	const struct fb_ops *fb;
>  	long ret = -ENOIOCTLCMD;
>  
>  	if (!info)
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
