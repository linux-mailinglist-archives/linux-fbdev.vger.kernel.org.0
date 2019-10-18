Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F71DBE8C
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Oct 2019 09:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404665AbfJRHkM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Oct 2019 03:40:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46485 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393022AbfJRHkM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Oct 2019 03:40:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id o18so5047770wrv.13
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Oct 2019 00:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5iztkm06g93DGhL7MltWaye7ky43Diy2spcjfqFIzXg=;
        b=pJCPbtlKt6Rvp+pV9pRvRRTB2+C2HV3kB8c8I0/yqQfCX1XILLaTFo35IB5nQTJtDM
         r9tTOQbpFgwCznZAP7qrE4cjnzi9qj6ZmdZGM1h1W5XfeazaxmF2MQu7674gQ2JvQYEr
         2njL2yf4ovlyLYmjBr4GUucktQC+SrgIDf56mP73dW7lI8dxYXSRuGNBDTX7/SweYT2e
         riAEXLMNTeT5LEopMjCuOCz8mo1DZscS2DBrV7iO6lbt7JZpcOHcZSgvd4iCvqII523b
         d9g8mpFLw5ipUQ2n81QUKvjxUvNjgP/G6QBe5rqiruEoearvj6JcSGh2PPB4m2NZOlgO
         ra8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5iztkm06g93DGhL7MltWaye7ky43Diy2spcjfqFIzXg=;
        b=LZ7frFU8OCUe+OAXxDRzPzR01wWmdUnmCXNgbg4xgi89/WY8m48u7mpQ38tuVP1I8c
         LpqdD0KtVO8ey0lTF6W8Ut3MeVRpKCIJgrp64ZpKCEuJEFh/Mhvu7bNTQx7FYCgfUvgH
         1OZS2kSHMawl70Awp5XwZk/p+C8lrPPRa0wiIsJg6R2jC/97rsgaXEissjeBmmQRclM2
         fFvGvaYKhFO1hdniF9khvYpd31PYIcatVQUwosmmoDaD9Gwna2AP3RpN2pObAS7RoGR1
         sBMKAwnm9nr5BS7f2IACxbMtQykH3kz98WHc/0BeIo4wnAj5CEnuUX5+MNkvvr8tDYt0
         i1lA==
X-Gm-Message-State: APjAAAXt0p+hC+/YNJErumWEqLDeQrbKussVo42PVSMtMKQZcEaiVsx4
        zWptzVT3tiaMCWlpxDrY16ka4A==
X-Google-Smtp-Source: APXvYqyaR1yIy6/nHTciHSlsM7Yad4h/pKWcFB87SKBaPMe+VEelXm6J/rsxud+fKoJs55M7U1t4SQ==
X-Received: by 2002:adf:a141:: with SMTP id r1mr6580104wrr.122.1571384409625;
        Fri, 18 Oct 2019 00:40:09 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id y1sm5466054wrw.6.2019.10.18.00.40.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 00:40:09 -0700 (PDT)
Date:   Fri, 18 Oct 2019 08:40:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191018074007.GV4365@dell>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191015191821.11479-30-bigeasy@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 15 Oct 2019, Sebastian Andrzej Siewior wrote:

> From: Thomas Gleixner <tglx@linutronix.de>
> 
> CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
> Both PREEMPT and PREEMPT_RT require the same functionality which today
> depends on CONFIG_PREEMPT.
> 
> Switch the Kconfig dependency to CONFIG_PREEMPTION.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> [bigeasy: +LCD_HP700]
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/video/backlight/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
