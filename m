Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0623472A14
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jul 2019 10:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfGXI1q (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jul 2019 04:27:46 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35948 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfGXI1q (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jul 2019 04:27:46 -0400
Received: by mail-io1-f67.google.com with SMTP id o9so87863728iom.3
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jul 2019 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kb7eArCilWdKUvwfohxdII2qALNxjvAYl3lvEVMZ9qk=;
        b=FNblimKx+rjoA1V3WXfUR4m6Iq3+TaxbTyU8mFKUXhELDK113890IrYfRO78n7UzKF
         1IEunSPuEZujSa5rreTEM/xTlEMYSAVaMZqmwYBfDw91Ixz1Xp+yhvDaIqA3tiNwnxdF
         9Cum8d7sFfluFaXFg5oazn+AGC9YF5zBQFKnlZOpgiSfMMCtrddzl1msoCzMazJV2dQB
         cbK/Mx2WmOr9yNYJvdNsbE37QqsbDlQgSaICPcdWK08ZFUTfEH1mPxOGNI7Rq4gZwry8
         SKEKAQRBKTJQlarxH0y+ncGoVQxWWEEq0s0rhJuTpMSbjweV2/KlRsrEokct1G/ymvEx
         fUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kb7eArCilWdKUvwfohxdII2qALNxjvAYl3lvEVMZ9qk=;
        b=Lg8HvET5ggrs44WfRQ0v+ilafKRXgScXPDzPsDZYGiLaFUU2KUMJZNZHuPxCv4MlRl
         R5MjX5BFEkB797xeqkyIsWqh28pYBFkmVkAsR0xtX1BsFfuOdVmfyQYGmeLDG2E1EUcY
         62OSVbCzEFYYt0K47klm8PiuM87ffaAcgakg85UWHCMfXbI4Tz5axq2t/XIB1o0AS+NU
         LK8KokjlMT4cNcLyhaZ6IeERDA+n+E6IAKARpa67bErTP1bgVmdaW8IWWrrQZ3Br1m8G
         XG7zkBFhjUnIo2sOjTuyuLanOgf2Iv1kCneiTK4CM2SyqdBr0dvB5kIPVuEl8aLlDyzV
         tX5Q==
X-Gm-Message-State: APjAAAWX4gHpFXaDkhH9/hVSTORkAj1gUFE1Xv2hSaX2BpekVBq5nXnG
        Eg65zuDROwpRLoo7Hj6EZkG3SGvLRfLGYlxnWh8=
X-Google-Smtp-Source: APXvYqzmN8vTeN4s5nOB+z3DmGITO+L5EC/Bb721+2hfW+hjZ6SuHLtd/pdIteqzcHzLZ3ZRwY+7/cfpmfZpM96HxeM=
X-Received: by 2002:a02:5b05:: with SMTP id g5mr81387107jab.114.1563956865306;
 Wed, 24 Jul 2019 01:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 Jul 2019 10:27:34 +0200
Message-ID: <CAMRc=McfheXWjbvV=JeBz4hxHGb5XFqsKtun6+BfrSodH4tn_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     linux-sh@vger.kernel.org, Rich Felker <dalias@libc.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jingoo Han <jingoohan1@gmail.com>
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

Daniel,

I missed your review tags - could you add them again?

Thanks,
Bart
