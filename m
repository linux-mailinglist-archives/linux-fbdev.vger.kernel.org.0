Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC6A279781
	for <lists+linux-fbdev@lfdr.de>; Sat, 26 Sep 2020 09:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbgIZHTT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 26 Sep 2020 03:19:19 -0400
Received: from mail-io1-f78.google.com ([209.85.166.78]:36339 "EHLO
        mail-io1-f78.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgIZHTS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 26 Sep 2020 03:19:18 -0400
Received: by mail-io1-f78.google.com with SMTP id h8so3805850ioa.3
        for <linux-fbdev@vger.kernel.org>; Sat, 26 Sep 2020 00:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=dX7uzTK5eNz0IQqGIK08F6NHKFH8T8i9KJUoLvVBVxA=;
        b=QH9TxZ6ox8L+3tzfRq7yGJxqjbuYn40NxrS3nRNHLkps/Tj08TR0eARFO0CDdlk1Ba
         QgmqWiBDPQbBBReXLzTizka09SzTT9ycwViqK2fUa1YXwa/aQTrOeeAsRiFXR2oux7Zc
         aWwMDEAMO9oKthUIV/7ijmtfkg6mWLiw16IgZd+BQvWzogXiB6+0/3uOQPMsOohE7VdE
         vP0of8s+yk4a2HcwVqOBi7HVRSjcEoO8400LKvRyopI0m+8zoztsWUf7A1SGic8e1Oin
         j/h9iye3YuDzERUIOhU4lHoCM9HbURpchQaWPlYSl6uWFUbH5VmIZEHGC4no6/OCzMnl
         nO4g==
X-Gm-Message-State: AOAM530HNigtKlfA38XbIY1y5X+On4+bGc1RfMhAKtdKs0GYEqRkNcbR
        QnCt6GwuWTP9vKAxcRRBD0sCrbN3OL+NETAxOkrUVfMqTkiz
X-Google-Smtp-Source: ABdhPJyIeKAJahOhUJBJzK1C//wuAqg5bULj5URE6A2okCbfGeIu3nY5c3ybpVmJpE9WPpHV4+vl7aIjnDX1rfDEAH4Vqg2YMWIi
MIME-Version: 1.0
X-Received: by 2002:a92:c041:: with SMTP id o1mr2815551ilf.160.1601104757824;
 Sat, 26 Sep 2020 00:19:17 -0700 (PDT)
Date:   Sat, 26 Sep 2020 00:19:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000056a39205b0324001@google.com>
Subject: KASAN: global-out-of-bounds Read in bit_putcs (2)
From:   syzbot <syzbot+a889d70ef11d6e0f6f22@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de,
        dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    171d4ff7 Merge tag 'mmc-v5.9-rc4-2' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126e918d900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=240e2ebab67245c7
dashboard link: https://syzkaller.appspot.com/bug?extid=a889d70ef11d6e0f6f22
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a889d70ef11d6e0f6f22@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in __fb_pad_aligned_buffer include/linux/fb.h:654 [inline]
BUG: KASAN: global-out-of-bounds in bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
BUG: KASAN: global-out-of-bounds in bit_putcs+0xbb6/0xd20 drivers/video/fbdev/core/bitblit.c:185
Read of size 1 at addr ffffffff88db78e9 by task syz-executor.4/16465

CPU: 0 PID: 16465 Comm: syz-executor.4 Not tainted 5.9.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 __fb_pad_aligned_buffer include/linux/fb.h:654 [inline]
 bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
 bit_putcs+0xbb6/0xd20 drivers/video/fbdev/core/bitblit.c:185
 fbcon_putcs+0x35a/0x450 drivers/video/fbdev/core/fbcon.c:1308
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:675
 redraw_screen+0x658/0x790 drivers/tty/vt/vt.c:1034
 fbcon_do_set_font+0x718/0x880 drivers/video/fbdev/core/fbcon.c:2438
 fbcon_copy_font+0x12f/0x1a0 drivers/video/fbdev/core/fbcon.c:2453
 con_font_copy drivers/tty/vt/vt.c:4719 [inline]
 con_font_op+0x65b/0x1140 drivers/tty/vt/vt.c:4734
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:473 [inline]
 vt_ioctl+0x21c9/0x2e90 drivers/tty/vt/vt_ioctl.c:852
 tty_ioctl+0x1019/0x15f0 drivers/tty/tty_io.c:2656
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45e179
Code: 3d b2 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 0b b2 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fe2e03e5c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000010840 RCX: 000000000045e179
RDX: 0000000020000400 RSI: 0000000000004b72 RDI: 0000000000000003
RBP: 000000000118cf80 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118cf4c
R13: 00007ffff7397e9f R14: 00007fe2e03e69c0 R15: 000000000118cf4c

The buggy address belongs to the variable:
 oid_index+0x109/0xae0

Memory state around the buggy address:
 ffffffff88db7780: 00 00 00 00 01 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
 ffffffff88db7800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06 f9
>ffffffff88db7880: f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9 00 01 f9 f9
                                                          ^
 ffffffff88db7900: f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9 00 00 02 f9
 ffffffff88db7980: f9 f9 f9 f9 00 03 f9 f9 f9 f9 f9 f9 07 f9 f9 f9
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
