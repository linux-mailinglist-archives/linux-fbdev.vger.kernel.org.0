Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7791102C4
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 17:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfLCQqU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 11:46:20 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32968 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfLCQqU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Dec 2019 11:46:20 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so4600313wrq.0
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Dec 2019 08:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lePQmCseTp9bskEyz6bBWCyl7NDpDZPssZ2LR7hDmAI=;
        b=cvsJ1Yuu6+T8r48v8IhnUOlpQAhSpRTXUKXQdRghuT3Q2U8AGI3SGfNAQUD4M6fD/R
         9GNS+6GUen1jXnJZhAiq8MV7dVCI6ldoYZcyM+OeRNXtX+7mfslT/2uy0u9NMMg6SUws
         vNiPE/NqyGtnkPVdA53kY4uUIXYRL6ljLPi30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lePQmCseTp9bskEyz6bBWCyl7NDpDZPssZ2LR7hDmAI=;
        b=NppWWEr5dbVXZrzBJYglP+UJ2XAfYDDNJtRmSgwS2nDQSZ0FlN9M9+rePafyXOYYBq
         XniDRgEY5yXjcE1F82q8F0JD1pglajA7lRWQfahVKoyK5UhrqFLHBY3txtRRhz/DNlt/
         ZIqx6bZLzFNfTlXxx7OPhuii2bGhBXdmO8qU43MsyyxwhxlGO167USzV1OlvhZxHjUVQ
         tKou1TPK3E8IJIkCfHZGYB0gEyJyU9YoR0pe8tIraZIGRNWICTTn1FGPf3nOzGTlunSb
         PgWpbvtXVTnj7qBKaOAAx95zP4mPGPwfm4jEYEJ2Gtb6Qhiz/26mKrQeeoPFBPgKTUic
         8mPg==
X-Gm-Message-State: APjAAAWbgQDSi/8t6xGHVWOziYeAzJJEzH7aRRsesIP0RhebwTnJrfOY
        J0veKW+piTyjKzlV27tgR+D0iQ==
X-Google-Smtp-Source: APXvYqzC4TlMWzjbN06wfhC5H/2lK+Du8aPg9B1xmlJwUVUjyl/FVBfSmX6QsF5Lotf7xMLhwio6ew==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr6541487wrx.288.1575391578346;
        Tue, 03 Dec 2019 08:46:18 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id t1sm3915088wma.43.2019.12.03.08.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:46:17 -0800 (PST)
Date:   Tue, 3 Dec 2019 17:46:15 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 01/12] video: fbdev: atyfb: modify the static fb_ops
 directly
Message-ID: <20191203164615.GE624164@phenom.ffwll.local>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <7dfbf1d47203157f5eb9a6f447f0095765d0b5e6.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dfbf1d47203157f5eb9a6f447f0095765d0b5e6.1575390740.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Dec 03, 2019 at 06:38:43PM +0200, Jani Nikula wrote:
> Avoid modifying the fb_ops via info->fbops to let us make the pointer
> const in the future.
> 
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/aty/atyfb.h         | 2 +-
>  drivers/video/fbdev/aty/atyfb_base.c    | 6 +++---
>  drivers/video/fbdev/aty/mach64_cursor.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
> index e5a347c58180..a7833bc98225 100644
> --- a/drivers/video/fbdev/aty/atyfb.h
> +++ b/drivers/video/fbdev/aty/atyfb.h
> @@ -341,7 +341,7 @@ extern const u8 aty_postdividers[8];
>       *  Hardware cursor support
>       */
>  
> -extern int aty_init_cursor(struct fb_info *info);
> +extern int aty_init_cursor(struct fb_info *info, struct fb_ops *atyfb_ops);
>  
>      /*
>       *  Hardware acceleration
> diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
> index 6dda5d885a03..bebc08505d94 100644
> --- a/drivers/video/fbdev/aty/atyfb_base.c
> +++ b/drivers/video/fbdev/aty/atyfb_base.c
> @@ -1316,10 +1316,10 @@ static int atyfb_set_par(struct fb_info *info)
>  	par->accel_flags = var->accel_flags; /* hack */
>  
>  	if (var->accel_flags) {
> -		info->fbops->fb_sync = atyfb_sync;
> +		atyfb_ops.fb_sync = atyfb_sync;
>  		info->flags &= ~FBINFO_HWACCEL_DISABLED;
>  	} else {
> -		info->fbops->fb_sync = NULL;
> +		atyfb_ops.fb_sync = NULL;
>  		info->flags |= FBINFO_HWACCEL_DISABLED;
>  	}
>  
> @@ -2702,7 +2702,7 @@ static int aty_init(struct fb_info *info)
>  
>  #ifdef CONFIG_FB_ATY_CT
>  	if (!noaccel && M64_HAS(INTEGRATED))
> -		aty_init_cursor(info);
> +		aty_init_cursor(info, &atyfb_ops);

Uh ... can I bikeshed this to duplicating an atyfb_cursor_ops and then
just reassigning the info->fbops pointer?

This here seems a bit too wild.
-Daniel

>  #endif /* CONFIG_FB_ATY_CT */
>  	info->var = var;
>  
> diff --git a/drivers/video/fbdev/aty/mach64_cursor.c b/drivers/video/fbdev/aty/mach64_cursor.c
> index 4cde25eab8e8..b06fa6e42e6e 100644
> --- a/drivers/video/fbdev/aty/mach64_cursor.c
> +++ b/drivers/video/fbdev/aty/mach64_cursor.c
> @@ -194,7 +194,7 @@ static int atyfb_cursor(struct fb_info *info, struct fb_cursor *cursor)
>  	return 0;
>  }
>  
> -int aty_init_cursor(struct fb_info *info)
> +int aty_init_cursor(struct fb_info *info, struct fb_ops *atyfb_ops)
>  {
>  	unsigned long addr;
>  
> @@ -219,7 +219,7 @@ int aty_init_cursor(struct fb_info *info)
>  	info->sprite.buf_align = 16; 	/* and 64 lines tall. */
>  	info->sprite.flags = FB_PIXMAP_IO;
>  
> -	info->fbops->fb_cursor = atyfb_cursor;
> +	atyfb_ops->fb_cursor = atyfb_cursor;
>  
>  	return 0;
>  }
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
