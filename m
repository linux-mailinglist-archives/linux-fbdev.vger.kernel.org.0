Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F51B72A0E
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jul 2019 10:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfGXI05 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jul 2019 04:26:57 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33412 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfGXI05 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jul 2019 04:26:57 -0400
Received: by mail-io1-f66.google.com with SMTP id z3so87842550iog.0
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jul 2019 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CBhO//b1Mv8t3fldT3hg9NFY3tt50vLM1dbfXQdhvjw=;
        b=D0p3Mc071pUEefJy2mzeuN0fKTpYKSow5oJhq50h2fxfnYdBwxnbUByQp3g8PS83e6
         At7iFoflnUuJh+x4blgGMFTDiVc0kOXTzjnwcF+UCwUbiShrIpTOhE2XIL+BqznqbY5t
         +UAaGLNmoaxWHHuN17Y2UBuy+pjgtYRocCvE6Pfbw2iZq2+TEm2nP9ucMiKLMGc2qfTj
         ApBqGrOuZB7kDqflOss8X2lqwBRr/6pPdg0uYWFVB6uU0l/UtHPv4aQgbs82rjmWgZgl
         c/Jb3D2O/z3w7jJXdLE43+asiU+OaAbLv/vy1SFRD6SfPJtk52VMMqvVHF7Yusk1djdr
         hCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CBhO//b1Mv8t3fldT3hg9NFY3tt50vLM1dbfXQdhvjw=;
        b=aogz6y+vvHUJT3o5+sQa9xvIjghi9ruPvWOUBiFBlW/9VcJdgKDLIaokS7oee+KSTO
         8Il6w3JWGcLeSFJ2eBM/474ZzmzgYRs8HD/F0inrFssRLUpcdbnrsCNL+5HargSk7NTL
         jgtmynd6C1rx9EhDaYPyQlQ8yZrK7Mb7TqnjWTy97UX+i4+P4XEuduHqTg74iqKiw3XJ
         LOa7Kwo5bZyCgxKr0TntKG6T5n1FHMzFEZUAAHqPuITbIq+wYdjYOGL3zhHGpaHwsSwl
         11ot7DaiBy99EJASylwQqBKI5p7PeOo57aFOQuIJ7gayzBOrZP6vRp4lwCUPcWLaWXIr
         h6Fg==
X-Gm-Message-State: APjAAAW2gPQefwIvBAXSdAtWp51OIp+SfpY6lhukmj/ESEgyZ4J4zNEM
        F3tEZkMtlcCXdGlAHFlher4rMkZI24kZNikusTE=
X-Google-Smtp-Source: APXvYqzlFH3wxV7Lz03vd2PrLc6bLm/+Ylj+di1LyWBQl8Ph0JepWk9jenk2cbZdUGaXiz8cH9/q3mMFct7ATpMadlg=
X-Received: by 2002:a05:6638:cf:: with SMTP id w15mr5664293jao.136.1563956816689;
 Wed, 24 Jul 2019 01:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl> <20190722150302.29526-3-brgl@bgdev.pl>
 <20190722160603.GY9224@smile.fi.intel.com> <CAMRc=Mfuvh6byfPhPdB51dy_YbAS5scJQT3n3pL_5VZLCjB3Hw@mail.gmail.com>
 <20190723153250.GK9224@smile.fi.intel.com>
In-Reply-To: <20190723153250.GK9224@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 Jul 2019 10:26:45 +0200
Message-ID: <CAMRc=Mf9MZRkvK5bvqsQuqwcUe5Wmsk+D7jwg2wMEK_cYVfe+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] backlight: gpio: simplify the platform data handling
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

wt., 23 lip 2019 o 17:32 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Tue, Jul 23, 2019 at 08:28:00AM +0200, Bartosz Golaszewski wrote:
> > pon., 22 lip 2019 o 18:06 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > >
> > > On Mon, Jul 22, 2019 at 05:02:57PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > Now that the last user of platform data (sh ecovec24) defines a pro=
per
> > > > GPIO lookup and sets the 'default-on' device property, we can drop =
the
> > > > platform_data-specific GPIO handling and unify a big chunk of code.
> > > >
> > > > The only field used from the platform data is now the fbdev pointer=
.
> > >
> > > > -static int gpio_backlight_probe_dt(struct platform_device *pdev,
> > > > -                                struct gpio_backlight *gbl)
> > > > -{
> > > > -     struct device *dev =3D &pdev->dev;
> > > > -     enum gpiod_flags flags;
> > > > -     int ret;
> > > > -
> > > > -     gbl->def_value =3D device_property_read_bool(dev, "default-on=
");
> > > > -     flags =3D gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> > > > -
> > > > -     gbl->gpiod =3D devm_gpiod_get(dev, NULL, flags);
> > > > -     if (IS_ERR(gbl->gpiod)) {
> > > > -             ret =3D PTR_ERR(gbl->gpiod);
> > > > -
> > > > -             if (ret !=3D -EPROBE_DEFER) {
> > > > -                     dev_err(dev,
> > > > -                             "Error: The gpios parameter is missin=
g or invalid.\n");
> > > > -             }
> > > > -             return ret;
> > > > -     }
> > > > -
> > > > -     return 0;
> > > > -}
> > >
> > > Why not leave this function (perhaps with different name)?
> >
> > Why would we do that if the entire probe() function is now less than
> > 50 lines long? Also: it gets inlined by the compiler anyway. It
> > doesn't make sense IMO.
>
> I'm not against this, perhaps, dropping and moving can be split to two ch=
anges.
>

This really is unnecessary - we can do it in a single patch alright.

Bart
