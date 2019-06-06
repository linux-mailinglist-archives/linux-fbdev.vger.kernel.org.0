Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4806B36D74
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Jun 2019 09:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbfFFHit (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Jun 2019 03:38:49 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39278 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfFFHit (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Jun 2019 03:38:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id m202so896074oig.6
        for <linux-fbdev@vger.kernel.org>; Thu, 06 Jun 2019 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utp5nI6WKyrTwwRbD4tMOT1+pcd3XgcqW3fhQwEE6xA=;
        b=ek/M+WnYPApHYeBvxMRpQo0ARYWtpWrbqYEuHuOyZGrII2exYTYHQdRVyTG9hNS17h
         3IzPv+Fb4Lr1HN2Cfle5W/bwWVT2szRuqKa9vzDoXNIswL/p4VyiiPN5D3mhVb9TPsPT
         +0JVDAmhWxD5H5B03ZHUUkUGDC/NnDzfss2dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utp5nI6WKyrTwwRbD4tMOT1+pcd3XgcqW3fhQwEE6xA=;
        b=JOdhjvm/pkDGcKpk9LrxZHLbf2IiEVsqRk4U7z/LOIIgi6YtQYtGJ8aQ9ie+gz65UY
         O8Guw/40cmC/8YDLiYOlqIkC6NDnHm8kCDjRLIDNovpV+0M/LNgvBGDrdNtOr1j44s+4
         gGLl02WcMT6SzyNetJrsLF/rpLoeCKKPD6i5/XPPdhDGcjaTM59ZBo2qbvvhC5pWZaPr
         6bO30ICtrQrtcDztw72ptB2oCsiNMTEBP1AdZJTSZxH8FlhSqYB2DZF9c/mI9XlbQ4va
         Wb0mvsSyq2UxKz179h5jiCwXMWBQxgeTs3F/9VedUz0CZx/IOJ6B3AJduxWEigh9L5XK
         6z4A==
X-Gm-Message-State: APjAAAWJtkd9TsjbPa2zvTjSlU1AYhPiQU9F/dxLAlijAFzQNMVibf25
        xgKDN8cQNPwNIo8UExzBjW/eSWSw2GFnMnBAKiS0YQ==
X-Google-Smtp-Source: APXvYqz+wo/fhXqhpOEXpmnP4dE+gKWaXY0NuvFubmj3puGKVyBuNSHEvZXxTzqyVKCA2WM6H7A+ckI0nqFn8dUL48M=
X-Received: by 2002:aca:ef88:: with SMTP id n130mr7241969oih.132.1559806728167;
 Thu, 06 Jun 2019 00:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 6 Jun 2019 09:38:36 +0200
Message-ID: <CAKMK7uHneUFYPiRr10X9xfWTkGtaoQBB=niDMGkAgJ-fgo5=mA@mail.gmail.com>
Subject: Re: [PATCH 00/33] fbcon notifier begone v3!
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Bart,

On Tue, May 28, 2019 at 11:02:31AM +0200, Daniel Vetter wrote:
> Hi all,
>
> I think we're slowly getting there. Previous cover letters with more
> context:
>
> https://lists.freedesktop.org/archives/dri-devel/2019-May/218362.html
>
> tldr; I have a multi-year plan to improve fbcon locking, because the
> current thing is a bit a mess.
>
> Cover letter of this version, where I detail a bit more the details
> fixed in this one here:
>
> https://lists.freedesktop.org/archives/dri-devel/2019-May/218984.html
>
> Note that the locking plan in this one is already outdated, I overlooked a
> few fun issues around any printk() going back to console_lock.
>
> I think remaining bits:
>
> - Ack from Daniel Thompson for the backlight bits, he wanted to check the
>   big picture.

I think Daniel is still on vacation until next week or so.

> - Hash out actual merge plan.

I'd like to stuff this into drm.git somehow, I guess topic branch works
too.

Long term I think we need to reconsider how we handle fbdev, at least the
core/fbcon pieces. Since a few years all the work in that area has been
motivated by drm, and pushed by drm contributors. Having that maintained
in a separate tree that doesn't regularly integrate imo doesn't make much
sense, and we ended up merging almost everything through some drm tree.
That one time we didn't (for some panel rotation stuff) it resulted in
some good suprises.

I think best solution is if we put the core and fbcon bits into drm-misc,
as group maintained infrastructure piece. All the other gfx infra pieces
are maintained in there already too. You'd obviously get commit rights.
I think that would include
- drivers/video/fbdev
- drivers/video/*c
- drivers/video/console

I don't really care about what happens with the actual fbdev drivers
(aside from the drm one in drm_fb_helper.c, but that's already maintained
as part of drm). I guess we could also put those into drm-misc, or as a
separate tree, depending what you want.

Thoughts?

Cheers, Daniel


>
> I'm also cc'ing the entire pile to a lot more people on request.
>
> Thanks, Daniel
>
> Daniel Vetter (33):
>   dummycon: Sprinkle locking checks
>   fbdev: locking check for fb_set_suspend
>   vt: might_sleep() annotation for do_blank_screen
>   vt: More locking checks
>   fbdev/sa1100fb: Remove dead code
>   fbdev/cyber2000: Remove struct display
>   fbdev/aty128fb: Remove dead code
>   fbcon: s/struct display/struct fbcon_display/
>   fbcon: Remove fbcon_has_exited
>   fbcon: call fbcon_fb_(un)registered directly
>   fbdev/sh_mobile: remove sh_mobile_lcdc_display_notify
>   fbdev/omap: sysfs files can't disappear before the device is gone
>   fbdev: sysfs files can't disappear before the device is gone
>   staging/olpc: lock_fb_info can't fail
>   fbdev/atyfb: lock_fb_info can't fail
>   fbdev: lock_fb_info cannot fail
>   fbcon: call fbcon_fb_bind directly
>   fbdev: make unregister/unlink functions not fail
>   fbdev: unify unlink_framebuffer paths
>   fbdev/sh_mob: Remove fb notifier callback
>   fbdev: directly call fbcon_suspended/resumed
>   fbcon: Call fbcon_mode_deleted/new_modelist directly
>   fbdev: Call fbcon_get_requirement directly
>   Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
>   fbmem: pull fbcon_fb_blanked out of fb_blank
>   fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
>   fb: Flatten control flow in fb_set_var
>   fbcon: replace FB_EVENT_MODE_CHANGE/_ALL with direct calls
>   vgaswitcheroo: call fbcon_remap_all directly
>   fbcon: Call con2fb_map functions directly
>   fbcon: Document what I learned about fbcon locking
>   staging/olpc_dcon: Add drm conversion to TODO
>   backlight: simplify lcd notifier
>
>  arch/arm/mach-pxa/am200epd.c                  |  13 +-
>  drivers/gpu/vga/vga_switcheroo.c              |  11 +-
>  drivers/media/pci/ivtv/ivtvfb.c               |   6 +-
>  drivers/staging/fbtft/fbtft-core.c            |   4 +-
>  drivers/staging/olpc_dcon/TODO                |   7 +
>  drivers/staging/olpc_dcon/olpc_dcon.c         |   6 +-
>  drivers/tty/vt/vt.c                           |  18 +
>  drivers/video/backlight/backlight.c           |   2 +-
>  drivers/video/backlight/lcd.c                 |  12 -
>  drivers/video/console/dummycon.c              |   6 +
>  drivers/video/fbdev/aty/aty128fb.c            |  64 ---
>  drivers/video/fbdev/aty/atyfb_base.c          |   3 +-
>  drivers/video/fbdev/core/fbcmap.c             |   6 +-
>  drivers/video/fbdev/core/fbcon.c              | 313 ++++++--------
>  drivers/video/fbdev/core/fbcon.h              |   6 +-
>  drivers/video/fbdev/core/fbmem.c              | 399 +++++++-----------
>  drivers/video/fbdev/core/fbsysfs.c            |  20 +-
>  drivers/video/fbdev/cyber2000fb.c             |   1 -
>  drivers/video/fbdev/neofb.c                   |   9 +-
>  .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   |  21 +-
>  drivers/video/fbdev/sa1100fb.c                |  25 --
>  drivers/video/fbdev/savage/savagefb_driver.c  |   9 +-
>  drivers/video/fbdev/sh_mobile_lcdcfb.c        | 132 +-----
>  drivers/video/fbdev/sh_mobile_lcdcfb.h        |   5 -
>  include/linux/console_struct.h                |   5 +-
>  include/linux/fb.h                            |  45 +-
>  include/linux/fbcon.h                         |  30 ++
>  27 files changed, 396 insertions(+), 782 deletions(-)
>
> --
> 2.20.1
>

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
