Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1EAD5CC6D
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2019 11:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfGBJLT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 2 Jul 2019 05:11:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51492 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfGBJLT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 2 Jul 2019 05:11:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so97808wma.1
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jul 2019 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YL/v7kwpoAOgfrWESvYJW+oEOt7FvpXlkjkTWAE20U0=;
        b=g8XO7GiaR9I/8MSq8vNOC8n9Zjdf9iwOmT25kQ4xcSoHEFAaUVXiioDJpXSFEGM/FX
         QiRHrnXy4C3eZbMS/HKHHHjfTNbwQKYvjDzOAeoK37i9GxcyCUnr7oP3jMf/093uPLP2
         gIexxaR99d8BsZFHxFMms0ILgNIgHYtwtUJD9vCPbgRPpY1aIQTsTiokf3xlDM3IT+Hf
         hr0Bq9xF4PbuQR81x6ZodSzm+rS6cI/6wQH1K7/J9qs9v06RUDnqh0t/3VINH2ZWbg50
         DVfRErAm0zplGE9wp8ZiAFxl11rqLvItVbBQWxNu3NOE0Qfq4H/BPMrUo0RpkwlRjL45
         XhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YL/v7kwpoAOgfrWESvYJW+oEOt7FvpXlkjkTWAE20U0=;
        b=fV2cLXgVJEvkOTvlWrQVqu8QAud5cT84xL/OHQtwvFQzti0D+9vXhHnwd3EvHX2qlq
         f0UBCa8A/tlHkMQxEnXycfcrmsdpX0azU0XYKpe3Cs9/2ojU8he5Axj5w+cFOLBo/WBt
         f5qUh0WaLjkwrap3dQqnd0GvIQAGpWfOnRYvyPGRrTzagwFDvlTdci7wyC74QVZ8ywYd
         nFDgxOx/o61IutKtIjfJ8iNsmoFjkqcYpOU17om6UZXVgPYUDBLKZJhQEslgqe14OhnZ
         Aebnaif0xmJlIRORk2YZCoSW5U7HS9hfsnTiR9gVOBJAXMvzFLDVn69oG7PJJIBx1ob7
         H4SQ==
X-Gm-Message-State: APjAAAULY9SUmt/pUpJaKXUVxXNEDWuBy7KUigbY915NJ+S5kBZCbSNV
        7i7k51MzASwIK7zkmeJ4krSrEQ==
X-Google-Smtp-Source: APXvYqyixyro0WIMqI0C7CGaQ2nlzq7IOMfvK1UOk36VvkyNl9VTipL9Hb/JJxMLaV9Nrsw90+v0Yg==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr779871wmj.79.1562058677297;
        Tue, 02 Jul 2019 02:11:17 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.googlemail.com with ESMTPSA id t15sm12269862wrx.84.2019.07.02.02.11.16
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 02:11:16 -0700 (PDT)
Subject: Re: [PATCH 03/12] backlight: gpio: pull the non-pdata device probing
 code into probe()
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
 <20190625163434.13620-4-brgl@bgdev.pl>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <920a5359-d662-5111-8b3d-4f5c63b2afb6@linaro.org>
Date:   Tue, 2 Jul 2019 10:11:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-4-brgl@bgdev.pl>
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
> There's no good reason to have the generic probing code in a separate
> routine. This function is short and is inlined by the compiler anyway.
> Move it into probe under the pdata-specific part.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Like the others, this will need to be respun to match latest code but 
when it comes round again:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>   drivers/video/backlight/gpio_backlight.c | 39 ++++++++----------------
>   1 file changed, 13 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 8adbc8d75097..89e10bccfd3c 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -54,30 +54,6 @@ static const struct backlight_ops gpio_backlight_ops = {
>   	.check_fb	= gpio_backlight_check_fb,
>   };
>   
> -static int gpio_backlight_probe_prop(struct platform_device *pdev,
> -				     struct gpio_backlight *gbl)
> -{
> -	struct device *dev = &pdev->dev;
> -	enum gpiod_flags flags;
> -	int ret;
> -
> -	gbl->def_value = device_property_read_bool(dev, "default-on");
> -	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> -
> -	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
> -	if (IS_ERR(gbl->gpiod)) {
> -		ret = PTR_ERR(gbl->gpiod);
> -
> -		if (ret != -EPROBE_DEFER) {
> -			dev_err(dev,
> -				"Error: The gpios parameter is missing or invalid.\n");
> -		}
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   static int gpio_backlight_probe(struct platform_device *pdev)
>   {
>   	struct gpio_backlight_platform_data *pdata =
> @@ -86,6 +62,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct backlight_device *bl;
>   	struct gpio_backlight *gbl;
> +	enum gpiod_flags flags;
>   	int ret;
>   
>   	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> @@ -116,9 +93,19 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   		if (!gbl->gpiod)
>   			return -EINVAL;
>   	} else {
> -		ret = gpio_backlight_probe_prop(pdev, gbl);
> -		if (ret)
> +		gbl->def_value = device_property_read_bool(dev, "default-on");
> +		flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +
> +		gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
> +		if (IS_ERR(gbl->gpiod)) {
> +			ret = PTR_ERR(gbl->gpiod);
> +
> +			if (ret != -EPROBE_DEFER) {
> +				dev_err(dev,
> +					"Error: The gpios parameter is missing or invalid.\n");
> +			}
>   			return ret;
> +		}
>   	}
>   
>   	memset(&props, 0, sizeof(props));
> 

