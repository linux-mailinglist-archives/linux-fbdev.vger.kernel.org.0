Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C633B583
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Jun 2019 14:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388833AbfFJM6d (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 10 Jun 2019 08:58:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40109 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388985AbfFJM6c (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 10 Jun 2019 08:58:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id a9so6554782lff.7
        for <linux-fbdev@vger.kernel.org>; Mon, 10 Jun 2019 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7DLFQ8by/jV1+O/LDvQ3huJEjoQ4sVNIYrRFls+hbxg=;
        b=kJwSbhswbKbQHzM85JPdk5WWpRJM3BNteN454cZjnKRT4+2cK1IwcgVbguNeugjWKU
         anfYSptxIdmrRV7MDJsWRwyVls6QGDNJe5RT+rmXTGCG/V7I4ey08t14jgw3CqDZdqaM
         4iETn+6dLcyFpjEoplS3FYXNzJi3sRorfA74TrLC+x6NxDVEIZqzxw7UcdmfBUQRlhlD
         XI6GJjZNM0hgCsW6GDaj6cyDatbRJLDB/QZwR6Hjgxqcihk9ghBmHeWACTK2zvqac68v
         dsnJZUC75L3rxuEyKrjXMpty88ykkZ7ebW3xpLMPpt/RQC6Pk3NpgulvKjx1FFOGfJXq
         0hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DLFQ8by/jV1+O/LDvQ3huJEjoQ4sVNIYrRFls+hbxg=;
        b=hNX0ycKCccCH2f56PAEkEf7/OqLVaXZyG03F2PaVGT4o6HsS816P+D36bkDgX/1x6a
         QjB87N1cgNsHEHv32LUMz/iUcHH4D045oDyHgtnS1wt+vZcll64ImWueIzElhDSG/bHe
         /RslfSfk1hV01UyMQFNK05YDR7Mw1vnnH3ZpnMQk9mWuM0w12ilLlGz+vC2mlZAH5Y4A
         On35ng5gV7fXWGWbSbDDLeGxzA6J3Eeopyr5wOuvNNCLiWnZCdyN78C6qp/2ZxxaXOoE
         rUq8ntE2JpLzT6G74aVgVF0YINpJQd33JjD6FNX4lq5TMq1FuiTEvuFN8IINxo6iBi8z
         4xOg==
X-Gm-Message-State: APjAAAVFCr9PW2Lqh83U0N2XMYzhg4TgoI1fT7Rf6rCNKW2zs74Ozkwt
        K3fR7GfEjuSnFk/0PlYiYzQdcHFHLkADgA4FtyOcqw==
X-Google-Smtp-Source: APXvYqw+d2TzVaMlkIN2DtQbw9EMUt0fHjzFymluDcPEIw5oOSKylqjj5JhidkPvvSMbBAUtXjailq7IiV0LAj261QA=
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr28592327lfi.130.1560171510009;
 Mon, 10 Jun 2019 05:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094657.23612-1-anders.roxell@linaro.org> <20190606071052.412a766d@coco.lan>
In-Reply-To: <20190606071052.412a766d@coco.lan>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 10 Jun 2019 14:58:18 +0200
Message-ID: <CADYN=9K0k30U5Uov3RHuSQAe2hfdVCWayWHmVdzQ9umD8Mpi-A@mail.gmail.com>
Subject: Re: [PATCH 0/8] fix warnings for same module names
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        marex@denx.de, stefan@agner.ch, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, b.zolnierkie@samsung.com,
        a.hajda@samsung.com, p.zabel@pengutronix.de, hkallweit1@gmail.com,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
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

On Thu, 6 Jun 2019 at 12:11, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> Em Thu,  6 Jun 2019 11:46:57 +0200
> Anders Roxell <anders.roxell@linaro.org> escreveu:
>
> > Hi,
> >
> > This patch set addresses warnings that module names are named the
> > same, this may lead to a problem that wrong module gets loaded or if one
> > of the two same-name modules exports a symbol, this can confuse the
> > dependency resolution. and the build may fail.
> >
> >
> > Patch "drivers: net: dsa: realtek: fix warning same module names" and
> > "drivers: net: phy: realtek: fix warning same module names" resolves the
> > name clatch realtek.ko.
> >
> > warning: same module names found:
> >   drivers/net/phy/realtek.ko
> >   drivers/net/dsa/realtek.ko
> >
> >
> > Patch  "drivers: (video|gpu): fix warning same module names" resolves
> > the name clatch mxsfb.ko.
> >
> > warning: same module names found:
> >   drivers/video/fbdev/mxsfb.ko
> >   drivers/gpu/drm/mxsfb/mxsfb.ko
> >
> > Patch "drivers: media: i2c: fix warning same module names" resolves the
> > name clatch adv7511.ko however, it seams to refer to the same device
> > name in i2c_device_id, does anyone have any guidance how that should be
> > solved?
> >
> > warning: same module names found:
> >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> >   drivers/media/i2c/adv7511.ko
> >
> >
> > Patch "drivers: media: coda: fix warning same module names" resolves the
> > name clatch coda.ko.
> >
> > warning: same module names found:
> >   fs/coda/coda.ko
> >   drivers/media/platform/coda/coda.ko
>
> Media change look ok, and probably the other patches too, but the
> problem here is: who will apply it and when.
>
> The way you grouped the changes makes harder for subsystem maintainers
> to pick, as the same patch touches multiple subsystems.
>
> On the other hand, if this gets picked by someone else, it has the
> potential to cause conflicts between linux-next and the maintainer's
> tree.
>
> So, the best would be if you re-arrange this series to submit one
> patch per subsystem.

I will send it per subsystem.

Cheers,
Anders

>
>
> >
> >
> > Patch "drivers: net: phy: fix warning same module names" resolves the
> > name clatch asix.ko.
> >
> > warning: same module names found:
> >   drivers/net/phy/asix.ko
> >   drivers/net/usb/asix.ko
> >
> > Patch "drivers: mfd: 88pm800: fix warning same module names" and
> > "drivers: regulator: 88pm800: fix warning same module names" resolves
> > the name clatch 88pm800.ko.
> >
> > warning: same module names found:
> >   drivers/regulator/88pm800.ko
> >   drivers/mfd/88pm800.ko
> >
> >
> > Cheers,
> > Anders
> >
> > Anders Roxell (8):
> >   drivers: net: dsa: realtek: fix warning same module names
> >   drivers: net: phy: realtek: fix warning same module names
> >   drivers: (video|gpu): fix warning same module names
> >   drivers: media: i2c: fix warning same module names
> >   drivers: media: coda: fix warning same module names
> >   drivers: net: phy: fix warning same module names
> >   drivers: mfd: 88pm800: fix warning same module names
> >   drivers: regulator: 88pm800: fix warning same module names
> >
> >  drivers/gpu/drm/bridge/adv7511/Makefile | 10 +++++-----
> >  drivers/gpu/drm/mxsfb/Makefile          |  4 ++--
> >  drivers/media/i2c/Makefile              |  3 ++-
> >  drivers/media/platform/coda/Makefile    |  4 ++--
> >  drivers/mfd/Makefile                    |  7 +++++--
> >  drivers/net/dsa/Makefile                |  4 ++--
> >  drivers/net/phy/Makefile                |  6 ++++--
> >  drivers/regulator/Makefile              |  3 ++-
> >  drivers/video/fbdev/Makefile            |  3 ++-
> >  9 files changed, 26 insertions(+), 18 deletions(-)
> >
>
>
>
> Thanks,
> Mauro
