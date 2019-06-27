Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C5C57F48
	for <lists+linux-fbdev@lfdr.de>; Thu, 27 Jun 2019 11:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfF0JY6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 27 Jun 2019 05:24:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40001 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbfF0JY5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 27 Jun 2019 05:24:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so1674467wre.7
        for <linux-fbdev@vger.kernel.org>; Thu, 27 Jun 2019 02:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LDEo8sY3vpdehIJiLNOJb41+3SEg4OJB1McKdbsbLIA=;
        b=rxjj862CxQk8EcoCFKXxBXec7q2dUTnfV23dSWU3s6L44wRwVyzKQI9LaItmJJBCYr
         CCunUbf0DyHes+96gfl0uMFK7u1ofaigi6tzk8foroRtjW67UkxmOjGR6pS8kxcMHMQf
         gfDC+UhYjbyEUkiMyFnCXp19uDzY8x/EIFJkHM36kWk82KVh6kEh17ORV4Ap0dqDjQeP
         eodW+lpOR5ylkyFRmF441elJYxUkOm61ILlY1XXEY0Qjg+u0/dV1FxmGel1jFTcSljsA
         mWoLPSgxDbcZ1/DraVDtzbuYhHkXnZ+w/hbhz5oruBYDlQJrnauT9rMlNjkp6tmEGn5i
         i8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LDEo8sY3vpdehIJiLNOJb41+3SEg4OJB1McKdbsbLIA=;
        b=XMKzoIUY5MmLm73YsozUYtSKzgl0tvuajv6eGGUAYICqYE60DlYhEgQs5B3lQC8X4n
         mpOLEKtEBlHD1OSKKlDVBG9geBXjnHKlaWNzxnKEvgs+MbmSqk8wFvB4YqNOG2KtntFi
         urV1Ktvr3Wz38FekHUdDbrK/v/AxtoYJtYyyAE7kk/frSAHVISBZ7FU4T6rNbh8XbYQk
         jRT8YdvupUkQhdH5vRBqe5epz72TuWhMfS4YuWqtkGRgyQK/RjQIRBvwKk/E6UtPuLdh
         FWKwkoL6oJnYmcyUFbvwl8HCOUU/VTf4hcmxr/3eiXAz/CbbG45dCHgcfL+8UC48aVpZ
         An5Q==
X-Gm-Message-State: APjAAAVnTxvKlV83JFCON1RBCYg9m3Ehas6vKpFuv/XtiX7wfGKC2jC4
        bBaxBtmaFQkxL6gYrmDG13f1Jg==
X-Google-Smtp-Source: APXvYqwlvlqQ9PBpwP6Ua8UBVUJ+rHq8wSy378IO2LZ07NL/lYMF4gUKV993A67XO9U+QjopyAUeqg==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr2224711wrj.47.1561627496119;
        Thu, 27 Jun 2019 02:24:56 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id h84sm5790048wmf.43.2019.06.27.02.24.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2019 02:24:55 -0700 (PDT)
Date:   Thu, 27 Jun 2019 10:24:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
Message-ID: <20190627092453.GB2000@dell>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-4-mka@chromium.org>
 <61ed137c-31bb-c695-4174-0484fe667d6c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ed137c-31bb-c695-4174-0484fe667d6c@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 21 Jun 2019, Daniel Thompson wrote:

> On 13/06/2019 20:43, Matthias Kaehlcke wrote:
> > For backlight curves calculated with the CIE 1931 algorithm set
> > the brightness scale type property accordingly. This makes the
> > scale type available to userspace via the 'scale' sysfs attribute.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> I'd like to keep discussion on patch 2 open a bit longer (it's not part of
> the thread below patch 2 but Pavel had concerns about the sysfs interface)
> so this ack won't really push things forward but FWIW:
> 
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

Does this depend on patch 2, or is it orthogonal?

> > ---
> >   drivers/video/backlight/pwm_bl.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index fb45f866b923..f067fe7aa35d 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -553,6 +553,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >   		goto err_alloc;
> >   	}
> > +	memset(&props, 0, sizeof(struct backlight_properties));
> > +
> >   	if (data->levels) {
> >   		/*
> >   		 * For the DT case, only when brightness levels is defined
> > @@ -591,6 +593,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >   			pb->levels = data->levels;
> >   		}
> > +
> > +		props.scale = BACKLIGHT_SCALE_CIE1931;
> >   	} else {
> >   		/*
> >   		 * That only happens for the non-DT case, where platform data
> > @@ -601,7 +605,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >   	pb->lth_brightness = data->lth_brightness * (state.period / pb->scale);
> > -	memset(&props, 0, sizeof(struct backlight_properties));
> >   	props.type = BACKLIGHT_RAW;
> >   	props.max_brightness = data->max_brightness;
> >   	bl = backlight_device_register(dev_name(&pdev->dev), &pdev->dev, pb,
> > 
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
