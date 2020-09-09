Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1BB026362C
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Sep 2020 20:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgIISni (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 9 Sep 2020 14:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgIISnh (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 9 Sep 2020 14:43:37 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1153C061573
        for <linux-fbdev@vger.kernel.org>; Wed,  9 Sep 2020 11:43:36 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c8so3725169edv.5
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Sep 2020 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VfN64tSOGeP7ex6MQ1qLJK62hgHjPavCUX84aVCHqYU=;
        b=ggEyuPM2at4cZym3o7YnP1kWeACf1A6Gzyf6R67Do2SkEc2O4Is3QDDRCJP5ee5H5s
         dqlEbhjuIJRjrKi25j6Mc8DUJ5Sz0mo5RxmSanuYmQTrFXKhj7t3w4Oh9DP6K6qOJPAX
         lzxxI9BQ4WLYaCt6rXfLNN1Nu66pUQK7u39vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VfN64tSOGeP7ex6MQ1qLJK62hgHjPavCUX84aVCHqYU=;
        b=cq22oFGidh/Jsw1PjVOvpyIU0PwBs8NXNOTioHnXFqjt8m5C5mJRsim01eV9Vw/mR0
         +04pkwU9BFcMU7C4lnhpP75pZdiU32MT7DK/+nfBfx4l3QIB6Nlovf2zUXE0qJwzTJfq
         tFZiRqOUFn0YiNac+Y31Du1RsgM+MUWjwdg+Lz57svaU/k6B1LMUm9rNy4gkodgn5nK0
         tgjSQbx1xTgzmCPy4ApvDDwgpCDt8dy3LTmicHKJYzNOu2gOfdOshmmieh+hEP7XaFeO
         ozRBlIL+qGK+9+7F5W1kZDQ+UlYxarC1I+mjOiYHuyuJtj1KEU2vj3r5NfnU6icyHSVQ
         IoQQ==
X-Gm-Message-State: AOAM530UTPFiYM1JjCNE8icFCH6mBkRzpijaEfVf8X/4McUDdkqaknkq
        9QPgMC9X+ACQOOmDe3rQMqOecjo5eU7ixg==
X-Google-Smtp-Source: ABdhPJxIs35yAwEbZJ1NdmVQfjvD+5VrvFD1pdXSki8eGdXqi5WAoNABVHJI+3a4YVwXSvOqpLu31Q==
X-Received: by 2002:a50:bb0d:: with SMTP id y13mr5737778ede.317.1599677014733;
        Wed, 09 Sep 2020 11:43:34 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id p3sm3144046edp.28.2020.09.09.11.43.33
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 11:43:33 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id lo4so5020788ejb.8
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Sep 2020 11:43:33 -0700 (PDT)
X-Received: by 2002:a17:906:bb0e:: with SMTP id jz14mr5218995ejb.525.1599677012842;
 Wed, 09 Sep 2020 11:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200721042522.2403410-1-amstan@chromium.org> <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
 <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
In-Reply-To: <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
From:   Alexandru M Stan <amstan@chromium.org>
Date:   Wed, 9 Sep 2020 11:42:56 -0700
X-Gmail-Original-Message-ID: <CAHNYxRw5t67-A4sf719+hQ51K-oRZZLt5W5P3Hej0ynvS9-V5Q@mail.gmail.com>
Message-ID: <CAHNYxRw5t67-A4sf719+hQ51K-oRZZLt5W5P3Hej0ynvS9-V5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during interpolation
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Sep 4, 2020 at 4:38 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jul 20, 2020 at 09:25:21PM -0700, Alexandru Stan wrote:
> > Some displays need the low end of the curve cropped in order to make
> > them happy. In that case we still want to have the 0% point, even though
> > anything between 0% and 5%(example) would be skipped.
>
> For backlights it is not defined that 0 means off and, to be honest, 0
> means off is actually rather weird for anything except transflexive
> or front lit reflective displays[1]. There is a problem on several
> systems that when the backlight slider is reduced to zero you can't
> see the screen properly to turn it back up. This patch looks like it
> would make that problem worse by hurting systems with will written
> device trees.
>
> There is some nasty legacy here: some backlight displays that are off
> at zero and that sucks because userspace doesn't know whether zero is
> off or lowest possible setting.
>
> Nevertheless perhaps a better way to handle this case is for 0 to map to
> 5% power and for the userspace to turn the backlight on/off as final
> step in an animated backlight fade out (and one again for a fade in).

Hello

Apologies for my delay. Thanks for the responses!

Yeah, I felt pretty sketchy about this 0% patch as well. But I figured
it's better to send my suggestion and get corrected than lose the
fixed interpolation patch.

Turns out there's no reason to need 2/3. I was mistaken:
echo "4" > /sys/devices/platform/backlight/backlight/backlight/bl_power
seems to work just fine to turn the backlight off, nothing special
about my device (pwm comes from cros_ec).
Chrome OS user space already makes full use of that knob
(https://source.chromium.org/chromiumos/chromiumos/codesearch/+/master:src/platform2/power_manager/powerd/system/internal_backlight.cc;l=169)
I wanted to try X11 on the same device but I haven't gotten to it yet,
perhaps I'll post my results in the next cover letter.
So it seems I didn't have to worry about "not breaking userspace" on
the existing devices.

I'll respin this patch set: keep 1/3 and 3/3, remove 2/3, and
potentially add another one to update trogdor's dtsi (since that's
where I want this fixed linear interpolation to happen).

Thank you,
Alexandru Stan
