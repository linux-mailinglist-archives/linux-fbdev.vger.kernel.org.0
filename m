Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8857F564B0
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Jun 2019 10:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfFZIfq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Jun 2019 04:35:46 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36533 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZIfp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Jun 2019 04:35:45 -0400
Received: by mail-ed1-f66.google.com with SMTP id k21so2075800edq.3
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Jun 2019 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JqRY3G6bsNlFjD5Nz71/DLy/L1FwnYgjl3T+44Bf528=;
        b=BzNRyMrpn68XLRzN46dz9engyxCRiW0M0laNt9vBGAExvBjVQa8I7yqlmkg34L/C/M
         whbLYiBT/ZTCw94H2DNgrggOUXHPOoRPQLBaeBoduxT0wZ6vjb9vgvH0+aW68616qvBT
         +IuH54+ALzn9il2kQgfrQES/KtxVRryBV/kKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JqRY3G6bsNlFjD5Nz71/DLy/L1FwnYgjl3T+44Bf528=;
        b=LF62q2tzCSQkjlxUjvMsYBxR91b5b+qGLtpXz5TPaLzNFqaMNWLAf0wsW3qrLS6DNk
         0cANY2dEL+krBOvamR/vjiZcfcWp5UJz3qfCPZvUUrmlzbD40ESeTlEN9yg1VqH6F6Yw
         N44kCCvA3FqCGKE6UUWBweZuyDF8KWOcy3Ep5aphsakLxp0iX35dzoGf+t+UNBq0wAoU
         igmngIZ7nk9YGDR9WME5Honf+dgdML7EPBrM96OZw4Mvzj9aaf7kN2Ka6sBW8h8PFIXC
         UWIJL/vkHfICYDxjB5blmIIC+y159yjPNy47V7vMDspOkLOEmWVAIb00aTGIzk9rSQ2J
         AhZA==
X-Gm-Message-State: APjAAAU33kf9tiZmETIY3Gw1VqGMlwM2PH+F5DXNxWvg6bgfDurCLAXI
        aaXP2YEb9XEgJsWuRGPhP1AbBg==
X-Google-Smtp-Source: APXvYqzDjN7hHzC1x37EU289kuOeL8M2SyVHP1HPaiKKVsQvJ5g9IZaLMT/8kFtpSNXI4zX0tT8XGA==
X-Received: by 2002:a17:906:9144:: with SMTP id y4mr2963695ejw.16.1561538144223;
        Wed, 26 Jun 2019 01:35:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id d23sm2118641ejj.50.2019.06.26.01.35.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 01:35:43 -0700 (PDT)
Date:   Wed, 26 Jun 2019 10:35:41 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>, linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
Message-ID: <20190626083541.GJ12905@phenom.ffwll.local>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jun 24, 2019 at 11:21:53AM +0200, Daniel Vetter wrote:
> Fixes linking fail when fbcon/fbdev is modular and vgaswitcheroo is
> enabled:
> 
> x86_64-linux-gnu-ld: drivers/gpu/vga/vga_switcheroo.o: in function `vga_switchto_stage2':
> vga_switcheroo.c:(.text+0x997): undefined reference to `fbcon_remap_all'
> 
> v2: I first tried to fix this with an EXPORT_SYMBOL, but vga_switcheroo is
> never a module, so this doesn't work.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Yisheng Xie <ysxie@foxmail.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

> --
> wrt merging probably best if Maarten adds this to the topic branch we
> have already and sends out an updated pull request.
> 
> Apologies for the mess.
> -Daniel
> ---
>  drivers/gpu/vga/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
> index 84ab482d0db6..c8c770b05ed9 100644
> --- a/drivers/gpu/vga/Kconfig
> +++ b/drivers/gpu/vga/Kconfig
> @@ -23,6 +23,7 @@ config VGA_SWITCHEROO
>  	depends on X86
>  	depends on ACPI
>  	depends on PCI
> +	depends on (FRAMEBUFFER_CONSOLE=n || FB=y)
>  	select VGA_ARB
>  	help
>  	  Many laptops released in 2008/9/10 have two GPUs with a multiplexer
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
