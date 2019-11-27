Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A21CC10B58C
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 19:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfK0SWR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 13:22:17 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33239 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbfK0SWR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 13:22:17 -0500
Received: by mail-wm1-f67.google.com with SMTP id y23so956214wma.0
        for <linux-fbdev@vger.kernel.org>; Wed, 27 Nov 2019 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t2/xCCoyQtmnHZvdo53/fp0uALFrbef3Xoi/I02wqMA=;
        b=M2FE4b6aum5dszCRzLjRm3HvBZAW0NkC4cVm23SswbLGywvtKwVCULrQxsZSDYS8yE
         0SSPMXXVHfnvLA/oT49Qa3neQmWDzpNUwU0E6plEL/5cBITed5Ccs6zRw//E4bFCOSEJ
         8BbsBXASPiZDDeHi3bIKhHGzJlaTMusq5uDnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t2/xCCoyQtmnHZvdo53/fp0uALFrbef3Xoi/I02wqMA=;
        b=tm7+CmZp3fKJqoQMGS99Gc7EkkoUZKoprqj3E9XzCBQtq0UYgl9eUQDOMpYudt81d9
         OSfouwpKecasAf36Hu6lmqqYWYZUsiZb2Vf6zLYUFdrMziY8r3uuJd4KGMUsCruOvjX1
         q/fUfru2qaXWscGYymKt2Kl0lxU9i7dLWSwlj4H1oSCHQamIgqKNrV+0YquIE7v2K3yE
         FWnfLyB1jbKGKpeiZ0gRfKtShoXFInsz613qDGpPqZFnoy53XdrY9KxM8QFh5OkyMEsr
         1lZagJF+53OnzqTuNddnejfFnIk/sTkbmLFAv0vqUIFp1IcRNNtLSKrgjufsLbZILgL7
         stCA==
X-Gm-Message-State: APjAAAW97FV5P27hmojEMK5ks82kd42Ta2zBQWy6aw3vmoZfYfYmXk8z
        rZyZqlyj6csS1cNlBwgQt5QcFw==
X-Google-Smtp-Source: APXvYqz6QN9409WR8t/G5F9+f2Hh6KT2FZYYp1yfg/s/+uyqMiwzAIyCKqz6/FyWAf5m96OL9S/3wA==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr5762761wma.38.1574878934100;
        Wed, 27 Nov 2019 10:22:14 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id u14sm20345977wrm.51.2019.11.27.10.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 10:22:12 -0800 (PST)
Date:   Wed, 27 Nov 2019 19:22:10 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Bernie Thompson <bernie@plugable.com>
Subject: Re: [PATCH 04/13] video: udlfb: don't restore fb_mmap after deferred
 IO cleanup
Message-ID: <20191127182210.GK406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <21cc1f07daffeddf4d59f2b444796c0216274c87.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21cc1f07daffeddf4d59f2b444796c0216274c87.1574871797.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 27, 2019 at 06:32:00PM +0200, Jani Nikula wrote:
> Deferred IO now preserves the fb_ops.
> 
> Cc: Bernie Thompson <bernie@plugable.com>
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Aside: I wonder whether we should start retiring all the fbdev drivers
which have kms drivers already ... you get fbdev for free with the latter.
-Daniel

> ---
>  drivers/video/fbdev/udlfb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> index fe373b63ddd6..07905d385949 100644
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -1037,7 +1037,6 @@ static int dlfb_ops_release(struct fb_info *info, int user)
>  		fb_deferred_io_cleanup(info);
>  		kfree(info->fbdefio);
>  		info->fbdefio = NULL;
> -		info->fbops->fb_mmap = dlfb_ops_mmap;
>  	}
>  
>  	dev_dbg(info->dev, "release, user=%d count=%d\n", user, dlfb->fb_count);
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
