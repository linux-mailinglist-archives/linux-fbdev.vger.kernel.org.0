Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F359FBD9
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Aug 2019 09:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfH1HdC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 28 Aug 2019 03:33:02 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33866 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfH1HdC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 28 Aug 2019 03:33:02 -0400
Received: by mail-io1-f67.google.com with SMTP id s21so4045975ioa.1
        for <linux-fbdev@vger.kernel.org>; Wed, 28 Aug 2019 00:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NfLQvLEN/4SUIg24wd6k61cmwl9/5gsSQNSZs//BCak=;
        b=PB/byqaJIzgXNpaKr0qKZqv+zcI4c1KjyuogKO7hLrB97+Zr+EVPM5gHnEVACggvzH
         YqmL2PNOSF4YBF/nIFviD/kKRvFeu4KUO8GrSvfRxYt/lhWFiYTK0GVTchFl3N9Z6Sr2
         bVJKDeuQ23rxZaL/KVQETgb/we8cEClXdiIwBicotlyJ1nDmDCjIk3J9/ok7pFulyeWP
         oyPMRucL6LMGFiTymfnqEWhPnthDy/2LabhScB8aoBlvipVBPHFuOcnsLNJWumcbmj88
         yXZO+1D1ikWjRK5B420Pn+LS+uQ8WHMeFllsxQwq4J3a3lEIeiIdAxMrux2R/F2KTHhs
         7aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NfLQvLEN/4SUIg24wd6k61cmwl9/5gsSQNSZs//BCak=;
        b=bhOQaXiQq97bDB2SeFaNY87MADMGSpM8V9lk+cyhDRvCBnPVwIIKql+DPHhfahl7eN
         OezmD/BF9BpCXkGS8CUsN5P+FAMHn80bo405Gq4AAeULsortDWQqgU7c3bY3uvgeD7JJ
         BnASTRGZGCrfXRY9aVK9bX4GRmwH5Vwz3pD8gR4lTPfqBkogYU1mqXjUnYF1096WC0P6
         9iKPerTJGouQUmPa4K/L90Gx9zdVgbWzpXHKFEYK6cooPlf2C0+EgekHjjrzOrkPXyk1
         IkpWc6n7sQGpW8Do2EslBWldRMGYmguZ/FPhWxMCS8esstUlPDCDg1TUldULel0IqmYd
         c7kQ==
X-Gm-Message-State: APjAAAWrZp1x9mZqYGX8KN3DflBo89CwA3fS3tLqx5xcfWu+IQumac7V
        qaTlQwEYz1YAKMO26oQhQzi5UgxwT0hTdoC+tcdNRQ==
X-Google-Smtp-Source: APXvYqxyUmBc7xgLnurv7r6uzQ6OCQX9cf5146mwYYO7o3wbWn1QAT5k46aSsfIFz7OOJ4gg7Gt4Y44wqYi3bGKmLGg=
X-Received: by 2002:a6b:901:: with SMTP id t1mr2978915ioi.6.1566977581776;
 Wed, 28 Aug 2019 00:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl> <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
 <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
In-Reply-To: <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Aug 2019 09:32:50 +0200
Message-ID: <CAMRc=McUEgm6yH7enwHuHxVTL41dmb5KAY_pxTmSr3vctCs2xg@mail.gmail.com>
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

pt., 16 sie 2019 o 17:48 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> czw., 8 sie 2019 o 10:17 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82=
(a):
> >
> > =C5=9Br., 24 lip 2019 o 10:25 Bartosz Golaszewski <brgl@bgdev.pl> napis=
a=C5=82(a):
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > While working on my other series related to gpio-backlight[1] I notic=
ed
> > > that we could simplify the driver if we made the only user of platfor=
m
> > > data use GPIO lookups and device properties. This series tries to do
> > > that.
> > >
> > > The first patch adds all necessary data structures to ecovec24. Patch
> > > 2/7 unifies much of the code for both pdata and non-pdata cases. Patc=
hes
> > > 3-4/7 remove unused platform data fields. Last three patches contain
> > > additional improvements for the GPIO backlight driver while we're alr=
eady
> > > modifying it.
> > >
> > > I don't have access to this HW but hopefully this works. Only compile
> > > tested.
> > >
> > > [1] https://lkml.org/lkml/2019/6/25/900
> > >
> > > v1 -> v2:
> > > - rebased on top of v5.3-rc1 and adjusted to the recent changes from =
Andy
> > > - added additional two patches with minor improvements
> > >
> > > v2 -> v3:
> > > - in patch 7/7: used initializers to set values for pdata and dev loc=
al vars
> > >
> > > Bartosz Golaszewski (7):
> > >   sh: ecovec24: add additional properties to the backlight device
> > >   backlight: gpio: simplify the platform data handling
> > >   sh: ecovec24: don't set unused fields in platform data
> > >   backlight: gpio: remove unused fields from platform data
> > >   backlight: gpio: remove dev from struct gpio_backlight
> > >   backlight: gpio: remove def_value from struct gpio_backlight
> > >   backlight: gpio: use a helper variable for &pdev->dev
> > >
> > >  arch/sh/boards/mach-ecovec24/setup.c         | 33 ++++++--
> > >  drivers/video/backlight/gpio_backlight.c     | 82 +++++-------------=
--
> > >  include/linux/platform_data/gpio_backlight.h |  3 -
> > >  3 files changed, 44 insertions(+), 74 deletions(-)
> > >
> > > --
> > > 2.21.0
> > >
> >
> > Hi Rich, Yoshinori,
> >
> > can you ack the sh patches in this series?
> >
> > Bart
>
> Ping.

Hi,

any chance of getting this reviewed for sh?

Bart
