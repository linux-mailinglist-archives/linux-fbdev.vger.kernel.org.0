Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE28844419A
	for <lists+linux-fbdev@lfdr.de>; Wed,  3 Nov 2021 13:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhKCMf2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 3 Nov 2021 08:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbhKCMf1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 3 Nov 2021 08:35:27 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905F9C061203
        for <linux-fbdev@vger.kernel.org>; Wed,  3 Nov 2021 05:32:50 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id s14so2306100ilv.10
        for <linux-fbdev@vger.kernel.org>; Wed, 03 Nov 2021 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tDdYp1cUnzplnw8xIPr07k5DnDOdOwaeISoz7QL9yx0=;
        b=JDrX1rqTut67mHyiDD55M7whnH4nzQ4v9Zb05BvlLbymXMVBtKR9whNpcPmwxMaYsw
         mc3JPmDaupFPjd+psSBTGwZ4woU42baz+lpyR+8Y+Knn+UArvVp7DUBcU2uvrqR92zo3
         a9mnlsA2WNzAPA+hQGU08xficIzDH7gMbO19zQ+ENYXABu8YIn6DApnrq12AoEOsG9Ry
         RKg+C6/MoNQzcnM7ZOOxg6orfZ4/7D21XJTNNzff0aoDs120MXaaxo/ocWxySelEHhRR
         YRBdDmuDsJP+ClFYcxafj0Scxb+uM6ulz7G2FUOVcfbXLF9SJGT5ayQ28HKv4HnFjCbB
         hMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tDdYp1cUnzplnw8xIPr07k5DnDOdOwaeISoz7QL9yx0=;
        b=ywaOF8CXW0xYrpg/fP0IuFeUaLK0n1ODWe1KAksK0V1/WJ1RixaddGkgC+dWIZpjgZ
         giUhXdj7y3D8h7mwEJq66Ycj+4EQ40/ZFpm3T1P033+ODNw7+VzIxLuxmY6dJs28AFmN
         2PJqvw87WyYtAQ2QKj5qop4wS9OBYb7HR4sq13eT59dsI2wKHIt4uGdS7JSeX7wyDYO2
         ZCxsB96q/7mlXB+fZTV7mx/MZq23W2eVz6Nhi94l8lyGNIsGr0ZR/+0hYk9gVgVV3es8
         SBbazGu418V+Prp0cdH1mIq5CH4MCqCT4l8FjzfPVTn6OIwYwap7vdkwymW+ST3rBQPF
         xwag==
X-Gm-Message-State: AOAM533b1xGqhduDBAJyt0iFwjuVauKykYZFplZxLdtgBcYtKmXYstfd
        /j2TeRjDfAdSHMsiXCg90m8bCFNrzUokkmCmh0flZX8vb0eHb6Uq
X-Google-Smtp-Source: ABdhPJyqczhhuSEjdk42q4884tP/2XraLAkEL5KVvM/Y3XOAJo7ixOsXUZsUGoMHtEfn7Mpjr0KOfXmDwAngG9O55F0=
X-Received: by 2002:a05:6e02:1bcb:: with SMTP id x11mr24928470ilv.94.1635942769924;
 Wed, 03 Nov 2021 05:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <YX1KCclMB/HTZ22c@fedora> <CAMuHMdW5thqxWz37er3BHwqee_agvhHVDK5p8Hrx7HCKOdFjLA@mail.gmail.com>
In-Reply-To: <CAMuHMdW5thqxWz37er3BHwqee_agvhHVDK5p8Hrx7HCKOdFjLA@mail.gmail.com>
From:   =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date:   Wed, 3 Nov 2021 09:32:38 -0300
Message-ID: <CAH7FV3mKnigzrA42NYEweiphOaYbr2gjhR=VLVzwmxJ+oSpwOw@mail.gmail.com>
Subject: Re: [PATCH v3] backlight: lp855x: Switch to atomic PWM API
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Em ter., 2 de nov. de 2021 =C3=A0s 05:39, Geert Uytterhoeven
<geert@linux-m68k.org> escreveu:
>
> Hi Ma=C3=ADra,
>
> On Sat, Oct 30, 2021 at 3:35 PM Ma=C3=ADra Canal <maira.canal@usp.br> wro=
te:
> > Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> > replace it for the atomic PWM API.
> >
> > Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
>
> Thanks for your patch!
>
> > --- a/drivers/video/backlight/lp855x_bl.c
> > +++ b/drivers/video/backlight/lp855x_bl.c
> > @@ -233,9 +233,8 @@ static int lp855x_configure(struct lp855x *lp)
> >
> >  static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
> >  {
> > -       unsigned int period =3D lp->pdata->period_ns;
> > -       unsigned int duty =3D br * period / max_br;
> > -       struct pwm_device *pwm;
> > +       struct pwm_device *pwm =3D NULL;
> > +       struct pwm_state state;
> >
> >         /* request pwm device with the consumer name */
> >         if (!lp->pwm) {
> > @@ -245,18 +244,16 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, in=
t br, int max_br)
> >
> >                 lp->pwm =3D pwm;
> >
> > -               /*
> > -                * FIXME: pwm_apply_args() should be removed when switc=
hing to
> > -                * the atomic PWM API.
> > -                */
> > -               pwm_apply_args(pwm);
> > +               pwm_init_state(lp->pwm, &state);
> > +               state.period =3D lp->pdata->period_ns;
> >         }
> >
> > -       pwm_config(lp->pwm, duty, period);
> > -       if (duty)
> > -               pwm_enable(lp->pwm);
> > -       else
> > -               pwm_disable(lp->pwm);
> > +       pwm_get_state(lp->pwm, &state);
> > +
> > +       state.duty_cycle =3D br * state.period / max_br;
>
> Above is a 64-by-32 division, which should not be open-coded, as
> that will cause link failures on 32-bit platform (cfr. "undefined
> reference to `__udivdi3'", as reported by the kernel test robot).
> Please use div_u64() instead.

Hi Geert,

Thank you for the suggestion! I fixed this problem a bit differently
and submitted the v4. I made use of the PWM API and applied the
pwm_set_relative_duty_cycle function, which solved this division
problem.

>
> > +       state.enabled =3D state.duty_cycle;
> > +
> > +       pwm_apply_state(lp->pwm, &state);
> >  }
> >
> >  static int lp855x_bl_update_status(struct backlight_device *bl)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
