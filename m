Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F9F28ED3C
	for <lists+linux-fbdev@lfdr.de>; Thu, 15 Oct 2020 08:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgJOGzK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 15 Oct 2020 02:55:10 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:34450 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgJOGzK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 15 Oct 2020 02:55:10 -0400
Received: by mail-oo1-f65.google.com with SMTP id o20so480046ook.1;
        Wed, 14 Oct 2020 23:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7FwAhhWPHZZtKLoXu0OtijXG8l8PtSjQz10RZ331mg=;
        b=V2MNpL482J+aSwyZJ4F8JV+OwattGUZNkOtmvdfTFZ312D8h4m/be9YBPiVOYTRY71
         /EKooAcFa2vHfhKG+e8KtalbnEkqev3QFWBcdaJH9cps7T9CV+IdqYYn2OUE4erjVHyA
         VfXIIe2BdUYO/tqIyBNbX/2MbKG1g3Z3uY6DpPfLwtdor6Sx2mxLYxruRNxN6MyckOUr
         OSqGO6y0LjadwFX3TowzXNsQuyhG3EdIC3DQbrb1GxID8Sz56djhydCvfK4F3Ol5R4X6
         7Y4eCP9Y0vZHIVYOg82QwkD5U8cO9d9BkS4S4OiItKMAlzh7F/W4jYjoDzKBkDI+6Aiv
         dqYg==
X-Gm-Message-State: AOAM533RXOETy/IHXq3bVOsinQVqDfj70Ah8+aYkZRD3FPdVuY9vazyw
        eyuCmY1jL7bm2uE9X0uMZUBSYRe/k1wb0YhJ2rzkLQ3u+PY=
X-Google-Smtp-Source: ABdhPJyfILeYBfFt4AVgi4KJBJUCvS32/OGntqcrg7x5aKKAXUqvuykGrrxWuGbTkyOE+IyIvpejID2er9xgBc2lBpY=
X-Received: by 2002:a4a:dbd3:: with SMTP id t19mr1350129oou.40.1602744909171;
 Wed, 14 Oct 2020 23:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201013080103.410133-1-amstan@chromium.org> <20201013010056.v2.1.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
In-Reply-To: <20201013010056.v2.1.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Oct 2020 08:54:57 +0200
Message-ID: <CAMuHMdUSWWSVQCxX-rv3MCvw59q+dscQ3bC4yysVCPyxdaEi6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] backlight: pwm_bl: Fix interpolation
To:     Alexandru Stan <amstan@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Alexandru,

On Tue, Oct 13, 2020 at 1:57 PM Alexandru Stan <amstan@chromium.org> wrote:
> Whenever num-interpolated-steps was larger than the distance
> between 2 consecutive brightness levels the table would get really
> discontinuous. The slope of the interpolation would stick with
> integers only and if it was 0 the whole line segment would get skipped.
>
> Example settings:
>         brightness-levels = <0 1 2 4 8 16 32 64 128 256>;
>         num-interpolated-steps = <16>;
>
> The distances between 1 2 4 and 8 would be 1, and only starting with 16
> it would start to interpolate properly.
>
> Let's change it so there's always interpolation happening, even if
> there's no enough points available (read: values in the table would
> appear more than once). This should match the expected behavior much
> more closely.
>
> Signed-off-by: Alexandru Stan <amstan@chromium.org>

Thanks for your patch!

> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -327,24 +324,25 @@ static int pwm_backlight_parse_dt(struct device *dev,
>                         table = devm_kzalloc(dev, size, GFP_KERNEL);
>                         if (!table)
>                                 return -ENOMEM;
> -
> -                       /* Fill the interpolated table. */
> -                       levels_count = 0;
> -                       for (i = 0; i < data->max_brightness - 1; i++) {
> -                               value = data->levels[i];
> -                               n = (data->levels[i + 1] - value) / num_steps;
> -                               if (n > 0) {
> -                                       for (j = 0; j < num_steps; j++) {
> -                                               table[levels_count] = value;
> -                                               value += n;
> -                                               levels_count++;
> -                                       }
> -                               } else {
> -                                       table[levels_count] = data->levels[i];
> -                                       levels_count++;
> +                       /*
> +                        * Fill the interpolated table[x] = y
> +                        * by draw lines between each (x1, y1) to (x2, y2).
> +                        */
> +                       dx = num_steps;
> +                       for (i = 0; i < num_input_levels - 1; i++) {
> +                               x1 = i * dx;
> +                               x2 = x1 + dx;
> +                               y1 = data->levels[i];
> +                               y2 = data->levels[i + 1];
> +                               dy = (s64)y2 - y1;
> +
> +                               for (x = x1; x < x2; x++) {
> +                                       table[x] = y1 +
> +                                               div_s64(dy * ((s64)x - x1), dx);

Yummy, 64-by-32 divisions.
Shouldn't this use a rounded division?

Nevertheless, I think it would be worthwhile to implement this using
a (modified) Bresenham algorithm, avoiding multiplications and
divisions, and possibly increasing accuracy as well.

https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm

>                                 }
>                         }
> -                       table[levels_count] = data->levels[i];
> +                       /* Fill in the last point, since no line starts here. */
> +                       table[x2] = y2;
>
>                         /*
>                          * As we use interpolation lets remove current

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
