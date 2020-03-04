Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 003CC178846
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Mar 2020 03:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387397AbgCDC0j (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Mar 2020 21:26:39 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11140 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387497AbgCDC0j (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Mar 2020 21:26:39 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 561B770F4122FC0FDD03;
        Wed,  4 Mar 2020 10:26:37 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Mar 2020
 10:26:31 +0800
Subject: Re: [v3] vgacon: Fix a UAF in vgacon_invert_region
To:     <b.zolnierkie@samsung.com>, <wangkefeng.wang@huawei.com>,
        <sergey.senozhatsky@gmail.com>, <pmladek@suse.com>,
        <akpm@osdl.org>, <ville.syrjala@linux.intel.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
References: <20200304021011.5691-1-zhangxiaoxu5@huawei.com>
From:   "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Message-ID: <85ac21e6-9b52-558a-c233-61253a12247b@huawei.com>
Date:   Wed, 4 Mar 2020 10:26:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200304021011.5691-1-zhangxiaoxu5@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.220.145]
X-CFilter-Loop: Reflected
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Please ignore this patch.
Thanks.

ÔÚ 2020/3/4 10:10, Zhang Xiaoxu Ð´µÀ:
> When syzkaller tests, there is a UAF:
>    BUG: KASan: use after free in vgacon_invert_region+0x9d/0x110 at addr
>      ffff880000100000
>    Read of size 2 by task syz-executor.1/16489
>    page:ffffea0000004000 count:0 mapcount:-127 mapping:          (null)
>    index:0x0
>    page flags: 0xfffff00000000()
>    page dumped because: kasan: bad access detected
>    CPU: 1 PID: 16489 Comm: syz-executor.1 Not tainted
>    Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
>    rel-1.9.3-0-ge2fc41e-prebuilt.qemu-project.org 04/01/2014
>    Call Trace:
>      [<ffffffffb119f309>] dump_stack+0x1e/0x20
>      [<ffffffffb04af957>] kasan_report+0x577/0x950
>      [<ffffffffb04ae652>] __asan_load2+0x62/0x80
>      [<ffffffffb090f26d>] vgacon_invert_region+0x9d/0x110
>      [<ffffffffb0a39d95>] invert_screen+0xe5/0x470
>      [<ffffffffb0a21dcb>] set_selection+0x44b/0x12f0
>      [<ffffffffb0a3bfae>] tioclinux+0xee/0x490
>      [<ffffffffb0a1d114>] vt_ioctl+0xff4/0x2670
>      [<ffffffffb0a0089a>] tty_ioctl+0x46a/0x1a10
>      [<ffffffffb052db3d>] do_vfs_ioctl+0x5bd/0xc40
>      [<ffffffffb052e2f2>] SyS_ioctl+0x132/0x170
>      [<ffffffffb11c9b1b>] system_call_fastpath+0x22/0x27
>      Memory state around the buggy address:
>       ffff8800000fff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>       00 00
>       ffff8800000fff80: 00 00 00 00 00 00 00 00 00 00 00 00 00
>       00 00 00
>      >ffff880000100000: ff ff ff ff ff ff ff ff ff ff ff ff ff
>       ff ff ff
> 
> It can be reproduce in the linux mainline by the program:
>    #include <stdio.h>
>    #include <stdlib.h>
>    #include <unistd.h>
>    #include <fcntl.h>
>    #include <sys/types.h>
>    #include <sys/stat.h>
>    #include <sys/ioctl.h>
>    #include <linux/vt.h>
> 
>    struct tiocl_selection {
>      unsigned short xs;      /* X start */
>      unsigned short ys;      /* Y start */
>      unsigned short xe;      /* X end */
>      unsigned short ye;      /* Y end */
>      unsigned short sel_mode; /* selection mode */
>    };
> 
>    #define TIOCL_SETSEL    2
>    struct tiocl {
>      unsigned char type;
>      unsigned char pad;
>      struct tiocl_selection sel;
>    };
> 
>    int main()
>    {
>      int fd = 0;
>      const char *dev = "/dev/char/4:1";
> 
>      struct vt_consize v = {0};
>      struct tiocl tioc = {0};
> 
>      fd = open(dev, O_RDWR, 0);
> 
>      v.v_rows = 3346;
>      ioctl(fd, VT_RESIZEX, &v);
> 
>      tioc.type = TIOCL_SETSEL;
>      ioctl(fd, TIOCLINUX, &tioc);
> 
>      return 0;
>    }
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
> ---
>   drivers/video/console/vgacon.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
> index de7b8382aba9..95e2fece7e91 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -1316,6 +1316,9 @@ static int vgacon_font_get(struct vc_data *c, struct console_font *font)
>   static int vgacon_resize(struct vc_data *c, unsigned int width,
>   			 unsigned int height, unsigned int user)
>   {
> +	if ((width >> 1) * height > vga_vram_size)
> +		return -EINVAL;
> +
>   	if (width % 2 || width > screen_info.orig_video_cols ||
>   	    height > (screen_info.orig_video_lines * vga_default_font_height)/
>   	    c->vc_font.height)
> 

