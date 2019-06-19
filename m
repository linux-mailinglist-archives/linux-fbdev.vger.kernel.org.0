Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90FB04BA4A
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Jun 2019 15:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfFSNmW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Jun 2019 09:42:22 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49039 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729856AbfFSNmV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Jun 2019 09:42:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190619134219euoutp02d1847b0e9374fac89267a2be10bf5305~pnVYgd8uT0316903169euoutp02U
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Jun 2019 13:42:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190619134219euoutp02d1847b0e9374fac89267a2be10bf5305~pnVYgd8uT0316903169euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560951739;
        bh=26WH2MroHkK0rAj3z4L2Gzfzkzrcmq5+B2FaFkXEPgY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Yt1p7qzihStIBkDl8czrdTqB+liz1Hoj8bzmoB2qruiRnOzQBUF0JSCKEMrDWVTpj
         s7OW3v9Gw0RZJNZIvkywVyHPvqIBz6eDwBzdXWGlM4T4TT+YyKvhil5sCWXwDjk8a4
         uoH95X3gQ+gnMJaDOwjfm02lpx3QeLsJolFvY8gs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190619134217eucas1p1fe8a69d2cc878119b70c530e12e6f506~pnVXZWV8f2500125001eucas1p18;
        Wed, 19 Jun 2019 13:42:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id C6.C4.04377.9BB3A0D5; Wed, 19
        Jun 2019 14:42:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190619134217eucas1p132644b0c882685819e2deb11c7aa8b63~pnVWuIaiO0810408104eucas1p10;
        Wed, 19 Jun 2019 13:42:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190619134216eusmtrp2f0528ad01a00640a6639c5d734647bdc~pnVWf3GST1705017050eusmtrp24;
        Wed, 19 Jun 2019 13:42:16 +0000 (GMT)
X-AuditID: cbfec7f4-5632c9c000001119-5d-5d0a3bb95cfb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 91.33.04146.8BB3A0D5; Wed, 19
        Jun 2019 14:42:16 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190619134216eusmtip2fe925e71f3a93f90d1dd23e366d83e6a~pnVVx0VHh1311413114eusmtip2s;
        Wed, 19 Jun 2019 13:42:16 +0000 (GMT)
Subject: Re: [PULL] topic/remove-fbcon-notifiers for v5.3
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <fcd3a833-e83a-53c5-7dbe-5f7a94327daa@samsung.com>
Date:   Wed, 19 Jun 2019 15:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8b9f9f03-54a4-9bda-6d12-2c0a3d9610b4@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUgTcRjH+93d7s7Z5JyGDxkFI3sRfKuoX68UGVx/SC8USSG58lBLp+zU
        sogs02yB6Qqi+ZbGfEPUVm1OFGOVmxVpaCbW0Cgro5mRFpFanqfkf5/7Pt/vPc8XfiypHlcs
        ZhN1aYJep03S0ErK2v67M8S+WRkTPlG9ErteVxD4+Vc3g8vfuUlsy/uEcM/4Nxpn32mgcVHB
        PQJXdTcgXD12i8Gt5QS+0ThK4IHxJwi78kcVuPz7AwoPDrch3GbqZbD7+mO03ZcvrTvLt/68
        TfF2k5vh77QME/zb3haaL+3Yx7eV1DH8wFUnwTub+xm+4f4riv9hWbrX+7ByS5yQlJgh6MO2
        xSoT3o9cJlP/hp/uvrQ/C+UEGZAXC9w6aGopYgxIyaq5agTGF+8JaaDmxhA8NSfJgx8Ieiwj
        tAExM4muQ7JchcCSP6GQPzwIij1vkBT24zZCpe3bDPtPc0fuM1pikjMooNm1RmKa2wSFl2tn
        PCpuG4yV98wwxQVBfVYFKfEiLhoG2hsVsscXOm59oCT24nZC7406Qv5nAPR/KJvlZWDzFJPS
        QcCZWahxmJFcMxKMQxdn2Q++OO8zMi+Bv3YpLAXqEUzmfZ5N2xBUXZ+iZddmeOR8OX0GO71i
        NTQ0h8nyDhgylZKSDJwP9Hl85SN8wGi9OSurIC9XLbtXQGNlIz231mCvIQuQxjSvmmleHdO8
        Oqb/e28jqhYFCOlicrwgrtEJp0JFbbKYrosPPZ6SbEHTj/HZlHOsCTVPHHMgjkWahSpXsDJG
        rdBmiJnJDgQsqfFXeWd7xahVcdrMM4I+5ag+PUkQHSiQpTQBqrMLBo+ouXhtmnBSEFIF/dyU
        YL0WZ6GiHfVlURmwPl5o3xWe233eL+pdrrVsI40tns5zCyIWmQKvhnjMhT4Xukq+PI/MTovq
        Dfya0sP9+qPLKRitjza6HD9vViyfKvS51j689kCfMZ3ooOwwfLDV3UUM6cVJx9ZEnTW1f4/1
        493d+EjIFdtDd+m4YpV4oiR2qblww14NJSZoI4JJvaj9B6eVexSIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42I5/e/4Pd0d1lyxBu9mmVicuL6IyeLMm7vs
        Fgsf3mW22N7xnNHiytf3bBbNi9ezWcyesJnJYvnl9YwWK77MZLfYu5DJYsqGD0wW978eZbQ4
        0feB1WLhx60sFg9e7me02D/rGrvF3clHGB0EPeatqfbY+20Bi8fOWXfZPRbvecnkcefaHjaP
        eScDPfbPXcPucb/7OJPH8V232D3Wb7nK4vF5k1wAd5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWF
        npGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexuN37cwF/w0qLrcENTC2qnYxsnNICJhIXAjv
        YuTiEBJYyijRfeozWxcjB1BYRuL4+rIuRk4gU1jiz7UuNoia14wSk7+fZQVJCAtYSizb/p4R
        xBYBsk+2nQYrYhboY5X49OEqO0THXiaJ/m9PmUCq2ASsJCa2rwLr4BWwk/iy8AqYzSKgKrGu
        YREziC0qECFx5v0KFogaQYmTM5+A2ZwCzhLXpqwBm8MsoC7xZ94lZghbXOLWk/lQcXmJ7W/n
        ME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzAVbDv2c/MO
        xksbgw8xCnAwKvHwntDiihViTSwrrsw9xCjBwawkwsvdzBkrxJuSWFmVWpQfX1Sak1p8iNEU
        6LmJzFKiyfnANJVXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoEx
        U2lmvG5RLaOXKVdkyNzoTA5pvQe6btr+BVck/gZMurHjW+b/4He7JRZs254rvtO7MuHXEeNg
        ffVXsSfY49dlnbH/5NbqNtlf+twOo9jK31PCch3eTbQ4xbJSf2H3d9ddtpeOhHwOi36y8bXw
        qyjumQ6aCfM22/y9+cSmyT85b7KsfFyN4jolluKMREMt5qLiRADD9osVGwMAAA==
X-CMS-MailID: 20190619134217eucas1p132644b0c882685819e2deb11c7aa8b63
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190618092027epcas1p464b0272448643905fefe528a27cfbae4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190618092027epcas1p464b0272448643905fefe528a27cfbae4
References: <887603f2-57a4-5a15-faa3-62634fe4b296@linux.intel.com>
        <CGME20190618092027epcas1p464b0272448643905fefe528a27cfbae4@epcas1p4.samsung.com>
        <ed2d0c16-807d-ddfb-eb96-4131d9daa47d@linux.intel.com>
        <7f6223e8-9945-fe43-5ed7-9a8df8c3bcd6@samsung.com>
        <8b9f9f03-54a4-9bda-6d12-2c0a3d9610b4@linux.intel.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 6/18/19 1:46 PM, Maarten Lankhorst wrote:
> Op 18-06-2019 om 13:17 schreef Bartlomiej Zolnierkiewicz:
>> Hi,
>>
>> On 6/18/19 11:20 AM, Maarten Lankhorst wrote:
>>> Op 14-06-2019 om 11:25 schreef Maarten Lankhorst:
>>>> Hi all,
>>>>
>>>> As discussed with Daniel V, I'm just doing the paperwork here as drm-misc maintainer.
>>>>
>>>> This is the topic pull request for the fbdev notifier removal.
>>>>
>>>> Bar, please make a final check and pull into your fbdev tree.
>>>>
>>>> Lee, please make a final check and pull into your backlight tree.
>>>>
>>>> Greg, this is just fyi, you already acked all the vt and staging patches in here
>>>> to land through other trees.
>>>>
>>>> I'll pull this into drm-misc-next once Bart & Lee acked it.
>>>>
>>>> Cheers, Maarten.
>>> Bart, Lee, ping?
>> Looks OK to me (I have test pulled it locally and there is only trivial
>> merge conflict on removed mxsfb fbdev driver) but it seems that all
>> patches miss your "S-o-B:" line (there is only "Reviewed-by:" tag which
>> is OK but has a different meaning)?
> 
> Hey,
> 
> I created the topic branch, but daniel pushed the patches to it. :)
> 
> That explains why there's a R-B but no S-o-B.

I see, that's kind of interesting work-flow.. :)

Anyway, I've pulled topic/remove-fbcon-notifiers-2019-06-14-1 tag
(and also topic/remove-fbcon-notifiers branch to get a buildfix)
into fbdev-for-next, thanks!

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Cheers,
> 
> Maarten
> 
>> Best regards,
>> --
>> Bartlomiej Zolnierkiewicz
>> Samsung R&D Institute Poland
>> Samsung Electronics
>>
>>>> topic/remove-fbcon-notifiers-2019-06-14-1:
>>>> ----------------------------------------------------------------
>>>> topic/remove-fbcon-notifiers:
>>>> - remove fbdev notifier usage for fbcon, as prep work to clean up the fbcon locking
>>>> - assorted locking checks in vt/console code
>>>> - assorted notifier and cleanups in fbdev and backlight code
>>>>
>>>> The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:
>>>>
>>>>   Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://anongit.freedesktop.org/drm/drm-misc tags/topic/remove-fbcon-notifiers-2019-06-14-1
>>>>
>>>> for you to fetch changes up to 1dcff4ae65185e8c0300972f6d8d39d9a9db2bda:
>>>>
>>>>   backlight: simplify lcd notifier (2019-06-13 10:07:20 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> Daniel Vetter (33):
>>>>       dummycon: Sprinkle locking checks
>>>>       fbdev: locking check for fb_set_suspend
>>>>       vt: might_sleep() annotation for do_blank_screen
>>>>       vt: More locking checks
>>>>       fbdev/sa1100fb: Remove dead code
>>>>       fbdev/cyber2000: Remove struct display
>>>>       fbdev/aty128fb: Remove dead code
>>>>       fbcon: s/struct display/struct fbcon_display/
>>>>       fbcon: Remove fbcon_has_exited
>>>>       fbcon: call fbcon_fb_(un)registered directly
>>>>       fbdev/sh_mobile: remove sh_mobile_lcdc_display_notify
>>>>       fbdev/omap: sysfs files can't disappear before the device is gone
>>>>       fbdev: sysfs files can't disappear before the device is gone
>>>>       staging/olpc: lock_fb_info can't fail
>>>>       fbdev/atyfb: lock_fb_info can't fail
>>>>       fbdev: lock_fb_info cannot fail
>>>>       fbcon: call fbcon_fb_bind directly
>>>>       fbdev: make unregister/unlink functions not fail
>>>>       fbdev: unify unlink_framebuffer paths
>>>>       fbdev/sh_mob: Remove fb notifier callback
>>>>       fbdev: directly call fbcon_suspended/resumed
>>>>       fbcon: Call fbcon_mode_deleted/new_modelist directly
>>>>       fbdev: Call fbcon_get_requirement directly
>>>>       Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
>>>>       fbmem: pull fbcon_fb_blanked out of fb_blank
>>>>       fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
>>>>       fb: Flatten control flow in fb_set_var
>>>>       fbcon: replace FB_EVENT_MODE_CHANGE/_ALL with direct calls
>>>>       vgaswitcheroo: call fbcon_remap_all directly
>>>>       fbcon: Call con2fb_map functions directly
>>>>       fbcon: Document what I learned about fbcon locking
>>>>       staging/olpc_dcon: Add drm conversion to TODO
>>>>       backlight: simplify lcd notifier
>>>>
>>>>  arch/arm/mach-pxa/am200epd.c                    |  13 +-
>>>>  drivers/gpu/vga/vga_switcheroo.c                |  11 +-
>>>>  drivers/media/pci/ivtv/ivtvfb.c                 |   6 +-
>>>>  drivers/staging/fbtft/fbtft-core.c              |   4 +-
>>>>  drivers/staging/olpc_dcon/TODO                  |   7 +
>>>>  drivers/staging/olpc_dcon/olpc_dcon.c           |   6 +-
>>>>  drivers/tty/vt/vt.c                             |  18 ++
>>>>  drivers/video/backlight/backlight.c             |   2 +-
>>>>  drivers/video/backlight/lcd.c                   |  12 -
>>>>  drivers/video/console/dummycon.c                |   6 +
>>>>  drivers/video/fbdev/aty/aty128fb.c              |  64 ----
>>>>  drivers/video/fbdev/aty/atyfb_base.c            |   3 +-
>>>>  drivers/video/fbdev/core/fbcmap.c               |   6 +-
>>>>  drivers/video/fbdev/core/fbcon.c                | 313 ++++++++-----------
>>>>  drivers/video/fbdev/core/fbcon.h                |   6 +-
>>>>  drivers/video/fbdev/core/fbmem.c                | 399 +++++++++---------------
>>>>  drivers/video/fbdev/core/fbsysfs.c              |  20 +-
>>>>  drivers/video/fbdev/cyber2000fb.c               |   1 -
>>>>  drivers/video/fbdev/neofb.c                     |   9 +-
>>>>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  21 +-
>>>>  drivers/video/fbdev/sa1100fb.c                  |  25 --
>>>>  drivers/video/fbdev/savage/savagefb_driver.c    |   9 +-
>>>>  drivers/video/fbdev/sh_mobile_lcdcfb.c          | 132 +-------
>>>>  drivers/video/fbdev/sh_mobile_lcdcfb.h          |   5 -
>>>>  include/linux/console_struct.h                  |   5 +-
>>>>  include/linux/fb.h                              |  45 +--
>>>>  include/linux/fbcon.h                           |  30 ++
>>>>  27 files changed, 396 insertions(+), 782 deletions(-)
