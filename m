Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74645209C18
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2020 11:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403900AbgFYJnY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jun 2020 05:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403854AbgFYJnX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jun 2020 05:43:23 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC41C061795
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:43:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so4890869wmh.4
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j45b6+I6ZWwo5WxhN+GENPgTL8D/dlpGydw4pkMbgwU=;
        b=FhgGj3eWSC1oHWyWzjIGtgCX9lx/ezhW5C4SRbb+zwdkKsAS/VCcdVQA7zvlH5L6bB
         xns15Dvy1K/2RZ75ELM9TI7FxopbjabZM6Rs6CpC1uStJ0up/tSvBTOKWuRLn0hp8dqi
         n3clD9tw81MhCHAdhAuOAM1a64/PP/E6Pj9iPIJ4mm/iU3uc8/BeX0ksXQXsDI2VQsOH
         72hia9pGoU1ngj60SObkuiwJYCdTRpIiX//NlUpSzT6UJY8PaQsezchlhDANZ5yPP9KC
         b+fAAhyEzRbO0sHF9OsxR034UrLImypDaYP40RaxKWK6q4rGvojBowjVVQJWLxLPwedB
         LMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j45b6+I6ZWwo5WxhN+GENPgTL8D/dlpGydw4pkMbgwU=;
        b=Qodqy/kot3ApIAVr8OgrpYlLnxyrsn+NGyXmfx3n7OX0Lq52N8mNRpiH1lEChedPQb
         +mDOkVvrvf60SkGyEZ3mBOdxtnGmcLXOMVRlXLgunkjHdjVzt5QszTnfUJQIU/Lq3maR
         Jb1wCXP7Um1pbbj0ohm/i1EcBRWer5KwSp3ielgZvrVuZk5/vGv5faoyYfs5VhtaKVz5
         L85Zjua9dKE8VWLqDKm68SY+rJfVQcd/toCW/b08Tpff0i4x79gaBBIAvIKD0yFmNhOI
         10ukF6ompTxsuIc0sMTH2XT6m050gglyZurVNvHq9vZXKZBVNUCswdxQtLDfSscK0JJv
         kmzw==
X-Gm-Message-State: AOAM53070eSm0xg30kprx/giOysWyxmpRHhxMJeVvniZ7vC/EC9BfF0s
        hhuwKR76Qepz+GIhoEVxmPu5/w==
X-Google-Smtp-Source: ABdhPJyVh2/u8gPyZu7/vGbROSHCxcfYm8e4mf1Wh34YtHnJmRVH7cCnSRaIAX6Gp4xYZgro0tnotA==
X-Received: by 2002:a1c:2402:: with SMTP id k2mr2437451wmk.138.1593078200289;
        Thu, 25 Jun 2020 02:43:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id t188sm11873191wmt.27.2020.06.25.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 02:43:19 -0700 (PDT)
Date:   Thu, 25 Jun 2020 10:43:18 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Software Engineering <sbabic@denx.de>
Subject: Re: [PATCH 5/8] backlight: ili922x: Add missing kerneldoc
 description for ili922x_reg_dump()'s arg
Message-ID: <20200625094318.h6t22gkgi5d7wbv4@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-6-lee.jones@linaro.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jun 24, 2020 at 03:57:18PM +0100, Lee Jones wrote:
> Kerneldoc syntax is used, but not complete.  Descriptions required.
> 
> Prevents warnings like:
> 
>  drivers/video/backlight/ili922x.c:298: warning: Function parameter or member 'spi' not described in 'ili922x_reg_dump'
> 
> Cc: <stable@vger.kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Software Engineering <sbabic@denx.de>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/backlight/ili922x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> index cd41433b87aeb..26193f38234e7 100644
> --- a/drivers/video/backlight/ili922x.c
> +++ b/drivers/video/backlight/ili922x.c
> @@ -295,6 +295,8 @@ static int ili922x_write(struct spi_device *spi, u8 reg, u16 value)
>  #ifdef DEBUG
>  /**
>   * ili922x_reg_dump - dump all registers
> + *
> + * @spi: pointer to the controller side proxy for an SPI slave device

Similar to previous... and I also noticed that there are several other
existing @spi descriptions in this file and it would be good to make
them consistent.


Daniel.

>   */
>  static void ili922x_reg_dump(struct spi_device *spi)
>  {
> -- 
> 2.25.1
> 
