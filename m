Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEB41B10DC
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Apr 2020 18:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDTQB6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Apr 2020 12:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDTQB6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Apr 2020 12:01:58 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3011C061A0C
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 09:01:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k11so12867027wrp.5
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IMezaVorfzWAZ5yeIdxf4Ausp6aB2BLNNEifQh5SkWY=;
        b=bfonvl29r9uts8Xx8gfv7LMJyNxovCHoJSFIxE8RWvJJ6+blEswwjU5N1hA17W6C5H
         gKMHFTbrP00nq9Mn7bzgtME7pphzpGBaaCjZjrZPVkom+UVDIKQXqUajP+QW6A4HdddY
         rNHjqexUnIz8eQw6YAAndd9loKWUOPXNMYlEYraF7CyBIubMnTek+J9CqVh8E9vBzICd
         XqAkZMEm0i9zTOFtwe1/Zk7aod/5pelm7e/ZG0z3ir/YjkEscI5iHrt4x+txDo+fejUZ
         jqqw3CDC3kRtJYd38TjTfQcVJVJWKA1LAjPjcXr6drNg7zmTcHRKbYAA5pa4hCC5k6o/
         VRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IMezaVorfzWAZ5yeIdxf4Ausp6aB2BLNNEifQh5SkWY=;
        b=fmYMajmdRWU2dKms2GpXSum7JEnvE1R1SPBb/MQs4dBlqI/pc9qhG08eLHrK/jatw3
         5my+PbDTpmmx9BtpYSIwlmHYFqSukp8ThnoGRd7B3nomzbBFYfOT9HvL5Dp/ysdarB88
         pPWhvxZ/jHJQUS5zgO6PkW96ng66qOKbuX01MrX9JZzzga3zHq0ie3is7Iq4yX0/08v+
         wuV5u9CgKOMKrqbMl0LO/96jHj/nr6TaOvOhiuIzXXfQF1WK76FJU1LuzkMfPx0gNfG/
         c7zDC7RLWssg84uyOyF7ay8/WwZVITDoSWurhnRk536WDfP4SALytC2AVR0GS9i9j0FW
         YL2Q==
X-Gm-Message-State: AGi0PuZmQVbY1JbLwEczqV1LlghQuULBgp0IpnFzaffL0hnin0mQn0we
        4VZFFRtwrg69C/C+6sHILJxmoQ==
X-Google-Smtp-Source: APiQypL807DBomjCdoSGoqFBRQixL7aAWGyJgpt3/rhDhHVtNEJ2X8Z4Jo1x5Xfj9OZhfdd1B/MXzA==
X-Received: by 2002:adf:a15d:: with SMTP id r29mr18316346wrr.134.1587398516436;
        Mon, 20 Apr 2020 09:01:56 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id h5sm1815470wrp.97.2020.04.20.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 09:01:55 -0700 (PDT)
Date:   Mon, 20 Apr 2020 17:01:54 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
Message-ID: <20200420160154.4xxv37fofx37ow7q@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-5-tomi.valkeinen@ti.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Apr 17, 2020 at 02:33:12PM +0300, Tomi Valkeinen wrote:
> led_bl_parse_levels() is rather difficult to follow. Rewrite it with a
> more obvious code flow.

... that introduces new behaviour.

There's a couple of new behaviours here but the one that particular
attracted my attention is the disregarding the "default-brightness-level" if
there is no table. That looks like a bug to me.

Please can you add any intended changes of behaviour in the patch
header?


Daniel.




> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/video/backlight/led_bl.c | 63 ++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 021b5edd895c..7b3889035540 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -132,50 +132,51 @@ static int led_bl_parse_levels(struct device *dev,
>  	int num_levels;
>  	u32 value;
>  	int ret;
> +	int i;
> +	u32 *levels;
>  
>  	if (!node)
>  		return -ENODEV;
>  
>  	num_levels = of_property_count_u32_elems(node, "brightness-levels");
> -	if (num_levels > 1) {
> -		int i;
> -		unsigned int db;
> -		u32 *levels;
> -
> -		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
> -				      GFP_KERNEL);
> -		if (!levels)
> -			return -ENOMEM;
> -
> -		ret = of_property_read_u32_array(node, "brightness-levels",
> -						 levels,
> -						 num_levels);
> -		if (ret < 0)
> -			return ret;
> -
> -		/*
> -		 * Try to map actual LED brightness to backlight brightness
> -		 * level
> -		 */
> -		db = priv->default_brightness;
> +
> +	if (num_levels < 0)
> +		return 0;
> +
> +	if (num_levels == 0) {
> +		dev_warn(dev, "No brightness-levels defined\n");
> +		return -EINVAL;
> +	}
> +
> +	levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
> +			      GFP_KERNEL);
> +	if (!levels)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32_array(node, "brightness-levels",
> +					 levels,
> +					 num_levels);
> +	if (ret < 0)
> +		return ret;
> +
> +	priv->max_brightness = num_levels - 1;
> +	priv->levels = levels;
> +
> +	ret = of_property_read_u32(node, "default-brightness-level", &value);
> +	if (!ret) {
> +		priv->default_brightness = min(value, priv->max_brightness);
> +	} else {
> +		/* Map LED default-brightness to backlight brightness level */
> +		unsigned int db = priv->default_brightness;
> +
>  		for (i = 0 ; i < num_levels; i++) {
>  			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
>  				break;
>  		}
>  
>  		priv->default_brightness = i < num_levels ? i : 0;
> -		priv->max_brightness = num_levels - 1;
> -		priv->levels = levels;
> -	} else if (num_levels >= 0) {
> -		dev_warn(dev, "Not enough levels defined\n");
>  	}
>  
> -	ret = of_property_read_u32(node, "default-brightness-level", &value);
> -	if (!ret && value <= priv->max_brightness)
> -		priv->default_brightness = value;
> -	else if (!ret  && value > priv->max_brightness)
> -		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
> -
>  	return 0;
>  }
>  
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
