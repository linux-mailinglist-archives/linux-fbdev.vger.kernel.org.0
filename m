Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA7ECE26D
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2019 14:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbfJGM4I (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 7 Oct 2019 08:56:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42600 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfJGM4H (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 7 Oct 2019 08:56:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so15129093wrw.9
        for <linux-fbdev@vger.kernel.org>; Mon, 07 Oct 2019 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lNH90AFjH7treDMnlBjyecd4jzPpSJ8AKVgoDKflMFE=;
        b=LXCip3xNAoYNYlV6dtRSB1uaKZJUo/K2WvzEmJRHr+u/U9uUi6O/di4oCQpBqx6of6
         J8XOGzJu5nCzvTxGoqsiLjRPzX9KO9l4JCcWeI93DIREUfvtMDYRTnbHLsgnFVRxVI91
         eNra9cn8FwGFq8SDd2yIo0KXFmOCwHroK8OA2B5D1/jzLI/DY49mWmhZxm/vLUxlHJAu
         IlX2X51TLp9dLtREuMFWPmRDOal9jgmHy97kXh6hnCm5M672qNcj/YFGyiD7kXlx7jBP
         8arMHMBD1atKgJ6GHC9o9ETGcZeqw3lUmF21zbtZEjD1U0ryJS/rR24tZMSTn1SLOEyI
         VALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lNH90AFjH7treDMnlBjyecd4jzPpSJ8AKVgoDKflMFE=;
        b=FlmHc6mK3vbaDPpmqc4QCvnk7AssPHmAkdwpwk5vinDno2JQXoWQQl7kBM8sGzgMPY
         4tf3ktexUc41OkPcOPOnFl8p6QhEvONGW0BkkRF6V6Y0uZ1gOo3TJJUksgCX7uYnAwTd
         oo1M71AjOlevTJzDGpjZbE8kYnOij1U78Ns4s0EvxDw3IJC+xb8kpgi1/mn6R+wKWgLZ
         uDilOstN/Lqz+q16MtknzcqFu/mu3kYElBNmXFJ0jCH7FuAdZnx1NkN/HhL4oPWKKfV6
         L1BkKZ/lrX+/8/abn+iMboMBwIEv/a2lddUGMJEtW/SvgexF7c0une547t0LsJMVMOtv
         KOHA==
X-Gm-Message-State: APjAAAWx2xzcp5Ap4WK65CRP+fH9bUsqWiE+ikxDgOwJ+rfrhJ4KfXRU
        t08jNMx21sbWlXBaddIqWzztOA==
X-Google-Smtp-Source: APXvYqw4wrBCEizxjGd3Oo7lWF2KXUVRw9xkZJnF90lw1VD0wL+cQobj6SS5sgKiiRn76myZtcAY3Q==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr22105358wro.67.1570452966040;
        Mon, 07 Oct 2019 05:56:06 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c9sm14922385wrt.7.2019.10.07.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 05:56:05 -0700 (PDT)
Date:   Mon, 7 Oct 2019 13:56:03 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Message-ID: <20191007125603.qmb6jfu2tjxnzmm6@holly.lan>
References: <20191007033200.13443-1-brgl@bgdev.pl>
 <20191007033200.13443-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007033200.13443-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Oct 07, 2019 at 05:32:00AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The probe function in the gpio-backlight driver is quite short. If we
> pull gpio_backlight_initial_power_state() into probe we can drop two
> more fields from struct gpio_backlight and shrink the driver code.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/gpio_backlight.c | 37 +++++++++---------------
>  1 file changed, 13 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 6247687b6330..407d4eaafc5c 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -17,11 +17,8 @@
>  #include <linux/slab.h>
>  
>  struct gpio_backlight {
> -	struct device *dev;
>  	struct device *fbdev;
> -
>  	struct gpio_desc *gpiod;
> -	int def_value;
>  };
>  
>  static int gpio_backlight_update_status(struct backlight_device *bl)
> @@ -53,41 +50,24 @@ static const struct backlight_ops gpio_backlight_ops = {
>  	.check_fb	= gpio_backlight_check_fb,
>  };
>  
> -static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
> -{
> -	struct device_node *node = gbl->dev->of_node;
> -
> -	/* Not booted with device tree or no phandle link to the node */
> -	if (!node || !node->phandle)
> -		return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> -
> -	/* if the enable GPIO is disabled, do not enable the backlight */
> -	if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> -		return FB_BLANK_POWERDOWN;
> -
> -	return FB_BLANK_UNBLANK;
> -}
> -
> -
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
> +	struct device_node *of_node = dev->of_node;
>  	struct backlight_properties props;
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
> -	int ret;
> +	int ret, def_value;
>  
>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
>  		return -ENOMEM;
>  
> -	gbl->dev = dev;
> -
>  	if (pdata)
>  		gbl->fbdev = pdata->fbdev;
>  
> -	gbl->def_value = device_property_read_bool(dev, "default-on");
> +	def_value = device_property_read_bool(dev, "default-on");
>  
>  	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
>  	if (IS_ERR(gbl->gpiod)) {
> @@ -109,7 +89,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return PTR_ERR(bl);
>  	}
>  
> -	bl->props.power = gpio_backlight_initial_power_state(gbl);
> +	/* Set the initial power state */
> +	if (!of_node || !of_node->phandle)
> +		/* Not booted with device tree or no phandle link to the node */
> +		bl->props.power = def_value ? FB_BLANK_UNBLANK
> +					    : FB_BLANK_POWERDOWN;
> +	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> +		bl->props.power = FB_BLANK_POWERDOWN;
> +	else
> +		bl->props.power = FB_BLANK_UNBLANK;
> +
>  	bl->props.brightness = 1;
>  
>  	backlight_update_status(bl);
> -- 
> 2.23.0
> 
