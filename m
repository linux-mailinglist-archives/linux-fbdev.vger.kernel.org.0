Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C91DEB0B94
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Sep 2019 11:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730810AbfILJib (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 12 Sep 2019 05:38:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37488 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730624AbfILJi2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 12 Sep 2019 05:38:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id r195so6827544wme.2
        for <linux-fbdev@vger.kernel.org>; Thu, 12 Sep 2019 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FyZv+2jpXHUeLj3zo5hEMKDZeE0gwZkeevJP1UY0f7g=;
        b=ecsVnCqf7jy234ajtjhPg9bUFq6eqgeSiFQ3B9VshYDzlqTvwe6qHgo3Rme+YYjBYq
         57zpk4CVJaSffFdPd270c0VN8xlStEbZJZ+Sqs9lpMMOoBBIxWcWmnuTRQRez1qiHG0d
         1lF/Ub0lLFF61mcsJSmPRk+pkj9XHPLqMlmxv7g+hUhnOhPZJw3sqdIw0H0sRO6Szluy
         uubJNNNO3gpZ0uIIEthnKcGjYVCyroZ5Acc8NukHDVwgHn57hKBRTPjMeKVcjOYEpRX9
         joNJftMwDDaAtTVKc4vY8Ukzbw1p4oew/FyaHhwm6kEX+/WIUZzjHq3A1AVFc9G0i9jV
         +qUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FyZv+2jpXHUeLj3zo5hEMKDZeE0gwZkeevJP1UY0f7g=;
        b=A2zIUnuV7BaPMb/28qV6ZJDeUHej5HnFb+xAgdLk0MTHAaOvFcdbstywe1IWQCRkf8
         gvH588jkCjKxIp7kV6Evt8+9vU5fesf3UyIr++CTNRdpxuvRoFbhx/lPO7m9EmoM3frT
         ODUztCTSk5130nNiZWUGQrukUFerZ0cR097qJMIWogapmrwwuwJmkZj8LBYUtxFMKwv7
         juhLoa6A2SFVNZ78JIMUtPLi+VUbc3CujXUzdF5KxZCbowbz1aQUeuWQk6JpEgG+P6ee
         NfHWgKMQ+UZPiuszhvGlB41Sz558s9oHsf6bmcV/RHRj9o71Tq7e9TUC0TBsyYC84r8f
         tViQ==
X-Gm-Message-State: APjAAAXwmrUVeaRszWeZJ9mCCFDyL/Sh2ThsVKbaOgJ/AgdGNxLSYDl2
        c5/BmOl2Kj+ag8kRHItPmxx7Ag==
X-Google-Smtp-Source: APXvYqwjmAOKkNKKUOfQJdiedHbylzFrCwIEHmlMF2gTZyinn/Hgz7ItTmOAoVNQxy2zFP2RBUqnOg==
X-Received: by 2002:a05:600c:2386:: with SMTP id m6mr1662719wma.164.1568281106577;
        Thu, 12 Sep 2019 02:38:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id s26sm43063574wrs.63.2019.09.12.02.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 02:38:25 -0700 (PDT)
Date:   Thu, 12 Sep 2019 10:38:23 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190912093823.h5ahzutlp4evwg6l@holly.lan>
References: <20190911172106.12843-1-andreas@kemnade.info>
 <20190911172106.12843-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911172106.12843-3-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Sep 11, 2019 at 07:21:06PM +0200, Andreas Kemnade wrote:
> For now just enable it in the probe function to allow i2c
> access. Disabling also means resetting the register values
> to default and according to the datasheet does not give
> power savings.
> 
> Tested on Kobo Clara HD.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Make sure Dan is happy w.r.t. his review comments but if this driver is
unchanged when you spin v4 (for the DT changes) then feel free to add:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
> changes in v2:
> - simplification
> - correct gpio direction initialisation
> 
> changes in v3:
> - removed legacy include
> 
>  drivers/video/backlight/lm3630a_bl.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index 8f84f3684f04..d9e67b9b2571 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -12,6 +12,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/interrupt.h>
>  #include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/pwm.h>
>  #include <linux/platform_data/lm3630a_bl.h>
>  
> @@ -48,6 +49,7 @@ struct lm3630a_chip {
>  	struct lm3630a_platform_data *pdata;
>  	struct backlight_device *bleda;
>  	struct backlight_device *bledb;
> +	struct gpio_desc *enable_gpio;
>  	struct regmap *regmap;
>  	struct pwm_device *pwmd;
>  };
> @@ -535,6 +537,13 @@ static int lm3630a_probe(struct i2c_client *client,
>  	}
>  	pchip->pdata = pdata;
>  
> +	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(pchip->enable_gpio)) {
> +		rval = PTR_ERR(pchip->enable_gpio);
> +		return rval;
> +	}
> +
>  	/* chip initialize */
>  	rval = lm3630a_chip_init(pchip);
>  	if (rval < 0) {
> -- 
> 2.20.1
> 
