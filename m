Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C713B5A6
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Jun 2019 15:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389414AbfFJNCD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 10 Jun 2019 09:02:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40470 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389309AbfFJNCD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 10 Jun 2019 09:02:03 -0400
Received: by mail-lf1-f68.google.com with SMTP id a9so6563915lff.7
        for <linux-fbdev@vger.kernel.org>; Mon, 10 Jun 2019 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FvVmgwiazCcMY+QGQrVG7dPwBjyoAsTBZz5XDskINwU=;
        b=EMSHvZxrNj7zSeWW6JUMb1PjD7XA4L2F3EJBWazAQYFiTny584qw5TGz+HoR4WtRPs
         jt0BFoSOGoG5cEKmGnSsVNUFOekU91241Gxig8HqO889e0o8n1mR0IGZzek77ZNEH0nR
         HNZtFC0cMDMDejIk5zmWW2LivA0+TD8QfSWxb873mnou5gQReddEbu9l7uaLLRATj9k6
         J7joALu5V2Uz0HXzTFybC991OzTTITbWKqyzTde8jVHngHRLH1MBiA42vMBZWBfmHdmL
         TtBrP9BIUOsdEwIlfDTfHuA+NE+2ZOKsggvG/+JwOwZa8/YD8lsLqeWXSvXlt6BSuR9U
         fTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvVmgwiazCcMY+QGQrVG7dPwBjyoAsTBZz5XDskINwU=;
        b=fvcoZP+tr0KYFU24dLuN5N2AtDsw+rqOusAieJRggV0AefQZaJvni6du3Kw/tdu5fN
         qihLHKzVpG/p39Az5ICYErIhBlS/kHMWptWH74zytdjp6QenBlBRDrQMeL1NyDkx5ZFU
         JuuG3tiquJ1SRPYXpPOrfjdArqQ+sNAymfJJBI/y+yQNv8RvSaSNuSc9n2fWqJGnPK37
         xYBdo5vWevaynBdmDjzRZSErSv38fwajpZxUM0KGYxyZe4ZIBnYpFWBeuiqJiyr4tuIz
         +5A07Jck6QhXGNVluenG/uPeLl4ZvLug+yQGvI86DMT8zLOULuvBo79vlH/zx8C+7KaP
         yZtA==
X-Gm-Message-State: APjAAAX18OWTf5Q7B1a1EgB63ViKfKTkRZqGtsF7S4iG7rXBFSyrYtJ/
        fvc44ahizbsce4Ns5KXczcGUTiScyxBMRw03QGMfKg==
X-Google-Smtp-Source: APXvYqztCweeAg9bUK/19CvnD4JyBvcZjEnwDj3sBiLhrLCK6pXF7PHLmDF1b1+3rnaeDnoReMLep6XRUs3DNxTDDHc=
X-Received: by 2002:a19:f601:: with SMTP id x1mr34368114lfe.182.1560171721490;
 Mon, 10 Jun 2019 06:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094736.23970-1-anders.roxell@linaro.org> <20190606105954.GZ2456@sirena.org.uk>
In-Reply-To: <20190606105954.GZ2456@sirena.org.uk>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 10 Jun 2019 15:01:50 +0200
Message-ID: <CADYN=9+5RCiSRQdV+vcUT9cqH6fMAMFpMUmApzT2hRfeivfhHg@mail.gmail.com>
Subject: Re: [PATCH 8/8] drivers: regulator: 88pm800: fix warning same module names
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, andrew@lunn.ch,
        vivien.didelot@gmail.com, f.fainelli@gmail.com, marex@denx.de,
        stefan@agner.ch, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, b.zolnierkie@samsung.com,
        a.hajda@samsung.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, hkallweit1@gmail.com,
        Lee Jones <lee.jones@linaro.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 6 Jun 2019 at 13:00, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jun 06, 2019 at 11:47:36AM +0200, Anders Roxell wrote:
>
> >  obj-$(CONFIG_REGULATOR_88PG86X) += 88pg86x.o
> > -obj-$(CONFIG_REGULATOR_88PM800) += 88pm800.o
> > +obj-$(CONFIG_REGULATOR_88PM800) += 88pm800-regulator.o
> > +88pm800-regulator-objs               := 88pm800.o
>
> Don't do this, no need for this driver to look different to all the
> others in the Makefile - just rename the whole file.

Thank you for your review, I'll rework and resend v2 shortly.

Cheers,
Anders
