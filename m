Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1221323D35B
	for <lists+linux-fbdev@lfdr.de>; Wed,  5 Aug 2020 23:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgHEVEw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 5 Aug 2020 17:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgHEVEv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 5 Aug 2020 17:04:51 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D7AC06174A
        for <linux-fbdev@vger.kernel.org>; Wed,  5 Aug 2020 14:04:50 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c15so23898823edj.3
        for <linux-fbdev@vger.kernel.org>; Wed, 05 Aug 2020 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V2PZXILdefiTwwzfO5OUUQBgzK17xy7UQ4vY/f0A1uM=;
        b=aPqJee4+/II1pDeHm6YJT9N8szJtyfH8/u0a/mb/rUh0XKwrO9/lI6mAKg/YUjZsap
         p0B7nL/zuMyT3EsRGWbvq29/0Lc9irQLp5boKwUO0dgr7wICe4bQ/VVNo2zfxFQFtKUF
         aTAuAP1cEHDioLUgDXQmFNnV10RJlUC2CPrZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V2PZXILdefiTwwzfO5OUUQBgzK17xy7UQ4vY/f0A1uM=;
        b=kLmDViV10ROYIcXc1it8faQtuE0DSlm3WLI+XDrscXu7wXH2Y0lG3cP4wVz3c0ecKv
         S4F7WiJkIrPuyt7nH0BTKxqrq8/bpM5FVZpXLLqVYBlLqxPpKWP+Y3nUT4GVgopBKTDi
         T5vmzNuoYJzYcvNahxcMBhmaUZS4bushwOyHCn2PxpyK6k+9cPFA89wrLQeXBXPiKsuE
         l/MiCJ51w/ww+r2L1qrNJVI7PfIA9AqR45tPsdvF0f+LtDyR4jsJAjaWOpO5ZKMj92kt
         qgIe54ZGAfFD9oOkSbk048LEIBHXwvVXdUfgEU1UlyVaZjIMFrW8gY+wHGk4Y+LCTT+8
         DAdw==
X-Gm-Message-State: AOAM532qmh/a3G4RHsv8RhD0xouYhZUvN0qipdCFTKyaPhdsabwo61v2
        wFBovCPcNYbmKITOpaGo90B3Agfby2M=
X-Google-Smtp-Source: ABdhPJzAtZs0pMrmSfJOJJaL7NBv7/iEhemyPDusA7BakiQzDX0M67IwfhFdimGuvMfG7doT5BBwKA==
X-Received: by 2002:aa7:c50b:: with SMTP id o11mr1088710edq.59.1596661488579;
        Wed, 05 Aug 2020 14:04:48 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id dm5sm2173488edb.32.2020.08.05.14.04.46
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 14:04:47 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id bs17so14811385edb.1
        for <linux-fbdev@vger.kernel.org>; Wed, 05 Aug 2020 14:04:46 -0700 (PDT)
X-Received: by 2002:a05:6402:28f:: with SMTP id l15mr1118783edv.233.1596661486208;
 Wed, 05 Aug 2020 14:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200721042522.2403410-1-amstan@chromium.org>
In-Reply-To: <20200721042522.2403410-1-amstan@chromium.org>
From:   Alexandru M Stan <amstan@chromium.org>
Date:   Wed, 5 Aug 2020 14:04:09 -0700
X-Gmail-Original-Message-ID: <CAHNYxRzwQ2jx99M0oyNv8CDE4h051jcdAdYFjRd8mhNjB19FgA@mail.gmail.com>
Message-ID: <CAHNYxRzwQ2jx99M0oyNv8CDE4h051jcdAdYFjRd8mhNjB19FgA@mail.gmail.com>
Subject: Re: [PATCH 0/3] PWM backlight interpolation adjustments
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jul 20, 2020 at 9:27 PM Alexandru Stan <amstan@chromium.org> wrote:
>
> I was trying to adjust the brightness for a new chromebook:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2291209
> Like a lot of panels, the low end needs to be cropped,
> and now that we have the interpolation stuff I wanted to make use of it
> and bake in even the curve.
>
> I found the behavior a little unintuitive and non-linear. See patch 1
> for a suggested fix for this.
>
> Unfortunatelly a few veyron dts files were relying on this
> (perhaps weird) behavior. Those devices also want a minimum brightness.
> The issue is that they also want the 0% point for turning off the
> display.
> https://github.com/torvalds/linux/commit/6233269bce47bd450196a671ab28eb1ec5eb88d9#diff-e401ae20091bbfb311a062c464f4f47fL23
>
> So the idea here is to change those dts files to only say <3 255> (patch
> 3), and add in a virtual 0% point at the bottom of the scale (patch 2).
>
> We have to do this conditionally because it seems some devices like to
> have the scale inverted:
>   % git grep "brightness-levels\s*=\s*<\s*[1-9]"|cat
>   arch/arm/boot/dts/tegra124-apalis-eval.dts:             brightness-levels = <255 231 223 207 191 159 127 0>;
>
>
> Alexandru Stan (3):
>   backlight: pwm_bl: Fix interpolation
>   backlight: pwm_bl: Artificially add 0% during interpolation
>   ARM: dts: rockchip: Remove 0 point in backlight
>
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts    |  2 +-
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts |  2 +-
>  arch/arm/boot/dts/rk3288-veyron-tiger.dts  |  2 +-
>  drivers/video/backlight/pwm_bl.c           | 78 +++++++++++-----------
>  4 files changed, 42 insertions(+), 42 deletions(-)
>
> --
> 2.27.0
>

Hello,

Friendly ping.
Let me know if you would like me to make any changes to my patches.

Thanks,
Alexandru M Stan
