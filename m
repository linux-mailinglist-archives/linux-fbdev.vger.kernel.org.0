Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEF51EA7F
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 May 2019 10:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbfEOI5E (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 15 May 2019 04:57:04 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41368 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOI5E (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 15 May 2019 04:57:04 -0400
Received: by mail-vs1-f67.google.com with SMTP id g187so1176344vsc.8
        for <linux-fbdev@vger.kernel.org>; Wed, 15 May 2019 01:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=96iRfZdib+4eTVJWWY+B4LN2z0sGbIorx6gOZw+wIXU=;
        b=Abp4D8QU9ewjwTa6GYUkTK5XEO2ILoSE22ldFZdjBOc6RhMvP2H0e9q1qSxOUTnpBE
         wYicEuFFRuG4gbtTI6nx/FKqvcp5Ko+g5gnrF8iKDkI6ZfZcIaITNKBGujIX9q1zD3ZZ
         D41FRibUk/oV1eVjzWkwpM79cUYCkbBfXahgXQfO92QSQRrSfdWx++8q3J6L3lAhCXQW
         dF6gYrLAav4jovCjB5eJdGwS8B13LJhLmqlajjKwPy3IvU8VpGTBL06RH24MsVUDMJge
         7vSwmtcqX+agX+ozga1NSphlnwkuDHBkfliBwVEhmKRomdqPxSJHEUeLffFRiM3QnL3R
         +kAA==
X-Gm-Message-State: APjAAAUJdoRpAoGnbR5jkRO7bxsQZWZWCWhUU8tsuP9Taewx7lrHVQBN
        j3TVmjvHo1RVQcrTnMVdnyR9iGDdn80hCKTPLDY=
X-Google-Smtp-Source: APXvYqxNXAHO4EY+qM+hpU3GaoFiF2m86JQAAagisY1V/FjL61yHVIJWOqozst81BAiD6TqTNyLFIbBrhe1VCUUlE4M=
X-Received: by 2002:a67:f303:: with SMTP id p3mr8190626vsf.166.1557910623342;
 Wed, 15 May 2019 01:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190117133336.19737-1-shc_work@mail.ru>
In-Reply-To: <20190117133336.19737-1-shc_work@mail.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 10:56:51 +0200
Message-ID: <CAMuHMdXrAaZoqsnY_adE=jn-hmTrgmsvJ2tDo+5ByxZ4sz_S7Q@mail.gmail.com>
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
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Alexander,

On Thu, Jan 17, 2019 at 2:39 PM Alexander Shiyan <shc_work@mail.ru> wrote:
> We have two *_CLASS_DEVICE kernel config options (LCD_CLASS_DEVICE
> and BACKLIGHT_LCD_DEVICE) that do the same job.
> The patch removes useless BACKLIGHT_LCD_SUPPORT option
> and converts LCD_CLASS_DEVICE into a menu.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

This is now commit 8c5dc8d9f19c7992 ("video: backlight: Remove useless
BACKLIGHT_LCD_SUPPORT kernel symbol").

> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -2,13 +2,7 @@
>  # Backlight & LCD drivers configuration
>  #
>
> -menuconfig BACKLIGHT_LCD_SUPPORT
> -       bool "Backlight & LCD device support"
> -       help
> -         Enable this to be able to choose the drivers for controlling the
> -         backlight and the LCD panel on some platforms, for example on PDAs.
> -
> -if BACKLIGHT_LCD_SUPPORT
> +menu "Backlight & LCD device support"
>
>  #
>  # LCD

Below, we have:

    config LCD_CLASS_DEVICE
            tristate "Lowlevel LCD controls"
            default m
            help
              This framework adds support for low-level control of LCD.
              Some framebuffer devices connect to platform-specific LCD modules
              in order to have a platform-specific way to control the flat panel
              (contrast and applying power to the LCD (not to the backlight!)).

and:

    config BACKLIGHT_CLASS_DEVICE
            tristate "Lowlevel Backlight controls"
            default m
            help
              This framework adds support for low-level control of the LCD
              backlight. This includes support for brightness and power.

Hence running "make oldconfig" on a .config where
CONFIG_BACKLIGHT_LCD_SUPPORT was not set leads two to new
questions, where the answers default to "m".

Perhaps the "default m" statements should be removed?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
