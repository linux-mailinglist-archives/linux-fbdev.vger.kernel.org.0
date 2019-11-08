Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C9F430C
	for <lists+linux-fbdev@lfdr.de>; Fri,  8 Nov 2019 10:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbfKHJY4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 8 Nov 2019 04:24:56 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:43776 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJYz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 8 Nov 2019 04:24:55 -0500
Received: by mail-il1-f193.google.com with SMTP id r9so4513606ilq.10
        for <linux-fbdev@vger.kernel.org>; Fri, 08 Nov 2019 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TIs1b1rF99sJDfx3z4532mKtmm9qYYLIgv84nPYnnHs=;
        b=gxCm/qOYL1x3dCef+3XYnB+136x455HWgfi7Qj90a6dbEpD7yZVGwabzGT+m3zVTeT
         xKLqQZnb6f4/364HgKR3h6iycCUM32NmFhTumpu7wzJ06bEb/Xja1/T7Z5YlkGLz35Ey
         MhWWmeBKp+7r2NZ2+3t2WxrDyefwkN4lYVL8k4pVi1DjNlUUCLwxWz+xJZJEB4Qo9i0a
         M54W0iLOpNNyBKFQJ99llVhbFmej2JakEAM/Fi6L/acyhlF+qLRQCpkd3ZssmyvurFCu
         Q+hTAR/0QZfEyCX/u3NrZ0Rcy2H2bZTuIO2iPbFE1K6cPSESvnjC3XnyAIg0mho1kDjw
         ljuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TIs1b1rF99sJDfx3z4532mKtmm9qYYLIgv84nPYnnHs=;
        b=kOhRs8cUSgUOLJuAjyKjpx2ZGDmj97Sh8Qb9TIWidLO1jwgS0I5sDsuwBi6zm7Hjtx
         Z6NiO6MpdPawx5m7RIGO9RWiDf1eh9oK5dkSOcTfiRMy3/7y4skkHUGVgU+XTa7+A2Qj
         1ArVekj4z3TuaQxH5O08MG7edOFFzaX7hSkwPkSN6l5RQvfUULflmSLDqWArmZeGqJc0
         Kuer/B/QFMXMJv7dkH4PcXg9LY0SHwNeUZQhAZ8zaZzYweYYiQeVYkBEAwT79MfzBI0H
         585g64r7YVU/RRtsIFR13PnI6lTyVM8tcVvc/hc6XF2mXASJMN3Z1aVJsLg4hqz63TlV
         cdgQ==
X-Gm-Message-State: APjAAAWpjuxg9rocWrstle6lr/2iD8pAOGIumyr0co7ukIJhSu59CD8N
        YT9hAam4tJBN0SWNEnYiXrDxA2ye8+XAfspoY3mebQ==
X-Google-Smtp-Source: APXvYqwtRtGOseUaKsfPdpbp1n2b413liDUFukBRms5HVfi6ZxDltAL8Iq7DZYBftqtmTEzjDq6ltn2a9JRv8Fjc/UQ=
X-Received: by 2002:a92:104a:: with SMTP id y71mr10820859ill.220.1573205094697;
 Fri, 08 Nov 2019 01:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20191022083630.28175-1-brgl@bgdev.pl> <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan> <20191024064726.GB15843@dell>
 <20191024071703.6keoebzlfnn2qmyd@uno.localdomain> <20191101085803.GD5700@dell>
 <20191101154133.qqjj3uriwrl2j5r5@uno.localdomain> <CAMRc=MejNQAPUXQkJsVFBxcQUJ83xRF0ntKM2ssnAxc1C+7Jjg@mail.gmail.com>
In-Reply-To: <CAMRc=MejNQAPUXQkJsVFBxcQUJ83xRF0ntKM2ssnAxc1C+7Jjg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Nov 2019 10:24:43 +0100
Message-ID: <CAMRc=Meh1jdc562bTHEfodyud7B0dBM+Lti3ZaCBUaqOjDhaCQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

pon., 4 lis 2019 o 10:22 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> pt., 1 lis 2019 o 16:39 Jacopo Mondi <jacopo@jmondi.org> napisa=C5=82(a):
> >
> > Hello,
> >   as promised...
> >
> > On Fri, Nov 01, 2019 at 08:58:03AM +0000, Lee Jones wrote:
> > > On Thu, 24 Oct 2019, Jacopo Mondi wrote:
> > >
> > > > Hello,
> > > >
> > > > On Thu, Oct 24, 2019 at 07:47:26AM +0100, Lee Jones wrote:
> > > > > On Wed, 23 Oct 2019, Daniel Thompson wrote:
> > > > >
> > > > > > On Tue, Oct 22, 2019 at 11:29:54AM +0200, Bartosz Golaszewski w=
rote:
> > > > > > > wt., 22 pa=C5=BA 2019 o 10:36 Bartosz Golaszewski <brgl@bgdev=
.pl> napisa=C5=82(a):
> > > > > > > >
> > > > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > >
> > > > > > > > While working on my other series related to gpio-backlight[=
1] I noticed
> > > > > > > > that we could simplify the driver if we made the only user =
of platform
> > > > > > > > data use GPIO lookups and device properties. This series tr=
ies to do
> > > > > > > > that.
> > > > > > > >
> > > > > > > > First two patches contain minor fixes. Third patch makes th=
e driver
> > > > > > > > explicitly drive the GPIO line. Fourth patch adds all neces=
sary data
> > > > > > > > structures to ecovec24. Patch 5/9 unifies much of the code =
for both
> > > > > > > > pdata and non-pdata cases. Patches 6-7/9 remove unused plat=
form data
> > > > > > > > fields. Last two patches contain additional improvements fo=
r the GPIO
> > > > > > > > backlight driver while we're already modifying it.
> > > > > > > >
> > > > > > > > I don't have access to this HW but hopefully this works. On=
ly compile
> > > > > > > > tested.
> > > > > > > >
> > > > > > > > [1] https://lkml.org/lkml/2019/6/25/900
> > > > > > > >
> > > > > > > > v1 -> v2:
> > > > > > > > - rebased on top of v5.3-rc1 and adjusted to the recent cha=
nges from Andy
> > > > > > > > - added additional two patches with minor improvements
> > > > > > > >
> > > > > > > > v2 -> v3:
> > > > > > > > - in patch 7/7: used initializers to set values for pdata a=
nd dev local vars
> > > > > > > >
> > > > > > > > v3 -> v4:
> > > > > > > > - rebased on top of v5.4-rc1
> > > > > > > > - removed changes that are no longer relevant after commit =
ec665b756e6f
> > > > > > > >   ("backlight: gpio-backlight: Correct initial power state =
handling")
> > > > > > > > - added patch 7/7
> > > > > > > >
> > > > > > > > v4 -> v5:
> > > > > > > > - in patch 7/7: added a comment replacing the name of the f=
unction being
> > > > > > > >   pulled into probe()
> > > > > > > >
> > > > > > > > v5 -> v6:
> > > > > > > > - added a patch making the driver explicitly set the direct=
ion of the GPIO
> > > > > > > >   to output
> > > > > > > > - added a patch removing a redundant newline
> > > > > > > >
> > > > > > > > v6 -> v7:
> > > > > > > > - renamed the function calculating the new GPIO value for s=
tatus update
> > > > > > > > - collected more tags
> > > > > > > >
> > > > > > > > Bartosz Golaszewski (9):
> > > > > > > >   backlight: gpio: remove unneeded include
> > > > > > > >   backlight: gpio: remove stray newline
> > > > > > > >   backlight: gpio: explicitly set the direction of the GPIO
> > > > > > > >   sh: ecovec24: add additional properties to the backlight =
device
> > > > > > > >   backlight: gpio: simplify the platform data handling
> > > > > > > >   sh: ecovec24: don't set unused fields in platform data
> > > > > > > >   backlight: gpio: remove unused fields from platform data
> > > > > > > >   backlight: gpio: use a helper variable for &pdev->dev
> > > > > > > >   backlight: gpio: pull gpio_backlight_initial_power_state(=
) into probe
> > > > > > > >
> > > > > > > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 +++--
> > > > > > > >  drivers/video/backlight/gpio_backlight.c     | 128 +++++++=
------------
> > > > > > > >  include/linux/platform_data/gpio_backlight.h |   3 -
> > > > > > > >  3 files changed, 69 insertions(+), 95 deletions(-)
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > Lee, Daniel, Jingoo,
> > > > > > >
> > > > > > > Jacopo is travelling until November 1st and won't be able to =
test this
> > > > > > > again before this date. Do you think you can pick it up and i=
n case
> > > > > > > anything's broken on SH, we can fix it after v5.5-rc1, so tha=
t it
> > > > > > > doesn't miss another merge window?
> > > > >
> > > > > November 1st (-rc6) will be fine.
> > > > >
> > > > > I'd rather apply it late-tested than early-non-tested.
> > > > >
> > > > > Hopefully Jacopo can prioritise testing this on Thursday or Frida=
y,
> > > > > since Monday will be -rc7 which is really cutting it fine.
> > > >
> > > > I'll do my best, I'll get home Friday late afternoon :)
> > >
> > > Welcome home!
> > >
> > > Just a little reminder in your inbox. TIA. :)
> >
> > For the ecovec part:
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
>
> Thanks Jacopo!
>
> Lee: I hope it's not too late to get it picked up for v5.5?
>

Hi, just a gentle ping for this series, because I'm afraid it will
miss yet another merge window.

Thanks in advance!
Bartosz Golaszewski
