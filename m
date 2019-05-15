Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0EAC1F3FE
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 May 2019 14:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfEOMR2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Wed, 15 May 2019 08:17:28 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46568 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbfEOMR0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 15 May 2019 08:17:26 -0400
Received: by mail-vs1-f67.google.com with SMTP id e2so1511864vsc.13
        for <linux-fbdev@vger.kernel.org>; Wed, 15 May 2019 05:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GoZqRtO1DJyDd5x1ykt89wHuMqf3mXxoCzfB/cokj1U=;
        b=bbW58FpF0snFvHUWZjV6GPvBWgQILfFRTtYvZAyp0BNuRa/caV2TX7ikVb06bRdJGD
         WyXcHXhg++A3f2KNf8UypRBrAaIlcf6ap1UMtstxu8VbgqHkpDHhF7aXQ0mvQ2U/Hm5n
         PuAVfNLeBEcQsQo+XZ0MBtOjsfMvtzKJWZ7fHS2vWmPdF6GH5T8lHmzj12fVsTzSLsJ9
         Y+RUezIYeBS8h4o4fxZmDoiPlsKJZQk1SPs6ilAeV7VrmWxVq5+I0B+ZnkYk8kOcRANR
         3472JgFySNEqoTRqb23brZEaiQdRMyczAPCWaSGfXamVKzatFZz1BZJ/H8MoxJ0iJah3
         JAtg==
X-Gm-Message-State: APjAAAV8bQsxRUJgMKfNnvNYRA+tVA8CHENDBUBR+dWeVRyOst77LB6A
        eiTvtwfLJb4tUsoS2fmCshgybZxYaVah+1fk1dI=
X-Google-Smtp-Source: APXvYqw1XFiQjVa/JMiq4S60gQIlK2cXL5b+8BOXQspv8ti/3HOAAmRtxBpaHNn1XhlzBo/rYNR9VuOso144yYjW6L8=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr12143867vsc.96.1557922645694;
 Wed, 15 May 2019 05:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190117133336.19737-1-shc_work@mail.ru> <CAMuHMdXrAaZoqsnY_adE=jn-hmTrgmsvJ2tDo+5ByxZ4sz_S7Q@mail.gmail.com>
 <1557916437.354393786@f383.i.mail.ru>
In-Reply-To: <1557916437.354393786@f383.i.mail.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 14:17:14 +0200
Message-ID: <CAMuHMdXBpneVGLULk2kE0BT336BBn0+NQsEqmMnGqsSEQy5D3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] video: lcd: Remove useless BACKLIGHT_LCD_SUPPORT
 kernel symbol
To:     Alexander Shiyan <shc_work@mail.ru>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Alexander,

On Wed, May 15, 2019 at 12:34 PM Alexander Shiyan <shc_work@mail.ru> wrote:
> Looks like you're right.
> Can you create a patch to fix this?

Thank you, done.

> >Среда, 15 мая 2019, 11:57 +03:00 от Geert Uytterhoeven <geert@linux-m68k.org>:
> >
> >Hi Alexander,
> >
> >On Thu, Jan 17, 2019 at 2:39 PM Alexander Shiyan < shc_work@mail.ru > wrote:
> >> We have two *_CLASS_DEVICE kernel config options (LCD_CLASS_DEVICE
> >> and BACKLIGHT_LCD_DEVICE) that do the same job.
> >> The patch removes useless BACKLIGHT_LCD_SUPPORT option
> >> and converts LCD_CLASS_DEVICE into a menu.
> >>
> >> Signed-off-by: Alexander Shiyan < shc_work@mail.ru >
> >This is now commit 8c5dc8d9f19c7992 ("video: backlight: Remove useless
> >BACKLIGHT_LCD_SUPPORT kernel symbol").
> >
> >> --- a/drivers/video/backlight/Kconfig
> >> +++ b/drivers/video/backlight/Kconfig
> >> @@ -2,13 +2,7 @@
> >>  # Backlight & LCD drivers configuration
> >>  #
> >>
> >> -menuconfig BACKLIGHT_LCD_SUPPORT
> >> -       bool "Backlight & LCD device support"
> >> -       help
> >> -         Enable this to be able to choose the drivers for controlling the
> >> -         backlight and the LCD panel on some platforms, for example on PDAs.
> >> -
> >> -if BACKLIGHT_LCD_SUPPORT
> >> +menu "Backlight & LCD device support"
> >>
> >>  #
> >>  # LCD
> >
> >Below, we have:
> >
> >    config LCD_CLASS_DEVICE
> >            tristate "Lowlevel LCD controls"
> >            default m
> >            help
> >              This framework adds support for low-level control of LCD.
> >              Some framebuffer devices connect to platform-specific LCD modules
> >              in order to have a platform-specific way to control the flat panel
> >              (contrast and applying power to the LCD (not to the backlight!)).
> >
> >and:
> >
> >    config BACKLIGHT_CLASS_DEVICE
> >            tristate "Lowlevel Backlight controls"
> >            default m
> >            help
> >              This framework adds support for low-level control of the LCD
> >              backlight. This includes support for brightness and power.
> >
> >Hence running "make oldconfig" on a .config where
> >CONFIG_BACKLIGHT_LCD_SUPPORT was not set leads two to new
> >questions, where the answers default to "m".
> >
> >Perhaps the "default m" statements should be removed?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
