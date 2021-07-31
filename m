Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803423DC886
	for <lists+linux-fbdev@lfdr.de>; Sun,  1 Aug 2021 00:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhGaWFV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 31 Jul 2021 18:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbhGaWFU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 31 Jul 2021 18:05:20 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17BAC061798
        for <linux-fbdev@vger.kernel.org>; Sat, 31 Jul 2021 15:05:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id h9so18344312ljq.8
        for <linux-fbdev@vger.kernel.org>; Sat, 31 Jul 2021 15:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eavS7+nVlKa3pE/nMERuVdSNOcLN0CSyw0CYPXJs2RE=;
        b=oxTawDKtE7gUMCEZTGVhmlVv2Y3WYDP+FS3lOaHPAgoD7WcgQjYd0RzzaaCmE3977P
         y2AZlp+prHKgerutQ7jx1R/cVL6lbK+WzauqEJucT+Izj+ziz0I0tc0O+XwvtPwksIj1
         ukvPhZPy1rocK17IvtjWMFHZ1JmoIIqK4FLNFIt716WQ3Pie0UvlUCbiTbUjKG2RTcHV
         7aLptfufBWxUeUNmjY6/SgCFLiwOzAyRIGpCOm9JFIGiWEdzkbX1t7kvgcWoJlruvGQV
         TNKC7K+DYoXaKkZDcceTWufkpcffdIMAe8eG+6751qHasEPk6w4m+/EI6Gd9NCUzZuvT
         oxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eavS7+nVlKa3pE/nMERuVdSNOcLN0CSyw0CYPXJs2RE=;
        b=X5XVgeylcDDJSlvnhDdhUIWOu6Mdsl7b5vb4RQMk3TgLK8XDJhz0xU8geHFmxMahYI
         zD0nB/DXnp3WHgY7U+R6eM0QOHdDuHFZm2tulwaqkSuex3L/y8lysHc7yZgvOOgUKAYF
         kk74ggD7OTsVtSvJDHoD+QZd93TmD6aindn81hnJA9NLJEHyzzX+OIsFtReSEjKF9zIN
         /Ja2SW+BlPsUGz8DuuS7Z1P0IUVTnpBoAo+iKQiV9WRUxqUW750EASJTf9z3QbA7TPzv
         XkVcYZ36szJdoNkjk3l0fzzRQkF80Nyf2rpJp4WXL5SE3QXpyiNDzMSd9hKhgzQhTf3u
         xmqA==
X-Gm-Message-State: AOAM530Vsb0u4UJqAaI70yJnzcKHdpdPwL+hb+1R1esa614zPdTYfF2S
        t5CmAVaXmWL2w6ysVYCCUALt4tSGnoQq8rKoJ6t63jZJe0U=
X-Google-Smtp-Source: ABdhPJwTjpbUeZT+xrHLeSR/vD0UodSpw43lXDmx8pJiyALETra8HqJRQTMUGT7mTfcqIT7xDGsd2Eo06KRRqoQp1Bw=
X-Received: by 2002:a2e:bc14:: with SMTP id b20mr6401323ljf.200.1627769110442;
 Sat, 31 Jul 2021 15:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210726115058.23729-1-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 Aug 2021 00:04:59 +0200
Message-ID: <CACRpkdYeqJFFwkc6pfSrz3-gaN_PjjV52jstqzR2sMa+bxbMuQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] arm: ep93xx: CCF conversion
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" 
        <dmaengine@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, YiFei Zhu <yifeifz2@illinois.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jul 26, 2021 at 1:51 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:

> This series series of patches converts ep93xx to Common Clock Framework.
>
> It consists of preparation patches to use clk_prepare_enable where it is
> needed, instead of clk_enable used in ep93xx drivers prior to CCF and
> a patch converting mach-ep93xx/clock.c to CCF.
>
> Link: https://lore.kernel.org/patchwork/cover/1445563/
> Link: https://lore.kernel.org/patchwork/patch/1435884/
>
> Alexander Sverdlin (7):
>   iio: ep93xx: Prepare clock before using it
>   spi: spi-ep93xx: Prepare clock before using it
>   Input: ep93xx_keypad: Prepare clock before using it
>   video: ep93xx: Prepare clock before using it
>   dmaengine: ep93xx: Prepare clock before using it
>   ASoC: cirrus: i2s: Prepare clock before using it
>   pwm: ep93xx: Prepare clock before using it
>
> Nikita Shubin (1):
>   ep93xx: clock: convert in-place to COMMON_CLK

This series is looking very good.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose the per-subsystem patches can be picked up by
each subsystem maintainer and then you can send the "big patch"
to the SoC tree.

Yours,
Linus Walleij
