Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F5E3D332
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Jun 2019 19:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405146AbfFKRBf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 11 Jun 2019 13:01:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42533 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404882AbfFKRB1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 11 Jun 2019 13:01:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so7795704pff.9
        for <linux-fbdev@vger.kernel.org>; Tue, 11 Jun 2019 10:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D/6K52cqkgjun9QL50SRby3oaZewpSvBQVwA1lCewfo=;
        b=XtFdaHCTpTDf0qQhQfuAjHKGqAns0vrUqrQg02/8jVmR8p0ZzKKlHKnR9VJJBokSNm
         ZgAQrr+A/h9J30599wfzOGisk8Qu8DlWAbSCBG5dzc6KA8829UtBGHKxwnkcRV2MXxbW
         ILseuhOSbtocL+Hw4Y3nT83V4Ab6Y2qlkb2SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D/6K52cqkgjun9QL50SRby3oaZewpSvBQVwA1lCewfo=;
        b=oe4bA76KgDdLGH9bYJxtOIMO1o6HR5d3APa+1ZF+15kjxp0bGw5fCtxsJRrJ9jOTRA
         lN3+a+zUYh8XNsyuEXZ7UVlSJd5e3+Y+/deZLO2qqtlupicoo41Yt7z+QvLXaln2gi4j
         YYXQeyUqjQlYqlYM+d7Qt59vGYR+u9eLXwRDAvUPn5D5lWitpVU9niJsOLIGo8SeD3Hd
         +rfVpvYJ3SBS5bQyp0wHX7fm067FXjTZWXZz8MCn5yd2R/+R92j/M2pQFvBVNN9WFOku
         cEwFHMLi8YAH7OKaYEDFVqxGW+ryZrC0TyYA7VPsrMO5m4rqkS0UsAQAZY3ezTHCW95M
         uDfQ==
X-Gm-Message-State: APjAAAXYrqMAlzdO99JSIWUYubWF2uy/XgsjBZdm8CdJ6KrZNXDPS92m
        3JikIeVuGdNkfOBBVj2XMefNRQ==
X-Google-Smtp-Source: APXvYqwqnW/JGe6b0ykApW2Df5C6hfjZci1Q+jK6X2Ei83loTkx83Y/j5N8snl0nAtPHXvq5b2N3cg==
X-Received: by 2002:a63:4e10:: with SMTP id c16mr20869964pgb.214.1560272486514;
        Tue, 11 Jun 2019 10:01:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id p1sm5962781pff.74.2019.06.11.10.01.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 10:01:25 -0700 (PDT)
Date:   Tue, 11 Jun 2019 10:01:23 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 2/2] backlight: pwm_bl: Get number of brightness levels
 for CIE 1931 from the device tree
Message-ID: <20190611170123.GD137143@google.com>
References: <20190610233739.29477-1-mka@chromium.org>
 <20190610233739.29477-2-mka@chromium.org>
 <20190611153314.cj6j6l4kcl4kk4t2@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190611153314.cj6j6l4kcl4kk4t2@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Daniel,

On Tue, Jun 11, 2019 at 04:33:14PM +0100, Daniel Thompson wrote:
> On Mon, Jun 10, 2019 at 04:37:39PM -0700, Matthias Kaehlcke wrote:
> > Commit 88ba95bedb79 ("backlight: pwm_bl: Compute brightness of LED
> > linearly to human eye") uses pwm_period / hweight32(pwm_period) as
> > as heuristic to determine the number of brightness levels when the DT
> > doesn't provide a brightness level table. This heuristic is broken
> > and can result in excessively large brightness tables.
> > 
> > Instead of using the heuristic try to retrieve the number of
> > brightness levels from the device tree (property 'max-brightness'
> > + 1). If the value is not specified use a default of 256 levels.
> 
> I'll look at the code tomorrow but why 256?
> 
> To me it feels simultaneously too big for a simple 8-bit PWM and too
> small for animated backlight effects.

I agree there is no one-size-fits-it-all default, 256 seemed like a
possible compromise.

> I certainly agree that an override could be useful but I'm not clear why
> deriving a default based on the period is bogus (and the description is
> merely concerned about uselessly big tables).

Maybe it's not necessarily bogus, but the current heuristic that
counts the number of set bits (hweight()) in the period certainly is.

IIUC the period provides a clue about the PWM resolution, because it
would be hard/impossible to accomodate the high resolution in shorter
periods.

> /*
>  * Once we have 4096 levels there's little point going much higher...
>  * neither interactive sliders nor animation benefits from having
>  * more values in the table.
>  */
> max_brightness = min(DIV_ROUND_UP(period, ffs(period), 4096);

I was also considering something along these lines, but wasn't sure
if there is indeed a relation between the period and the PWM
resolution. I take your suggestion as a confirmation :)
