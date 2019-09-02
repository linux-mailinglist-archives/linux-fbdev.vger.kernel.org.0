Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED9D1A564B
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 14:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730428AbfIBMfm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 08:35:42 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43468 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730271AbfIBMfm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 08:35:42 -0400
Received: by mail-io1-f68.google.com with SMTP id u185so25060962iod.10
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 05:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vnhw4cu5Y19Ngs/FcBn3AtSwpWd+bzaeBt1B8o4ltr0=;
        b=qpXZrNFOf8FMkMWjsohOjNNDkWvo69WRgme+57+rTRmXKIOiO1IiNxMMiGWCQSg94p
         uKQg1D4YEnLemazeoGnZOS6K926UhvmB4PXev0a0SIEKpuA04Frl8bbWXiPZzrc0iZpU
         S4kbzpImRnUHETvZHhfHwZEPB8D8zYmyebN2Ht/yydHW+1WdeXyGygmDjzQ4P1yCV0xv
         jIVdjwpC34AgTkw54p5aFkpzLRm0cjkZ050coecWNregtgHKkGE2lkr6argOPvK6AB4v
         RXkbdicD7E7yBQJ/cJLAX1RMugFIrBYYajEWSQxVQ+BhXGyVq7OdZkN609bfjzKec+6e
         6ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vnhw4cu5Y19Ngs/FcBn3AtSwpWd+bzaeBt1B8o4ltr0=;
        b=URN/NzEizy5sjTA1n1kXIYWnhaPDEuxEDB8Upv73v0duF87HUWSvT9m5yOkwW5y9Nj
         VTBIKDj38wGZBBiwRKqGLR6MZbs4408y84nQMyyhDuJWGyOBxAt0CQ3iNyZkhK6XzOHC
         oo4CKV6m3wP4XPPfId09lIZNzXQmxxyV3b65mFPIS3DHTbe1/dPx8TOjnbZiT0nFIof1
         7yL0m+s7ATUKK4GTw3p/xeJWIkTW+U2QS2E/U17CQw8R2/gBKS/XPPr7g5rwoQ5ET6wl
         nnsCyC+QGOJcgyRNm53Y+JuhlLpDECgyzosV7J55NHcZZvY7bufwSkjMvwP4jU6nq4NE
         Nvkw==
X-Gm-Message-State: APjAAAVBc8anLd2WvGLmdOhr/tXvuZh5WNFRogCU7ddBBz/w8vjc5G4A
        5aX6hSjcvRJGkJ+ItiMFJcsme6dKQKkhz5ij4opxBg==
X-Google-Smtp-Source: APXvYqwH4WnK2YgFBebstftIqR2c3baQcgor+d3PzdCtsmEbNLL45XxEHTEDeCGgnIkf7NhdFMpzDt1Jmy5oZMTkWgQ=
X-Received: by 2002:a5d:870b:: with SMTP id u11mr29928734iom.220.1567427741022;
 Mon, 02 Sep 2019 05:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl> <20190902093137.GI32232@dell>
In-Reply-To: <20190902093137.GI32232@dell>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Sep 2019 14:35:30 +0200
Message-ID: <CAMRc=Me2FYJDDHo=8noU5bPNdPXBL23jDU_3XQiPfRJ3-pGh7g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-sh@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

pon., 2 wrz 2019 o 11:31 Lee Jones <lee.jones@linaro.org> napisa=C5=82(a):
>
> On Wed, 24 Jul 2019, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > While working on my other series related to gpio-backlight[1] I noticed
> > that we could simplify the driver if we made the only user of platform
> > data use GPIO lookups and device properties. This series tries to do
> > that.
> >
> > The first patch adds all necessary data structures to ecovec24. Patch
> > 2/7 unifies much of the code for both pdata and non-pdata cases. Patche=
s
> > 3-4/7 remove unused platform data fields. Last three patches contain
> > additional improvements for the GPIO backlight driver while we're alrea=
dy
> > modifying it.
> >
> > I don't have access to this HW but hopefully this works. Only compile
> > tested.
> >
> > [1] https://lkml.org/lkml/2019/6/25/900
> >
> > v1 -> v2:
> > - rebased on top of v5.3-rc1 and adjusted to the recent changes from An=
dy
> > - added additional two patches with minor improvements
> >
> > v2 -> v3:
> > - in patch 7/7: used initializers to set values for pdata and dev local=
 vars
> >
> > Bartosz Golaszewski (7):
> >   sh: ecovec24: add additional properties to the backlight device
> >   backlight: gpio: simplify the platform data handling
> >   sh: ecovec24: don't set unused fields in platform data
> >   backlight: gpio: remove unused fields from platform data
> >   backlight: gpio: remove dev from struct gpio_backlight
> >   backlight: gpio: remove def_value from struct gpio_backlight
> >   backlight: gpio: use a helper variable for &pdev->dev
> >
> >  arch/sh/boards/mach-ecovec24/setup.c         | 33 ++++++--
> >  drivers/video/backlight/gpio_backlight.c     | 82 +++++---------------
> >  include/linux/platform_data/gpio_backlight.h |  3 -
> >  3 files changed, 44 insertions(+), 74 deletions(-)
>
> Can you collect all your Acks and re-submit please?
>

Done.

Bart

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
