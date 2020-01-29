Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7909114CCDA
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jan 2020 15:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgA2O7V (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 Jan 2020 09:59:21 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41584 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgA2O7U (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 Jan 2020 09:59:20 -0500
Received: by mail-qk1-f196.google.com with SMTP id s187so17266779qke.8
        for <linux-fbdev@vger.kernel.org>; Wed, 29 Jan 2020 06:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yFFnDEPV8qmyFvWAxO/SsQ1ehnqonaxGmlVfD7DOHfw=;
        b=VRc/dzK3xlehE4NkXiPMTzQvco1YgZqPdC67Aj4XVnuYXdNkzl3gH/3q9wgQCEXrEp
         1WnH9g1GcpcXS/Dadf2PmPjf3BZ1tB89mrZor0Wv6gVb//ED/V9CL85atg8KgIGRbhoE
         UtpOfEjAmgSf0JjL1XlYUR85oWVnW4Did/+iD4hBaKVQD7KQ7PA/i/ZXC3jRIlIcLRbm
         fWUiWIK0RbJxX116SieaSBN3Vnhk6IGxcF3q+sAeB/0tG8ytEOjqZWVUaPOOmh9krclh
         TqIfKEGMyzHJF5V+3bcrRFQBXvSpG3gFoTJ/3goH0dBXGPN7cGqbebQ5QRBCj4Q1+75r
         SzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yFFnDEPV8qmyFvWAxO/SsQ1ehnqonaxGmlVfD7DOHfw=;
        b=Mr4Nngug1zFzd4R1XXShW5wkGbK2/n2rvLE3k80EKq7EL+F1Yx8pSWnwTmdu0/gciP
         dQSjkubmUEskMuUkZxH3xPSVLT1842iT+i9Hq8ukKHawPr+Kesfwcj3bwtPqouSmVG9K
         BYRxTMQ0ISqdNRHcQIYbHRAbwR0W7OKOBxuM9swXIUyKWoCqeOJmcff4v+lTEB+DlVUT
         nQMhyZJ72eqrcLyIISO64IV5bf8Tha3lNVuHagUj6RX5l2hnhJB07MB7KVDRX7y5nH23
         dHoJhK6ouOTKu92hhxq7hG5SeUhpNj2ZQZTbR47DBxU8jHKwovvT/nODGe+gyvk/PNjB
         GUYg==
X-Gm-Message-State: APjAAAUPjKAJq9h16qeIN0fW4CkxgNqdZ6FoEn8o3+PN/Gh1rQaF3b19
        CnHCkCqsym/cMkFFRi9QMCd8wrtWFw3O0iTVbb/szQ==
X-Google-Smtp-Source: APXvYqwBRCLvaDwM/oWv/aFmiTw4TFm3vq6Ctvjx34oTuJTJNW+q/P9l5V5F0gFF1pyjOyG52SAL74GWBo5NlxJ1bQI=
X-Received: by 2002:ae9:e50c:: with SMTP id w12mr25953401qkf.407.1580309959502;
 Wed, 29 Jan 2020 06:59:19 -0800 (PST)
MIME-Version: 1.0
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz> <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
 <20200129141517.GA13721@jagdpanzerIV.localdomain> <20200129141759.GB13721@jagdpanzerIV.localdomain>
 <20200129143754.GA15445@jagdpanzerIV.localdomain>
In-Reply-To: <20200129143754.GA15445@jagdpanzerIV.localdomain>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 29 Jan 2020 15:59:07 +0100
Message-ID: <CACT4Y+bavHG8esK3jsv0V40+9+mUOFaSdOD1+prpw6L4Wv816g@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     anon anon <742991625abc@gmail.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Petr Mladek <pmladek@suse.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        syzkaller <syzkaller@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jan 29, 2020 at 3:40 PM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> Cc-ing Dmitry and Tetsuo
>
> Original Message-id: CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com
>
> On (20/01/29 23:17), Sergey Senozhatsky wrote:
> > > Hmm. There is something strange about it. I use vga console quite
> > > often, and scrolling happens all the time, yet I can't get the same
> > > out-of-bounds report (nor have I ever seen it in the past), even with
> > > the reproducer. Is it supposed to be executed as it is, or are there
> > > any preconditions? Any chance that something that runs prior to that
> > > reproducer somehow impacts the system? Just asking.
> >
> > These questions were addressed to anon anon (742991625abc@gmail.com),
> > not to Bartlomiej.
>
> Could this be GCC_PLUGIN related?

syzkaller repros are meant to be self-contained, but they don't
capture the image and VM setup (or actual hardware). I suspect it may
have something to do with these bugs.
syzbot has reported a bunch of similar bugs in one of our internal kernels:

KASAN: slab-out-of-bounds Read in vgacon_scroll
KASAN: slab-out-of-bounds Read in vgacon_invert_region
KASAN: use-after-free Write in vgacon_scroll
KASAN: use-after-free Read in vgacon_scroll
KASAN: use-after-free Read in vgacon_invert_region
BUG: unable to handle kernel paging request in vgacon_scroll

But none on upstream kernels. That may be some difference in config?
I actually don't know what affects these things. When I tried to get
at least some coverage of that code in syzkaller I just understood
that relations between all these
tty/pty/ptmx/vt/pt/ldisc/vcs/vcsu/fb/con/dri/drm/etc are complex to
say the least...
