Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B76928B9ED
	for <lists+linux-fbdev@lfdr.de>; Tue, 13 Aug 2019 15:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbfHMNUD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 13 Aug 2019 09:20:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33203 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729005AbfHMNUC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 13 Aug 2019 09:20:02 -0400
Received: by mail-wm1-f66.google.com with SMTP id p77so1067404wme.0
        for <linux-fbdev@vger.kernel.org>; Tue, 13 Aug 2019 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xfLZK+aLXf7IAAQGT9kpcQjUA//C9TO1nW5nQQ+lsfA=;
        b=HHI7V9VWxdEm2ldMnuSEETf9TtQRRvw0u9IpAnbFdEDIldH0obuMMaRec5Agi5HTUa
         5IW6bcvigEZ8VrczojbBgrCbpZx2BecDQoam7fTeIDEgcnUem6nskJgAs3Z2oqzXxqID
         fI1giGDh1UEvzwuXJqe8vE/Ffyw+loocGo/rm8EmKNGyoz7QnMWQzpbYZ0x4/Rwpev8I
         FE2xzCTqbj/+xYrlcb4PnJZVB0DNbOv0IulMGdy/Yifvnur34UyvGrDqYU5JeqHGz00R
         O3LewDnqlT66dXkbyGQk+3uviMvG6EZ6SgIRA8KX1hSAP/JykmwXkxfDQls710u+6arZ
         CaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xfLZK+aLXf7IAAQGT9kpcQjUA//C9TO1nW5nQQ+lsfA=;
        b=oYIuf1Pw0qEuvkukN+5e1WB7lJVD717ihPSw7GnYEzD+7OHfHmefa1aK6azAtBdWTS
         8ebiZduYgpIVM/+XWWg0XKq04E4rS36DtgatdpeQKeULGqB9aOYvtILDRLemAA4wa5gU
         PEztqjVDtEJ4bcj3gSUnjM18MvEKyZDScTOYdAbzf6vaqxcZFqRsJ+w3tkZaeNIb8QZz
         npTD+/PZuZJQeKnIB0tUR4mr960oZ9BCEozqs7pMnwNKg5kDWIilZUQDt/Ia2L2IUsuW
         EsRZ/+M1Tu+tx4kqXA31Oon5xP+iNyusyDdKHwYEFpgqD8Wj4BTsFOPlKYOJM4YlGYqC
         hsXQ==
X-Gm-Message-State: APjAAAUABaQyNmw5bHElviF9IWLiUyoizovpe+Aw+lBiSNOiIwEQu1Ml
        Dw093EwfsKg+ERO4DVkFUdclOA==
X-Google-Smtp-Source: APXvYqxD9JIaAO8mg/yD2uQuL4bLr+ORAdUW5lgxOkILCPRyLV+UcWdOnX80lXIzt9mo7IA3xJko4w==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr3274136wmc.151.1565702400644;
        Tue, 13 Aug 2019 06:20:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id d207sm1225341wmd.0.2019.08.13.06.19.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 06:20:00 -0700 (PDT)
Date:   Tue, 13 Aug 2019 14:19:58 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alexander Shiyan <shc_work@mail.ru>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] video: backlight: Drop default m for
 {LCD,BACKLIGHT_CLASS_DEVICE}
Message-ID: <20190813131958.y3fgzeeuzhsfddbh@holly.lan>
References: <20190813115853.30329-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813115853.30329-1-geert@linux-m68k.org>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Aug 13, 2019 at 01:58:53PM +0200, Geert Uytterhoeven wrote:
> When running "make oldconfig" on a .config where
> CONFIG_BACKLIGHT_LCD_SUPPORT is not set, two new config options
> ("Lowlevel LCD controls" and "Lowlevel Backlight controls") appear, both
> defaulting to "m".
> 
> Drop the "default m", as options should default to disabled, and because
> several driver config options already select LCD_CLASS_DEVICE or
> BACKLIGHT_CLASS_DEVICE when needed.
> 
> Fixes: 8c5dc8d9f19c7992 ("video: backlight: Remove useless BACKLIGHT_LCD_SUPPORT kernel symbol")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 8b081d61773e21eb..40676be2e46aae61 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -10,7 +10,6 @@ menu "Backlight & LCD device support"
>  #
>  config LCD_CLASS_DEVICE
>          tristate "Lowlevel LCD controls"
> -	default m
>  	help
>  	  This framework adds support for low-level control of LCD.
>  	  Some framebuffer devices connect to platform-specific LCD modules
> @@ -143,7 +142,6 @@ endif # LCD_CLASS_DEVICE
>  #
>  config BACKLIGHT_CLASS_DEVICE
>          tristate "Lowlevel Backlight controls"
> -	default m
>  	help
>  	  This framework adds support for low-level control of the LCD
>            backlight. This includes support for brightness and power.
> -- 
> 2.17.1
> 
