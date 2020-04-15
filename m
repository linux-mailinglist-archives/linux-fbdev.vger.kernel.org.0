Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AC41A9AEB
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Apr 2020 12:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408815AbgDOKjT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 15 Apr 2020 06:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408811AbgDOKit (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 15 Apr 2020 06:38:49 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442FDC061A0C
        for <linux-fbdev@vger.kernel.org>; Wed, 15 Apr 2020 03:38:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t14so5295664wrw.12
        for <linux-fbdev@vger.kernel.org>; Wed, 15 Apr 2020 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IrPL0bBBQDeF29Z4aLgq8ImOYXP6kd9vk4rNs7ZTqws=;
        b=yIAMMnZu4/5XkjVkCq32hl9Pn9SikmiyUmlKUEu7u/JAwTn5UxxsMyK4Mz2TFYtBJK
         8bK9XO32DspPZRUWcNCWbt434F5d59Z8Gp6+JI7VNiygAxfdd+dK18ew602ZlIrASmTB
         f+O8iv9zsJpKyROuS7I6KJHsds1z/or0RLiYq85eCFBcyejyW54bjjsycwzLwCGj81jO
         M5mgoA6CFO2R78EETs8ZwxWQ497GCVAIWtench+iCvLlMVYhQVf+KEUmYIFf/OsCqb7E
         u+lhG72eBlNLj5HqiKBPiX6FLhcupVCkG3ru861qNkNNR30/I6gDKk8HUXt2PeCOnnOi
         NGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IrPL0bBBQDeF29Z4aLgq8ImOYXP6kd9vk4rNs7ZTqws=;
        b=Dijqrk4fQDTTEZpFPIf2x65srqtrscHhvo9143KXte+mYfvBDRNjtQFl22EgPfvU9F
         tSVzoGppNpjbf4ctjLCIy/1696dD0JniKEJEdEGRVOZmdz8NQ47wOsO4wvaqvw6T6/wD
         y6CA/IVDZDnxiMe7EBRoxH8PJe1iCiS5B2YHL88jXzDurdMQhqUrwszbs3AAxlJOXBQ4
         9W2f7JNhGfZ35F4Gg4XcfKYr7P4Uj3kNnZNh8Bvb0T5bp38DwtovFoE9uPTOsJkYZVQU
         R+gp6PU05b3fAuRHQagFTIUC1lr1a4l3q8Xk2qZx5jS0PkTYmKMrTDWek6NoSmq/J9Pc
         zG/A==
X-Gm-Message-State: AGi0PuYce6P3boBCLqP5M0WCescKxmcNsRGVaRcRBwMG9/hBU1J0SI/G
        kk147s/RNwh7bOA05GKbey9tfA==
X-Google-Smtp-Source: APiQypJfhW8S65Wxra9t0NaoxN8IlVd9vyp0bk8pl+XOImR8b/3RISiU1lKFKzoqVOuvy3de4k5SGA==
X-Received: by 2002:adf:e54c:: with SMTP id z12mr17403476wrm.276.1586947126830;
        Wed, 15 Apr 2020 03:38:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z15sm10599204wrs.47.2020.04.15.03.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 03:38:46 -0700 (PDT)
Date:   Wed, 15 Apr 2020 11:38:44 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200415103844.vnjccybvy5wtnrq6@holly.lan>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Mar 26, 2020 at 10:09:59PM +0100, Wolfram Sang wrote:
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/tosa_lcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
> index e8ab583e5098..113116d3585c 100644
> --- a/drivers/video/backlight/tosa_lcd.c
> +++ b/drivers/video/backlight/tosa_lcd.c
> @@ -107,7 +107,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
>  	/* TG LCD GVSS */
>  	tosa_tg_send(spi, TG_PINICTL, 0x0);
>  
> -	if (!data->i2c) {
> +	if (IS_ERR_OR_NULL(data->i2c)) {
>  		/*
>  		 * after the pannel is powered up the first time,
>  		 * we can access the i2c bus so probe for the DAC
> @@ -119,7 +119,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
>  			.addr	= DAC_BASE,
>  			.platform_data = data->spi,
>  		};
> -		data->i2c = i2c_new_device(adap, &info);
> +		data->i2c = i2c_new_client_device(adap, &info);
>  	}
>  }
>  
> -- 
> 2.20.1
> 
