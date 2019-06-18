Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A967149F04
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2019 13:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbfFRLRa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jun 2019 07:17:30 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37095 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLR3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jun 2019 07:17:29 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190618111728euoutp01a6bebf5bc75364da1f5ab211d5eaf4b8~pRtoK530B0801908019euoutp01k
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2019 11:17:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190618111728euoutp01a6bebf5bc75364da1f5ab211d5eaf4b8~pRtoK530B0801908019euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560856648;
        bh=QF7jDRlJuFHFdhXEhdYB7dHEXiO3L/QtNo1lOGpKhZo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=P5C9wct3k4YBMO7DL9NnZsvklt6uIwg06A1kbczUjztGtW1vniq9IyrRgzs21lMEa
         Ngh0spiyk0jEsnczCz8g2HwwcxwJBCEKuOzhdUOq9M9p/CyEJ3LtmvQK1Chy31bv3z
         lE6CYcBrxqfRtq+119mpsISbQEY8gA2vQ4dOm3VQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190618111726eucas1p12860e56db453b78676b4f4ad8cabf834~pRtmlhnOb1674416744eucas1p1c;
        Tue, 18 Jun 2019 11:17:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id BF.A7.04377.648C80D5; Tue, 18
        Jun 2019 12:17:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190618111725eucas1p29cd34a56ca1c1cbdbab87b215a5ae921~pRtl1BY951380013800eucas1p2y;
        Tue, 18 Jun 2019 11:17:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190618111725eusmtrp2b65cbd2ba1656e61944a6d003122be9b~pRtl0TR371313013130eusmtrp2Z;
        Tue, 18 Jun 2019 11:17:25 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-dd-5d08c8467dc9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A9.1B.04140.548C80D5; Tue, 18
        Jun 2019 12:17:25 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190618111724eusmtip20af472e057ecb11f24230b62fad39a36~pRtlK8BdH2886328863eusmtip2Y;
        Tue, 18 Jun 2019 11:17:24 +0000 (GMT)
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
Message-ID: <7f6223e8-9945-fe43-5ed7-9a8df8c3bcd6@samsung.com>
Date:   Tue, 18 Jun 2019 13:17:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ed2d0c16-807d-ddfb-eb96-4131d9daa47d@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0gUURTGvTOzM+PW2rgaHiwKFpSKykcG1wrTihz6qyAwKqmtJnu4Fjtp
        qSGWZLZBaBrippu6tJZJK1qZYlimrotGr7XC1tRQyspHuFZmWo6zkv/9zjnfd8/54LKkelzh
        zx5NOCXoE7TxGlpJPWgZf75qaysbG2weVOLWt6UEbv/WxeCS3i4S12R9QtgxNkzjDLOVxtez
        qwlc9tqK8C1XAYMflRA4r3KEwN1jzQi3XhlR4JLv9yncM9CAcIPxDYO7cptQpDdvqkjlH/0o
        pvhaYxfDm+sHCN75pp7mTfYdfENRBcN3X7YRvK2uk+Gt9zoofrRqyfZ5u5UbDgnxR5MEfVDE
        fuUR68cJ+qR9xRnnwxxFOrItNSBPFrgwONc+igxIyaq5WwjaBtpJuXAhGK+uouViFEFvXiY5
        axkqeuIelCFwWRwKuRhE8NhYjCSVDxcOlprhGfadZntmGy0xyRkUUNcaKjHNrYOci+UzGhUX
        AQP1vYTEFBcAw+WXGYkXcrugu6VSIWu8wV7QR0nsyW2GC5Z695t+0Nl3g5B5KdQMFs5kAO4m
        C0MmMyWfvQU+mB3uCD7wxXaPkXkx/K2VzJLhLoLJrM9udw2CstwpWlath6e2l9NnsNMrloO1
        LkhuR0G/0URKbeC84N2gt3yEF1x9kO9uqyArUy2rA6HSUknPrjXU3iazkcY4J5pxThzjnDjG
        /3uLEVWO/IREURcniKEJwunVolYnJibErT54QleFpj9k25TN9RDV/TnQiDgWaearIIOJVSu0
        SWKyrhEBS2p8VdfWsLFq1SFtcoqgP7FPnxgviI1oEUtp/FSpHj171Fyc9pRwXBBOCvrZKcF6
        +qcjz2X7rXGbyeD8gI2bNiQ5x2Kcacc9wr3OXwtcmRbqk2bo7z5/kLgkipPRbfuInpD8sO/E
        gvs7t7U/KU0xRz+LzFP/auj92uSr63AFvjtH9pvFNXs7d92Mif/93pXsGI6JPTvGfMk3Hbvj
        LOxY2/wyT/EiasFP+6/DjrCJ0LTy9Fd9Gko8og1ZQepF7T8r9kMRjAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42I5/e/4PV3XExyxBsc3qVqcuL6IyeLMm7vs
        Fgsf3mW22N7xnNHiytf3bBbNi9ezWcyesJnJYvnl9YwWK77MZLfYu5DJYsqGD0wW978eZbQ4
        0feB1WLhx60sFg9e7me02D/rGrvF3clHGB0EPeatqfbY+20Bi8fOWXfZPRbvecnkcefaHjaP
        eScDPfbPXcPucb/7OJPH8V232D3Wb7nK4vF5k1wAd5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWF
        npGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvpHv9kKTmpV3NkxkbWB8bh8FyMnh4SAicS7
        uQfZuhi5OIQEljJKnJq3BsjhAErISBxfXwZRIyzx51oXVM1rRolfF3ewgSSEBSwllm1/zwhi
        iwDZJ9tOgxUxC/SxSnz6cJUdouM8o8T976tYQarYBKwkJravAuvgFbCTeLnnIROIzSKgKvF+
        VTc7iC0qECFx5v0KFogaQYmTM5+A2ZwCzhKty/aAbWYWUJf4M+8SM4QtLnHryXwmCFteYvvb
        OcwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAhMCNuO/dyy
        g7HrXfAhRgEORiUe3oJW9lgh1sSy4srcQ4wSHMxKIrxTjTlihXhTEiurUovy44tKc1KLDzGa
        Aj03kVlKNDkfmKzySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUw
        Gqi37VNYEG3IsUnANlH7be3FO/v3if4XarX4n9HrWp3B6KUdLxL3hH1tJOcn9upCtdcpNza9
        yjM/Fa4jsCe5Wyvi9G/5XYqnmPgu6zJk/HjT/VdOPmxe19eVDa/2+Cy7G5ZXcujcOe4DdqtS
        1mx9WC9e7qY8w72TOStA+qKLDW/Hjue2yneVWIozEg21mIuKEwEFjaKHHgMAAA==
X-CMS-MailID: 20190618111725eucas1p29cd34a56ca1c1cbdbab87b215a5ae921
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190618092027epcas1p464b0272448643905fefe528a27cfbae4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190618092027epcas1p464b0272448643905fefe528a27cfbae4
References: <887603f2-57a4-5a15-faa3-62634fe4b296@linux.intel.com>
        <CGME20190618092027epcas1p464b0272448643905fefe528a27cfbae4@epcas1p4.samsung.com>
        <ed2d0c16-807d-ddfb-eb96-4131d9daa47d@linux.intel.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


Hi,

On 6/18/19 11:20 AM, Maarten Lankhorst wrote:
> Op 14-06-2019 om 11:25 schreef Maarten Lankhorst:
>> Hi all,
>>
>> As discussed with Daniel V, I'm just doing the paperwork here as drm-misc maintainer.
>>
>> This is the topic pull request for the fbdev notifier removal.
>>
>> Bar, please make a final check and pull into your fbdev tree.
>>
>> Lee, please make a final check and pull into your backlight tree.
>>
>> Greg, this is just fyi, you already acked all the vt and staging patches in here
>> to land through other trees.
>>
>> I'll pull this into drm-misc-next once Bart & Lee acked it.
>>
>> Cheers, Maarten.
> 
> Bart, Lee, ping?

Looks OK to me (I have test pulled it locally and there is only trivial
merge conflict on removed mxsfb fbdev driver) but it seems that all
patches miss your "S-o-B:" line (there is only "Reviewed-by:" tag which
is OK but has a different meaning)?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> 
>> topic/remove-fbcon-notifiers-2019-06-14-1:
>> ----------------------------------------------------------------
>> topic/remove-fbcon-notifiers:
>> - remove fbdev notifier usage for fbcon, as prep work to clean up the fbcon locking
>> - assorted locking checks in vt/console code
>> - assorted notifier and cleanups in fbdev and backlight code
>>
>> The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:
>>
>>   Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://anongit.freedesktop.org/drm/drm-misc tags/topic/remove-fbcon-notifiers-2019-06-14-1
>>
>> for you to fetch changes up to 1dcff4ae65185e8c0300972f6d8d39d9a9db2bda:
>>
>>   backlight: simplify lcd notifier (2019-06-13 10:07:20 +0200)
>>
>> ----------------------------------------------------------------
>> Daniel Vetter (33):
>>       dummycon: Sprinkle locking checks
>>       fbdev: locking check for fb_set_suspend
>>       vt: might_sleep() annotation for do_blank_screen
>>       vt: More locking checks
>>       fbdev/sa1100fb: Remove dead code
>>       fbdev/cyber2000: Remove struct display
>>       fbdev/aty128fb: Remove dead code
>>       fbcon: s/struct display/struct fbcon_display/
>>       fbcon: Remove fbcon_has_exited
>>       fbcon: call fbcon_fb_(un)registered directly
>>       fbdev/sh_mobile: remove sh_mobile_lcdc_display_notify
>>       fbdev/omap: sysfs files can't disappear before the device is gone
>>       fbdev: sysfs files can't disappear before the device is gone
>>       staging/olpc: lock_fb_info can't fail
>>       fbdev/atyfb: lock_fb_info can't fail
>>       fbdev: lock_fb_info cannot fail
>>       fbcon: call fbcon_fb_bind directly
>>       fbdev: make unregister/unlink functions not fail
>>       fbdev: unify unlink_framebuffer paths
>>       fbdev/sh_mob: Remove fb notifier callback
>>       fbdev: directly call fbcon_suspended/resumed
>>       fbcon: Call fbcon_mode_deleted/new_modelist directly
>>       fbdev: Call fbcon_get_requirement directly
>>       Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
>>       fbmem: pull fbcon_fb_blanked out of fb_blank
>>       fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
>>       fb: Flatten control flow in fb_set_var
>>       fbcon: replace FB_EVENT_MODE_CHANGE/_ALL with direct calls
>>       vgaswitcheroo: call fbcon_remap_all directly
>>       fbcon: Call con2fb_map functions directly
>>       fbcon: Document what I learned about fbcon locking
>>       staging/olpc_dcon: Add drm conversion to TODO
>>       backlight: simplify lcd notifier
>>
>>  arch/arm/mach-pxa/am200epd.c                    |  13 +-
>>  drivers/gpu/vga/vga_switcheroo.c                |  11 +-
>>  drivers/media/pci/ivtv/ivtvfb.c                 |   6 +-
>>  drivers/staging/fbtft/fbtft-core.c              |   4 +-
>>  drivers/staging/olpc_dcon/TODO                  |   7 +
>>  drivers/staging/olpc_dcon/olpc_dcon.c           |   6 +-
>>  drivers/tty/vt/vt.c                             |  18 ++
>>  drivers/video/backlight/backlight.c             |   2 +-
>>  drivers/video/backlight/lcd.c                   |  12 -
>>  drivers/video/console/dummycon.c                |   6 +
>>  drivers/video/fbdev/aty/aty128fb.c              |  64 ----
>>  drivers/video/fbdev/aty/atyfb_base.c            |   3 +-
>>  drivers/video/fbdev/core/fbcmap.c               |   6 +-
>>  drivers/video/fbdev/core/fbcon.c                | 313 ++++++++-----------
>>  drivers/video/fbdev/core/fbcon.h                |   6 +-
>>  drivers/video/fbdev/core/fbmem.c                | 399 +++++++++---------------
>>  drivers/video/fbdev/core/fbsysfs.c              |  20 +-
>>  drivers/video/fbdev/cyber2000fb.c               |   1 -
>>  drivers/video/fbdev/neofb.c                     |   9 +-
>>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  21 +-
>>  drivers/video/fbdev/sa1100fb.c                  |  25 --
>>  drivers/video/fbdev/savage/savagefb_driver.c    |   9 +-
>>  drivers/video/fbdev/sh_mobile_lcdcfb.c          | 132 +-------
>>  drivers/video/fbdev/sh_mobile_lcdcfb.h          |   5 -
>>  include/linux/console_struct.h                  |   5 +-
>>  include/linux/fb.h                              |  45 +--
>>  include/linux/fbcon.h                           |  30 ++
>>  27 files changed, 396 insertions(+), 782 deletions(-)
