Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865B8DE98E
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Oct 2019 12:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfJUKfl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 21 Oct 2019 06:35:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34523 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbfJUKfl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 21 Oct 2019 06:35:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so8194985wrr.1
        for <linux-fbdev@vger.kernel.org>; Mon, 21 Oct 2019 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kCC2K+1Phv+hZCvepsAaxz4dYzO4ZQaseMmOK9Alp0E=;
        b=t3cX8WuPKhyW/BpGMRXewuy78R7w/7zHRJAn8p3dQKQhukExp9KXRyiHQyZRTZgcFr
         0/pl5MrCraK5WBczSBLwEjUlqJTKVoS/g+6NITgaiFUHaA7IbHUBno7wgha+PhK8Ezmj
         5mJSHCJmisfZGWC1TVJG+/bomIXUOeCqAXrKt+0YDkAEWgYrCiIUXsZ8c30JsZpVc/uW
         2F25TYKY7ZnPOQ/WQe6pOp9mAEwYaNyQVo2o5NzhBoPbgVKO/CdBduSVc9MBnP5TSM6f
         VLUNnsx7qaQ2y3zEpnuF8EUCKoY7Wl+T/mPi5QVjgndd4zTXy2aXSO8Y1CRecvEAspBy
         D7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kCC2K+1Phv+hZCvepsAaxz4dYzO4ZQaseMmOK9Alp0E=;
        b=sQ5y9z2sueXsLb9Jkb3wVMRly8DmntFl3E+3v6GUhSc6JqhxPjNXQmgidNgfv5eShQ
         d5NnX3TPAYDZP0E6WtirtKIi46dvT6WiWwtC+iuotgmdamnvbDCEQwaHydgl2QpqyGgV
         sZib3geDbCJAeaKnoi/5M1NDcKjcGK4L6ZNsW+5iYBB8HbbOaUNTJFo3Df+R2x6+7XrF
         4i5sJFoG4/hgm71sGnUQ3/GoNVLyAiE1pxnCfKNNHUgFfYYRxhe19RfM6Faqe3olsm3h
         NMsRB6WQg2+oIn3tFybAGiiPOZKsgt6z7d3MVz17ml4CM/eYa0DwnOaFtV1WfwtAsEFz
         dQLg==
X-Gm-Message-State: APjAAAXhHI/P6/3tKm7Y65N9yVMP7Hdanadh38IF79MK8Mje7npzRaz4
        Ng8O/+DnOGv3bFIKwjzhHFS8Xw==
X-Google-Smtp-Source: APXvYqwzq4W2hoqMGfXD+SnL4v4XRwsU52eKiLQU7E1OuYqmacWEauu7fUOpM3T6jtW1TY+PYeZ8Yw==
X-Received: by 2002:adf:92a5:: with SMTP id 34mr18183433wrn.337.1571654139130;
        Mon, 21 Oct 2019 03:35:39 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c18sm13475121wrv.10.2019.10.21.03.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 03:35:38 -0700 (PDT)
Date:   Mon, 21 Oct 2019 11:35:36 +0100
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
Subject: Re: [PATCH v6 2/9] backlight: gpio: remove stray newline
Message-ID: <20191021103536.svhda5kmffhm5hjd@holly.lan>
References: <20191019083556.19466-1-brgl@bgdev.pl>
 <20191019083556.19466-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191019083556.19466-3-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Oct 19, 2019 at 10:35:49AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Remove a double newline from the driver.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

(wow! that one was easy ;-) )

> ---
>  drivers/video/backlight/gpio_backlight.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 7e1990199fae..3955b513f2f8 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -91,7 +91,6 @@ static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
>  	return FB_BLANK_UNBLANK;
>  }
>  
> -
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
>  	struct gpio_backlight_platform_data *pdata =
> -- 
> 2.23.0
> 
