Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F336EDBE8
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Nov 2019 10:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfKDJuG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 4 Nov 2019 04:50:06 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39839 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbfKDJuG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 4 Nov 2019 04:50:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id a11so16209994wra.6
        for <linux-fbdev@vger.kernel.org>; Mon, 04 Nov 2019 01:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zkMcvSms/U4Qaw7R6HtNgaBc3dEVSO6odZWh6NsVfGM=;
        b=ReXeIciiF4NFFhQ/IHMb4yYMIlGw4cQRP3qdhGM+219nNZPv24yYUgtPBwOjkmgo6c
         ZwdFIwEcVH/odn/N6q36fHsB2YJEd2OlYTTLSAJyPfwDyXnEsLekH35c5/8HH4OHVTS+
         +bRNSLbWFjNLk+2TPLtrWBgVbLUz7xWK5NV48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=zkMcvSms/U4Qaw7R6HtNgaBc3dEVSO6odZWh6NsVfGM=;
        b=lIjhsYxIpAmipmDyq2Wx+2DRoydpbZH6qOMDy7Hm8345kfLltjFfBDtx1jza+I93fC
         3G8vi5qvDXpXN0dj40zJerNMAM0F60lWMAlzzT2XS1egpreHPf9y59NgwbzmMOufPhns
         8kFtNfTCH0zfjQ4DXxLmSigd0FwoP94shkYpDWFHIDXD8BKSNoyep5Jh2KUSpDOh/RGr
         78xJP+8FJKd25yAf6Ohx048LVFjZ6OA/DhH9HMid5RLKpKgPE/ytQkxMEP/OEEchZ8gN
         XXBcu4vxqfJFQB39Qiy3sLBq+d7bERYVlaLUDj1B3zp3t92EL/9XMNziGCouUPrU7isM
         38gg==
X-Gm-Message-State: APjAAAW0VQSklqEmXFwLVCXcHigD/536cdIw3HCfu44PbDes5TucTJ0o
        7BwWbjWOaKfReN78Emh+uwvNqQ==
X-Google-Smtp-Source: APXvYqyS9IIRVxDZNgalOrFWi0oIEgRyORArI8t1YtTjTqwHb+ZD4S0expj0K0dwt02Xt23TJXmrPA==
X-Received: by 2002:a5d:55c7:: with SMTP id i7mr23332669wrw.371.1572861003981;
        Mon, 04 Nov 2019 01:50:03 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id r3sm35307740wre.29.2019.11.04.01.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 01:50:03 -0800 (PST)
Date:   Mon, 4 Nov 2019 10:50:01 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] fbdev: c2p: Fix link failure on non-inlining
Message-ID: <20191104095001.GB10326@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190927094708.11563-1-geert@linux-m68k.org>
 <CAMuHMdW7fkPjqppQYESDf4ZLKcCrxhMUyCn0=tm6kxPSxf5mGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7fkPjqppQYESDf4ZLKcCrxhMUyCn0=tm6kxPSxf5mGA@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Nov 04, 2019 at 08:43:07AM +0100, Geert Uytterhoeven wrote:
> Hi Bartlomiej, Andrew,
> 
> On Fri, Sep 27, 2019 at 11:47 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > When the compiler decides not to inline the Chunky-to-Planar core
> > functions, the build fails with:
> >
> >     c2p_planar.c:(.text+0xd6): undefined reference to `c2p_unsupported'
> >     c2p_planar.c:(.text+0x1dc): undefined reference to `c2p_unsupported'
> >     c2p_iplan2.c:(.text+0xc4): undefined reference to `c2p_unsupported'
> >     c2p_iplan2.c:(.text+0x150): undefined reference to `c2p_unsupported'
> >
> > Fix this by marking the functions __always_inline.
> >
> > While this could be triggered before by manually enabling both
> > CONFIG_OPTIMIZE_INLINING and CONFIG_CC_OPTIMIZE_FOR_SIZE, it was exposed
> > in the m68k defconfig by commit ac7c3e4ff401b304 ("compiler: enable
> > CONFIG_OPTIMIZE_INLINING forcibly").
> >
> > Fixes: 9012d011660ea5cf ("compiler: allow all arches to enable CONFIG_OPTIMIZE_INLINING")
> > Reported-by: noreply@ellerman.id.au
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> > This is a fix for v5.4-rc1.
> 
> Can you please apply this for v5.4?
> This is one of the 4 remaining build regressions, compared to v5.3.

Applied to drm-misc-fixes, thanks for your patch.
-Daniel

> 
> Thanks!
> 
> > v2:
> >   - Add Reviewed-by,
> >   - Fix Fixes,
> >   - Add more explanation.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
