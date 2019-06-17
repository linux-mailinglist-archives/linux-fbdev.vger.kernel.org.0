Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCFE47BD2
	for <lists+linux-fbdev@lfdr.de>; Mon, 17 Jun 2019 10:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfFQIGy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 17 Jun 2019 04:06:54 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43433 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfFQIGy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 17 Jun 2019 04:06:54 -0400
Received: by mail-lf1-f65.google.com with SMTP id j29so5781602lfk.10
        for <linux-fbdev@vger.kernel.org>; Mon, 17 Jun 2019 01:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBAIYgr3qMK7KPe2vk2HnkrCN8Z499UT+fyGo5dytmg=;
        b=PeiQD7ucu6ttWMmG1WUhfQKedVRpBzDvgC7nLN33W740jH8McmcV8/PiKVWlLOLLvo
         uelNath+qcbvdpiNwNqUc+uFnEn3T0gPVMrBwIxESI3mYZDk2hrMshx+9GNb2ZWcVFNN
         1bygO0ujsboXZT8p88gh+UQSWgccqUkhYesNm0NJKnM2gnNEFcavWFHy8RRwKUZJ8F4Q
         dKkm+RgnAUyrPdhjhZZWCyshJ0GzdEHjorsZtOkQHrOfWEo6qFOT7J4Lk9qzzuBpuYVM
         4eGIXa3gX7nti5Gkq7n5DKmX3eOcDIJ/X+d2JI4sZnYqTL9sZ500x27K64vWwYMWVrbJ
         fu0g==
X-Gm-Message-State: APjAAAUVJWM9ySpldwCztH/oktRpY72M3Mp5v4lUOS3bIqRujeDpbDqg
        vxB6J251oW8qSh+vmjHpWkdN73WK6Cfaeh+wpV8=
X-Google-Smtp-Source: APXvYqxsNaI0j7ZDK/oBDGI+JMsaCwWe50htav7v93pfnpqy1paFPPZWjCEXJWv9iX6EQ2tFXHlJ785TORXA5arqirk=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr7058679lfn.75.1560758812459;
 Mon, 17 Jun 2019 01:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190614023225.GA27938@t-1000>
In-Reply-To: <20190614023225.GA27938@t-1000>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jun 2019 10:06:39 +0200
Message-ID: <CAMuHMdW0iHNuS2Q1n4jynVGrgcnOPrLWX08ffWdT3GUGaidt-g@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
To:     Shobhit Kukreti <shobhitkukreti@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Shobhit,

Thanks for your patch!

On Fri, Jun 14, 2019 at 4:34 AM Shobhit Kukreti
<shobhitkukreti@gmail.com> wrote:
> Cleaned up code to resolve  the checkpatch error
> ERROR: space prohibited before that close parenthesis ')'
> from the file:
>
> fbtft/fbtft-bus.c

IMHO that is a bogus checkpatch error...

> Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 2ea814d..2b43bc2 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,9 +62,9 @@ out:                                                                        \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
>
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
>  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
> -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)

... as the space is the (mandatory) separator between the comma and the
(empty) last parameter value.

Checkpatch has some limitations when parsing the C preprocessor macro
languagage.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
