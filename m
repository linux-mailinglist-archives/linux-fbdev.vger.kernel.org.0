Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E49A7CE76D
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2019 17:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfJGP2F (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 7 Oct 2019 11:28:05 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38579 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfJGP2E (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 7 Oct 2019 11:28:04 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so12825045wmi.3
        for <linux-fbdev@vger.kernel.org>; Mon, 07 Oct 2019 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DCOkxVIM+JoLp/YA+axrp58OiH/imrwWD+NmGvd4Ocg=;
        b=PYxYfGB6zPqtbG5xjS2Q9qk6xu1t5yFe2l7zfOc1z1MO7Cjx3Ihljkj8az2zpIEJTe
         92TxrZQdhkL8Jr5XjUmbVouX5Ez39Rud2TRflwB8e9bqonoq2235fow3dFw80PEn2MwT
         yK1c3LlElksS2/p36HWmCRfUvBNpQ6oGvFLp8G5Y9Eje4M7lOL5hQYn4bO9ZdGpyHJxz
         i3Zq9KKFEmW1uPM+l3JpophHsU8IskdX8Xg0Vz/kJ40SZqz9vjnh3XeRRheiD8zKjy+u
         Nt6YLTFk8HUvTJ5oY4wQl+zFdjqMNkJUrQ8m1p7UPr3xqSwfuaHbJksPhAWG9jyjJQCo
         XI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DCOkxVIM+JoLp/YA+axrp58OiH/imrwWD+NmGvd4Ocg=;
        b=TCzFeOUE4sKfjxHs6vTGHqU9BM58W+xZyTgTdsJAl7EK+VtAWN15SznKr6RJUbL9q6
         /hY7zPKr/WHdRgYGiY2c6tahaPZO3ZFiW9n56G4veRSIERvNRkn2QPKgKK+gpcHCShuR
         rXquXhmIf1K8stvSpr0GmVJRmECyb891vhwBHNQYDBxurH2Iku8EEFJJMcVhAwyzTk6B
         02qumOGBzsLcjhirGKZHSg3rkVDFE2xTkwjOAokeh23Ni31ixB2xbQHnCToOJ7rCPoUk
         jfmcjPNviX/t34Ll+9KCZ1GI9UaDo5iRe9MJTjuCEtuQPoh7T5ORwsejECQ9aXOLzoHB
         hvcw==
X-Gm-Message-State: APjAAAWU1oHX/rVmJTuilq42egdnBhlSERfY8qe8NDb/qiHr4n5EscS2
        PYgFWePSmL9e0yLEMo/47WhzGg==
X-Google-Smtp-Source: APXvYqzLtwmET3hiE2eWvE24sEsSRwb8ljYitXMiLtwoOUl9Ert6W2PeYvJ4zI6wnb+Z9sUY6yV87w==
X-Received: by 2002:a1c:a8cb:: with SMTP id r194mr20184823wme.156.1570462082643;
        Mon, 07 Oct 2019 08:28:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id n14sm13722808wro.83.2019.10.07.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:28:02 -0700 (PDT)
Date:   Mon, 7 Oct 2019 16:28:00 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
Message-ID: <20191007152800.3nhbf7h7knumriz4@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-3-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919140620.32407-3-linux@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Sep 19, 2019 at 04:06:18PM +0200, Rasmus Villemoes wrote:
> The scheduler uses a (currently private) fixed_power_int() in its load
> average computation for computing powers of numbers 0 < x < 1
> expressed as fixed-point numbers, which is also what we want here. But
> that requires the scale to be a power-of-2.

It feels like there is some rationale missing in the description here.

What is the benefit of replacing the explicit int_pow() with the
implicit multiplications?


Daniel.


> 
> We could (and a following patch will) change to use a power-of-2 scale,
> but for a fixed small exponent of 3, there's no advantage in using
> repeated squaring.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/video/backlight/pwm_bl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index 9252d51f31b9..aee6839e024a 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -179,7 +179,8 @@ static u64 cie1931(unsigned int lightness, unsigned int scale)
>  	if (lightness <= (8 * scale)) {
>  		retval = DIV_ROUND_CLOSEST(lightness * 10, 9033);
>  	} else {
> -		retval = int_pow((lightness + (16 * scale)) / 116, 3);
> +		retval = (lightness + (16 * scale)) / 116;
> +		retval *= retval * retval;
>  		retval = DIV_ROUND_CLOSEST_ULL(retval, (scale * scale));
>  	}
>  
> -- 
> 2.20.1
