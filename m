Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA9549F8A
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2019 13:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbfFRLrA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jun 2019 07:47:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:24690 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729110AbfFRLrA (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jun 2019 07:47:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 04:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,389,1557212400"; 
   d="scan'208";a="357826468"
Received: from unknown (HELO [10.249.33.40]) ([10.249.33.40])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2019 04:46:56 -0700
Subject: Re: [PULL] topic/remove-fbcon-notifiers for v5.3
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Dave Airlie <airlied@gmail.com>,
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
References: <887603f2-57a4-5a15-faa3-62634fe4b296@linux.intel.com>
 <CGME20190618092027epcas1p464b0272448643905fefe528a27cfbae4@epcas1p4.samsung.com>
 <ed2d0c16-807d-ddfb-eb96-4131d9daa47d@linux.intel.com>
 <7f6223e8-9945-fe43-5ed7-9a8df8c3bcd6@samsung.com>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <8b9f9f03-54a4-9bda-6d12-2c0a3d9610b4@linux.intel.com>
Date:   Tue, 18 Jun 2019 13:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7f6223e8-9945-fe43-5ed7-9a8df8c3bcd6@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Op 18-06-2019 om 13:17 schreef Bartlomiej Zolnierkiewicz:
> Hi,
>
> On 6/18/19 11:20 AM, Maarten Lankhorst wrote:
>> Op 14-06-2019 om 11:25 schreef Maarten Lankhorst:
>>> Hi all,
>>>
>>> As discussed with Daniel V, I'm just doing the paperwork here as drm-misc maintainer.
>>>
>>> This is the topic pull request for the fbdev notifier removal.
>>>
>>> Bar, please make a final check and pull into your fbdev tree.
>>>
>>> Lee, please make a final check and pull into your backlight tree.
>>>
>>> Greg, this is just fyi, you already acked all the vt and staging patches in here
>>> to land through other trees.
>>>
>>> I'll pull this into drm-misc-next once Bart & Lee acked it.
>>>
>>> Cheers, Maarten.
>> Bart, Lee, ping?
> Looks OK to me (I have test pulled it locally and there is only trivial
> merge conflict on removed mxsfb fbdev driver) but it seems that all
> patches miss your "S-o-B:" line (there is only "Reviewed-by:" tag which
> is OK but has a different meaning)?

Hey,

I created the topic branch, but daniel pushed the patches to it. :)

That explains why there's a R-B but no S-o-B.

Cheers,

Maarten

> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>
>>> topic/remove-fbcon-notifiers-2019-06-14-1:
>>> ----------------------------------------------------------------
>>> topic/remove-fbcon-notifiers:
>>> - remove fbdev notifier usage for fbcon, as prep work to clean up the fbcon locking
>>> - assorted locking checks in vt/console code
>>> - assorted notifier and cleanups in fbdev and backlight code
>>>
>>> The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:
>>>
>>>   Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://anongit.freedesktop.org/drm/drm-misc tags/topic/remove-fbcon-notifiers-2019-06-14-1
>>>
>>> for you to fetch changes up to 1dcff4ae65185e8c0300972f6d8d39d9a9db2bda:
>>>
>>>   backlight: simplify lcd notifier (2019-06-13 10:07:20 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Daniel Vetter (33):
>>>       dummycon: Sprinkle locking checks
>>>       fbdev: locking check for fb_set_suspend
>>>       vt: might_sleep() annotation for do_blank_screen
>>>       vt: More locking checks
>>>       fbdev/sa1100fb: Remove dead code
>>>       fbdev/cyber2000: Remove struct display
>>>       fbdev/aty128fb: Remove dead code
>>>       fbcon: s/struct display/struct fbcon_display/
>>>       fbcon: Remove fbcon_has_exited
>>>       fbcon: call fbcon_fb_(un)registered directly
>>>       fbdev/sh_mobile: remove sh_mobile_lcdc_display_notify
>>>       fbdev/omap: sysfs files can't disappear before the device is gone
>>>       fbdev: sysfs files can't disappear before the device is gone
>>>       staging/olpc: lock_fb_info can't fail
>>>       fbdev/atyfb: lock_fb_info can't fail
>>>       fbdev: lock_fb_info cannot fail
>>>       fbcon: call fbcon_fb_bind directly
>>>       fbdev: make unregister/unlink functions not fail
>>>       fbdev: unify unlink_framebuffer paths
>>>       fbdev/sh_mob: Remove fb notifier callback
>>>       fbdev: directly call fbcon_suspended/resumed
>>>       fbcon: Call fbcon_mode_deleted/new_modelist directly
>>>       fbdev: Call fbcon_get_requirement directly
>>>       Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
>>>       fbmem: pull fbcon_fb_blanked out of fb_blank
>>>       fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
>>>       fb: Flatten control flow in fb_set_var
>>>       fbcon: replace FB_EVENT_MODE_CHANGE/_ALL with direct calls
>>>       vgaswitcheroo: call fbcon_remap_all directly
>>>       fbcon: Call con2fb_map functions directly
>>>       fbcon: Document what I learned about fbcon locking
>>>       staging/olpc_dcon: Add drm conversion to TODO
>>>       backlight: simplify lcd notifier
>>>
>>>  arch/arm/mach-pxa/am200epd.c                    |  13 +-
>>>  drivers/gpu/vga/vga_switcheroo.c                |  11 +-
>>>  drivers/media/pci/ivtv/ivtvfb.c                 |   6 +-
>>>  drivers/staging/fbtft/fbtft-core.c              |   4 +-
>>>  drivers/staging/olpc_dcon/TODO                  |   7 +
>>>  drivers/staging/olpc_dcon/olpc_dcon.c           |   6 +-
>>>  drivers/tty/vt/vt.c                             |  18 ++
>>>  drivers/video/backlight/backlight.c             |   2 +-
>>>  drivers/video/backlight/lcd.c                   |  12 -
>>>  drivers/video/console/dummycon.c                |   6 +
>>>  drivers/video/fbdev/aty/aty128fb.c              |  64 ----
>>>  drivers/video/fbdev/aty/atyfb_base.c            |   3 +-
>>>  drivers/video/fbdev/core/fbcmap.c               |   6 +-
>>>  drivers/video/fbdev/core/fbcon.c                | 313 ++++++++-----------
>>>  drivers/video/fbdev/core/fbcon.h                |   6 +-
>>>  drivers/video/fbdev/core/fbmem.c                | 399 +++++++++---------------
>>>  drivers/video/fbdev/core/fbsysfs.c              |  20 +-
>>>  drivers/video/fbdev/cyber2000fb.c               |   1 -
>>>  drivers/video/fbdev/neofb.c                     |   9 +-
>>>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  21 +-
>>>  drivers/video/fbdev/sa1100fb.c                  |  25 --
>>>  drivers/video/fbdev/savage/savagefb_driver.c    |   9 +-
>>>  drivers/video/fbdev/sh_mobile_lcdcfb.c          | 132 +-------
>>>  drivers/video/fbdev/sh_mobile_lcdcfb.h          |   5 -
>>>  include/linux/console_struct.h                  |   5 +-
>>>  include/linux/fb.h                              |  45 +--
>>>  include/linux/fbcon.h                           |  30 ++
>>>  27 files changed, 396 insertions(+), 782 deletions(-)


