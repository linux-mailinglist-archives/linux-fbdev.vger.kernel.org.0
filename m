Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07EB2D7E91
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2019 20:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbfJOSNn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Oct 2019 14:13:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:20292 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbfJOSNn (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Oct 2019 14:13:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 11:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; 
   d="scan'208";a="208230294"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga001.fm.intel.com with SMTP; 15 Oct 2019 11:13:38 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 15 Oct 2019 21:13:37 +0300
Date:   Tue, 15 Oct 2019 21:13:37 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Adam Jackson <ajax@redhat.com>,
        Mathieu Malaterre <malat@debian.org>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v2 00/15] DRM fbconv helpers for converting fbdev drivers
Message-ID: <20191015181337.GG1208@intel.com>
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191015143318.GP11828@phenom.ffwll.local>
 <5241e699-f66a-d212-03a5-bb736639e66b@suse.de>
 <CAKMK7uGTAxYNhS7TqEFVA+Gd+-4WOMq7JXPZRF8_a9EP69TkTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uGTAxYNhS7TqEFVA+Gd+-4WOMq7JXPZRF8_a9EP69TkTQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
> 
> > > - we've had conversion helpers before (for the legacy kms -> atomic
> > >   upgrade). They constantly broke, pretty much every release when someone
> > >   wanted to use them they first had to fix them up again. I think having
> > >   those helpers is good, but better to just have them in some branch
> > >   somewhere where it's clear that they might not work anymore on latest
> > >   upstream.
> > >
> > > - especially for some of these simple fbdev drivers I feel like just
> > >   typing a new driver from scratch might be simpler.
> > >
> > > A few more concerns specifically for your mga example:
> > >
> > > - We already have a mga driver. Might be better to integrate support for
> > >   older mgas into that than have a parallel driver.
> >
> > Two colleagues of mine, Takashi and Egbert, send a patch that added
> > support for desktop G200s to mgag200. [1] But it was rejected because
> > the devices are two old and not relevant any longer. If that opinion has
> > changed in the meantime, I wouldn't mind adding support for desktop GPUs
> > to the driver.
> 
> Hm that seems to have petered out inconclusive. I definitely think a
> merged mga driver is better than 2 drm atomic kms drivers for roughly
> the same hardware. I'm also assuming that at least for now no one
> plans to resurrect the 3d acceleration support for these old chips.
> But even then it's fairly easy to disable all that on the server
> chips.
> 
> > > - Your helper is based on simple display pipe, and I think for these old
> > >   mga chips (especially the dual pipe mga 450 and 550) simple display pipe
> > >   helper is more a hindering detour than actual help. From a quick read
> > >   through the code (especially all the custom ioctls) you definitely want
> > >   separate TV-out connector to expose all the tv mode properties (instead
> > >   of the custom ioctls).
> >
> > Around the G100, there's something like a change in generation. Before,
> > devices had only a single output and less than 8 MiB of RAM. This works
> > well with GEM SHMEM and simple KMS. Afterwards, devices have 8 MiB or
> > more and multiple outputs. GEM VRAM and the full set of helpers fit this
> > much better. Maybe having 2 drivers that share common code (or 3 with
> > the Server Engine chipsets) makes most sense.
> 
> Yeah if that's the case maybe a mga100 and mga200g driver fits better.
> Former based on simple display pipe.

The display hardware differences are quite minimal from 
1064SG to G200. G400 did add the second CRTC but essentially
nothing else changed from G200 display. G450/G550 changed
the PLLS around a bit just for the heck of it, and integrated 
the TMDS transmitter and TV encoder. And then they did even
more PLL madness with the different G200 server chip variants.

So IMO from display hw POV G100 vs. G200 split doesn't really
make sense.

And if you go to the effort of supporting dual head on G400+ then
the single head case on earlier platforms is just the same as the
single head "trivial" case on G400+, so totally different drivers
doesn't make sense there either. Also not all G400 cards have
the TVO/TMDS chip present in which case you can only use a
single head anyway (it's almost identical to a G200 card at
that point, assuming you drive the single output with the
primary CRTC).

-- 
Ville Syrjälä
Intel
