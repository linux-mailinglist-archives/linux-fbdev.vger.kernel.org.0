Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1A24E843
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jun 2019 14:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfFUMtg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jun 2019 08:49:36 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39072 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfFUMtg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jun 2019 08:49:36 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so6486532wma.4
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jun 2019 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1W2WjOrHyAQxbAms+0lUtVAz8eLCNhjimYeSWnn2kxY=;
        b=g6dZCD+0BKGgFTxVXquMah27DBoxfovfxxX56Mb73a05HlB2qIrrf8g+SEftMtzlhD
         t2ZmeKQkKEqdJoh0k840zL94hKMkX2Cr3jFPzhyXuuPzIuzZI8n2v6V0CKpcvkP3onEG
         ANAjEFLKx38eZ1JlUKG0zzImhRZGY/9GTpMJoEH/sA2yxdJIOMeW8oxUvpI5N4uQG9z6
         QyZAwFS7+whdd+jEHONQAhNRAf2v7RIJGmv718aiN3zc9iGCiJgcdOe4+qpfp5BgUMEI
         lI9onn9PFGeLpa7SJ99NelRtcQQrUG1r2rMHjx38oPYsVjwX/6soInLmMx6HSHceYYpI
         7Jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1W2WjOrHyAQxbAms+0lUtVAz8eLCNhjimYeSWnn2kxY=;
        b=RXljJ5cD45duT/7jj7jl56ZsoDZs0JxJGSKG3hQN0VwCOiXlUosOVmmbjubXnJc6sY
         2rF5AJcOVFjjtkE/U8k2viYHmL7wEFKsUq/nwqQfE8DSh5P2VYIrRd+3GCu4JrAkGkco
         iMG5MUUjVCEeg4zZ7g3srZqPtsOtf2+10FVHDqvpPFqyoJSQpaplq7EY0JHDJlJO/tFN
         DR2o91PGv+QAocMyrlAyb85PoULjgyGCtncn/ZCfjyXIZkurD4mDhJmjO0QZFBtrSW+Z
         RGmAzwNdp0QP1p9aX1Ww4wxIn7Z0sG8ucuCCb9l/fyOH12w+gLvzKsGkqwb5/CbUVUNt
         HL3A==
X-Gm-Message-State: APjAAAU5+0S2oSvvKwYKxi1eieMKpEc1YqFwtcYw8i+Hkj7oEn3O3c1U
        7Rw2l5LQPL7znORn4+15UhLA5Q==
X-Google-Smtp-Source: APXvYqzzAFNVEwfP98oYEgpzs3sVfqEHFy4Wk/kg/CY26BKqOzSTI2d+xIIWa5QU568W7TC2Lndjqg==
X-Received: by 2002:a05:600c:2388:: with SMTP id m8mr3862455wma.23.1561121374405;
        Fri, 21 Jun 2019 05:49:34 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.googlemail.com with ESMTPSA id j32sm5690957wrj.43.2019.06.21.05.49.33
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 05:49:33 -0700 (PDT)
Subject: Re: [PATCH] backlight: pwm_bl: Fix heuristic to determine number of
 brightness levels
To:     Matthias Kaehlcke <mka@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <20190612180003.161966-1-mka@chromium.org>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <bf229b34-2b76-90f7-3e48-102f473b3b52@linaro.org>
Date:   Fri, 21 Jun 2019 13:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612180003.161966-1-mka@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 12/06/2019 19:00, Matthias Kaehlcke wrote:
> With commit 88ba95bedb79 ("backlight: pwm_bl: Compute brightness of
> LED linearly to human eye") the number of set bits (aka hweight())
> in the PWM period is used in the heuristic to determine the number
> of brightness levels, when the brightness table isn't specified in
> the DT. The number of set bits doesn't provide a reliable clue about
> the length of the period, instead change the heuristic to:
> 
>   nlevels = period / fls(period)
> 
> Also limit the maximum number of brightness levels to 4096 to avoid
> excessively large tables.
> 
> With this the number of levels increases monotonically with the PWM
> period, until the maximum of 4096 levels is reached:
> 
> period (ns)    # levels
> 
> 100    	       16
> 500	       62
> 1000	       111
> 5000	       416
> 10000	       769
> 50000	       3333
> 100000	       4096
> 
> Fixes: 88ba95bedb79 ("backlight: pwm_bl: Compute brightness of LED linearly to human eye")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

As I understand it we can't determine the PWM quantization without 
actually programming it so the table could still be oversized after this 
patch (e.g. multiple entries end up with same physical brightness) but 
since it should always be monotonic and the table size will cap out at a 
sane value then:

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>   drivers/video/backlight/pwm_bl.c | 24 ++++++------------------
>   1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index fb45f866b923..0b7152fa24f7 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -194,29 +194,17 @@ int pwm_backlight_brightness_default(struct device *dev,
>   				     struct platform_pwm_backlight_data *data,
>   				     unsigned int period)
>   {
> -	unsigned int counter = 0;
> -	unsigned int i, n;
> +	unsigned int i;
>   	u64 retval;
>   
>   	/*
> -	 * Count the number of bits needed to represent the period number. The
> -	 * number of bits is used to calculate the number of levels used for the
> -	 * brightness-levels table, the purpose of this calculation is have a
> -	 * pre-computed table with enough levels to get linear brightness
> -	 * perception. The period is divided by the number of bits so for a
> -	 * 8-bit PWM we have 255 / 8 = 32 brightness levels or for a 16-bit PWM
> -	 * we have 65535 / 16 = 4096 brightness levels.
> -	 *
> -	 * Note that this method is based on empirical testing on different
> -	 * devices with PWM of 8 and 16 bits of resolution.
> +	 * Once we have 4096 levels there's little point going much higher...
> +	 * neither interactive sliders nor animation benefits from having
> +	 * more values in the table.
>   	 */
> -	n = period;
> -	while (n) {
> -		counter += n % 2;
> -		n >>= 1;
> -	}
> +	data->max_brightness =
> +		min((int)DIV_ROUND_UP(period, fls(period)), 4096);
>   
> -	data->max_brightness = DIV_ROUND_UP(period, counter);
>   	data->levels = devm_kcalloc(dev, data->max_brightness,
>   				    sizeof(*data->levels), GFP_KERNEL);
>   	if (!data->levels)
> 

