Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EA849F3C
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2019 13:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729605AbfFRLbX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jun 2019 07:31:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45613 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLbX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jun 2019 07:31:23 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so13504878wre.12
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2019 04:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=W9PB7MhxGEU1s8bWv+j+oACWtQHMzZL9tbzOk4vJD74=;
        b=CCYVIYzDvDuJ/lZ4RkY3reGTc72cJeBmFtRrS9ntPlzEiymbFvSKEfnY/7rkfZVs0o
         MVdVutVaTlT0kujIsRyVgxC6RmvXzeMjglceLnf77R5jvJh2W6ltBEHxoRTSeB8SsvZl
         IosoKYDiZ5slke8iG2NPWhV8XK2OOlGB+A1Edi0KjQZhK4Gc6yEE/9FRAKzbTw3neVAG
         egpgOSOgdM3mYrzs4Gy94QGUWDY5mHVnEJBd/6B+kdPnOiEJauYEZj4orodq2Pi1wfW7
         RQmZuufg+py9zMpoLCvOO1fQ+wx0Hg8kL/RGrGEtWVMNknbgraQI+jdexmX88eLq7/KE
         GokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=W9PB7MhxGEU1s8bWv+j+oACWtQHMzZL9tbzOk4vJD74=;
        b=O/iuKS14MTOcmYvt+IXZM4rsEqesJWDCyCla3DfFmquLY0cR7Wuj6ooJfvSXQqOxWP
         qfF5V0b99xAueS0om3b4gE7ycE+vsDgs7MAHOugcvMv8LQxAx84gZzfoXFq2GWAxG9h6
         IVCI02ScKJLbwEcJeJEQkEj9FU2A3OR1ZFlSqaRJpysrKqMI/uP82269dsdJ30XDU9X/
         F5jh31p6B/2erzjukwc9ZXuExVOMuccXmBdxDw7YrW4B1mZB/Jorp/GVfqxECN5cB0mp
         d8GIvujgIbJ9nl4hHBx6w9Q7eMSHsCrd5KOFe6faGY489Dv8384XMElxORJsuO8YER35
         /xvg==
X-Gm-Message-State: APjAAAWsQENZfzHH1tSjwMW4Lbm/5/TWzEHb8cY7t8xiGpin3Bv4w3Kh
        nmasFlhGnsr/Xlf3x0cWy14Nqw==
X-Google-Smtp-Source: APXvYqyTq7mpTwX0+gYS4ehoL7FidxWt/7s8ORb9RNpk9qHcTQYGCP36YjF8ch9F+xsPliqn31bYNw==
X-Received: by 2002:adf:e3cc:: with SMTP id k12mr3497626wrm.159.1560857481420;
        Tue, 18 Jun 2019 04:31:21 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id y44sm15968344wrd.13.2019.06.18.04.31.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 04:31:20 -0700 (PDT)
Date:   Tue, 18 Jun 2019 12:31:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Dave Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Sean Paul <sean@poorly.run>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        dim-tools@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Subject: Re: [PULL] topic/remove-fbcon-notifiers for v5.3
Message-ID: <20190618113119.GC18371@dell>
References: <887603f2-57a4-5a15-faa3-62634fe4b296@linux.intel.com>
 <ed2d0c16-807d-ddfb-eb96-4131d9daa47d@linux.intel.com>
 <20190618100347.GB18371@dell>
 <20190618102741.GS12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190618102741.GS12905@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 18 Jun 2019, Daniel Vetter wrote:

> On Tue, Jun 18, 2019 at 11:03:47AM +0100, Lee Jones wrote:
> > On Tue, 18 Jun 2019, Maarten Lankhorst wrote:
> > 
> > > Op 14-06-2019 om 11:25 schreef Maarten Lankhorst:
> > > > Hi all,
> > > >
> > > > As discussed with Daniel V, I'm just doing the paperwork here as drm-misc maintainer.
> > > >
> > > > This is the topic pull request for the fbdev notifier removal.
> > > >
> > > > Bar, please make a final check and pull into your fbdev tree.
> > > >
> > > > Lee, please make a final check and pull into your backlight tree.
> > > >
> > > > Greg, this is just fyi, you already acked all the vt and staging patches in here
> > > > to land through other trees.
> > > >
> > > > I'll pull this into drm-misc-next once Bart & Lee acked it.
> > > >
> > > > Cheers, Maarten.
> > > 
> > > Bart, Lee, ping?
> > 
> > Asking for an Ack on a PR is kind of odd.  If you have all of the
> > patch Acks you need, and you've made the PR has small as possible,
> > then you should be good to go.
> 
> Ime there's lots of ways to screw up a pull request, so asking for a "yup
> looks good to me" seems reasonable. I've done that with all the topic
> pulls in the past.

Instead of burdening others, it's probably best to take 'no news is
good news' stance.  In all of the immutable branch PRs I've sent out,
other than the occasional 'pulled thanks', no one has ever reviewed/
acked them before.

> > My plan is to see if any of this collides with my PR to Linus.  If it
> > doesn't then I may not have to pull it in at all.
> 
> For simple conflicts Linus usually prefers to resolve them himself. The
> topic pull is needed if there's more stuff on top, like patches that need
> to be rebased ...

There are multiple uses for immutable branches.  I'll pull this one if
the need arises.

> > > > topic/remove-fbcon-notifiers-2019-06-14-1:
> > > > ----------------------------------------------------------------
> > > > topic/remove-fbcon-notifiers:
> > > > - remove fbdev notifier usage for fbcon, as prep work to clean up the fbcon locking
> > > > - assorted locking checks in vt/console code
> > > > - assorted notifier and cleanups in fbdev and backlight code
> > > >
> > > > The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:
> > > >
> > > >   Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   git://anongit.freedesktop.org/drm/drm-misc tags/topic/remove-fbcon-notifiers-2019-06-14-1
> > > >
> > > > for you to fetch changes up to 1dcff4ae65185e8c0300972f6d8d39d9a9db2bda:
> > > >
> > > >   backlight: simplify lcd notifier (2019-06-13 10:07:20 +0200)
> > > >
> > > > ----------------------------------------------------------------
> > > > Daniel Vetter (33):
> > > >       dummycon: Sprinkle locking checks
> > > >       fbdev: locking check for fb_set_suspend
> > > >       vt: might_sleep() annotation for do_blank_screen
> > > >       vt: More locking checks
> > > >       fbdev/sa1100fb: Remove dead code
> > > >       fbdev/cyber2000: Remove struct display
> > > >       fbdev/aty128fb: Remove dead code
> > > >       fbcon: s/struct display/struct fbcon_display/
> > > >       fbcon: Remove fbcon_has_exited
> > > >       fbcon: call fbcon_fb_(un)registered directly
> > > >       fbdev/sh_mobile: remove sh_mobile_lcdc_display_notify
> > > >       fbdev/omap: sysfs files can't disappear before the device is gone
> > > >       fbdev: sysfs files can't disappear before the device is gone
> > > >       staging/olpc: lock_fb_info can't fail
> > > >       fbdev/atyfb: lock_fb_info can't fail
> > > >       fbdev: lock_fb_info cannot fail
> > > >       fbcon: call fbcon_fb_bind directly
> > > >       fbdev: make unregister/unlink functions not fail
> > > >       fbdev: unify unlink_framebuffer paths
> > > >       fbdev/sh_mob: Remove fb notifier callback
> > > >       fbdev: directly call fbcon_suspended/resumed
> > > >       fbcon: Call fbcon_mode_deleted/new_modelist directly
> > > >       fbdev: Call fbcon_get_requirement directly
> > > >       Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
> > > >       fbmem: pull fbcon_fb_blanked out of fb_blank
> > > >       fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
> > > >       fb: Flatten control flow in fb_set_var
> > > >       fbcon: replace FB_EVENT_MODE_CHANGE/_ALL with direct calls
> > > >       vgaswitcheroo: call fbcon_remap_all directly
> > > >       fbcon: Call con2fb_map functions directly
> > > >       fbcon: Document what I learned about fbcon locking
> > > >       staging/olpc_dcon: Add drm conversion to TODO
> > > >       backlight: simplify lcd notifier
> > > >
> > > >  arch/arm/mach-pxa/am200epd.c                    |  13 +-
> > > >  drivers/gpu/vga/vga_switcheroo.c                |  11 +-
> > > >  drivers/media/pci/ivtv/ivtvfb.c                 |   6 +-
> > > >  drivers/staging/fbtft/fbtft-core.c              |   4 +-
> > > >  drivers/staging/olpc_dcon/TODO                  |   7 +
> > > >  drivers/staging/olpc_dcon/olpc_dcon.c           |   6 +-
> > > >  drivers/tty/vt/vt.c                             |  18 ++
> > > >  drivers/video/backlight/backlight.c             |   2 +-
> > > >  drivers/video/backlight/lcd.c                   |  12 -
> > > >  drivers/video/console/dummycon.c                |   6 +
> > > >  drivers/video/fbdev/aty/aty128fb.c              |  64 ----
> > > >  drivers/video/fbdev/aty/atyfb_base.c            |   3 +-
> > > >  drivers/video/fbdev/core/fbcmap.c               |   6 +-
> > > >  drivers/video/fbdev/core/fbcon.c                | 313 ++++++++-----------
> > > >  drivers/video/fbdev/core/fbcon.h                |   6 +-
> > > >  drivers/video/fbdev/core/fbmem.c                | 399 +++++++++---------------
> > > >  drivers/video/fbdev/core/fbsysfs.c              |  20 +-
> > > >  drivers/video/fbdev/cyber2000fb.c               |   1 -
> > > >  drivers/video/fbdev/neofb.c                     |   9 +-
> > > >  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  21 +-
> > > >  drivers/video/fbdev/sa1100fb.c                  |  25 --
> > > >  drivers/video/fbdev/savage/savagefb_driver.c    |   9 +-
> > > >  drivers/video/fbdev/sh_mobile_lcdcfb.c          | 132 +-------
> > > >  drivers/video/fbdev/sh_mobile_lcdcfb.h          |   5 -
> > > >  include/linux/console_struct.h                  |   5 +-
> > > >  include/linux/fb.h                              |  45 +--
> > > >  include/linux/fbcon.h                           |  30 ++
> > > >  27 files changed, 396 insertions(+), 782 deletions(-)
> > > 
> > > 
> > 
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
