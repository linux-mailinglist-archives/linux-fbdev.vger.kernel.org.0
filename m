Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54B218B375
	for <lists+linux-fbdev@lfdr.de>; Tue, 13 Aug 2019 11:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfHMJM4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 13 Aug 2019 05:12:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46884 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfHMJMz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 13 Aug 2019 05:12:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so107049276wru.13
        for <linux-fbdev@vger.kernel.org>; Tue, 13 Aug 2019 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FZkkanscr2yXD89j1fbn9ohAAYxCp1RzxWGi4o6zEW8=;
        b=cE5sGxsaIMTOCowXH1sGPI+8JCImG4j3rBpkOYIFu7Y+DCo9IixpnMvmKpL1J6IF+x
         mcGtI+GudckR6pAanyRlcrZCV/ZV5FJzrIsdgRs+44AUPY4tmnDTVRTHHcAZp380fz0d
         bMJmkNdKG5tisrxJnOTLQ2i0vfHYMvZgSbd0tKAM6+Fta4gS0XOPgSUTIa6/8fl39K/D
         zU/HBy4gyfgdty/tztUpP4CW9OaAvipPxy+yOt1QdzuaYL5ckDTliL1GjDxmo4Oyl0Ze
         4WCcvLfZ9YfTf+R2mYTJrLj28QfS6slRFc8o8AqBf9WvDrMtw63sXd5VMgE4eFpBcCmW
         4M0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FZkkanscr2yXD89j1fbn9ohAAYxCp1RzxWGi4o6zEW8=;
        b=JCZ0T7y9bZIQNm4Em+1rTZhb9GhGzNDvHnO/C+uahaWqF30vbDh8AbRkS5V5kJE3/b
         xyTPmgn2EipGP9DTe4fjsjdAsJZ6leGBGNQ14/oll/9ne3oO9wRnjyrzNOu1rdUNqDTC
         xYS4a1vqx3A5yPvWKOxOeL/nmLDBheBihfa51GTDfcYdCkwImqfpsfT37kZR7l8WLrcX
         qKS+cFgdxWXUBbs5ZwUjrDy3Ywh/XfS9sOYFKbkLMJ9crvNEyc0dmAoOXOLbZ6uaOTaC
         8F07AYKoNsM85h2erYfRUO5cpO1gPMIMp3eK0ffLobu9nRpESzaKNyAhOgU0CG54upN9
         vg3A==
X-Gm-Message-State: APjAAAWjKF9waHn2vzLVfwZBZK+nQ7ApyUjsa4KGZrbCPIp4NuzZ3Riu
        WN3B35E1jPLKGYpgiCOgOnZsQA==
X-Google-Smtp-Source: APXvYqwbv5cG9FKibLWc2sKuDq7jDJn87gc4AZJbbRd1Ijcjad32ZCpwaC08SokZHVAHzK87pDWnrw==
X-Received: by 2002:a5d:678a:: with SMTP id v10mr13170524wru.116.1565687573545;
        Tue, 13 Aug 2019 02:12:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id t198sm1283913wmt.39.2019.08.13.02.12.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 02:12:52 -0700 (PDT)
Date:   Tue, 13 Aug 2019 10:12:51 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props
 constant
Message-ID: <20190813091251.2nyxtivsvp47aahp@holly.lan>
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813085855.8302-1-nishkadg.linux@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Aug 13, 2019 at 02:28:55PM +0530, Nishka Dasgupta wrote:
> Static structure micro_bl_props, having type backlight_properties, is
> used only once, when it is passed as the last argument to function
> devm_backlight_device_register(). devm_backlight_device_register() is
> defined with its last parameter being declared constant. Hence make
> micro_bl_props itself constant as well.
> Issue found with Coccinelle.

Did you do any review to see if this pattern occurs in other backlight
drivers (it looks to me like the same pattern appears in
rave-sp-backlight.c... do the tools bring that one out as well).


Daniel.


> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/video/backlight/ipaq_micro_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
> index 1123f67c12b3..85b16cc82878 100644
> --- a/drivers/video/backlight/ipaq_micro_bl.c
> +++ b/drivers/video/backlight/ipaq_micro_bl.c
> @@ -44,7 +44,7 @@ static const struct backlight_ops micro_bl_ops = {
>  	.update_status  = micro_bl_update_status,
>  };
>  
> -static struct backlight_properties micro_bl_props = {
> +static const struct backlight_properties micro_bl_props = {
>  	.type = BACKLIGHT_RAW,
>  	.max_brightness = 255,
>  	.power = FB_BLANK_UNBLANK,
> -- 
> 2.19.1
> 
