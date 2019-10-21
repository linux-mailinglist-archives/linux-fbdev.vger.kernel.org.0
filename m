Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01BA2DEC0C
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Oct 2019 14:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfJUMVf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 21 Oct 2019 08:21:35 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:33243 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbfJUMVe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 21 Oct 2019 08:21:34 -0400
Received: by mail-il1-f196.google.com with SMTP id v2so11793946ilm.0
        for <linux-fbdev@vger.kernel.org>; Mon, 21 Oct 2019 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wnGtB4lj7QZakI4bXBl4LOnjDVuoS6i9juH0AaPHUsI=;
        b=yqzJO5yrEuZ0AujBs35LlMVgp6QrGyJjIObeyazkPjRn1j5wQVKWq6ySSs5n6N4uiw
         w7AvSYJxB4dwHnN4Ik35WPXIfmBuhe7CsdcgDCSBhAMZJYWjhfy5dXSqH5XFQGMRCiL7
         IDZuf7KHDhV7oNVgFuYj4nLiL3qZQdEK4nrMHqRbpO0nMszqcZGhHNGy/GBtrkmkYzAL
         yXeyd+jUgvOFi1sZvsBGEwDj2CQv2SACk7Dp90Yp6dxMObXcSZ58Nk2OSFEIQIPF4hSy
         Xtzxus/dbLmFmsv9pIP40s+WzRnsGXN55Dx17Z3AwLupEnMqRwCTVQozron87CbKuu/n
         mb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wnGtB4lj7QZakI4bXBl4LOnjDVuoS6i9juH0AaPHUsI=;
        b=PegjdXoRNZzkKEassJJLN2CrfJSLVHGW2aU4+KVRX8ni0295juLQ10z48IZFSaFqAw
         56cctfdswUMfrVX3RoLZ+yRzFPkxRW8nd8OkCAkQKdr42GWu6hnsAerEKnipxv+ARL5F
         /ehSlI0av1FOv1XMHa1C5MlHQuUKbritdsRWnReDYnw3hONxKB/mUqBYXcMOkoathqcz
         iuw1GyS6w6ZgDv+259uNtDFGNTVFCiM9mCg/543f7Wdy7Tl1ZQd4rAn80ZSLqZc9nJPn
         pUVBXYaS3BfLYeoQVist/AUqP5DzFC7IuYHM7uoYIx6DWaXgC7QZLk+hZx1w/JorcODb
         VXRg==
X-Gm-Message-State: APjAAAXoOZ+JNhJghl0/HxYnYMHuQKnLzt/gCv0OihpFUmPnRUm/0QXR
        8a6geMaXegW7kTyZJPpaF74RK+hWIuc0/2gxjvUeDg==
X-Google-Smtp-Source: APXvYqxYqbLQZbfxUfYl5IZ0yaJHH03rYbBNlFarkoXOb5pIu+StSQSkslvJykiuWugAbTzjBnKJwDiNY2bcVyEpgSA=
X-Received: by 2002:a92:410c:: with SMTP id o12mr25941800ila.287.1571660492888;
 Mon, 21 Oct 2019 05:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191019083556.19466-1-brgl@bgdev.pl> <20191019083556.19466-4-brgl@bgdev.pl>
 <20191021104509.p2bsll3rwe7ica6t@holly.lan>
In-Reply-To: <20191021104509.p2bsll3rwe7ica6t@holly.lan>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Oct 2019 14:21:21 +0200
Message-ID: <CAMRc=Md99q+67FAduiixQQs6BVtLXNrC=KbicsuBsB2Jp4O7dw@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] backlight: gpio: explicitly set the direction of
 the GPIO
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

pon., 21 pa=C5=BA 2019 o 12:45 Daniel Thompson <daniel.thompson@linaro.org>
napisa=C5=82(a):
>
> On Sat, Oct 19, 2019 at 10:35:50AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The GPIO backlight driver currently requests the line 'as is', without
> > acively setting its direction. This can lead to problems: if the line
> > is in input mode by default, we won't be able to drive it later when
> > updating the status and also reading its initial value doesn't make
> > sense for backlight setting.
> >
> > Request the line 'as is' initially, so that we can read its value
> > without affecting it but then change the direction to output explicitly
> > when setting the initial brightness.
> >
> > Also: check the current direction and only read the value if it's outpu=
t.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Intent looks good to me but...
>
> > ---
> >  drivers/video/backlight/gpio_backlight.c | 23 ++++++++++++++++++-----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
> > index 3955b513f2f8..a36ac3a45b81 100644
> > --- a/drivers/video/backlight/gpio_backlight.c
> > +++ b/drivers/video/backlight/gpio_backlight.c
> > @@ -25,9 +25,8 @@ struct gpio_backlight {
> >       int def_value;
> >  };
> >
> > -static int gpio_backlight_update_status(struct backlight_device *bl)
> > +static int gpio_backlight_get_curr_brightness(struct backlight_device =
*bl)
>
> This function does not get the current brightness (e.g. what the
> hardware is currently doing). Given we've just nuked the function that
> *did* get the current brightness from the hardware this isn't an
> acceptable name.
>
> Would like something like calc_brightness() or get_next_brightness().
>

Fair enough, the latter sounds good in this case.

Bart
