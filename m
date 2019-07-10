Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA25F64F5A
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jul 2019 01:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbfGJXtu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 10 Jul 2019 19:49:50 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42688 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbfGJXtu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 10 Jul 2019 19:49:50 -0400
Received: by mail-pg1-f196.google.com with SMTP id t132so1974071pgb.9
        for <linux-fbdev@vger.kernel.org>; Wed, 10 Jul 2019 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bdXtqqxh12gfpIhfLW0BOHj1xamqr81xRsaaifvH1jA=;
        b=SnvyKqxvl+fvKR0+PjUifcGbb6pSDIrbMTS58kDSV8YT7OXiNbKXsVeJVg2HK188+L
         tChVd0+x6RADEjmenfa3I6KpEJkhlJ+YQ07qBMOAMK94FtgGzJS6EL1/vSG7oGkRf5mD
         E0Jl2k7JaQsBZO/L2agq/mEEglBbL6AMdHKkj4eH6gV5zEf5SNnX7myIX6yWWEgv6jOL
         poPt6Yhesg7askDUTQvE3uX+Yixbofm+fDHz6KIRYKS+yFArbBKxyxW5Vz7SFr6MkB/I
         8IAR+T/l15J7CiPl5709TQMnpfkLBNYYhPQafv0JjITR+hlj60KN1RJeovT3P+8ErufZ
         31Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bdXtqqxh12gfpIhfLW0BOHj1xamqr81xRsaaifvH1jA=;
        b=X+0TC934e+8H/dmMQbfO693uanxNUzk7FmtegXLEvoyp1A1HyaxBILcaQR1T8DVmLW
         +2gUAl2L9AJOUoiw6akXfBYjYf9Ww/agOTqoK9n8zoxvxP5uMdyZESZxuicx2BA7/d8h
         IIXrKUi0iVCtW+F4TsAedUPiN9eR83u0vOtheYWITFW2CRb4Atq1N8r+PfbM3edFYrXN
         pd0v6CK7P4fmPagsO3BXT6sRGvmmH6tWKlptny0Mveey473YDhah6T1Tu/Me2LCmrMBd
         fX8ntuHplYXWFC3Yall7hFkmNkzJsXaeV0DJqoAZzYTTs7RSBZC8DxwydiRIjxttKkuT
         DFew==
X-Gm-Message-State: APjAAAVwrMvGeb71q7xCxH7+Ftlw/g7lixeb/69Q+G9UrhReUnESGUuN
        sPaObZ47t+B22YZfQSLFVl8Vn9DRU1i+Pg==
X-Google-Smtp-Source: APXvYqwRtOjO9X0OoS+6qzfe5qy8hqnHZVMH+ftWzgtOftn4Yt50WnEvvRSdLx7+oyw3gG7AjcEwsw==
X-Received: by 2002:a65:4841:: with SMTP id i1mr998306pgs.316.1562802589521;
        Wed, 10 Jul 2019 16:49:49 -0700 (PDT)
Received: from nishad (p3261240-ipngn21201hodogaya.kanagawa.ocn.ne.jp. [153.202.122.240])
        by smtp.gmail.com with ESMTPSA id x128sm7650140pfd.17.2019.07.10.16.49.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 16:49:49 -0700 (PDT)
Date:   Thu, 11 Jul 2019 05:19:42 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Phil Reid <preid@electromag.com.au>, gregkh@linuxfoundation.org,
        thomas.petazzoni@free-electrons.com, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        nsaenzjulienne@suse.de
Subject: Re: BUG: Staging: fbtft: Switch to the gpio descriptor interface
Message-ID: <20190710234940.GB29252@nishad>
References: <3ca02376-631b-d159-7070-7c50403126de@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca02376-631b-d159-7070-7c50403126de@electromag.com.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 10, 2019 at 04:31:09PM +0800, Phil Reid wrote:
> G'day Nishad,
> 
> I'm just wondering if the commit
> c440eee1a7a1d0f "Staging: fbtft: Switch to the gpio descriptor interface"
> was tested on anything.
> 
> I've had to apply the following patch to get my display functioning again.
> 
> in particular the devm_gpiod_get_index using dev->driver->name for the gpio lookup seems
> wrong.
> 
> Also I've had to invert the polarity of the reset-gpios in the DT file for the display to function.
> 
> this code:
> 	gpiod_set_value_cansleep(par->gpio.reset, 0);
> 	usleep_range(20, 40);
> 	gpiod_set_value_cansleep(par->gpio.reset, 1);
> 
> could be read as deasserting the reset line and then asserting it.
> So I've had to specify and active high reset line in the DT.
> 
> Regards
> Phil
> 
Hello Phil,

This patch was only compiled successfully.

It hasn't been tested on any hardware.

Sorry for the mistake.

Thanks and regards,
Nishad

> 
> 
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 9b07bad..6fe7cb5 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -79,18 +79,16 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
>  	struct device_node *node = dev->of_node;
>  	int ret = 0;
> 
> -	if (of_find_property(node, name, NULL)) {
> -		*gpiop = devm_gpiod_get_index(dev, dev->driver->name, index,
> -					      GPIOD_OUT_HIGH);
> -		if (IS_ERR(*gpiop)) {
> -			ret = PTR_ERR(*gpiop);
> -			dev_err(dev,
> -				"Failed to request %s GPIO:%d\n", name, ret);
> -			return ret;
> -		}
> -		fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
> -			      __func__, name);
> +	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
> +				      GPIOD_OUT_HIGH);
> +	if (IS_ERR(*gpiop)) {
> +		ret = PTR_ERR(*gpiop);
> +		dev_err(dev,
> +			"Failed to request %s GPIO: (%d)\n", name, ret);
> +		return ret;
>  	}
> +	fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
> +		      __func__, name);
> 
>  	return ret;
>  }
> @@ -103,34 +101,34 @@ static int fbtft_request_gpios_dt(struct fbtft_par *par)
>  	if (!par->info->device->of_node)
>  		return -EINVAL;
> 
> -	ret = fbtft_request_one_gpio(par, "reset-gpios", 0, &par->gpio.reset);
> +	ret = fbtft_request_one_gpio(par, "reset", 0, &par->gpio.reset);
>  	if (ret)
>  		return ret;
> -	ret = fbtft_request_one_gpio(par, "dc-gpios", 0, &par->gpio.dc);
> +	ret = fbtft_request_one_gpio(par, "dc", 0, &par->gpio.dc);
>  	if (ret)
>  		return ret;
> -	ret = fbtft_request_one_gpio(par, "rd-gpios", 0, &par->gpio.rd);
> +	ret = fbtft_request_one_gpio(par, "rd", 0, &par->gpio.rd);
>  	if (ret)
>  		return ret;
> -	ret = fbtft_request_one_gpio(par, "wr-gpios", 0, &par->gpio.wr);
> +	ret = fbtft_request_one_gpio(par, "wr", 0, &par->gpio.wr);
>  	if (ret)
>  		return ret;
> -	ret = fbtft_request_one_gpio(par, "cs-gpios", 0, &par->gpio.cs);
> +	ret = fbtft_request_one_gpio(par, "cs", 0, &par->gpio.cs);
>  	if (ret)
>  		return ret;
> -	ret = fbtft_request_one_gpio(par, "latch-gpios", 0, &par->gpio.latch);
> +	ret = fbtft_request_one_gpio(par, "latch", 0, &par->gpio.latch);
>  	if (ret)
>  		return ret;
>  	for (i = 0; i < 16; i++) {
> -		ret = fbtft_request_one_gpio(par, "db-gpios", i,
> +		ret = fbtft_request_one_gpio(par, "db", i,
>  					     &par->gpio.db[i]);
>  		if (ret)
>  			return ret;
> -		ret = fbtft_request_one_gpio(par, "led-gpios", i,
> +		ret = fbtft_request_one_gpio(par, "led", i,
>  					     &par->gpio.led[i]);
>  		if (ret)
>  			return ret;
> -		ret = fbtft_request_one_gpio(par, "aux-gpios", i,
> +		ret = fbtft_request_one_gpio(par, "aux", i,
>  					     &par->gpio.aux[i]);
>  		if (ret)
>  			return ret;
> 
> 
> 
> 
