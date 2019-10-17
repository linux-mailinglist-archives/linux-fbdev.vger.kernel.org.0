Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E791DAB50
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Oct 2019 13:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439728AbfJQLhM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Oct 2019 07:37:12 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39766 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439726AbfJQLhL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Oct 2019 07:37:11 -0400
Received: by mail-wm1-f68.google.com with SMTP id v17so2166773wml.4
        for <linux-fbdev@vger.kernel.org>; Thu, 17 Oct 2019 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kz81GWsdy+gT4h09Jxnw2SGeMu79bPfNDv5X5wml0Ow=;
        b=wsOtMSHpdRb6Eyt0a4RIHj3ouio4xANV3N5raaZk1cU6ih1BY7YK6f325AhA1diobG
         BoWDhKGQOnDjqitMuKFbONryFjMvYhZmmtl5rmPznmkTrsP/nAWrpY0aOqIlR1HAARM7
         N/1QBXvBRGJE7dzNZi8tAMcuJ1bPouAvd/7WSc9b0ZQOoHsKqZBvcPsPddV4pI0Iho5Z
         DgQO9eIECjl+wUtc+XLAFN3gZWbGdpPq3rWLFAoaw+88iW2ze6C5XjKTY0IQJsCRoKQ9
         ZLY5Mi8HF9bcMw+3rZd+S2RC9xAefNibIiecULZ6nBDr1NAtYRifeOwAy2lom3/e9mrJ
         ZcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kz81GWsdy+gT4h09Jxnw2SGeMu79bPfNDv5X5wml0Ow=;
        b=SNp3goocE/NcAOqAhLZH9AwqKSqVubBZxwd1I0LiXj/eeNOSS/M4jwkuP4eaPeztGU
         XOKnRJ5r+eeVceBhoGtMLfWjwB/PmO4oEzTzfZZyMCYTrJcF6j8J7EaMAnl1b2f/udOr
         Ric4FiPjqUFtTh04g9uCCE/1DZSaVGVuOyflWNix3NBdZb2OOVzyV9WP+94ondXOi8ty
         bke2dHJk07DKGeGRIu+ktngJZgVs00MSTYaBKPG4Ec3kyIx3FqQduABr+C65UOcZeVQm
         5Bn5KbMhyHnj0247UOjB9Af4gu8b4KTl/uUdlZ89/Q5w+evEHsYuRraVN9+dOsYRecRG
         pAnQ==
X-Gm-Message-State: APjAAAUhFUCA8QwIXpa4iT/R8kiVmFqhi7kbi/veoy81A9KzS6tzFAPh
        LxHjVE3u4DqUJ8KrgvamdwmANQ==
X-Google-Smtp-Source: APXvYqwVcAbF9NKa2DBqA54nZM8E1xuownksYgsSe+rQmhJK4e6KkHf1SfpZesJWdHwSR9jrw3iaOw==
X-Received: by 2002:a1c:1dc9:: with SMTP id d192mr2631862wmd.51.1571312229630;
        Thu, 17 Oct 2019 04:37:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u1sm2020090wrp.56.2019.10.17.04.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 04:37:08 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:37:07 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015191821.11479-30-bigeasy@linutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Oct 15, 2019 at 09:18:16PM +0200, Sebastian Andrzej Siewior wrote:
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

(I know... the review for this particular patch is trivial but an
Acked-by from a maintainer means something specific and it is Lee
Jones who coordinates landing cross sub-system patch sets for
backlight).


Daniel.

> ---
>  drivers/video/backlight/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 40676be2e46aa..d09396393724b 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -99,7 +99,7 @@ config LCD_TOSA
>  
>  config LCD_HP700
>  	tristate "HP Jornada 700 series LCD Driver"
> -	depends on SA1100_JORNADA720_SSP && !PREEMPT
> +	depends on SA1100_JORNADA720_SSP && !PREEMPTION
>  	default y
>  	help
>  	  If you have an HP Jornada 700 series handheld (710/720/728)
> @@ -228,7 +228,7 @@ config BACKLIGHT_HP680
>  
>  config BACKLIGHT_HP700
>  	tristate "HP Jornada 700 series Backlight Driver"
> -	depends on SA1100_JORNADA720_SSP && !PREEMPT
> +	depends on SA1100_JORNADA720_SSP && !PREEMPTION
>  	default y
>  	help
>  	  If you have an HP Jornada 700 series,
> -- 
> 2.23.0
> 
