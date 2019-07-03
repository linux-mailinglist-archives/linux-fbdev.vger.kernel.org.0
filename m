Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304F35CC55
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2019 11:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfGBJFp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 2 Jul 2019 05:05:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43687 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfGBJFp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 2 Jul 2019 05:05:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id p13so16820111wru.10
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jul 2019 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dGGbbVrqx3epkvQ7DyUVG6YDxBKrBKIRNUqt51MsijM=;
        b=wqvvFWgtmzbFxo8VIz+VxphSEkiKA5bEkqsSJbk4N9X6ToqP0Ug0T390wJ64sQNiSo
         0dpDPjUpSc4dprK2hO+WKHjiVjvMnqJRTwJAKJ3pYIQBTCVP4fwcnojimRI6/XX58fK1
         Zc/qyltOkfvRJdr7J9Ryjhfp1jccErLoyG6BY4djPD09BuaQMtJf2IjrxLSpyIi2ZR/E
         zFRrP032ysoweK5yydg5EfUMDUdCedbRQIlRBSZ4XFl4PjBhZIL8hUD54x073ZkjN3bv
         pptW0BFA1tZ9vGiIjVpOkl2MPRu/sV3gyYd8y+I81DB9m4RBX5JsYt2PXUULcovGkcGJ
         jyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dGGbbVrqx3epkvQ7DyUVG6YDxBKrBKIRNUqt51MsijM=;
        b=I8iuA6uWKIP4tykXJf2oR2WOIJTzHgqjy4RF91X0KrnB0cf+Sf6IgbmfRJTxB5wi4o
         s/P5hdpFgset801FWo5JnSHeL9QjiueFXzhVhzD3zBiYfPTTRSsdDYzZb0BrnzjkI9r4
         UD+545WRgLyzf+xNwbCddYTWRsaHCr55Hpn9/3sX9z1NTPpdGtZsek9txR2FMVeDSEVJ
         UD/9WqUMlx/+vnRAMuEAeH49qDFGG6/3Ttbfow14s3h2SLb4Dmm6G5Begww+WeZnwY+X
         COacDgzrml/N7yc65aglhf7cGe1YpWHhDFt5MbqwMUpLMGz1TWhrRHu+NfoCU909LWOD
         PIQw==
X-Gm-Message-State: APjAAAXFhNGC71UBPCw5g2MeWU1l6onCJLTAR09DxABg2gO0KzFqImsg
        slvxRvOe9fEoZmggVgcOZ/q7OMJEKtbfzg==
X-Google-Smtp-Source: APXvYqyBUFgKUMPUQ1VT+uu50twL4iJvolYnaYIt4CMSKd/z9qxaRpeKXoSJKscs/7Q4ud6bG1ycrA==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr22383402wru.195.1562058342873;
        Tue, 02 Jul 2019 02:05:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.googlemail.com with ESMTPSA id u6sm2334585wml.9.2019.07.02.02.05.41
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 02:05:42 -0700 (PDT)
Subject: Re: [PATCH 02/12] backlight: gpio: use a helper variable for
 &pdev->dev
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
 <20190625163434.13620-3-brgl@bgdev.pl>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <ada53c47-c768-8390-928a-caf7cb72bcac@linaro.org>
Date:   Tue, 2 Jul 2019 10:05:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-3-brgl@bgdev.pl>
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
> Instead of dereferencing pdev each time, use a helper variable for
> the associated device pointer.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

No objections but I think this will need to be respun against 
backlight-next (or v5.3).

> ---
>   drivers/video/backlight/gpio_backlight.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 654c19d3a81d..8adbc8d75097 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -83,15 +83,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   	struct gpio_backlight_platform_data *pdata =
>   		dev_get_platdata(&pdev->dev);

Why leave this one out?


Daniel.


>   	struct backlight_properties props;
> +	struct device *dev = &pdev->dev;
>   	struct backlight_device *bl;
>   	struct gpio_backlight *gbl;
>   	int ret;
>   
> -	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
> +	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>   	if (gbl == NULL)
>   		return -ENOMEM;
>   
> -	gbl->dev = &pdev->dev;
> +	gbl->dev = dev;
>   
>   	if (pdata) {
>   		/*
> @@ -108,7 +109,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   		ret = devm_gpio_request_one(gbl->dev, pdata->gpio, flags,
>   					    pdata ? pdata->name : "backlight");
>   		if (ret < 0) {
> -			dev_err(&pdev->dev, "unable to request GPIO\n");
> +			dev_err(dev, "unable to request GPIO\n");
>   			return ret;
>   		}
>   		gbl->gpiod = gpio_to_desc(pdata->gpio);
> @@ -123,11 +124,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   	memset(&props, 0, sizeof(props));
>   	props.type = BACKLIGHT_RAW;
>   	props.max_brightness = 1;
> -	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
> -					&pdev->dev, gbl, &gpio_backlight_ops,
> -					&props);
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
> +					    &gpio_backlight_ops, &props);
>   	if (IS_ERR(bl)) {
> -		dev_err(&pdev->dev, "failed to register backlight\n");
> +		dev_err(dev, "failed to register backlight\n");
>   		return PTR_ERR(bl);
>   	}
>   
> 

