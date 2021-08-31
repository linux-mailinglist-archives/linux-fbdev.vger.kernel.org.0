Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87E03FCD6F
	for <lists+linux-fbdev@lfdr.de>; Tue, 31 Aug 2021 21:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240002AbhHaTF6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 31 Aug 2021 15:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239924AbhHaTF4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 31 Aug 2021 15:05:56 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E504AC061575
        for <linux-fbdev@vger.kernel.org>; Tue, 31 Aug 2021 12:05:00 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w19so424060oik.10
        for <linux-fbdev@vger.kernel.org>; Tue, 31 Aug 2021 12:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZvHe6WFLlEOY+cnNyJHf8IUGJZtLzfrewOzKEL/ktBI=;
        b=ACWt0ukBTDTGH9DZcqNb3LHML6ZIXTJi22x9F1+NGl+2yrk61J+GgzScyE3gFTlSlQ
         x226k4VgR+xl+Mxu1P2nWpexNXNlNb1LiuVItVK2b3hkNGxNhP3j+ea03k66KOk1vptW
         JM2F8HfiCiSzN9m0fQJeZ3AwirWfftjNbongs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZvHe6WFLlEOY+cnNyJHf8IUGJZtLzfrewOzKEL/ktBI=;
        b=V8W+tA4f9X7lCBU0OtZcpkGNcEk4kKRSiUH5ZeLD+J7ov4Xw4pX8H6/AXPSRAxHwUH
         Mulv2dC+l7O2lYj/YOc9TvKMsH4sTgaam7Ml3LMkXg1JUIbPAT73KBh7ZYwQOyHIJeUc
         V1IWG+WA52Nmz8JW9KRH48l2UvSGTWahmwjRUAi/FfDYvTt1URDZBU5fOvs8XbIyhAHp
         HzEyJFFgH9XyrRbkNqiLHYVlSSJzL96ddwLbMyNduqDCrxkco+K/ibDSlL0jhO6ISq6F
         WW+mA0hSISWcPu8HlAmhQnvQvlHDGyGCsuFw6iUfTVsTQ+A+dvy0AkV3ykuQObvetl8r
         UupQ==
X-Gm-Message-State: AOAM532zgzJCburl0lNLL0Ki8XSUvxke2Oame/o//VQx5CCuRWQ7nucY
        fzbPxpyzLIY3/ByMjPR4ldjLfEnI3qLw2q7vclaG/Q==
X-Google-Smtp-Source: ABdhPJzuNvtIttTsikeJhpfgPjZLhIkRqb9ifqIW1nYLm/S07/enaQExtksB0ZnMvf3m4HMYN91Gb9HNmjtQutiTXpc=
X-Received: by 2002:a05:6808:1449:: with SMTP id x9mr4264801oiv.14.1630436700262;
 Tue, 31 Aug 2021 12:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com> <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org> <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
 <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
 <CAKMK7uF1cnen2UVWeOL164z1CCqOuRMC5SmM+5GvRvi7C-UOTw@mail.gmail.com> <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
In-Reply-To: <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 31 Aug 2021 21:04:48 +0200
Message-ID: <CAKMK7uHuOQWUnsiH00QFbHKgTdjjryK0ra9We2stojXMiAVgJA@mail.gmail.com>
Subject: Re: [PATCH] fbmem: don't allow too huge resolutions
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Colin King <colin.king@canonical.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Aug 31, 2021 at 8:56 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> On Tue, Aug 31, 2021 at 8:53 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Tue, Aug 31, 2021 at 7:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Aug 31, 2021 at 5:24 PM Tetsuo Handa
> > > <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > > > On 2021/08/31 15:48, Geert Uytterhoeven wrote:
> > > > > Furthermore, this restricts the virtual frame buffer size on 64-bit,
> > > > > too, while graphics cards can have much more than 4 GiB of RAM.
> > > >
> > > > Excuse me, but do you mean that some hardware allows allocating more than
> > > > UINT_MAX bytes of memory for kernel frame buffer drivers?
> > >
> > > While smem_len is u32 (there have been complaints about such
> > > limitations on 64-bit platforms as far as 10 years ago), I see no
> > > reason why a graphics card with more than 4 GiB of RAM would not be
> > > able to provide a very large virtual screen.
> > >
> > > Of course e.g. vga16fb cannot, as it is limited to 64 KiB.
> >
> > The first gpus with 4GB or more memory started shipping in 2012. We're
> > not going to have fbdev drivers for these, so let's not invent code
> > for use-cases that aren't please.
>
> This code path is used with fbdev emulation for drm drivers, too,
> right?

Yeah, you get one buffer, with overallocating 2. That's all, you don't
get the entire vram because we can't revoke that for fbdev users. We'd
have fixed this long ago if it's a real limitations.

8k at 64bpp is still less than 256MB. Also due to pci bar limitations
(which finally get lifted now because windows fixed their pci code,
which motivates motherboard manufactures for desktop space to also fix
theirs) we're limited to 256MB actually cpu visible anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
