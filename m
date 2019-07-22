Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAC7703A1
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 17:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfGVPXv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 11:23:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54333 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbfGVPXv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 11:23:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so35597219wme.4
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dt/YdbkdtXbQfI//Db8fFkJDny3N1lhFKp8D2tIZAQw=;
        b=cQ2I7j835ew5ZusitfiizKVXsv2ms/Nc0gSb5CrVHW/lFCaI9Gv70gdA4oadY9nnnt
         22rHq7NOp1P54r4QTN05DnoO5Vzk7n5pOqdpjljYIGB6p/c5/nb5/NE7ssI4cnM5+uMW
         re3SrKpnRzNArReAT73AICGdFbuEJXjev/94JuhOADB6QIJg6lsQY73ChYKd5Ay955n8
         n/282J2Tet1cmlYWPRfz4nrpYUJ3ON+x0+U8/9RSfLmrAUYjyYD408Dv0NWz2VfZl9v7
         0EV1HGfx/k9CthCvh6voCMuiR+51PFNtlUlVSLG1xJXZPSpw9f/DV0Y7wom93U6fLsF+
         EEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dt/YdbkdtXbQfI//Db8fFkJDny3N1lhFKp8D2tIZAQw=;
        b=MpodYeOBd+8HgnmPlQlzoC4abTB9QwlVZ0SKFwpupXmlTeyU9mfyjsp5PYR5BQnK8f
         VqT5YLdRcqxCsHkQPUE+NwbFNdDMk4ZLePXmhbq8z44iALqj/RFrqT+DVqn1DMlNLbm4
         onYn5jdfCwWWxnMxUJbLsAWPez1C+WognZYJ5rUsVyr/OE8Z2n9IlDe3DfmMZwrWdd43
         7DLMwvAKwM4FfWg/xlPAD4YxmmLvV3hZ8iOm/leGVjcmbGCxEeDFLzXNWvj9Vzcglvay
         W7/O5eOwY5Kg3fmPcztEYQ+HrE0nIG9O0YWA4jEVK5MQB6kz0gX4onCU4k1WHpwALDUW
         wTgA==
X-Gm-Message-State: APjAAAUSGaylmGz3cj/dxQceh7w/tpue+9DBafDej1oXTDLeZksQo4Td
        xywIQkqdAg8qs8lsAishiHWuuQ==
X-Google-Smtp-Source: APXvYqygZB7malLkPMeQEKMwJy8+ylJrhDjDfHPzerIG3eAhjzAGq3TdPyRHRcEw3vxVe2mikWslSQ==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr57074124wma.176.1563809029501;
        Mon, 22 Jul 2019 08:23:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id n2sm27256412wmi.38.2019.07.22.08.23.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:23:48 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:23:47 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190722152347.fuar2lezfhp7iuyy@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jul 22, 2019 at 05:03:02PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Instead of dereferencing pdev each time, use a helper variable for
> the associated device pointer.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/gpio_backlight.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index cd6a75bca9cc..091ff799659a 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -54,29 +54,32 @@ static const struct backlight_ops gpio_backlight_ops = {
>  
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
> -	struct gpio_backlight_platform_data *pdata =
> -		dev_get_platdata(&pdev->dev);
> +	struct gpio_backlight_platform_data *pdata;
>  	struct backlight_properties props;
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	enum gpiod_flags flags;
> +	struct device *dev;
>  	int ret, def_value;
>  
> -	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
> +	dev = &pdev->dev;
> +	pdata = dev_get_platdata(dev);
> +
> +	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
>  		return -ENOMEM;
>  
>  	if (pdata)
>  		gbl->fbdev = pdata->fbdev;
>  
> -	def_value = device_property_read_bool(&pdev->dev, "default-on");
> +	def_value = device_property_read_bool(dev, "default-on");
>  	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>  
> -	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
> +	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
>  	if (IS_ERR(gbl->gpiod)) {
>  		ret = PTR_ERR(gbl->gpiod);
>  		if (ret != -EPROBE_DEFER) {
> -			dev_err(&pdev->dev,
> +			dev_err(dev,
>  				"Error: The gpios parameter is missing or invalid.\n");
>  		}
>  		return ret;
> @@ -85,11 +88,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = 1;
> -	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
> -					&pdev->dev, gbl, &gpio_backlight_ops,
> -					&props);
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
> +					    &gpio_backlight_ops, &props);
>  	if (IS_ERR(bl)) {
> -		dev_err(&pdev->dev, "failed to register backlight\n");
> +		dev_err(dev, "failed to register backlight\n");
>  		return PTR_ERR(bl);
>  	}
>  
> -- 
> 2.21.0
> 
