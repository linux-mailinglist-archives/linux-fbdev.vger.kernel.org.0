Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8C2EFABD
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Nov 2019 11:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388310AbfKEKRt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 5 Nov 2019 05:17:49 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50298 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388128AbfKEKRt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 5 Nov 2019 05:17:49 -0500
Received: by mail-wm1-f67.google.com with SMTP id 11so20224704wmk.0
        for <linux-fbdev@vger.kernel.org>; Tue, 05 Nov 2019 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fNwu5Brajivr2NZ+53CyrBT2A5quV+LusyMm1pW2iI4=;
        b=Svr0IOsnkV9uVg/wKUTFvPy0qCkSTYOZs+R3aU79Dp+7ujp/ZXBprGDTPc0rLHfI7s
         VXryGU7kIKqHDwe5tREK11WYlbZq4eWm3Kc2rtO7mC+OpAWnx4dlQKjg6NEfCRyLa5ea
         bLew8FfugD4c6fjaiQY+vFWl9Z1poGasldw4clK9AQEJxMgQ4KxSTmV5PKOdZYCmwfPV
         9i1t3A/3UK5mO6Trk1Skr6MyslHPEnuzjTWerWmFz20fGmbsaoe1u5HC2DI4sPp8xukM
         yfMq8tdIjgrLh0cCpwnPQRm+X9bEDFydYxFRKXammO4Kq3Kw0D6cJhX5XpaNlE4VInNV
         itfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fNwu5Brajivr2NZ+53CyrBT2A5quV+LusyMm1pW2iI4=;
        b=ZuDpiA5mqa4xPw5bA2i7/XURrMow38Aa4+IM8lRVJX55eWBbNkQBBm4kuvKno8rmOe
         oJizfxoRgUuR/Gpo6xlg5WZNfUPk1DyoTN/fialzEVirkr7yQBB8kEg0zj9ayHXO++pA
         svJyocF0MnYFvJLdaLTNsIHzxE9yp3zrC+F7JnkaXAcfv9AnzmT8iSSU1sLgF5aNq5B4
         x8Gj1oxPira42CaKevaM64R2Rqh1cM3YgXNWJaDZeAhN3ZvROdrYo5QcgTrzo0poeuo7
         MFTwVEq4/DliIddPgpf7OWpTJjWgj+N2qJOzDxaCoZC3Fwr1XLEn0/PjSXoTdfR1idJY
         fxKA==
X-Gm-Message-State: APjAAAXYtqko5itUIU51CFph1mgRAWgk6GNrs+eCbfU0428VGC1wKYOV
        0OUSYwINc01wbd/vRL6Gr3tXvA==
X-Google-Smtp-Source: APXvYqwco7NI1yNgZpp2/qpqSq4V+HjXy7jIUynHKwu8FbE4cdXYH516yi26h8p96gVT/T4eKt2BBg==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr3623783wmk.94.1572949066778;
        Tue, 05 Nov 2019 02:17:46 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id d2sm25272593wmd.2.2019.11.05.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:17:46 -0800 (PST)
Date:   Tue, 5 Nov 2019 10:17:44 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 38/46] video: backlight: tosa: use gpio lookup table
Message-ID: <20191105101744.kzdpopq25slbfuue@holly.lan>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-38-arnd@arndb.de>
 <CACRpkdajkSh6Bbvpfycm83j1GuCm+pTfw9fQS53JEfG2i07MKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdajkSh6Bbvpfycm83j1GuCm+pTfw9fQS53JEfG2i07MKg@mail.gmail.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Nov 05, 2019 at 11:04:44AM +0100, Linus Walleij wrote:
> On Fri, Oct 18, 2019 at 5:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > The driver should not require a machine specific header. Change
> > it to pass the gpio line through a lookup table, and move the
> > timing generator definitions into the drivers itself.
> >
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > ---
> > I'm not overly confident that I got the correct device names
> > for the lookup table, it would be good if someone could
> > double-check.
> 
> You're anyway doing more than required for the people who
> may or may not be using this platform. Brokenness can surely
> be fixed later, it's not like we are taking down the entire Amazon
> cloud or something.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Same here. I read, I did't see anything wrong but I can't test.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
