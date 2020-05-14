Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA9A1D2FE7
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2020 14:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgENMhm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 May 2020 08:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725955AbgENMhm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 May 2020 08:37:42 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0409EC061A0C
        for <linux-fbdev@vger.kernel.org>; Thu, 14 May 2020 05:37:42 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j5so3885540wrq.2
        for <linux-fbdev@vger.kernel.org>; Thu, 14 May 2020 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w34+yydt15m63oHueozKI43M9FgZpWIQLSp+jJoneNc=;
        b=e9aC+t+1AWn+GBNk8udUi5A57evXgsw+F9q1iHmY3vlD3E8kA43XVDIYnG9V3xm68B
         FCFJ7rvjlbP4UB/TZsijLyVQ1kbajlm/kVuYa547rgf9p0/NvbE8RafbP7P9AZ+p5dPV
         tD334UKBTtHNlnIp6jO8wZRD3W/XOr9Vf2WzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w34+yydt15m63oHueozKI43M9FgZpWIQLSp+jJoneNc=;
        b=J/qckZwJDuwuERWzLbTY2T6qrRKEOarf3b9JRB2oKgtKwj/oR/pVOWIqlMOU+qdJoH
         dQ/VZDXM+D+mvP1UKxIBNk90MbCE1fnu5G2bR+kQmfQAOF4Njm617VZIl9NtYTV+dOld
         zuhJirgNfVmZcV7U9Fz+JUbqDsE/hVm0m45F9iChb6S5uEZIGxrBF/28RWxYg8aWRc1Y
         VV98EG6if49Ey7NZWlJ8qsmDv0YEgt3c/s9wsDgM6G1a+W04z4bJmqECDwFn6duMpcoI
         wWMcoGuSKySwMovvK/Xlj9pM2oFQ2+qOA7VAsndJfRAz9DVgBoelMh5ct5p4FB0voJa6
         1tKQ==
X-Gm-Message-State: AOAM5302opbW/ack1YL2eb7cyrmUzOa7O+xlSpeAASnWu6ydexjGD6AV
        /2DgYN2/D6NZbW4qrEVi18gnGQ==
X-Google-Smtp-Source: ABdhPJwwuh/8AkuSZPZulxuTxYjN+CMuoQTY/ngPdRDVzsewOeGDG8SgR2dLnt8VxV2pX1mnW/MzQQ==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr5022866wrn.190.1589459860755;
        Thu, 14 May 2020 05:37:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c19sm3973321wrb.89.2020.05.14.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 05:37:40 -0700 (PDT)
Date:   Thu, 14 May 2020 14:37:38 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: annotate rivafb/nvidiafb as obsolete
Message-ID: <20200514123738.GU206103@phenom.ffwll.local>
References: <20200513215342.2145495-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513215342.2145495-1-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, May 13, 2020 at 10:53:42PM +0100, Emil Velikov wrote:
> Drivers have not seen any love for years.
> 
> Be that fixes or improvements, or cosmetics like introducing symbolic
> names, style and code-flow polish.
> 
> Seemingly the maintainer has also disappeared years ago :-\
> 
> Considering nouveau supports all that hardware (modulo nv03) just mark
> these as obsolete/broken, referring to nouveau in the help text.
> 
> Cc: Antonino Daplas <adaplas@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Makes sense

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  MAINTAINERS                           | 3 +--
>  arch/powerpc/configs/g5_defconfig     | 2 --
>  arch/powerpc/configs/pasemi_defconfig | 2 --
>  arch/powerpc/configs/pmac32_defconfig | 2 --
>  arch/powerpc/configs/ppc6xx_defconfig | 3 ---
>  drivers/video/fbdev/Kconfig           | 6 ++++++
>  6 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 515a81fdb7d6..cc9da9a1e230 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11247,9 +11247,8 @@ F:	include/linux/nubus.h
>  F:	include/uapi/linux/nubus.h
>  
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> -M:	Antonino Daplas <adaplas@gmail.com>
>  L:	linux-fbdev@vger.kernel.org
> -S:	Maintained
> +S:	Obsolete
>  F:	drivers/video/fbdev/riva/
>  F:	drivers/video/fbdev/nvidia/
>  
> diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
> index ceb3c770786f..24225e39662a 100644
> --- a/arch/powerpc/configs/g5_defconfig
> +++ b/arch/powerpc/configs/g5_defconfig
> @@ -130,8 +130,6 @@ CONFIG_FB=y
>  CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_OF=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_RADEON=y
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
> index c0423b2cf7c0..36b242efae9a 100644
> --- a/arch/powerpc/configs/pasemi_defconfig
> +++ b/arch/powerpc/configs/pasemi_defconfig
> @@ -107,8 +107,6 @@ CONFIG_DRM_RADEON=y
>  CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_VGA16=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_RADEON=y
>  # CONFIG_LCD_CLASS_DEVICE is not set
>  CONFIG_VGACON_SOFT_SCROLLBACK=y
> diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
> index 50b610b48914..ef4470d44763 100644
> --- a/arch/powerpc/configs/pmac32_defconfig
> +++ b/arch/powerpc/configs/pmac32_defconfig
> @@ -211,8 +211,6 @@ CONFIG_FB_PLATINUM=y
>  CONFIG_FB_VALKYRIE=y
>  CONFIG_FB_CT65550=y
>  CONFIG_FB_IMSTT=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_MATROX=y
>  CONFIG_FB_MATROX_MILLENIUM=y
>  CONFIG_FB_MATROX_MYSTIQUE=y
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index 7c6baf6df139..5b4e26de0bcf 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -752,9 +752,6 @@ CONFIG_FB_OF=y
>  CONFIG_FB_PLATINUM=y
>  CONFIG_FB_VALKYRIE=y
>  CONFIG_FB_CT65550=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
> -CONFIG_FB_RIVA=m
>  CONFIG_FB_MATROX=y
>  CONFIG_FB_MATROX_MILLENIUM=y
>  CONFIG_FB_MATROX_MYSTIQUE=y
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 1b2f5f31fb6f..cad3e4bc5e52 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -868,6 +868,7 @@ config FB_ATMEL
>  
>  config FB_NVIDIA
>  	tristate "nVidia Framebuffer Support"
> +	depends on BROKEN
>  	depends on FB && PCI
>  	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>  	select FB_MODE_HELPERS
> @@ -877,6 +878,8 @@ config FB_NVIDIA
>  	select BITREVERSE
>  	select VGASTATE
>  	help
> +	  Obsolete, use nouveau instead.
> +
>  	  This driver supports graphics boards with the nVidia chips, TNT
>  	  and newer. For very old chipsets, such as the RIVA128, then use
>  	  the rivafb.
> @@ -915,6 +918,7 @@ config FB_NVIDIA_BACKLIGHT
>  
>  config FB_RIVA
>  	tristate "nVidia Riva support"
> +	depends on BROKEN
>  	depends on FB && PCI
>  	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
>  	select FB_MODE_HELPERS
> @@ -924,6 +928,8 @@ config FB_RIVA
>  	select BITREVERSE
>  	select VGASTATE
>  	help
> +	  Obsolete, use nouveau instead.
> +
>  	  This driver supports graphics boards with the nVidia Riva/Geforce
>  	  chips.
>  	  Say Y if you have such a graphics board.
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
