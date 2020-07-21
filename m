Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2EB22829C
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Jul 2020 16:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgGUOrR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Jul 2020 10:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbgGUOrR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Jul 2020 10:47:17 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199F8C061794
        for <linux-fbdev@vger.kernel.org>; Tue, 21 Jul 2020 07:47:17 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c80so3126374wme.0
        for <linux-fbdev@vger.kernel.org>; Tue, 21 Jul 2020 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fNGxz0EZnvsEYVO1d5B3FCu46i18q7LLNyU2Zb0GsXw=;
        b=FZlxfbBzMv/Mv99bS4q6XH2M9JQIzudAk8C+E9ynRtLRrlX+FFqRTkY6dUUJTYVsx9
         MbwQz4rp3eDGY+uDX/JEllnSNunccztui3HhWwSzWhUtXNWe6A578ErRwy6TFgtQbIY6
         wyNiTkrJ9rzJmvTWpye+mu3S49o+qB5+w/hvsS/+u6kdFvsS5aRuDajMVSEkwV+Kk7Sq
         qqLf+fmbamozD6zTBYAHp4OlhWXRl9EO/4rW2H//ctPY7jHXtp0c0q3u6WZzWFqCR06A
         Ns7hAnG9p0XM18hzRwptDvr/Y70R9is31f9lNp2/uqwTiPM9h2XP2U7EWC4/rZObBP1B
         go0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fNGxz0EZnvsEYVO1d5B3FCu46i18q7LLNyU2Zb0GsXw=;
        b=ulse61ZrcOPv3bn+FDb7lGpj+0Uo4TVjBnwycfcE9wZVpfkXGGYZ9QSdGWl69hK5BS
         L3gaT4idD27bxbdCm1++rVk2VjUeGYvYlEVwX7uFtkN5hqLu+AupiQZSAv8HvMDDgjZr
         8mUqeDk9FHXaF9WUhN/cO3jocaB+0QZvZO3p297eyy6kdSGiMHBPbbhU49Bo4o5+t7Iv
         ez2u+eJ7BTwgbSkjOr+yumFp4F4mG0sxEPCgV8TMzF80E7wj9uMJW6bfaEkOEELzWqLu
         Zxi1Fr8o/ABCowGGHWZq9dlpUS5T5XcDqKs6BTXI/rz3Y819e2GLZpbw1ZHzWTDCKcin
         2DJw==
X-Gm-Message-State: AOAM530v2tDuymPPSnEyEWVcnrMLAgU033waST5Z+/qlOnE0GYSezpuJ
        iUBAhOLdyU7L6lt8DQk7NgZiqg==
X-Google-Smtp-Source: ABdhPJxElqrmQU4NxdvdqG6pNVbw5C9a920GKqPa8jgL90mmqhRnnOi+UUmFOIFCOVpkQwnSzyvuXg==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr4607804wmb.104.1595342835775;
        Tue, 21 Jul 2020 07:47:15 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id y17sm21855229wrh.63.2020.07.21.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:47:15 -0700 (PDT)
Date:   Tue, 21 Jul 2020 15:47:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Hulk Robot <hulkci@huawei.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH -next] backlight: cr_bllcd: Remove unused variable
 'intensity'
Message-ID: <20200721144711.GF621928@dell>
References: <20200721134841.33893-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721134841.33893-1-weiyongjun1@huawei.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 21 Jul 2020, Wei Yongjun wrote:

> Gcc report unused-variable warning as follows:
> 
> drivers/video/backlight/cr_bllcd.c:62:6: warning:
>  unused variable 'intensity' [-Wunused-variable]
>    62 |  int intensity = bd->props.brightness;
>       |      ^~~~~~~~~
> 
> After commit 24d34617c24f ("backlight: cr_bllcd: Introduce
> gpio-backlight semantics"), this variable is never used, this
> commit removing it.
> 
> Fixes: 24d34617c24f ("backlight: cr_bllcd: Introduce gpio-backlight semantics")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/video/backlight/cr_bllcd.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks for the patch, but this has already been fixed.

> diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlight/cr_bllcd.c
> index a24d42e1ea3c..4ad0a72531fe 100644
> --- a/drivers/video/backlight/cr_bllcd.c
> +++ b/drivers/video/backlight/cr_bllcd.c
> @@ -59,7 +59,6 @@ struct cr_panel {
>  
>  static int cr_backlight_set_intensity(struct backlight_device *bd)
>  {
> -	int intensity = bd->props.brightness;
>  	u32 addr = gpio_bar + CRVML_PANEL_PORT;
>  	u32 cur = inl(addr);
>  
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
