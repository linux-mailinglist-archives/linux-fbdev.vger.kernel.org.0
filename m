Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED20E22B125
	for <lists+linux-fbdev@lfdr.de>; Thu, 23 Jul 2020 16:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgGWOVI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 23 Jul 2020 10:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726815AbgGWOVH (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 23 Jul 2020 10:21:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16BBD20759;
        Thu, 23 Jul 2020 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595514067;
        bh=DwG9+pXoNYRP1xXdYl20/XfML1PesR93kEaPYXidrE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kxf2jh3n16Cqi842NE27sFgWtSWK+7ENJd5lTnUXfLSPQeqgXGOlI1AZdGACV/zJv
         g4o6uamQTJm7iIu6ox+u4upCTlzSjSqqtGnVzjivV2q/uLDAyQwvV9PVMgpRjh7aAW
         Vaff7IalES2a7kZ1v7zAgr7DMIOLBl2aXDSLZAuw=
Date:   Thu, 23 Jul 2020 16:21:11 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        George Kennedy <george.kennedy@oracle.com>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
Message-ID: <20200723142111.GA2377086@kroah.com>
References: <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200715094836.GD2571@kadam>
 <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
 <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
 <20200715151220.GE2571@kadam>
 <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
 <20200716100006.GN3278063@phenom.ffwll.local>
 <b202b74b-6a7b-e2be-2350-72144331303b@i-love.sakura.ne.jp>
 <20200721160836.GA2109047@kroah.com>
 <CAKMK7uGtDQKkSJhvr4YrGOmcbfVyTeEvSD-QSoHhUtH8=D856w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGtDQKkSJhvr4YrGOmcbfVyTeEvSD-QSoHhUtH8=D856w@mail.gmail.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 22, 2020 at 10:07:06AM +0200, Daniel Vetter wrote:
> On Tue, Jul 21, 2020 at 6:08 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jul 16, 2020 at 08:27:21PM +0900, Tetsuo Handa wrote:
> > > On 2020/07/16 19:00, Daniel Vetter wrote:
> > > > On Thu, Jul 16, 2020 at 12:29:00AM +0900, Tetsuo Handa wrote:
> > > >> On 2020/07/16 0:12, Dan Carpenter wrote:
> > > >>> I've complained about integer overflows in fbdev for a long time...
> > > >>>
> > > >>> What I'd like to see is something like the following maybe.  I don't
> > > >>> know how to get the vc_data in fbmem.c so it doesn't include your checks
> > > >>> for negative.
> > > >>
> > > >> Yes. Like I said "Thus, I consider that we need more sanity/constraints checks." at
> > > >> https://lore.kernel.org/lkml/b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp/ ,
> > > >> we want basic checks. That's a task for fbdev people who should be familiar with
> > > >> necessary constraints.
> > > >
> > > > I think the worldwide supply of people who understand fbdev and willing to
> > > > work on it is roughly 0. So if someone wants to fix this mess properly
> > > > (which likely means adding tons of over/underflow checks at entry points,
> > > > since you're never going to catch the driver bugs, there's too many and
> > > > not enough people who care) they need to fix this themselves.
> > >
> > > But I think we can enforce reasonable constraint which is much stricter than Dan's basic_checks()
> > > (which used INT_MAX). For example, do we need to accept var->{xres,yres} >= 1048576, for
> > > "32768 rows or cols" * "32 pixels per character" = 1045876 and vc_do_resize() accepts only
> > > rows and cols < 32768 ?
> > >
> > > >
> > > > Just to avoid confusion here.
> > > >
> > > >> Anyway, my two patches are small and low cost; can we apply these patches regardless
> > > >> of basic checks?
> > > >
> > > > Which two patches where?
> > >
> > > [PATCH v3] vt: Reject zero-sized screen buffer size.
> > >  from https://lkml.kernel.org/r/20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp
> >
> > This is now in my tree.
> >
> > > [PATCH v2] fbdev: Detect integer underflow at "struct fbcon_ops"->clear_margins.
> > >  from https://lkml.kernel.org/r/20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp
> >
> > That should be taken by the fbdev maintainer, but I can take it too if
> > people want.
> 
> Just missed this weeks pull request train and feeling like not worth
> making this an exception (it's been broken forever after all), so
> maybe best if you just add this to vt.
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Also this avoids the impression I know what's going on in fbdev code,
> maybe with sufficient abandon from my side someone will pop up who
> cares an fixes the bazillion of syzkaller issues we seem to have
> around console/vt and everything related.

Great, will go queue it up now, thanks!

greg k-h
