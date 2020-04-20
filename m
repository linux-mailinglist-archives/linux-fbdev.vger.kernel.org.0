Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC901B101C
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Apr 2020 17:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgDTP3y (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Apr 2020 11:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgDTP3x (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Apr 2020 11:29:53 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C22C061A0C
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:29:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b11so12701838wrs.6
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Apr 2020 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rRuKmbK6PwqWVFEf4NCbIZ/sdAUEPs0XWhgaR5GQdu4=;
        b=BjfHQm3+4hBnp0JqjA408JQJh9WCU7VabxE1gH4uXEabh4Q8spOIaCWnHW/wrQ/LEX
         sCdl+8F3kzeSqsBYpYWgEbubA1mzRerxIXe3RDe6BzwNiSYvCHpv5Gh7/z84PsNpOiaM
         dHoWhTlrSuDUdGdPsQ84He3cMDcPVACyp5/HK24uY/plpHIc/vCy3f5Q5K5TqajFUmoX
         nMQOJoF761TJ6+NxwFYY78i7yrgv93k5yPso2cw+keCvT6rb2mJ7luHUOr9+IKBmW3zD
         xWi4VTqxq5eqk7/hUtukRnXrxuKbnhrbvIwgiiiXWlzfompI10Vq4KpsfvdSewGnfFcT
         37Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rRuKmbK6PwqWVFEf4NCbIZ/sdAUEPs0XWhgaR5GQdu4=;
        b=n6WB9dWxK8LeU9oBkMCQ2VWGWzC+TuUz8m3pJmGe8WHN/uUV8mNxrMPojkHESK/ydX
         swvNNMGxUl0U1xYvmfKFzYOb8TURydRzOo3X0/QEmLVfKWIPI+E35K/MxrPrq5rkQrkx
         Pv2M+/tEKSXg+cvV+8NkC/jmFMnkjqhJMmNMW78eRt/M9dHWrbyP/z5a4V+b1QXIR9KX
         sUUfrBX6lYbyonzaFGAb3aWIDqhuLXWWHjAaF6d/T9xJF5+YHuZTfO4wbJDIA5E5UJEv
         7XQ/9g6kbW4VMMMflbLz339QeAh1SA1DFqjC8xLGyw9+e4bd6B3g7I3/rv7SSxcOx6VY
         vFpQ==
X-Gm-Message-State: AGi0PubOhf9pn/cWldCxI2qtIKk4ih4gbChZJdI0Yr4JGMcATUrgjYuy
        uhQrbcw7TPM7sPvb+04MLU7BAVf3L8yevQ==
X-Google-Smtp-Source: APiQypK5RfbPvKdwfP8P/l0O9IIsLTzCSbRFf/E1gHpNWUtZ8QfVvGc/PqRja08Oj+g7RQAo24Q2Cg==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr21185532wru.219.1587396592213;
        Mon, 20 Apr 2020 08:29:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id l4sm1622167wrv.60.2020.04.20.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:29:51 -0700 (PDT)
Date:   Mon, 20 Apr 2020 16:29:50 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/5] backlight: led_bl: drop useless NULL initialization
Message-ID: <20200420152950.hbc54fzxta7lq5ug@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-2-tomi.valkeinen@ti.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Apr 17, 2020 at 02:33:09PM +0300, Tomi Valkeinen wrote:
> There's no need to set 'levels' to NULL.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/led_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index d4e1ce684366..c46ecdfe8b0a 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -140,7 +140,7 @@ static int led_bl_parse_levels(struct device *dev,
>  	if (num_levels > 1) {
>  		int i;
>  		unsigned int db;
> -		u32 *levels = NULL;
> +		u32 *levels;
>  
>  		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
>  				      GFP_KERNEL);
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
