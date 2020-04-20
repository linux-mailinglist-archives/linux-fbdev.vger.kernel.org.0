Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9F21B1085
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Apr 2020 17:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgDTPpm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Apr 2020 11:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgDTPpl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Apr 2020 11:45:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62647C061A0C
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:45:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so12758826wrs.9
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PTNNEmCRenBa+/gabP9o5qvz1IO1aOxWgqhpmwXuNCw=;
        b=gXlROUMWwWERLyx3EEn5gqLTpGpbSZc6Mar0UI1HdJDdfjvqXJsnX8MIgqgE3At71l
         GzMOcgmYLa+qAfrAXpDalgTdjldYU8Wk93dCZ/OqoBfnjw4eZnohyy+FN3iQ6fxNWqtz
         Mo6U425nAZIQzOPajyhKkxYPiRa0N9qI4P9ybINCik9zbvqc1H0/nU4tOes0LxIwsPxr
         7q2b1HORpXXzfGjngOUJriYl3ldqx0n9ojqmaFq8UbRSXIoIEBaTdKciqc39xNj60a7E
         yPJJI1lELti15biybkg8T8kqZ1a+OIWH7F7c5pUqFN0XD2jpbEdRJxUUlZNGYVcKrJzN
         /Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PTNNEmCRenBa+/gabP9o5qvz1IO1aOxWgqhpmwXuNCw=;
        b=tTPKOwZGZkLBWG5ywnNFqDBx63x+D0DmnP/wQm9xxgEGAS2qca4DXJfhWmoDBqbFTF
         9/sZ73X7md9QgFnqS7uAT9f/TqpYBQNnPgx1MzwvCV+YC25xioJ7PGz4H4bdtuk1YCFF
         WgeSif4UPN/3oGkQsWaK4djXzXmUDKZjpqpCCChqzwoK6Aav1g6vNto3CRpBoatZsYGD
         0di2c67HxMdzVt4glsyT12v152b0vIgMj4An1l+vGw3E6pmbsz6RqZ3CWZupryQcf8O5
         rJgQOTYB5pb9q2REoTsQQdJfry3EatjuBRPLUoyx3t8yTeVMsG9mCvqMG47HUJxSbGjP
         UiNA==
X-Gm-Message-State: AGi0PuYWzAmVab2eo0BqAt8dsINtQ7OQW6rnTix/zfUTw09HP4kFCVPA
        esmuf7zNBeXRSg8dzLFq05CqNw==
X-Google-Smtp-Source: APiQypIMRuiaM3+lPbOnBrNsY2RZOsgIiOlSVW9cnmG6bbn7R/teekRaSuhN0JWQCSxdAHNUgU7ikA==
X-Received: by 2002:adf:bb94:: with SMTP id q20mr20970772wrg.105.1587397540007;
        Mon, 20 Apr 2020 08:45:40 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z22sm2206wma.20.2020.04.20.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:45:39 -0700 (PDT)
Date:   Mon, 20 Apr 2020 16:45:37 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/5] backlight: led_bl: add led_access locking
Message-ID: <20200420154537.ul37aq733guergda@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-3-tomi.valkeinen@ti.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Apr 17, 2020 at 02:33:10PM +0300, Tomi Valkeinen wrote:
> led_bl does not lock 'led_access' when calling led_sysfs_disable and
> led_sysfs_enable, causing the below WARN. Add the locking.
> 
> WARNING: CPU: 0 PID: 223 at drivers/leds/led-core.c:353 led_sysfs_disable+0x4c/0x5c
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

I did wonder if it might be better to provide self-locking API from the
LED sub-sys but it looks like elsewhere led_sysfs_disable() is
frequently paired with led_trigger_set() (and both under the same
lock)...

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/led_bl.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index c46ecdfe8b0a..63693c4f0883 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -216,8 +216,11 @@ static int led_bl_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->bl_dev);
>  	}
>  
> -	for (i = 0; i < priv->nb_leds; i++)
> +	for (i = 0; i < priv->nb_leds; i++) {
> +		mutex_lock(&priv->leds[i]->led_access);
>  		led_sysfs_disable(priv->leds[i]);
> +		mutex_unlock(&priv->leds[i]->led_access);
> +	}
>  
>  	backlight_update_status(priv->bl_dev);
>  
> @@ -233,8 +236,11 @@ static int led_bl_remove(struct platform_device *pdev)
>  	backlight_device_unregister(bl);
>  
>  	led_bl_power_off(priv);
> -	for (i = 0; i < priv->nb_leds; i++)
> +	for (i = 0; i < priv->nb_leds; i++) {
> +		mutex_lock(&priv->leds[i]->led_access);
>  		led_sysfs_enable(priv->leds[i]);
> +		mutex_unlock(&priv->leds[i]->led_access);
> +	}
>  
>  	return 0;
>  }
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
