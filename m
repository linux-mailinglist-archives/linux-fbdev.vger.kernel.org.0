Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A778C5CC4B
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2019 11:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfGBJCH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 2 Jul 2019 05:02:07 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44470 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfGBJCH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 2 Jul 2019 05:02:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id e3so7289989wrs.11
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jul 2019 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UYqevnI0spcyedfiOLJ3vdJN7KeUhPxc6owycWTRKgQ=;
        b=kNZfMLh00xnDEGdyC0iMBLY3n5hKUNwtHEhscIYyRu5QdBU8iXikuYKclzZ4F+RGCK
         S6LNIhsKN0ymzqyVPrK9D4krSgW29DhsBIMN8qLF13phqddvbHbk3QsIowLUof5CiE3W
         Adhoe3+1xqurjhsFfPGGjmFerkhGU8fxZHZZ83yVnrtCXpMli/vgDurTNBYZYzIrK189
         ll8jNF8I6Ry98ZCfRnt3Luin+fFFYxhHCS3vDGnefmmSsVhe7w42q0IRzxQ3DrWrWBSy
         6Wv5vwS9v8z/uz7RDdfqT/GI1sdH96WAO0YFRg960KbLyx3V81mfc5Y2fr5RzWHcdzym
         nZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UYqevnI0spcyedfiOLJ3vdJN7KeUhPxc6owycWTRKgQ=;
        b=ps30yVEY3oVS/MaFEw/jXT6lObtvdTe38G6jv+DgBThEnMsuVLW9M1IJAx2Tf7mgHn
         S89ibjsxAYqCIRBsBez1VETRts+qXtE2pN6VpCNS2E6vqzLBr4xEY70CM0C1sZLwORn9
         Hyi+YYuCrQYLFiGFVIuCKkvU2iNgg9/N3p85LsWFx3+ZfAJwrOfsqe7/bGpNy87eqPb1
         qpUKKCirY3l5yUE+hQM27vnAGrWk7nVrAGJJUvvn9ilDn12yClUBtcp1dJG+Eyz+s9gV
         gYt/5tkAxuBk2klB/WCxxRcuqKWNIaWhkLt11T7QoG22gvbYxatDFc4DdINs4vp6tZDK
         XrKw==
X-Gm-Message-State: APjAAAVpPwHZy1ZP+F+TWjU0KrxnqjZHUq4GmkLZmiV9PZNB/cKlTg+5
        ERUokY9DXrq35sPqqAGZt0b17A==
X-Google-Smtp-Source: APXvYqwe8Sm/0nT25qcnzu4by7nlxEbs2dugrf6wEZ/ThBZTX0iMnPIhJfIGmRRbZlCWJVwSZilmew==
X-Received: by 2002:a5d:5450:: with SMTP id w16mr13519041wrv.128.1562058125256;
        Tue, 02 Jul 2019 02:02:05 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.googlemail.com with ESMTPSA id z5sm11056873wrh.16.2019.07.02.02.02.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 02:02:04 -0700 (PDT)
Subject: Re: [PATCH 01/12] backlight: gpio: allow to probe non-pdata devices
 from board files
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <20190625163434.13620-2-brgl@bgdev.pl>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <57229b83-c876-1042-2866-1a63e6654bd4@linaro.org>
Date:   Tue, 2 Jul 2019 10:02:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 25/06/2019 17:34, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently we can only probe devices that either use device tree or pass
> platform data to probe(). Rename gpio_backlight_probe_dt() to
> gpio_backlight_probe_prop() and use generic device properties instead
> of OF specific helpers.

This has already been done in (which IIRC did get queued for the next 
release):
https://www.spinics.net/lists/dri-devel/msg215050.html

> Reverse the logic checking the presence of
> platform data in probe(). This way we can probe devices() registered
> from machine code that neither have a DT node nor use platform data.

Andy's patch did not reverse this logic... but it does check 
pdev->dev.fwnode rather than of_node .


Daniel.


> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   drivers/video/backlight/gpio_backlight.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index b9300f3e1ee6..654c19d3a81d 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -54,15 +54,14 @@ static const struct backlight_ops gpio_backlight_ops = {
>   	.check_fb	= gpio_backlight_check_fb,
>   };
>   
> -static int gpio_backlight_probe_dt(struct platform_device *pdev,
> -				   struct gpio_backlight *gbl)
> +static int gpio_backlight_probe_prop(struct platform_device *pdev,
> +				     struct gpio_backlight *gbl)
>   {
>   	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
>   	enum gpiod_flags flags;
>   	int ret;
>   
> -	gbl->def_value = of_property_read_bool(np, "default-on");
> +	gbl->def_value = device_property_read_bool(dev, "default-on");
>   	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>   
>   	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
> @@ -86,26 +85,15 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   	struct backlight_properties props;
>   	struct backlight_device *bl;
>   	struct gpio_backlight *gbl;
> -	struct device_node *np = pdev->dev.of_node;
>   	int ret;
>   
> -	if (!pdata && !np) {
> -		dev_err(&pdev->dev,
> -			"failed to find platform data or device tree node.\n");
> -		return -ENODEV;
> -	}
> -
>   	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
>   	if (gbl == NULL)
>   		return -ENOMEM;
>   
>   	gbl->dev = &pdev->dev;
>   
> -	if (np) {
> -		ret = gpio_backlight_probe_dt(pdev, gbl);
> -		if (ret)
> -			return ret;
> -	} else {
> +	if (pdata) {
>   		/*
>   		 * Legacy platform data GPIO retrieveal. Do not expand
>   		 * the use of this code path, currently only used by one
> @@ -126,6 +114,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   		gbl->gpiod = gpio_to_desc(pdata->gpio);
>   		if (!gbl->gpiod)
>   			return -EINVAL;
> +	} else {
> +		ret = gpio_backlight_probe_prop(pdev, gbl);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	memset(&props, 0, sizeof(props));
> 

