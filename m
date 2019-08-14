Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7EF8CE63
	for <lists+linux-fbdev@lfdr.de>; Wed, 14 Aug 2019 10:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfHNI2Y (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 14 Aug 2019 04:28:24 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34757 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfHNI2Y (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 14 Aug 2019 04:28:24 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so71475443lfq.1
        for <linux-fbdev@vger.kernel.org>; Wed, 14 Aug 2019 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J83KZGJM1H+25Ep5nDkozma8SkGK+OcDZldJ6QzwaH0=;
        b=cUmVYG8UsBSWCZJv2pd/lU/PNItzi2UNLiW0TfIkMtuhz/f0dnCZQBVRRPzmjzbDU1
         rdC1UiKranq4PCx9s8pGLDdNWlc7JTJqMhRBsGlJk7PTqFNy1P03hYYsmPkCfCPrboHE
         0D/9A510sxkFeysavEIqfp66pVKT46ihtgpDP36P8Z3A4hJbbaT/WITBlrYDFwxlDNcN
         zLMkVCuS8HXPJzOiNrSXY8IyUTRz7gMllIMp1c64kuJZOjJK6HczBxJ2Av8+QOz7gA+0
         T4EXfGOohdgKCjLCVyIixyz3hWalVsJruTGIoJAsFUhUGYsjdb9sJ/UEHSaA2BoPhqiD
         jY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J83KZGJM1H+25Ep5nDkozma8SkGK+OcDZldJ6QzwaH0=;
        b=ixyaqLdwhgBXcHFAp1HPEQz6Zixya8bgj5Z+1ioIIbqbdlAq6Hj/ZJEHlmycYET7Qz
         CfeyuIKjhFcisX7UXhxkDoG97qGwY2UtYyfbCrFWiTkIIvuKcz6IGi4UGdUtxJ2jADho
         W83Zam7ouUwQGSA08h4kR+zVReZu2Ie9yAmF++A8vwH06V9n5WwzCu++MpP25FBw4yMH
         0VqBTALybCwT37zBCmE/mzsOfV7lPWiezfL7rvm71ue8ZrzuJGMuOrVJX5MPG7HdVCRI
         tBwymy7K1/HEYsVLjEa/D1tOtZT2VqHW0z+MMhg55Nr6RuzlcXxBLUcCPSm8+tCB5+pA
         YkhQ==
X-Gm-Message-State: APjAAAXuoLMGa6RyvNj8XfD1xWvPqg7itbdiHnKAXx8bGpdkm3ga6QCh
        HLCu0snNAkorgTUUl9j7gUWxQRlxoQO5wNWQkEU/rw==
X-Google-Smtp-Source: APXvYqx/pKIYf3ADrbaWtwPl1LapITMRPkDGA7rLXKcmW0V2qmaOIyExXYgPPecgdSpyox9WXnP5n7P2WaFpzCnXOK0=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr26028436lfn.60.1565771302470;
 Wed, 14 Aug 2019 01:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190812073020.19109-1-geert@linux-m68k.org>
In-Reply-To: <20190812073020.19109-1-geert@linux-m68k.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:28:10 +0200
Message-ID: <CACRpkdZAA8N6igrNaXcT5m62Fz2irRL-tyRZnjWgsxfacB2aow@mail.gmail.com>
Subject: Re: [PATCH] m68k: atari: Rename shifter to shifter_st to avoid conflict
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        kbuild test robot <lkp@intel.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Aug 12, 2019 at 9:30 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> When test-compiling the BCM2835 pin control driver on m68k:
>
>     In file included from arch/m68k/include/asm/io_mm.h:32:0,
>                      from arch/m68k/include/asm/io.h:8,
>                      from include/linux/io.h:13,
>                      from include/linux/irq.h:20,
>                      from include/linux/gpio/driver.h:7,
>                      from drivers/pinctrl/bcm/pinctrl-bcm2835.c:17:
>     drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
>     arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'
>      # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>
> "shifter" is a too generic name for a global definition.
>
> As the corresponding definition for Atari TT is already called
> "shifter_tt", fix this by renaming the definition for Atari ST to
> "shifter_st".
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Suggested-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Finally we can use the sh pfc pin controller on our m68k Atari.

Now if I can only resolder the capacitors on my Atari TT ST
before the board self-destructs I will one day test this.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
