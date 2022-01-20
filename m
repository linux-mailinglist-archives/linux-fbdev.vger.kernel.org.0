Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95EA4494E01
	for <lists+linux-fbdev@lfdr.de>; Thu, 20 Jan 2022 13:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242601AbiATMd0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 20 Jan 2022 07:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242424AbiATMdZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 20 Jan 2022 07:33:25 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4971EC061574
        for <linux-fbdev@vger.kernel.org>; Thu, 20 Jan 2022 04:33:25 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id s22so8599289oie.10
        for <linux-fbdev@vger.kernel.org>; Thu, 20 Jan 2022 04:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xAsS+cBzF1az+dLK774y0Ar/SOQiJ4SGoUpXhk8OsjE=;
        b=eT3fPkZamZBAgri7MjujHXrtsEzey4T9Zp6+0Cluzpnx1SyMzVpg06GRTyJgcvICa9
         pb8YGVe+v+GWqVHcwACSERnXfhc+mo7smFyFiWFiZx28LivZTYJimDIaFtua/c0fs2T8
         Xf/lQVv+Lqbs6hnDXpzjjyf5bDR9T3dGvCeOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xAsS+cBzF1az+dLK774y0Ar/SOQiJ4SGoUpXhk8OsjE=;
        b=7UW79nlzjw2LwB8SuLzWQrNTf/LiJGlVmBams2y9AWqjlQJzJTN1tttd9cfZhopg+A
         0IcZtODtBQ9IWt9rk27gwGz2u+kYnz/dn0h8utDYReWjXAZIZPkGs1hRrBq/ldA1JM+l
         d0pLuiQFY+Zkmq0DGKudBIlrl2iIdogxsKWw/R0dBDxam4LW/UQcaKD6KBwgle1S5AjQ
         d2CsLmSrVlcerlAzZVHJdpe9ony+sjDI024rtS+Vohr2Q8W6P1wKE0buciyRyS8NlmFl
         65GzF8rO4eusXJnAhlQaBDGA9xL9BeEbp2ptp+dDBoMah1htIrubxUyPadjHYQJdo2Ud
         t3Vg==
X-Gm-Message-State: AOAM530nTFX2g2ipMTi+05lr8zoJmnhLsvNHZjbJq7vosJgfO/96/oVK
        KhwVHttVCaYEXeMoXRkgVUnMuiI2JXNkb/oqTVjONA==
X-Google-Smtp-Source: ABdhPJz0AocIxrCq+aQK4KD7jN9gnG5qVpYlIduVNMO6eQovBYfTFYGKVpBZaUd/YyTNblox0kax2La91eaITvtSMzE=
X-Received: by 2002:a05:6808:3a3:: with SMTP id n3mr7484746oie.128.1642682004640;
 Thu, 20 Jan 2022 04:33:24 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530> <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org> <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org> <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
 <CAKMK7uEOFg3z2btFERQ5XBQ7hqex6bXCb9X=SdwCjeLfX_SdFw@mail.gmail.com> <CAMuHMdVjv1+UNeXkCBE+80tdtLuNg=5d6N12hNLgJdaS-jxERg@mail.gmail.com>
In-Reply-To: <CAMuHMdVjv1+UNeXkCBE+80tdtLuNg=5d6N12hNLgJdaS-jxERg@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 20 Jan 2022 13:33:13 +0100
Message-ID: <CAKMK7uEwDdaR7kDVi9Oah0w8qFEoAywp_wj2eH7DtttVD2L00A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sven Schnelle <svens@stackframe.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jan 20, 2022 at 1:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> On Thu, Jan 20, 2022 at 12:33 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Jan 20, 2022 at 10:06 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Thu, Jan 20, 2022 at 4:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > On Tue, Jan 18, 2022 at 10:33:23AM +0200, Pekka Paalanen wrote:
> > > > > On Mon, 17 Jan 2022 19:47:39 +0100
> > > > > Sven Schnelle <svens@stackframe.org> wrote:
> > > > > > I also tested the speed on my Thinkpad X1 with Intel graphics, and there
> > > > > > a dmesg with 919 lines one the text console took about 2s to display. In
> > > > > > x11, i measure 22ms. This might be unfair because encoding might be
> > > > > > different, but i cannot confirm the 'memcpy' is faster than hardware
> > > > > > blitting' point. I think if that would be the case, no-one would care
> > > > > > about 2D acceleration.
> > > > >
> > > > > I think that is an extremely unfair comparison, because a graphical
> > > > > terminal app is not going to render every line of text streamed to it.
> > > > > It probably renders only the final view alone if you simply run
> > > > > 'dmesg', skipping the first 800-900 lines completely.
> > > >
> > > > Probably more like "render on every vblank", but yes, unlike fbcon it
> > > > surely wouldn't render every single character sent to the terminal.
> > > >
> > > > Also acceleration on modern hardware is more like "compose window
> > > > content using the 3d engine" than "use 2d blitter to scroll the window".
> > > >
> > > > > Maybe fbcon should do the same when presented with a flood of text,
> > > > > but I don't know how or why it works like it works.
> > > >
> > > > fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
> > > > doing it synchronously.
> > >
> > > Hopefully only the parts of the screen which need a redraw?
> > >
> > > Not all displays can be updated that fast. For a "modern" example, see
> > > https://patchwork.freedesktop.org/series/93070/.
> >
> > drm does damage tracking throughout the stack, e.g.
> >
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#damage-tracking-properties
> >
> > And unlike fbdev, it's explicit (so less overhead since userspace
> > generally knows what it's drawn) and doesn't rely on page fault
> > intercepting and fun stuff like that.
>
> My reply was to a paragraph about rendering text by fbcon, not about
> userspace rendering graphics.

Yeah, and ofc when I say "throughout the stack" this also includes the
fbdev emulation, including the mmap intercepting with fbdev_defio and
all that. They all get remapped to that damage tracking property,
which drivers can then inspect using a bunch of helpers.

But reading code&docs is too hard I guess, safer to assume it's just
broken and not supported.
-Daniel

> > Like do people actually know what drm can and cannot do, or would that
> > take out all the fun?
>
> ;-)
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



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
