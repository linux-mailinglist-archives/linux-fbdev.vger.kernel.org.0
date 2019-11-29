Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B82B10D7D5
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 16:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfK2PY3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 10:24:29 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41184 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfK2PY3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 10:24:29 -0500
Received: by mail-wr1-f65.google.com with SMTP id b18so35661681wrj.8
        for <linux-fbdev@vger.kernel.org>; Fri, 29 Nov 2019 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HZxTVlwR9S+LHDcDnd3r+LpNXkrw15HFfQVXjG7J9/E=;
        b=Yh5TTeBbDxmHyDVsUFzNoO+GyiDsMJHi236XMedRdwvw9iBXjsDT1ume7QEsbMHoRW
         z72BCDapANcOkUwKIO+h2t4pzNCXs7KOBk7shGlo+m1jdUMSPP+p7D/jCXACtUVa57zE
         QgN5gru4OfPkhEOUWa/052MVuk9GozTbmq770=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HZxTVlwR9S+LHDcDnd3r+LpNXkrw15HFfQVXjG7J9/E=;
        b=k7nQayPT1eOMbF6+m/oWt/FL/u+2Hu8CL+ps1KzwXENjsz7VfyitVyuOg94W5QyC93
         lXi3xIBPnVz+P65kGZQhWTLOIey5OwEWVFkQ/wjqR0Ha/p2vKhWucAN0k1bz6Sesk6UQ
         AlanmVGiNBh8u+mGhcExajRGDztJSf1OyYl70cAT/RnKz/owaL8QDaTjl5JAjxFwQJ4T
         jIrPVKY+3JgLL9SJcCU+YE4kEiVq0xegod6f4vw61TYWv5r/xaQRNrc2Jv/lNdE05yqr
         wALrGi3nx39efLqArppSJNtq/N28eMJE3CHG5P7aLcT9xy9ZJWPRo7JYUvXYhAk9l00I
         Sf4Q==
X-Gm-Message-State: APjAAAWWrb10d8jeppguoIx4l+vBW5UjpigXLA7UIUMQgU5OAmC3OFUu
        znxZQ66GObvO39/6y5LyWQXsPQ==
X-Google-Smtp-Source: APXvYqwGU0CdNMNQU6hbCMvLZUJQQoMbyV6IyjQC0/iMA89Z39aGV++Py6TWgBu+WbtfhNBIMHmCqw==
X-Received: by 2002:a5d:66cf:: with SMTP id k15mr54298695wrw.38.1575041067222;
        Fri, 29 Nov 2019 07:24:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id t1sm5538037wma.43.2019.11.29.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 07:24:25 -0800 (PST)
Date:   Fri, 29 Nov 2019 16:24:24 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        intel-gfx@lists.freedesktop.org,
        Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
Message-ID: <20191129152424.GG624164@phenom.ffwll.local>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Nov 29, 2019 at 12:29:44PM +0200, Jani Nikula wrote:
> Now that the fbops member of struct fb_info is const, we can start
> making the ops const as well.
> 
> Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
> Cc: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/auxdisplay/cfag12864bfb.c | 2 +-
>  drivers/auxdisplay/ht16k33.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
> index 4074886b7bc8..2002291ab338 100644
> --- a/drivers/auxdisplay/cfag12864bfb.c
> +++ b/drivers/auxdisplay/cfag12864bfb.c

Oh, another display subsystem? Intriguing ...

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> @@ -57,7 +57,7 @@ static int cfag12864bfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  	return vm_map_pages_zero(vma, &pages, 1);
>  }
>  
> -static struct fb_ops cfag12864bfb_ops = {
> +static const struct fb_ops cfag12864bfb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_read = fb_sys_read,
>  	.fb_write = fb_sys_write,
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index a2fcde582e2a..d951d54b26f5 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -228,7 +228,7 @@ static int ht16k33_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  	return vm_map_pages_zero(vma, &pages, 1);
>  }
>  
> -static struct fb_ops ht16k33_fb_ops = {
> +static const struct fb_ops ht16k33_fb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_read = fb_sys_read,
>  	.fb_write = fb_sys_write,
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
