Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93DA209C0E
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2020 11:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390445AbgFYJk4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jun 2020 05:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389532AbgFYJkz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jun 2020 05:40:55 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103C1C061573
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:40:55 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j4so2654870wrp.10
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TlmH6CUdIAxBdzHoXkJA+99qDumm1XXj1357pinG+ZI=;
        b=YcmE+Im9XZ7cBXoYmYZkFd+TUXCQKZaFtyX9M0aBLCnTaDtwFXG10K875A7mhoZgFt
         71yo/XAjAgPkE6om6A1NlAGHl5mT5y+rnAdDz3TI3Bz7sJi8vkncQfEH9CTwuAIpUyc0
         fbTj0m2ZDGn7crejTzpH8uULmP6iMzU3QGX51+wJhV86k/NL3gAuPAKmhU89hYWVGoxI
         ddnqMAc2yOq5YxlYo6U+wHMioDAziVOu84iKChzwHytbpmGwuL5s1IZt26PKbH5oM4+T
         8rbFbtcP259jH0szLCcN2Snog/qW6IEqmYSOkq1HVbKvvLIkllftm6UYFoAOg6mchBRA
         yk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TlmH6CUdIAxBdzHoXkJA+99qDumm1XXj1357pinG+ZI=;
        b=IMJiTMjD/3NMkSykcm13ayvBdzHZWTWWqDlUyQ8xhOVNepze3bE9IGBRHNjao1jVb2
         WrqIwXr5l9gD4PLr04wuJ488g0thmvqkrAYs5uJwh4GlsI++h3qcPh5hDrmaD0W1wqk8
         Jh5iMXWk1n4JUaUYkPPYBHJgvczac5mYkGcHbi9gn7wScvKHba/qBZ2MJ0XOJbg/ph+j
         NICbXJJQnMrWBsVrrZ69pyMCskwH/TlCOGyli5eDYbnFw70JTevlKeB4CLjDa1JbHqg1
         vu0cFRYMdE7KcELU9kGz5I3QY1R6j0Dra3QlkpSorJ9CdFxvl1sJ6sSoBr8JIcIWARJi
         uKJg==
X-Gm-Message-State: AOAM530n1YnPWlsMGdvaftgPEyUiKJ5vL+Cq/jcfUbeV0oRkEaQgrBYU
        RhLPxI5EUWfg9PTP3JBubkBQmg==
X-Google-Smtp-Source: ABdhPJy87UtoAD2RwowyPkHPcmUfIwaVK7ldX8ETiKlJPlPgPIPmViUdDBSNcBx2Wk03qCIhThHFvQ==
X-Received: by 2002:adf:b608:: with SMTP id f8mr36492832wre.363.1593078053819;
        Thu, 25 Jun 2020 02:40:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id d9sm30518424wre.28.2020.06.25.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 02:40:53 -0700 (PDT)
Date:   Thu, 25 Jun 2020 10:40:51 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Software Engineering <sbabic@denx.de>
Subject: Re: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc
 descriptions for CHECK_FREQ_REG() args
Message-ID: <20200625094051.u4hanl3rycczlwiy@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-4-lee.jones@linaro.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jun 24, 2020 at 03:57:16PM +0100, Lee Jones wrote:
> Kerneldoc syntax is used, but not complete.  Descriptions required.
> 
> Prevents warnings like:
> 
>  drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 's' not described in 'CHECK_FREQ_REG'
>  drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 'x' not described in 'CHECK_FREQ_REG'
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
> index 9c5aa3fbb2842..8cb4b9d3c3bba 100644
> --- a/drivers/video/backlight/ili922x.c
> +++ b/drivers/video/backlight/ili922x.c
> @@ -107,6 +107,8 @@
>   *	lower frequency when the registers are read/written.
>   *	The macro sets the frequency in the spi_transfer structure if
>   *	the frequency exceeds the maximum value.
> + * @s: pointer to controller side proxy for an SPI slave device

What's wrong with "a pointer to an SPI device"?

I am aware, having looked it up to find out what the above actually
means, that this is how struct spi_device is described in its own kernel
doc but quoting at that level of detail of both overkill and confusing.


Daniel.


> + * @x: pointer to the read/write buffer pair
>   */
>  #define CHECK_FREQ_REG(s, x)	\
>  	do {			\
> -- 
> 2.25.1
> 
