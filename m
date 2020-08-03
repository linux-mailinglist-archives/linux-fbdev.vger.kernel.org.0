Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFDC23A136
	for <lists+linux-fbdev@lfdr.de>; Mon,  3 Aug 2020 10:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgHCIpT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Aug 2020 04:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgHCIpT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 3 Aug 2020 04:45:19 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129E3C06174A
        for <linux-fbdev@vger.kernel.org>; Mon,  3 Aug 2020 01:45:19 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id z22so2022416oid.1
        for <linux-fbdev@vger.kernel.org>; Mon, 03 Aug 2020 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gCUQRtjhgMP+4GbBlVgd/KVwJHXD6T5ihkhKQfTfDnU=;
        b=Hch2bh2tVN4GKSCCG47YFGcb33DidnAU0pRKNrC6oElbJ3glt2FoXG+13dUia3VYc/
         D7B6Ra3TG2G4k8P1ViHNYEhdkuYmmYwHY3uCpoPmJz4tunDAm1LbIDEMrc0y5b6U3NvB
         INwJeEmQ9u/BXHXS33nqaRRqxkdRL7GWZ5NLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gCUQRtjhgMP+4GbBlVgd/KVwJHXD6T5ihkhKQfTfDnU=;
        b=ZFmKqRsl8UTpTq84qlVCS8h0Kyp1/VlIT+vLe21uBXXkiq0LYL0YuxD3a1BJ1X8I6Q
         2a5kN+sgeh4gfZhaK7Ox/PgZSrd9VkilCMorSilpDNjq9UHy36h/opF8cFJC/PMGIbRM
         DlQeGTi4i6w5bZ7hz58vGYR1e3GSJNkvjFJJvgqHwi7yqioZ0zxykas5koW2Bzfhquwq
         JoSZM2kXhLUHxJGPnmkTNrQ/fvUMTJvBgmx+SQQiyNwN+tlmqPa+EYauPp30fQlcKELq
         5tLQCZjyVJmphiXfLhyl3MF8jVzF/p9hxE3Ag9ZqAuDOFqWmfm1/fYhYBICN/C66U8dB
         RsQw==
X-Gm-Message-State: AOAM531ppnORL0cswLlaS+bSmDkiwlzkzk1ttlgYTQJMHkxgjRdt76oy
        q16FtUWJBhmcf7cZu6zowv5AeLsoHSOPTIDwu+5IVg==
X-Google-Smtp-Source: ABdhPJyId8XExJYVy8L0eC778A06mCCWCXZXLWXucocgDo0ClcYsQp5fGA/P5XZTfEUbLvnRb5egClDmVXOjvoGR4Ag=
X-Received: by 2002:aca:ab87:: with SMTP id u129mr11811035oie.128.1596444318309;
 Mon, 03 Aug 2020 01:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <659f8dcf-7802-1ca1-1372-eb7fefd4d8f4@kernel.org>
 <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com> <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
 <9386c640-34dd-0a50-5694-4f87cc600e0f@kernel.org> <20200803081823.GD493272@kroah.com>
In-Reply-To: <20200803081823.GD493272@kroah.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 3 Aug 2020 10:45:07 +0200
Message-ID: <CAKMK7uEV+CV89-L1Y=dijOEy8DKE=juRfQDnNnbhbAJhFh1fYw@mail.gmail.com>
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
To:     Greg KH <greg@kroah.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Kyungtae Kim <kt0755@gmail.com>,
        Anthony Liguori <aliguori@amazon.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        DRI devel <dri-devel@lists.freedesktop.org>,
        "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
        Solar Designer <solar@openwall.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        xiao.zhang@windriver.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Aug 3, 2020 at 10:26 AM Greg KH <greg@kroah.com> wrote:
>
> On Mon, Aug 03, 2020 at 10:08:43AM +0200, Jiri Slaby wrote:
> > Hi,
> >
> > On 31. 07. 20, 7:22, =E5=BC=A0=E4=BA=91=E6=B5=B7 wrote:
> > > Remove whitespace at EOL
> >
> > I am fine with the patch. However it should be sent properly (inline
> > mail, having a PATCH subject etc. -- see
> > Documentation/process/submitting-patches.rst). git send-email after git
> > format-patch handles most of it.
> >
> > There is also question who is willing to take it?
> >
> > Bart? Greg? Should we route it via akpm, or will you Linus directly? (I
> > can sign off and resend the patch which was attached to the mail I am
> > replying to too, if need be.)
>
> I can take it, if Bart can't, just let me know.

Yeah vt stuff and console drivers !=3D fbcon go through Greg's tree past
few years ...

Greg, should we maybe add a MAINTAINERS entry that matches on all
things console? With tty/vt you definitely have the other side of that
coin already :-)
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
