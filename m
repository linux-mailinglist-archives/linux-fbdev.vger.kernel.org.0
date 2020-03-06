Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE97D17BA5F
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Mar 2020 11:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgCFKix (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Mar 2020 05:38:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46786 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgCFKix (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Mar 2020 05:38:53 -0500
Received: by mail-wr1-f67.google.com with SMTP id n15so1711113wrw.13
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Mar 2020 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QBuHXkQCdmLJ0nXbzpYAf4DqRlWoqLDUktFkgtQzgGA=;
        b=AOXtqHfvj9gugJf59g0OuCHIP4kBo9ltUBqZpetVCev688+6x5zZQI3dvbK2fTr3Pr
         UjVcnqna/R491NtzDR4xmNJhDrfkQN4UkpHyPZnfMsa+6VjA6zIcS3rLzn3SQkfnOLg6
         dog7j6/QcNRKnKCkq/11uiPrIGoFE2Spxla54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QBuHXkQCdmLJ0nXbzpYAf4DqRlWoqLDUktFkgtQzgGA=;
        b=bOuArznsjpFnpHZgo6SFgf+F5hHkB7cl0bCXS2Kw2dHhJhRHl6d5eYg5SoQDMrYztk
         hGziFkPzaRFqbD471+5hexXU+6iv+dpKZdzWtAU/Do7xkT+zct5MHINDwIT0/hpFdHNS
         DVPbviA46gVQbNSOQUCcXbIXVN7hjHSfI7vUko2HrOOC4DYbFontdEokynKLYuhi1e0H
         Bb7PQ2wXw0sC9nM0o9joNTKhB3J/GKNwxZmcJp4/aOH4jUYs2cFQXGsP3Y1Sw/OdtMlB
         C6zmzRQp3vlLxXTyV009DaOOapbypwwM8w0CSHNTBIlBY0zp4NWnJ2OKhyk6J07rc1sr
         SqRA==
X-Gm-Message-State: ANhLgQ1XIr7pJ3BlPoEkPHNbKIrg3JM8J2KHvFFrzsRbzTQKMarTAyH9
        Eb/CmVIPhLYm/TRlEnADBaJT1A==
X-Google-Smtp-Source: ADFU+vtBBQ9nb9nLi1ZiizM9gWpnMIhehOjRavKJTQ5P+czbD4tlRZj3ehITDNQcbRRReAywuF2e8g==
X-Received: by 2002:a5d:4885:: with SMTP id g5mr3294585wrq.93.1583491129177;
        Fri, 06 Mar 2020 02:38:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b197sm13842655wmd.10.2020.03.06.02.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 02:38:48 -0800 (PST)
Date:   Fri, 6 Mar 2020 11:38:46 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
        Dave Airlie <airlied@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     b.zolnierkie@samsung.com, wangkefeng.wang@huawei.com,
        sergey.senozhatsky@gmail.com, pmladek@suse.com, akpm@osdl.org,
        ville.syrjala@linux.intel.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [v4] vgacon: Fix a UAF in vgacon_invert_region
Message-ID: <20200306103846.GS2363188@phenom.ffwll.local>
References: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Mar 04, 2020 at 10:24:29AM +0800, Zhang Xiaoxu wrote:
> When syzkaller tests, there is a UAF:
>   BUG: KASan: use after free in vgacon_invert_region+0x9d/0x110 at addr
>     ffff880000100000
>   Read of size 2 by task syz-executor.1/16489
>   page:ffffea0000004000 count:0 mapcount:-127 mapping:          (null)
>   index:0x0
>   page flags: 0xfffff00000000()
>   page dumped because: kasan: bad access detected
>   CPU: 1 PID: 16489 Comm: syz-executor.1 Not tainted
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
>   rel-1.9.3-0-ge2fc41e-prebuilt.qemu-project.org 04/01/2014
>   Call Trace:
>     [<ffffffffb119f309>] dump_stack+0x1e/0x20
>     [<ffffffffb04af957>] kasan_report+0x577/0x950
>     [<ffffffffb04ae652>] __asan_load2+0x62/0x80
>     [<ffffffffb090f26d>] vgacon_invert_region+0x9d/0x110
>     [<ffffffffb0a39d95>] invert_screen+0xe5/0x470
>     [<ffffffffb0a21dcb>] set_selection+0x44b/0x12f0
>     [<ffffffffb0a3bfae>] tioclinux+0xee/0x490
>     [<ffffffffb0a1d114>] vt_ioctl+0xff4/0x2670
>     [<ffffffffb0a0089a>] tty_ioctl+0x46a/0x1a10
>     [<ffffffffb052db3d>] do_vfs_ioctl+0x5bd/0xc40
>     [<ffffffffb052e2f2>] SyS_ioctl+0x132/0x170
>     [<ffffffffb11c9b1b>] system_call_fastpath+0x22/0x27
>     Memory state around the buggy address:
>      ffff8800000fff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      00 00
>      ffff8800000fff80: 00 00 00 00 00 00 00 00 00 00 00 00 00
>      00 00 00
>     >ffff880000100000: ff ff ff ff ff ff ff ff ff ff ff ff ff
>      ff ff ff
> 
> It can be reproduce in the linux mainline by the program:
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <unistd.h>
>   #include <fcntl.h>
>   #include <sys/types.h>
>   #include <sys/stat.h>
>   #include <sys/ioctl.h>
>   #include <linux/vt.h>
> 
>   struct tiocl_selection {
>     unsigned short xs;      /* X start */
>     unsigned short ys;      /* Y start */
>     unsigned short xe;      /* X end */
>     unsigned short ye;      /* Y end */
>     unsigned short sel_mode; /* selection mode */
>   };
> 
>   #define TIOCL_SETSEL    2
>   struct tiocl {
>     unsigned char type;
>     unsigned char pad;
>     struct tiocl_selection sel;
>   };
> 
>   int main()
>   {
>     int fd = 0;
>     const char *dev = "/dev/char/4:1";
> 
>     struct vt_consize v = {0};
>     struct tiocl tioc = {0};
> 
>     fd = open(dev, O_RDWR, 0);
> 
>     v.v_rows = 3346;
>     ioctl(fd, VT_RESIZEX, &v);
> 
>     tioc.type = TIOCL_SETSEL;
>     ioctl(fd, TIOCLINUX, &tioc);
> 
>     return 0;
>   }
> 
> When resize the screen, update the 'vc->vc_size_row' to the new_row_size,
> but when 'set_origin' in 'vgacon_set_origin', vgacon use 'vga_vram_base'
> for 'vc_origin' and 'vc_visible_origin', not 'vc_screenbuf'. It maybe
> smaller than 'vc_screenbuf'. When TIOCLINUX, use the new_row_size to calc
> the offset, it maybe larger than the vga_vram_size in vgacon driver, then
> bad access.
> Also, if set an larger screenbuf firstly, then set an more larger
> screenbuf, when copy old_origin to new_origin, a bad access may happen.
> 
> So, If the screen size larger than vga_vram, resize screen should be
> failed. This alse fix CVE-2020-8649 and CVE-2020-8647.
> 
> Fixes: 0aec4867dca14 ("[PATCH] SVGATextMode fix")
> Reference: CVE-2020-8647 and CVE-2020-8649
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

This seems to match the size computation used in other places in the vt
and vgacon code. So from that pov

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

There's also no other "is this going to be bigger than the vga memory we
have" checks anywhere, so makes sense to do that. There's a few copy
helpers that limit the copy size to the max of vga_ram_size and
vc->vc_screenbuf_size, but seems like not really done consistently. So
seems to make sense, but really how did I end up getting listed as
maintainer for vt stuff :-/

Anyway also needs

Cc: stable@vger.kernel.org

Linus, since this missed the -fixes pull from Dave maybe double check I'm
not grossly wrong here and apply directly?

Thanks, Daniel

> ---
>  drivers/video/console/vgacon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
> index de7b8382aba9..998b0de1812f 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -1316,6 +1316,9 @@ static int vgacon_font_get(struct vc_data *c, struct console_font *font)
>  static int vgacon_resize(struct vc_data *c, unsigned int width,
>  			 unsigned int height, unsigned int user)
>  {
> +	if ((width << 1) * height > vga_vram_size)
> +		return -EINVAL;
> +
>  	if (width % 2 || width > screen_info.orig_video_cols ||
>  	    height > (screen_info.orig_video_lines * vga_default_font_height)/
>  	    c->vc_font.height)
> -- 
> 2.17.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
