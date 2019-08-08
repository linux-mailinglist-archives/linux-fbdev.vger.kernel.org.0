Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2907385C9E
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Aug 2019 10:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731837AbfHHIRM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 8 Aug 2019 04:17:12 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35162 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731763AbfHHIRM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 8 Aug 2019 04:17:12 -0400
Received: by mail-ot1-f67.google.com with SMTP id j19so38603060otq.2
        for <linux-fbdev@vger.kernel.org>; Thu, 08 Aug 2019 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dNM5N57Ioc8DGeTZqQ0rAIXdhWsFh5H0j1dVFwmVmb4=;
        b=gtTvn2IndIxQCjjyBbjHq+P0txQocLhuW0xeMXqj5eVcDPoq6BuVqI7IpQwk2ignJU
         8DyRLC//uN/6s4e1rWXVDWevrneTBo4+Q9LtC2vL7AMkKhAOJx/zCw92RkkPUkwDWzSg
         Z6NT0FKxGa9xWPFOpGlnTaPTBu2ViA8/jlzJ2yIIPPoicWJH3Z0vbjMwPgB7EacgrSfH
         bY5qy+QwCAe8+Cb4SG0+Ennjuw3jVUeJKC/t8B+QMcMwMz8hVDhbiATUYO+l5pkzllhX
         iA98x/+0bobd6W0fdIaTCHrNOytdTCvT5jvTWdGy1E0GmN3OM+5b5NAV4IwZjrFZhUek
         SK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dNM5N57Ioc8DGeTZqQ0rAIXdhWsFh5H0j1dVFwmVmb4=;
        b=sOqACVAPYftPojb4fWFEZq5WIpT6NAlOcjBVpWxdfJM2LbpGgDRhEFzs1hx8ibehdV
         b+nOpqXK6yeW36eHhwtXEkp96GJz++bFcu8YUu+mph/r/4qkrz/JcDGBSfGXNuD132Jb
         iYku6iIP6P1qvxPXZN3tltvxpgOCDzkcqy2iYY8LspeCo4ECts8mN+UNffP8RahHa/El
         K4IIwM1Fh86qq4Y1m414fvwHArd6N39UGSZMfGNAJRyiLfyZhPHktFOPVMcFNivkafbB
         O+7niM0P9xPCD3ahq2ef5nCKnQdx+wbBy2vcQotOK4qYDvwpPxJEDZ7vIhr/MzWqEHAg
         IT7Q==
X-Gm-Message-State: APjAAAXn8Y7QMcPbwEQVMT4I+an8dJEWAnEkgsoC2/7PW4UZg/sXOljY
        CMzb7nojPdswPzbuGXjbkb4YdjkB8OyaTF8jo1QOrg==
X-Google-Smtp-Source: APXvYqwRT6RNZjkYIS7Txd9d/bJwV7lSsUOLdoji98fPLPn7Ri1bmULRrvDu/Ajv9YIyI8JGyUg6MQO3Oo7ThI1tBJc=
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr13530588ioh.40.1565252231701;
 Thu, 08 Aug 2019 01:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 8 Aug 2019 10:17:00 +0200
Message-ID: <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-sh@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

=C5=9Br., 24 lip 2019 o 10:25 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> While working on my other series related to gpio-backlight[1] I noticed
> that we could simplify the driver if we made the only user of platform
> data use GPIO lookups and device properties. This series tries to do
> that.
>
> The first patch adds all necessary data structures to ecovec24. Patch
> 2/7 unifies much of the code for both pdata and non-pdata cases. Patches
> 3-4/7 remove unused platform data fields. Last three patches contain
> additional improvements for the GPIO backlight driver while we're already
> modifying it.
>
> I don't have access to this HW but hopefully this works. Only compile
> tested.
>
> [1] https://lkml.org/lkml/2019/6/25/900
>
> v1 -> v2:
> - rebased on top of v5.3-rc1 and adjusted to the recent changes from Andy
> - added additional two patches with minor improvements
>
> v2 -> v3:
> - in patch 7/7: used initializers to set values for pdata and dev local v=
ars
>
> Bartosz Golaszewski (7):
>   sh: ecovec24: add additional properties to the backlight device
>   backlight: gpio: simplify the platform data handling
>   sh: ecovec24: don't set unused fields in platform data
>   backlight: gpio: remove unused fields from platform data
>   backlight: gpio: remove dev from struct gpio_backlight
>   backlight: gpio: remove def_value from struct gpio_backlight
>   backlight: gpio: use a helper variable for &pdev->dev
>
>  arch/sh/boards/mach-ecovec24/setup.c         | 33 ++++++--
>  drivers/video/backlight/gpio_backlight.c     | 82 +++++---------------
>  include/linux/platform_data/gpio_backlight.h |  3 -
>  3 files changed, 44 insertions(+), 74 deletions(-)
>
> --
> 2.21.0
>

Hi Rich, Yoshinori,

can you ack the sh patches in this series?

Bart
