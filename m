Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB01D78A0
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2019 16:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732563AbfJOOdZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Oct 2019 10:33:25 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34252 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732448AbfJOOdZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Oct 2019 10:33:25 -0400
Received: by mail-ed1-f66.google.com with SMTP id j8so6586415eds.1
        for <linux-fbdev@vger.kernel.org>; Tue, 15 Oct 2019 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0+1+JK/k9PbfNMorJdiToNy7DBRV+eAxkFvnSx4AW8o=;
        b=eoIvVIPUJnMTU3Y+N0eLXiIEUrqZJZcYtj0NjLJSvFqye20E0pOSm5s1u+W8HZwz/Z
         N2LatWUaNWiyk1+3qxL4HTbk1J0xJsoE9lPkr3c+4/eYBpByevsKmzReba2IGf7xbm/e
         SAT51TyEbto6XsVFeZJHHQfxW1H27JkNlHlwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0+1+JK/k9PbfNMorJdiToNy7DBRV+eAxkFvnSx4AW8o=;
        b=JkT2XbOnzE3rQohpeNcyXnROzvcABs+L+tx76u8+KWFLM2c6/fXcvGCv7GXwNj8vdj
         OfwoaGNhKpNT5l7ErRGk4CLaWTYnwLS6kggDMaUBluhn7xK4bN8A/BLRZQPdqa79ktBP
         QRhQlvylCLoucazY9VnW7Ohqz8Tur4V90scHSEQOTl+jyFpkBTzwi3gzoCyBVn8JhSud
         le8dD10NZDfTOtTNVj6cH2O0kdTfFU4H2wY8euISXaYh6PmqjHTZpOJ0spG0kQdpoJKl
         nC4/EdEWzvJ/5VdvHmWrSU/MAiUAZp5KO9i8oaSWgPzfG+x3H4WESl654BUSLCpLalkv
         aksw==
X-Gm-Message-State: APjAAAVBI4ClX2Yx7ZjjdpPPBpkbw9K1L74wGoZa2vLlqdxbV8xoZrjV
        WcyPcr6b56Qjk6bBPdEAyl7DMw==
X-Google-Smtp-Source: APXvYqz4AfSAQ3MGZjT3YlPub4j8uBLQbI0ZjcsGfRP2bhqzqe7eGcvEx/+ZIJwnJEHBtS3QnYKJ/g==
X-Received: by 2002:a17:906:6a09:: with SMTP id o9mr34048112ejr.289.1571150001547;
        Tue, 15 Oct 2019 07:33:21 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id i63sm3743297edi.65.2019.10.15.07.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 07:33:20 -0700 (PDT)
Date:   Tue, 15 Oct 2019 16:33:18 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, b.zolnierkie@samsung.com, ajax@redhat.com,
        ville.syrjala@linux.intel.com, malat@debian.org,
        michel@daenzer.net, corbet@lwn.net, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 00/15] DRM fbconv helpers for converting fbdev drivers
Message-ID: <20191015143318.GP11828@phenom.ffwll.local>
References: <20191014140416.28517-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014140416.28517-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas,

On Mon, Oct 14, 2019 at 04:04:01PM +0200, Thomas Zimmermann wrote:
> (was: DRM driver for fbdev devices)
> 
> This is version 2 of the fbdev conversion helpers. It's more or less a
> rewrite of the original patchset.
> 
> The fbdev subsystem is considered legacy and will probably be removed at
> some point. This would mean the loss of a signifanct number of drivers.
> Some of the affected hardware is not in use any longer, but some hardware
> is still around and provides good(-enough) framebuffers.
> 
> The fbconv helpers allow for running the current DRM stack on top of fbdev
> drivers. It's a set of functions that convert between fbdev interfaces and
> DRM interfaces. Based on SHMEM and simple KMS helpers, it only offers the
> basic functionality of a framebuffer, but should be compatible with most
> existing fbdev drivers.
> 
> A DRM driver using fbconv helpers consists of
> 
>   * DRM stub code that calls into fbconv helpers, and
>   * the original fbdev driver code.
> 
> The fbdev driver code has to be modified to register itself with the
> stub driver instead of the fbdev core framework. A tutorial on how to use
> the helpers is part of this patchset. The resulting driver hybrid can be
> refactored into a first-class DRM driver. The fbconv helpers contain a
> number of comments, labeled 'DRM porting note', which explain the required
> steps.
> 
> I tested the current patchset with the following drivers: atyfb, aty128fb,
> matroxfb, pm2fb, pm3fb, rivafb, s3fb, savagefb, sisfb, tdfxfb and tridentfb.
> With each, I was able to successfully start with fbcon enabled, run weston and
> X11. The drivers are available at [1]. For reference, the patchset includes
> the Matrox stub driver.

So I really don't want to rain on the parade here, since if you think this
is useful when converting fbdev drivers I'll buy that, and I'm all for
getting more modern drivers into drm.

But I have a bunch of concerns with the approach you're proposing here:

- we've tried staging for drm driver refactoring, it hurts. Separate tree
  plus the quick pace in refactoring create lots of pains. And for small
  drivers refacotoring before it's not buying you anything above
  refactoring in your own personal tree. And for big drivers we're fairly
  lenient with merging drivers that aren't fully polished yet, if there's
  a team serious enough with cleaning up the mess. I think even merging
  partial drivers directly under drivers/gpu (but behind CONFIG_BROKEN) is
  better than staging.

- we've had conversion helpers before (for the legacy kms -> atomic
  upgrade). They constantly broke, pretty much every release when someone
  wanted to use them they first had to fix them up again. I think having
  those helpers is good, but better to just have them in some branch
  somewhere where it's clear that they might not work anymore on latest
  upstream.

- especially for some of these simple fbdev drivers I feel like just
  typing a new driver from scratch might be simpler.

A few more concerns specifically for your mga example:

- We already have a mga driver. Might be better to integrate support for
  older mgas into that than have a parallel driver.

- Your helper is based on simple display pipe, and I think for these old
  mga chips (especially the dual pipe mga 450 and 550) simple display pipe
  helper is more a hindering detour than actual help. From a quick read
  through the code (especially all the custom ioctls) you definitely want
  separate TV-out connector to expose all the tv mode properties (instead
  of the custom ioctls).

- On the topic of ioctls, looks like we could add FBIOGET_VBLANK to our
  generic implementation in the fbdev helpers.

So here's my alternative proposal:

- You push this as a branch onto a gitlab repo (freedesktop.org or
  wherever you feel like).

- You add a gitlab CI target to autobuild the very nice kerneldoc you've
  created. Feel free to also do this with anything else you're familiar
  with, it's just I know gitlab and it's real simple to get a few docs
  autogenerated and published with it.

- We add a todo.rst patch linking to your branch and the docs and a few
  lines on how to best convert an fbdev driver over to kms/atomic.

And all the drivers would land the usual way, like any of the other
drivers we've added to drivers/gpu/drm over the past few years.

Thoughts?

Cheers, Daniel
> 
> v2:
> 	* rename to fbconv helpers
> 	* rewrite as helper library
> 	* switch over to simple KMS helpers
> 	* switch over to SHMEM
> 	* add documentation
> 
> [1] https://gitlab.freedesktop.org/tzimmermann/linux/commits/fbconv-plus-drivers
> 
> Thomas Zimmermann (15):
>   fbdev: Export fb_check_foreignness()
>   fbdev: Export FBPIXMAPSIZE
>   drm/simple-kms-helper: Add mode_fixup() to simple display pipe
>   drm: Add fbconv helper module
>   drm/fbconv: Add DRM <-> fbdev pixel-format conversion
>   drm/fbconv: Add mode conversion DRM <-> fbdev
>   drm/fbconv: Add modesetting infrastructure
>   drm/fbconv: Add plane-state check and update
>   drm/fbconv: Mode-setting pipeline enable / disable
>   drm/fbconv: Reimplement several fbdev interfaces
>   drm/fbconv: Add helpers for init and cleanup of fb_info structures
>   drm/fbconv: Add helper documentation
>   staging: Add mgakms driver
>   staging/mgakms: Import matroxfb driver source code
>   staging/mgakms: Update matroxfb driver code for DRM
> 
>  Documentation/gpu/drm-kms-helpers.rst     |   12 +
>  Documentation/gpu/todo.rst                |   15 +
>  drivers/gpu/drm/Kconfig                   |   11 +
>  drivers/gpu/drm/Makefile                  |    1 +
>  drivers/gpu/drm/drm_fbconv_helper.c       | 2126 +++++++++++++++++
>  drivers/gpu/drm/drm_simple_kms_helper.c   |   15 +
>  drivers/staging/Kconfig                   |    2 +
>  drivers/staging/Makefile                  |    1 +
>  drivers/staging/mgakms/Kconfig            |   18 +
>  drivers/staging/mgakms/Makefile           |   17 +
>  drivers/staging/mgakms/g450_pll.c         |  539 +++++
>  drivers/staging/mgakms/g450_pll.h         |   13 +
>  drivers/staging/mgakms/i2c-matroxfb.c     |  238 ++
>  drivers/staging/mgakms/matroxfb_DAC1064.c | 1082 +++++++++
>  drivers/staging/mgakms/matroxfb_DAC1064.h |  174 ++
>  drivers/staging/mgakms/matroxfb_Ti3026.c  |  746 ++++++
>  drivers/staging/mgakms/matroxfb_Ti3026.h  |   10 +
>  drivers/staging/mgakms/matroxfb_accel.c   |  519 +++++
>  drivers/staging/mgakms/matroxfb_accel.h   |    9 +
>  drivers/staging/mgakms/matroxfb_base.c    | 2592 +++++++++++++++++++++
>  drivers/staging/mgakms/matroxfb_base.h    |  700 ++++++
>  drivers/staging/mgakms/matroxfb_crtc2.h   |   35 +
>  drivers/staging/mgakms/matroxfb_g450.c    |  640 +++++
>  drivers/staging/mgakms/matroxfb_g450.h    |   10 +
>  drivers/staging/mgakms/matroxfb_maven.h   |   21 +
>  drivers/staging/mgakms/matroxfb_misc.c    |  815 +++++++
>  drivers/staging/mgakms/matroxfb_misc.h    |   22 +
>  drivers/staging/mgakms/mga_device.c       |   68 +
>  drivers/staging/mgakms/mga_device.h       |   30 +
>  drivers/staging/mgakms/mga_drv.c          |  129 +
>  drivers/staging/mgakms/mga_drv.h          |   14 +
>  drivers/video/fbdev/core/fbmem.c          |    5 +-
>  include/drm/drm_fbconv_helper.h           |  150 ++
>  include/drm/drm_simple_kms_helper.h       |   43 +
>  include/linux/fb.h                        |    3 +
>  35 files changed, 10822 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_fbconv_helper.c
>  create mode 100644 drivers/staging/mgakms/Kconfig
>  create mode 100644 drivers/staging/mgakms/Makefile
>  create mode 100644 drivers/staging/mgakms/g450_pll.c
>  create mode 100644 drivers/staging/mgakms/g450_pll.h
>  create mode 100644 drivers/staging/mgakms/i2c-matroxfb.c
>  create mode 100644 drivers/staging/mgakms/matroxfb_DAC1064.c
>  create mode 100644 drivers/staging/mgakms/matroxfb_DAC1064.h
>  create mode 100644 drivers/staging/mgakms/matroxfb_Ti3026.c
>  create mode 100644 drivers/staging/mgakms/matroxfb_Ti3026.h
>  create mode 100644 drivers/staging/mgakms/matroxfb_accel.c
>  create mode 100644 drivers/staging/mgakms/matroxfb_accel.h
>  create mode 100644 drivers/staging/mgakms/matroxfb_base.c
>  create mode 100644 drivers/staging/mgakms/matroxfb_base.h
>  create mode 100644 drivers/staging/mgakms/matroxfb_crtc2.h
>  create mode 100644 drivers/staging/mgakms/matroxfb_g450.c
>  create mode 100644 drivers/staging/mgakms/matroxfb_g450.h
>  create mode 100644 drivers/staging/mgakms/matroxfb_maven.h
>  create mode 100644 drivers/staging/mgakms/matroxfb_misc.c
>  create mode 100644 drivers/staging/mgakms/matroxfb_misc.h
>  create mode 100644 drivers/staging/mgakms/mga_device.c
>  create mode 100644 drivers/staging/mgakms/mga_device.h
>  create mode 100644 drivers/staging/mgakms/mga_drv.c
>  create mode 100644 drivers/staging/mgakms/mga_drv.h
>  create mode 100644 include/drm/drm_fbconv_helper.h
> 
> --
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
