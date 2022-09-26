Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2E65EACDB
	for <lists+linux-fbdev@lfdr.de>; Mon, 26 Sep 2022 18:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiIZQpE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 26 Sep 2022 12:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiIZQoe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 26 Sep 2022 12:44:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B5D8E984
        for <linux-fbdev@vger.kernel.org>; Mon, 26 Sep 2022 08:32:37 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id z6so10846321wrq.1
        for <linux-fbdev@vger.kernel.org>; Mon, 26 Sep 2022 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=0KlEo+afyt4apyvxaLqPEL4NYXEKz5IumQTdfwKfpco=;
        b=xoAHbUl+K1FV+nzNh1j3pmo5TlabCnsO83h8eMKm9rHlDB82YJ7aZGCJzVSGlL8J1F
         prRS6DaKF27OYe2itAcEOrguRqR3JSe2uABB/yaTFX/3DdGi/eZX1+asJSt6vVcim4xy
         iUrc+T5aQkrSWiQNtbScpF12JD3iXrdKtKCc5nw/EqgMvam2ccBd0Yw30/z6FMLF/bJ9
         FPcbyo+6x51hfV4+tEky8O1HUNmPN4z/fcM9YmCEKTo5GdEl8dlg7GK0O6oP08wUIuJa
         t3/l2cjZ8PFNTQDbkGcZy62nQ7mT2HaTctpyqC9QTPSR0flDO/QcVk7HdS2w/M8iJ+7K
         llGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0KlEo+afyt4apyvxaLqPEL4NYXEKz5IumQTdfwKfpco=;
        b=3epYTkIJUqfXYjfVVUtRwei6vw7VcxPwhyisqh8Y3k72tF44SdxHrcKoRFdnWejvdM
         KQoiTNKhxio3UMmVxpH/ghJ2O4aS3+FlH9lIMSIA7UjQs+UqDDCkOm3eac2+33OLEe/1
         p8I2NFEqe9Mvs4gW0WCv1D1iYcgwrPZXX9Q2SCq011xa8XFAcBQd6Tu9pmXvoWgBrB3t
         jij19gf8HVs/7nWHSD6jIRJ7/B76PBQZRXnBKnKS5Z+lEFeZnVNULgj3mS3Fm1YwQ6HD
         uZ+rW2sOu1Jp4xosV4oMb7rftMa/UQDeHl8AhzPQRfNWQWDOZ01hfI1q23wenvPo/F0Y
         avMQ==
X-Gm-Message-State: ACrzQf2XTqcUw4+sKwPaRPsnvXCvNwlDyXgal+abVcbZmh3D+Jo8bl4/
        QUnHVD5ggnuiQ/P+JsEARu1bppqx3swJ3yzH
X-Google-Smtp-Source: AMsMyM52E5mqq6qKo38bBmoy7Uq9UewNHaL9e35Vmjh6mw2qQaPpjOuWlfz5YmM/Lchc3PeMqmWH1A==
X-Received: by 2002:a05:6000:1e14:b0:22b:3aa1:f310 with SMTP id bj20-20020a0560001e1400b0022b3aa1f310mr12237323wrb.108.1664206356053;
        Mon, 26 Sep 2022 08:32:36 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003a3442f1229sm12860585wmg.29.2022.09.26.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 08:32:34 -0700 (PDT)
Date:   Mon, 26 Sep 2022 16:32:32 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        lee@kernel.org, jingoohan1@gmail.com
Subject: Re: [PATCH -next v2] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
Message-ID: <YzHGEAoodSoamUIM@maple.lan>
References: <20220926142447.2296872-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926142447.2296872-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Sep 26, 2022 at 10:24:47PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2:
>   Remove "Error: " in error meassage
> ---
>  drivers/video/backlight/gpio_backlight.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 6f78d928f054..4ff3939e5f7e 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -64,13 +64,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	def_value = device_property_read_bool(dev, "default-on");
>
>  	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod)) {
> -		ret = PTR_ERR(gbl->gpiod);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev,
> -				"Error: The gpios parameter is missing or invalid.\n");
> -		return ret;
> -	}
> +	if (IS_ERR(gbl->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> +				     "The gpios parameter is missing or invalid.\n");

Why keep the leading "The " ?


Daniel.
