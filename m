Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CA21B10C9
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Apr 2020 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDTPzS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Apr 2020 11:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725875AbgDTPzS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Apr 2020 11:55:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D61C061A0C
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:55:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t14so12776897wrw.12
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r/n+TXVCwahJ0neSAd5S8H3U44t9W/OjkN1updrJWzI=;
        b=XaSx+Z8Z17VeODBS+IkDozGo5ztRVFa3cLc1gtDiqsF1OtSUz3iqkL5Je2kgCxDQOY
         kAIdyHL6ZrzqeQ70pYZTQN1wOtodyaQUzIZhVGZrKhytocOY4qiDuYGZm5wyA5uec91E
         JP+jqUQnjW1mzIKdwpfHnQ0O9lIC2M8yTGDZ3qOO48PsaPjvuyPey7Ga+SMy4FVX1GBf
         erBsrNedmMIP/kT+Dz7oEPIO6XoXNziGbdX7fzSgj6bWAN8z9seMVIfw9fFasJTLteMK
         HIe+dhrc+JpFF550IBM2Z+8rj00dcisG133pLC6eIGhq7K+bxDr5JI2tiKEa95rUhQC/
         sUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r/n+TXVCwahJ0neSAd5S8H3U44t9W/OjkN1updrJWzI=;
        b=ZpyB9R4nE7Pj66tennbZMu4RymctdSCveynHgjkKnEzGyJsTfH8tqfgLPdYMX6MXBs
         /hgjPQoUzSQmypDjBUBslVSLHAFMuCnx44r4CFs2PSvmaNxv1ccY4iXnb5w95+L2IEko
         o7FNXN03RAqAk/w0ju3AbpoA3Ot115SPSDD0BJuvw9+XzqjrG1jOxsnUrbfniE2gSfbl
         +aQ1vojvbljHxZAtf6532AibEuli7Ne9OY5078/nSu2Cmr8xt4hZF17NbYYPiXGU+IaP
         v6Y2ILksfaPB8+63OE9yFxnxdrI0C0IWlsspH+JooqfZcRgMxtybt8ZTu2NRlUG01uAs
         R58g==
X-Gm-Message-State: AGi0PuYPrAalf6xg0LrAQhEBDt7TJzICcoCUEJp5DZjUxHkaWEfRFdJ4
        NoMXm+lc61tQuedsEYrJdq07ow==
X-Google-Smtp-Source: APiQypKBVr8BbuF4rTT3qTRXc0+2UdFaONraKBrKV8Q/Mi2GDFqPgs1Wu1UiKkhz5WL5XPPXRXq+gA==
X-Received: by 2002:adf:e552:: with SMTP id z18mr19026705wrm.244.1587398116801;
        Mon, 20 Apr 2020 08:55:16 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id d7sm1605548wrn.78.2020.04.20.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:55:16 -0700 (PDT)
Date:   Mon, 20 Apr 2020 16:55:14 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 4/5] backlight: led_bl: fix led -> backlight brightness
 mapping
Message-ID: <20200420155514.lyb73ujf5fzgpvp4@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-4-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-4-tomi.valkeinen@ti.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Apr 17, 2020 at 02:33:11PM +0300, Tomi Valkeinen wrote:
> The code that maps the LED default brightness to backlight levels has
> two issues: 1) if the default brightness is the first backlight level
> (usually 0), the code fails to find it, and 2) when the code fails to
> find a backlight level, it ends up using max_brightness + 1 as the
> default brightness.
> 
> Fix these two issues.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/video/backlight/led_bl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 63693c4f0883..021b5edd895c 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -159,10 +159,11 @@ static int led_bl_parse_levels(struct device *dev,
>  		 */
>  		db = priv->default_brightness;
>  		for (i = 0 ; i < num_levels; i++) {
> -			if ((i && db > levels[i - 1]) && db <= levels[i])
> +			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
>  				break;
>  		}
> -		priv->default_brightness = i;
> +
> +		priv->default_brightness = i < num_levels ? i : 0;

This seems a bit odd. If the LED is currently set to brighter than the
maximum brightness level why would we choose a default brightness of
zero?


Daniel.


>  		priv->max_brightness = num_levels - 1;
>  		priv->levels = levels;
>  	} else if (num_levels >= 0) {
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
