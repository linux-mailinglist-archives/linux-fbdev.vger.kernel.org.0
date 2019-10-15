Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06A5BD7E7C
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2019 20:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfJOSJR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Oct 2019 14:09:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:40282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfJOSJR (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Oct 2019 14:09:17 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB50520659;
        Tue, 15 Oct 2019 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571162955;
        bh=pfUcHAJ+PNF6T1BeIRAUUlIhaxPXRX2OzwJOiZJxCiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOC5Xt+rh/f4SvYnv84KHqDtWWXkZsJuTyPboILtGfFJ0uTH1WcfFa5wuzccHNWiz
         wYAnI2QI4pyuMtTiJNUgNn26QGP8B+seze9XXzur6GhDEVxkZumUVxjaJBlg3PJFPQ
         sUxgxzK/aDDOvqzita5ZbL9ZpnZYXloVwgxCv4i4=
Date:   Tue, 15 Oct 2019 20:05:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Adam Jackson <ajax@redhat.com>,
        "Syrjala, Ville" <ville.syrjala@linux.intel.com>,
        Mathieu Malaterre <malat@debian.org>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Jonathan Corbet <corbet@lwn.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v2 00/15] DRM fbconv helpers for converting fbdev drivers
Message-ID: <20191015180503.GA1082328@kroah.com>
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191015143318.GP11828@phenom.ffwll.local>
 <5241e699-f66a-d212-03a5-bb736639e66b@suse.de>
 <CAKMK7uGTAxYNhS7TqEFVA+Gd+-4WOMq7JXPZRF8_a9EP69TkTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGTAxYNhS7TqEFVA+Gd+-4WOMq7JXPZRF8_a9EP69TkTQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Oct 15, 2019 at 07:48:29PM +0200, Daniel Vetter wrote:
> On Tue, Oct 15, 2019 at 7:28 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi Daniel
> >
> > Am 15.10.19 um 16:33 schrieb Daniel Vetter:
> > > Hi Thomas,
> > >
> > > On Mon, Oct 14, 2019 at 04:04:01PM +0200, Thomas Zimmermann wrote:
> > >> (was: DRM driver for fbdev devices)
> > >>
> > >> This is version 2 of the fbdev conversion helpers. It's more or less a
> > >> rewrite of the original patchset.
> > >>
> > >> The fbdev subsystem is considered legacy and will probably be removed at
> > >> some point. This would mean the loss of a signifanct number of drivers.
> > >> Some of the affected hardware is not in use any longer, but some hardware
> > >> is still around and provides good(-enough) framebuffers.
> > >>
> > >> The fbconv helpers allow for running the current DRM stack on top of fbdev
> > >> drivers. It's a set of functions that convert between fbdev interfaces and
> > >> DRM interfaces. Based on SHMEM and simple KMS helpers, it only offers the
> > >> basic functionality of a framebuffer, but should be compatible with most
> > >> existing fbdev drivers.
> > >>
> > >> A DRM driver using fbconv helpers consists of
> > >>
> > >>   * DRM stub code that calls into fbconv helpers, and
> > >>   * the original fbdev driver code.
> > >>
> > >> The fbdev driver code has to be modified to register itself with the
> > >> stub driver instead of the fbdev core framework. A tutorial on how to use
> > >> the helpers is part of this patchset. The resulting driver hybrid can be
> > >> refactored into a first-class DRM driver. The fbconv helpers contain a
> > >> number of comments, labeled 'DRM porting note', which explain the required
> > >> steps.
> > >>
> > >> I tested the current patchset with the following drivers: atyfb, aty128fb,
> > >> matroxfb, pm2fb, pm3fb, rivafb, s3fb, savagefb, sisfb, tdfxfb and tridentfb.
> > >> With each, I was able to successfully start with fbcon enabled, run weston and
> > >> X11. The drivers are available at [1]. For reference, the patchset includes
> > >> the Matrox stub driver.
> > >
> > > So I really don't want to rain on the parade here, since if you think this
> > > is useful when converting fbdev drivers I'll buy that, and I'm all for
> > > getting more modern drivers into drm.
> > >
> > > But I have a bunch of concerns with the approach you're proposing here:
> > >
> > > - we've tried staging for drm driver refactoring, it hurts. Separate tree
> > >   plus the quick pace in refactoring create lots of pains. And for small
> > >   drivers refacotoring before it's not buying you anything above
> > >   refactoring in your own personal tree. And for big drivers we're fairly
> > >   lenient with merging drivers that aren't fully polished yet, if there's
> > >   a team serious enough with cleaning up the mess. I think even merging
> > >   partial drivers directly under drivers/gpu (but behind CONFIG_BROKEN) is
> > >   better than staging.
> >
> > I mostly put this into staging, because it's the kind of code you'd
> > expect there.
> 
> Yeah, except we tried, it's a real pain. Conclusion by everyone
> involved is that staging doesn't work for the drm subsystem.

As the staging maintainer, I too agree with this.  No drm drivers/code
in staging please.

thanks,

greg k-h
