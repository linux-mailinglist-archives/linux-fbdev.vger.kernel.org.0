Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFF359567
	for <lists+linux-fbdev@lfdr.de>; Fri, 28 Jun 2019 09:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF1HzW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 28 Jun 2019 03:55:22 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41794 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfF1HzW (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 28 Jun 2019 03:55:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so5196588wrm.8
        for <linux-fbdev@vger.kernel.org>; Fri, 28 Jun 2019 00:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=28q0p8mfEjo9y2tYGYE8ojhpf6JJn4oHqxDJM4Zwywo=;
        b=YVeJdSjXyGRCdF2WmpC/ewATk5iXIkwZ/JIJisZIjk5xmVj1kn09bt61Ahn1Qe/lQg
         5i5n55RmnCX1F8SIlclZUlQA4bK9puQRh2BbQg84wLDjunKlJsXFuPcZksEstlRD35mP
         iAiT17WBFT6EcmLfR/CaS269KYwqzXA+RG0+X/74V3JcYWFQNCrKLewc8YAlk4cptNAy
         rPWHJUWZ0NRDAs79yjPu2rW2AF0Khj2gwSQiNBMmQ1lkRs2cEbOyKFxOwL1GWUXY3a4E
         1pJmhaHTGO1ODS9pjBs9K/Kkjv3AX/xWVEkTMQq310+vE/rwmqQse3mvc4C4Pp73yn5Z
         p8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=28q0p8mfEjo9y2tYGYE8ojhpf6JJn4oHqxDJM4Zwywo=;
        b=CGO7pABUSPk0PXTBscT8MGqgTN7i5y0HMePzPo0/LsQW3wEO/D77EGgUnCuBjBsQav
         Tab03AZFtyLvrVfET9XAM1OOBeVebbceCAd5QRHElyb4B6lRG7S7+Rk5jquGJ788BMMP
         eVQIJrDDJLX7ES+3EzxrG/vxz5nbbGYJHm92S1P70YyNDGkD100CLzghAkYbZznI9PCs
         5B8Fg3lZGKJKGC9UJTFdwMvS0s2wlSR/nINeZFg6sl+3QHCVawcSWZ7uoSbxzS83+/pK
         xTylJPo2tyi2Dr/PehbkeCqB2NSkUMp0Etv6PryRJ5jpdmx1gecG8B0DPkGSWSeO2Cn2
         CraA==
X-Gm-Message-State: APjAAAWE5Le93K+1beArKJ2e7CUH1BZgy/96HG7MVTBy9BU9VVB6/YYX
        Xx1UJaUTOms5MrsnwEZLkHMXHA==
X-Google-Smtp-Source: APXvYqyHwucMhMiFSR2RCdWM5dLpObReYHRWk+PK0l6xFWUQ6oTBpk/rv/91P2HAonWQM7F7VS+UgQ==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr6969556wru.49.1561708519895;
        Fri, 28 Jun 2019 00:55:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u2sm8474802wmc.3.2019.06.28.00.55.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 00:55:18 -0700 (PDT)
Date:   Fri, 28 Jun 2019 08:55:16 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Message-ID: <20190628075516.dwev7fxz7kmox2i2@holly.lan>
References: <20190624203114.93277-1-mka@chromium.org>
 <20190624203114.93277-5-mka@chromium.org>
 <20190626145617.GB22348@xo-6d-61-c0.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626145617.GB22348@xo-6d-61-c0.localdomain>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jun 26, 2019 at 04:56:18PM +0200, Pavel Machek wrote:
> On Mon 2019-06-24 13:31:13, Matthias Kaehlcke wrote:
> > Check if a brightness curve specified in the device tree is linear or
> > not and set the corresponding property accordingly. This makes the
> > scale type available to userspace via the 'scale' sysfs attribute.
> > 
> > To determine if a curve is linear it is compared to a interpolated linear
> > curve between min and max brightness. The curve is considered linear if
> > no value deviates more than +/-5% of ${brightness_range} from their
> > interpolated value.
> 
> I don't think this works. Some hardware does takes brightness in perceptual units,
> converting it in the LED controller.

This check is exclusive to PWM backlights so I'd like to double check
that you are thinking specifically of hardware that takes it's signal
from the PWM and works in perceptual units?

I don't recall any examples being offered when we reviewed the
auto-generated CIE tables (although since that can be overriden by DT it
was not of the same gravity and this example).


Daniel.
