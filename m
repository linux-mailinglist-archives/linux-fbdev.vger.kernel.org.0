Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0DB470377
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 17:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfGVPSd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 11:18:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34113 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbfGVPSd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 11:18:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id 31so39891146wrm.1
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 08:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kJIZoXmnEJk2nuaDS1euaSfVjq7bZa7xFpx8vg18ues=;
        b=R8xbBrGPGLYEg+fbDVZlVqU0/MX8qvpSvYM5BRrRcMJmaQWlDvQBjOsDvzqzGXi2yL
         +F3P+mSXQKXvOQoHCKXasn3T1fKDwZI/8NRNHQH99OC/bjHPY5Brw9h3HzyBUF5fANth
         vzD6QvRsuvJayURHV5qrDxjdcVlQ4/klfZPoQrFYz1iOQnEp83H/9Gw+MJKr02S9/HzB
         OgkAX5D8NuBKqrR0L4PUno1eo72I0a9hBErXyVDYlP6Xbym+ED8A825MqdjJS7SglUvb
         bJiD5TdhG7qS+kInVSG4SBIJ4CShOp0/+WlLnNtiskli0KzGOT5v3fVRkSJV1LQHqL3d
         Xcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kJIZoXmnEJk2nuaDS1euaSfVjq7bZa7xFpx8vg18ues=;
        b=WspquScLkNcVEg3gpA2cDJVeArqEum4FIA1OqdWG3rzK7gb/ohF61t228UZjobDZSG
         sfM1ZiHWc4IDLRhvyNobpFCwhzVhecQwEOuKVplwvY7zXV4XiyA6HFtn8aHBrOn9F6pw
         a0cdO0nGs+uP8fubfSUXXAYf86iHAibaSwvQO25AKMBQFCcemgr1UW/ataOQEMbrWZsg
         rYE2TW+iSXG/ut6MDRSf3qb41J9h4Ze51Mf8WHgV5AkDYABhcYfOv6rXFvZqCJkWWxaR
         zoPz1FQzCTT+B+bbINMRL+j7rEjf1UR46P3AezLIL7k3sxBovBPOpewRZlmy7Ps/gbq3
         5Y8Q==
X-Gm-Message-State: APjAAAWK2seakTjfWXIqG/1UmuSmSCOLTZO8XglJMTF0kJutANXUCRVn
        ITCbnaUO0ohqz/ezK9trmPJ9Ng==
X-Google-Smtp-Source: APXvYqwzssx9bi+kpuqmBQK4Q0zcUFYDYs9ctyDAvKFt8l2MfJ1utjL2AT+NQh6yZBGaAgBoipYLhA==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr73952371wrq.333.1563808711047;
        Mon, 22 Jul 2019 08:18:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id b5sm33232438wru.69.2019.07.22.08.18.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:18:30 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:18:28 +0100
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
Subject: Re: [PATCH v2 4/7] backlight: gpio: remove unused fields from
 platform data
Message-ID: <20190722151828.sefbqj5vf5vtrik3@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-5-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jul 22, 2019 at 05:02:59PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Remove the platform data fields that nobody uses.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  include/linux/platform_data/gpio_backlight.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/linux/platform_data/gpio_backlight.h b/include/linux/platform_data/gpio_backlight.h
> index 34179d600360..1a8b5b1946fe 100644
> --- a/include/linux/platform_data/gpio_backlight.h
> +++ b/include/linux/platform_data/gpio_backlight.h
> @@ -9,9 +9,6 @@ struct device;
>  
>  struct gpio_backlight_platform_data {
>  	struct device *fbdev;
> -	int gpio;
> -	int def_value;
> -	const char *name;
>  };
>  
>  #endif
> -- 
> 2.21.0
> 
