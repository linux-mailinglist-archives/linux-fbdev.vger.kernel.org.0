Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB2A1B1012
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Apr 2020 17:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgDTP3c (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Apr 2020 11:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgDTP3c (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Apr 2020 11:29:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823F6C061A0C
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:29:30 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id i10so12682702wrv.10
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cyrvl1UNNyvmvSRFc2plqbq/36zN9I9LxXSI94EYg3w=;
        b=vSw+K1bnniROZHpFFGnkTQEfq3SYB803deC+12rxngU2ZWftRrrB6u8Ij7aZRS4O0W
         DSVn5bXx0UdNZBTJ8l0QXEAH2zNzkU0rALVPiAGMrvLorDSpWxjwSRlyzIJHFD3fzCFE
         Xe+TJ+WGBNrtXMXDpHOY6eN6GUzhEQSwlON7gBEVPCZMGQSFs5xweiRJYSCfNWzubCaI
         MgI3WIN65fgsv77ovvBW/Wrw6w/ChuaWaUl027CjfpoMXzkJJ2lnbB/eVyGEFFddj/iO
         bbrSM9PMZLALCH838O0wU05TyTZXEY25SoOSr74YJHoIwUs0WQ7SCGWVvxtadrzjnkrx
         Bm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cyrvl1UNNyvmvSRFc2plqbq/36zN9I9LxXSI94EYg3w=;
        b=k/T4k8vqcF16LHUkb7Zta0ExOIg0rrm8Bh9nO1CYrw5OYpq5N7KajfuUtVDAC9fXEc
         xufJ+XWohvUjup4qb4ap2hrVAaKxb0dy8CIRBz1tnlImmIlg+6eo6jHsEvNA0onaIBio
         8ZpEr9KrxjJih3Swr9ocjg4Y39U4de65RKqqol0AVtI+9tki8lYtuyVYhgO7Jov28ykL
         EWfvXmDcvHMpbftWmK1+DHfcaY6ZOiLoCuWeUxJc014R5nLWu5K/dNqzsOBDIx35RcCS
         R+dtWuLpJcyH98KX8MYmKClfvAGiyNyF+pyudlNHIQw/nLXt+i2ClLyK+jJxuoy2h/HO
         EjYg==
X-Gm-Message-State: AGi0PuamvC1BaWvMYrv3RbEDoTJksxWUdXFjn8e1K73F308mal1xPkuU
        fZ2STHrVSL2Jx1RsoLxFyQORoU7ZRMvvrA==
X-Google-Smtp-Source: APiQypK6tefjWZfbtcgSUZva+qQn3xkbLOuOEOPu/WipnTA9dY1PhUmeRTUeIXiOfxidpp8fWcprxA==
X-Received: by 2002:adf:f986:: with SMTP id f6mr19130458wrr.221.1587396569273;
        Mon, 20 Apr 2020 08:29:29 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id n2sm1877539wrq.74.2020.04.20.08.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:29:28 -0700 (PDT)
Date:   Mon, 20 Apr 2020 16:29:26 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/5] backlight: led_bl: fix cosmetic issues
Message-ID: <20200420152926.iqtpvy6e3rbrm475@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-1-tomi.valkeinen@ti.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Apr 17, 2020 at 02:33:08PM +0300, Tomi Valkeinen wrote:
> Fix issues reported by checkpatch. No functional changes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/led_bl.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 3f66549997c8..d4e1ce684366 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -126,7 +126,7 @@ static int led_bl_get_leds(struct device *dev,
>  }
>  
>  static int led_bl_parse_levels(struct device *dev,
> -			   struct led_bl_data *priv)
> +			       struct led_bl_data *priv)
>  {
>  	struct device_node *node = dev->of_node;
>  	int num_levels;
> @@ -148,8 +148,8 @@ static int led_bl_parse_levels(struct device *dev,
>  			return -ENOMEM;
>  
>  		ret = of_property_read_u32_array(node, "brightness-levels",
> -						levels,
> -						num_levels);
> +						 levels,
> +						 num_levels);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -159,14 +159,15 @@ static int led_bl_parse_levels(struct device *dev,
>  		 */
>  		db = priv->default_brightness;
>  		for (i = 0 ; i < num_levels; i++) {
> -			if ((i && db > levels[i-1]) && db <= levels[i])
> +			if ((i && db > levels[i - 1]) && db <= levels[i])
>  				break;
>  		}
>  		priv->default_brightness = i;
>  		priv->max_brightness = num_levels - 1;
>  		priv->levels = levels;
> -	} else if (num_levels >= 0)
> +	} else if (num_levels >= 0) {
>  		dev_warn(dev, "Not enough levels defined\n");
> +	}
>  
>  	ret = of_property_read_u32(node, "default-brightness-level", &value);
>  	if (!ret && value <= priv->max_brightness)
> @@ -208,7 +209,8 @@ static int led_bl_probe(struct platform_device *pdev)
>  	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
>  		      FB_BLANK_UNBLANK;
>  	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
> -			&pdev->dev, priv, &led_bl_ops, &props);
> +						 &pdev->dev, priv, &led_bl_ops,
> +						 &props);
>  	if (IS_ERR(priv->bl_dev)) {
>  		dev_err(&pdev->dev, "Failed to register backlight\n");
>  		return PTR_ERR(priv->bl_dev);
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
