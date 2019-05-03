Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0257C12F16
	for <lists+linux-fbdev@lfdr.de>; Fri,  3 May 2019 15:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfECN3i (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 3 May 2019 09:29:38 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37821 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfECN3h (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 3 May 2019 09:29:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id y5so6796008wma.2
        for <linux-fbdev@vger.kernel.org>; Fri, 03 May 2019 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UiiURwV+csCsGFRj/M2EvTMLMlk1L513hkjExJHkVEs=;
        b=e0kosvW7YUPpY4q0WS+jyio53RdExQS62XQnEHyBmCxIHKCBWazHrqKfLNh+eOEieV
         I2bVKlwVGg0oI3yJoOLsDsrD91dTw7V5D5/cEs/eOR9DZ5OmnPiBEuDApU4xkcXfxe2X
         o7bJMLvk5gP59Q3seFovLewo/ILLvmgMz7b2xyr2qU5SV4kP+psmWOztcoXQQ3tSpolP
         nOchj/xqxMmUd3yhD8nAlE0amuKDxMyFNej4nv2y5YZZt5GvQDyTzGZB5qPUQ/DBX0Qp
         q/d/Hd3vvz6aIqXSzBmBxlFg0JULwwQfQ6rfbhB9NDIqzT/ZqfdUzhADnIqaqWQdbLeB
         hkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UiiURwV+csCsGFRj/M2EvTMLMlk1L513hkjExJHkVEs=;
        b=CWibGG5xaq8dP74T2syPQtrad0vC4hstv3YOndTjoWbx9oOMBbWzkfIElQwW99U/Tt
         CYcbOGoEUtSyUu+ikA3JAq3H/2bV246u2e8nn1oe8h3KKF/s/weikJbo+4GYJgST5vXS
         8b2d+5h/18ZoCDqDT+97DteDPgTE0NPFhGOi1DeLyMbylaHVtcEvsQVK4LfZzqATFzUT
         PnnS0qZTIZuTXFFJLQIXGCA0tHLx3MZtquRGy+SS2ozQFjBV/7/zcehRExuUEefuELET
         kVm7vtt291nnVecs2bTfG0QlYFFZf0ejDR0EDSXsgANQ1QlDYQ9Mx471wNf7pN8Naj5g
         MpSQ==
X-Gm-Message-State: APjAAAUfSuZiTEYkTvvtr1TzwrTfGGEsq7t7O0V09sGttbgwUn7IXT06
        xZOIjNpuuB9a8E70bq8ZpZt7mQ==
X-Google-Smtp-Source: APXvYqzA0vhwJpj92WdDars413IpWNcg1yQiVM9kEifAW+RTVzyZeKAKG9EQBfSsSikTgk3bWBMNUA==
X-Received: by 2002:a1c:7610:: with SMTP id r16mr6360976wmc.15.1556890175153;
        Fri, 03 May 2019 06:29:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id o6sm2901085wre.60.2019.05.03.06.29.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 06:29:34 -0700 (PDT)
Date:   Fri, 3 May 2019 14:29:32 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: Re: [PATCH] backlight: rave-sp: don't touch initial state and
 register with correct device
Message-ID: <20190503132932.2e3vrvlykofpexkf@holly.lan>
References: <20190429152919.27277-1-l.stach@pengutronix.de>
 <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
 <1556798505.2590.7.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556798505.2590.7.camel@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, May 02, 2019 at 02:01:45PM +0200, Lucas Stach wrote:
> Hi Daniel,
> 
> Am Donnerstag, den 02.05.2019, 11:33 +0100 schrieb Daniel Thompson:
> > On 29/04/2019 16:29, Lucas Stach wrote:
> > > This way the backlight can be referenced through its device node and
> > > enabling/disabling can be managed through the panel driver.
> > 
> > Is it possible to implement something similar to 
> > pwm_backlight_initial_power_state() to handle this?
> 
> I'm not aware of any protocol to the RAVE-SP that would allow to read
> back the backlight state. AFAICS the backlight is implemented as a
> unidirectional protocol.

That function does two things... one is read the current power state to
ensure meta-data is correctly up to date which cannot be replicated.
The other is to choose different behaviour depending on whether the
backlight is standalone or has a phandle link to another device.

Does the second part apply to the rave-sp?


Daniel.



> > backlight drivers already suffer from too much diversity so I prefer 
> > things like this to align behaviour with the (fairly heavilyly used) PWM 
> > driver if possible.
> > 
> > 
> > Daniel.
> > 
> > 
> > > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > ---
> > >   drivers/video/backlight/rave-sp-backlight.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/rave-sp-backlight.c b/drivers/video/backlight/rave-sp-backlight.c
> > > index 462f14a1b19d..d296bfcf4396 100644
> > > --- a/drivers/video/backlight/rave-sp-backlight.c
> > > +++ b/drivers/video/backlight/rave-sp-backlight.c
> > > @@ -48,15 +48,13 @@ static int rave_sp_backlight_probe(struct platform_device *pdev)
> > > > >   	struct device *dev = &pdev->dev;
> > > > >   	struct backlight_device *bd;
> > >   
> > > > > -	bd = devm_backlight_device_register(dev, pdev->name, dev->parent,
> > > > > +	bd = devm_backlight_device_register(dev, pdev->name, dev,
> > > > >   					    dev_get_drvdata(dev->parent),
> > > > >   					    &rave_sp_backlight_ops,
> > > > >   					    &rave_sp_backlight_props);
> > > > >   	if (IS_ERR(bd))
> > > > >   		return PTR_ERR(bd);
> > >   
> > > > > -	backlight_update_status(bd);
> > > -
> > > > >   	return 0;
> > >   }
> > >   
> > > 
> > 
> > 
