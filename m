Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA62209C12
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2020 11:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390952AbgFYJla (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jun 2020 05:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389532AbgFYJla (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jun 2020 05:41:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64DFC061573
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:41:29 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z13so5133249wrw.5
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o1jD7J8NDVqOQc9AKq7CATicHwQZYtpzJ7cR9sOfFqw=;
        b=KHHYFSoy24G/mXyVtLft9wFkNpYC2Pktesf5tHqTuFFWhOYFY1uLmbdKS9K7U4hBvQ
         n7iwkmWESbQO2d3LySeThLR8EMVDTCNtpIF/0NoRbndmxwkd59b0E0TEA+EScemuQz3w
         BUZ82dIyTxeMrB+/XJg38uVhDfKVznLpqjf27nHqgvNpoAAyXfuX13zFn/cepgtKDKVf
         gos2hUBI6fOo+KynmRO1otG/CrSzPyazUoownlH2w66Xl1P2qh4QDEfkz8iC7yhmbao2
         hjyaIoRYWZwRMfSxsu5SExtGw8xmz9TPS5M3MyRUnRgnD5xIqmw7hKs5YJrpFIDnV4Uy
         gJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o1jD7J8NDVqOQc9AKq7CATicHwQZYtpzJ7cR9sOfFqw=;
        b=f88M1sPmFGfr546UO35ReOlQUhd97sYrmBB2NOBh04chjLgQbDXZxcpii2ijp3Qazi
         ECHz97bc5hUQowCvHweugeEeVxnxjmTPXuZQDalKrznsAEjUzJrLA//k3x4O1PpssO5o
         qr1uiZgGGfAhH8xKJftuGF+VHn4nRNtdEgo+Vx+GKX8oXQUI5Rvk1gM2uNy3iRncsoa5
         efeHFFhj6nHnFMHKJfg7XqgFc+HOmoNKitBI5Z/LR9tBMN/2m5mSsFxURXZXZcSV/G6x
         mxS0MtWDDz8DEfkHEl2EwGwjdMtlHy9EX7cLByUvvFG+vpSKnOMmXK9DYuEvtSMSAu40
         nXFg==
X-Gm-Message-State: AOAM533bIs41DdSAwsFRJUaC+Q+8gOAaiuKW78ra2B4AonF8F1Qbs4fK
        z8sYsrBxj/hXHsXKqragLue1QA==
X-Google-Smtp-Source: ABdhPJwqVIF3U4RpHKFRh/x+HzkKFYCTnP8uQGV7G4OL1b+Bw0pR+kNSz0MBfG7un3od3TOn8lviaA==
X-Received: by 2002:adf:8462:: with SMTP id 89mr20649914wrf.420.1593078088492;
        Thu, 25 Jun 2020 02:41:28 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id o7sm9921492wmb.9.2020.06.25.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 02:41:27 -0700 (PDT)
Date:   Thu, 25 Jun 2020 10:41:26 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Software Engineering <sbabic@denx.de>
Subject: Re: [PATCH 4/8] backlight: ili922x: Remove invalid use of kerneldoc
 syntax
Message-ID: <20200625094126.jp5e7x64sjdu7med@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-5-lee.jones@linaro.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jun 24, 2020 at 03:57:17PM +0100, Lee Jones wrote:
> Kerneldoc is for documenting function arguments and return values.
> 
> Prevents warnings like:
> 
>  drivers/video/backlight/ili922x.c:127: warning: cannot understand function prototype: 'int ili922x_id = 1; '
>  drivers/video/backlight/ili922x.c:136: warning: cannot understand function prototype: 'struct ili922x '
> 
> Cc: <stable@vger.kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Software Engineering <sbabic@denx.de>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/ili922x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> index 8cb4b9d3c3bba..cd41433b87aeb 100644
> --- a/drivers/video/backlight/ili922x.c
> +++ b/drivers/video/backlight/ili922x.c
> @@ -123,7 +123,7 @@
>  
>  #define set_tx_byte(b)		(tx_invert ? ~(b) : b)
>  
> -/**
> +/*
>   * ili922x_id - id as set by manufacturer
>   */
>  static int ili922x_id = 1;
> @@ -132,7 +132,7 @@ module_param(ili922x_id, int, 0);
>  static int tx_invert;
>  module_param(tx_invert, int, 0);
>  
> -/**
> +/*
>   * driver's private structure
>   */
>  struct ili922x {
> -- 
> 2.25.1
> 
