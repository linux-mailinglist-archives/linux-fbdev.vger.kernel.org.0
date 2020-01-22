Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8238145334
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 Jan 2020 11:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgAVKz5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 Jan 2020 05:55:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53557 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbgAVKzo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 Jan 2020 05:55:44 -0500
Received: by mail-wm1-f65.google.com with SMTP id m24so6324778wmc.3
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Jan 2020 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yy5Pm6Chzs3nZ800EbMSsW7jSH1HwjtkYzsQKIFnm8w=;
        b=rocHCsiCeMC1gpXVMEd5t5GK6MZu9gxeI/GUSwU8+8FCQI16R2LHI3G4MWOh1lr3g3
         i1wiLGTmuLwe05mlGIErWGWzGoqLVAABV3NaILq2JqpGu7mjVMG0VWhHTkzHQYAGnHNW
         w5UKpjmG4Gd1NbGZRzJrNdIP/C0xnSuRunOmteVNAKpUcHu5mklqKMhQn+wY5GlzLYaj
         zeQwQ2vkEOUjwaMVA0Tjz2cECH5crF8FweVqeBt52Eur64fEAaeJKGW7XhCjUe0/IUTI
         B/X/CNzrO1eWv0TSaH0s7OQ+Zv9Ob8TeRHde5yOBtBPlR1dWivNW/PIeEIc/nhgezLE8
         ju5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yy5Pm6Chzs3nZ800EbMSsW7jSH1HwjtkYzsQKIFnm8w=;
        b=ah0QwdT9RPEXloDQm8HbJUV3V0y6/AgcEbBzM6+0+oA07VYe+TfU5RyHP2FUTNOC0z
         avlxBDsTMADB9rJOZxdVpbE6mvRKpjrst8hz4D+zWLYhk6mXNsck8Ha9AbYhIZ+Fuc63
         U4lRLGDEV3iLliFoRH0gOaHG72JTiYlNUVFB1aoKv2KOtFMWsrftD+qEfaZgtMskY0TO
         ldToLfJzEs5z111gHDVeKcAYtvJsKCaTsLJ3TVSUQ/KljHwzxAw2rjAR7W/tu3MKX/KO
         l1CQ6NHcQx+34QNNJpm3kKLZOZBaUGlkBnOJUpiZxjlZAxZzKZVtTK+zCZX6i1dtFKyU
         BJjg==
X-Gm-Message-State: APjAAAUwBHIraJeW8cSPb89XQXqC8tNvdD17Dx9AzCBZCzt6/iX7INP2
        ANaXCsc7c4yX1nLQlcVAbJG+qQ==
X-Google-Smtp-Source: APXvYqzNbQ3MeYMpzTRW08neyXYjeyY3mAyF76V58Qsal/cqNuXZMYb5EXT6tBXSUfJrJImtvdHofw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr2227038wmi.146.1579690542801;
        Wed, 22 Jan 2020 02:55:42 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z133sm1370588wmb.7.2020.01.22.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 02:55:42 -0800 (PST)
Date:   Wed, 22 Jan 2020 10:55:40 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        lee.jones@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, kgunda@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] backlight: qcom-wled: fix unsigned comparison
 to zero
Message-ID: <20200122105540.w5vrvs34zxmhkjae@holly.lan>
References: <20200122013240.132861-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122013240.132861-1-chenzhou10@huawei.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jan 22, 2020 at 09:32:40AM +0800, Chen Zhou wrote:
> Fixes coccicheck warning:
> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
> 	WARNING: Unsigned expression compared with zero: string_len > 0
> 
> The unsigned variable string_len is assigned a return value from the call
> to of_property_count_elems_of_size(), which may return negative error code.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
> 
> changes in v2:
> - fix commit message description.
> 
> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index d46052d..3d276b3 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -956,8 +956,8 @@ static int wled_configure(struct wled *wled, int version)
>  	struct wled_config *cfg = &wled->cfg;
>  	struct device *dev = wled->dev;
>  	const __be32 *prop_addr;
> -	u32 size, val, c, string_len;
> -	int rc, i, j;
> +	u32 size, val, c;
> +	int rc, i, j, string_len;
>  
>  	const struct wled_u32_opts *u32_opts = NULL;
>  	const struct wled_u32_opts wled3_opts[] = {
> -- 
> 2.7.4
> 
