Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722221425EC
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Jan 2020 09:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgATIkK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Jan 2020 03:40:10 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:34854 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgATIkK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Jan 2020 03:40:10 -0500
Received: by mail-il1-f197.google.com with SMTP id h18so24612372ilc.2
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Jan 2020 00:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=q3gPVRkCKkDnQbdwbaF+Lx6G3K/uNCyBe1Ploo7BnSo=;
        b=CmVZdPyoLjdgkUhs596tm50tUhNYp+YAev517C0RmwFi4WIq31+LCNky+9BTNnUle5
         AsqC3bcUsAg8cMfsMb1ujrxqJjoJAABqDQQWQIFlJzKzwozg66xQpdU3OhXKupWCEoZE
         2KVKizFjEzUg79g1KN2+71C54y9YK4YdS8opABxGqYamlF39SEjt9uPhjHi64k0u/oIx
         tI4xKzfnN9Gp94y0ZulQt9Q7kmMN8SS86ZfBu1i+zKqhsViNVhqPU3afUm1nNeu0Mgtc
         MouUMYJ+ZCQTUa/IsCcCP+2pLcsQrrYIoH0g+y6jKbh0hG4bEx/gp+5EY/YxfBXVyKAZ
         MsSw==
X-Gm-Message-State: APjAAAXV9rDLtkWppE5psh+E0Q99BKquCiDXxbM6l2fitfiXo8DeS56F
        jh2g58+/SUfHwwy26I8/G/qZ/IpVKdThauB9tuf9eDsXiSSY
X-Google-Smtp-Source: APXvYqwRnqskRytYCzey5ro0cwoVeQWZX5TMhi+PhksUIhPcxXH72L0GALOweoFs+iGpnn2VKzs0/LpM6OEhzniC9UnNvX2akYpR
MIME-Version: 1.0
X-Received: by 2002:a6b:7201:: with SMTP id n1mr35564880ioc.37.1579509609592;
 Mon, 20 Jan 2020 00:40:09 -0800 (PST)
Date:   Mon, 20 Jan 2020 00:40:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000032fde8059c8e3d63@google.com>
Subject: general protection fault in fbcon_invert_region
From:   syzbot <syzbot+d0c38158ee047ba58ce1@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        sam@ravnborg.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    def9d278 Linux 5.5-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13000685e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=83c00afca9cf5153
dashboard link: https://syzkaller.appspot.com/bug?extid=d0c38158ee047ba58ce1
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d0c38158ee047ba58ce1@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 9735 Comm: syz-executor.0 Not tainted 5.5.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:fbcon_invert_region+0x81/0x2c0 drivers/video/fbdev/core/fbcon.c:2819
Code: c8 48 c1 e9 03 48 89 4d b0 41 89 dc 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 4d 89 ee 49 c1 ee 03 48 bb 00 00 00 00 00 fc ff df <41> 0f b6 04 1e 84 c0 0f 85 9b 01 00 00 45 0f b7 7d 00 48 8b 45 b0
RSP: 0018:ffffc900049578e0 EFLAGS: 00010203
RAX: ffff8880a3ab1478 RBX: dffffc0000000000 RCX: 1ffff1101475628f
RDX: ffffc90001ef9000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90004957930 R08: ffffffff83c83887 R09: fffffbfff128923c
R10: fffffbfff128923c R11: 0000000000000000 R12: 0000000000000000
R13: 000000000002000e R14: 0000000000004001 R15: ffff8880a3ab1000
FS:  00007f81f0197700(0000) GS:ffff8880aed00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000000 CR3: 00000000906dc000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 invert_screen+0x255/0xdb0 drivers/tty/vt/vt.c:763
 set_selection_kernel+0xe5d/0x1880 drivers/tty/vt/selection.c:80
 set_selection_user+0x63/0x80 drivers/tty/vt/selection.c:177
 tioclinux+0x103/0x530 drivers/tty/vt/vt.c:3039
 vt_ioctl+0x3f1/0x3a70 drivers/tty/vt/vt_ioctl.c:364
 tty_ioctl+0xee6/0x15c0 drivers/tty/tty_io.c:2660
 do_vfs_ioctl+0x6e2/0x19b0 fs/ioctl.c:47
 ksys_ioctl fs/ioctl.c:749 [inline]
 __do_sys_ioctl fs/ioctl.c:756 [inline]
 __se_sys_ioctl fs/ioctl.c:754 [inline]
 __x64_sys_ioctl+0xe3/0x120 fs/ioctl.c:754
 do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45b349
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f81f0196c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f81f01976d4 RCX: 000000000045b349
RDX: 0000000020000000 RSI: 000000000000541c RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000549 R14: 00000000004c68ef R15: 000000000075bf2c
Modules linked in:
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#2] PREEMPT SMP KASAN
CPU: 1 PID: 9735 Comm: syz-executor.0 Not tainted 5.5.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:fbcon_cursor+0xda/0xc40 drivers/video/fbdev/core/fbcon.c:1380
Code: 8b 45 d0 48 8d 98 a0 03 00 00 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 80 40 ec fd 48 8b 1b 48 89 d8 48 c1 e8 03 <42> 8a 04 28 84 c0 0f 85 13 08 00 00 44 89 75 c4 0f b7 03 89 45 c0
RSP: 0018:ffffc90004957558 EFLAGS: 00010003
RAX: 0000000020000001 RBX: 000000010000000e RCX: 0000000000040000
RDX: ffffc90001ef9000 RSI: 0000000000006ad1 RDI: 0000000000006ad2
RBP: ffffc900049575c0 R08: ffffffff83c808c8 R09: fffffbfff128923c
R10: fffffbfff128923c R11: 0000000000000000 R12: ffff888218834468
R13: dffffc0000000000 R14: 0000000000000001 R15: 1ffff1104310688d
FS:  00007f81f0197700(0000) GS:ffff8880aed00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000000 CR3: 00000000906dc000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 fbcon_blank+0x47a/0xa60 drivers/video/fbdev/core/fbcon.c:2406
 do_unblank_screen+0x299/0xb60 drivers/tty/vt/vt.c:4277
 unblank_screen+0x10/0x20 drivers/tty/vt/vt.c:4296
 bust_spinlocks+0x47/0xe0 lib/bust_spinlocks.c:26
 oops_end+0x38/0x100 arch/x86/kernel/dumpstack.c:336
 die+0x41/0x50 arch/x86/kernel/dumpstack.c:410
 do_general_protection+0x292/0x3d0 arch/x86/kernel/traps.c:560
 general_protection+0x2d/0x40 arch/x86/entry/entry_64.S:1202
RIP: 0010:fbcon_invert_region+0x81/0x2c0 drivers/video/fbdev/core/fbcon.c:2819
Code: c8 48 c1 e9 03 48 89 4d b0 41 89 dc 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 4d 89 ee 49 c1 ee 03 48 bb 00 00 00 00 00 fc ff df <41> 0f b6 04 1e 84 c0 0f 85 9b 01 00 00 45 0f b7 7d 00 48 8b 45 b0
RSP: 0018:ffffc900049578e0 EFLAGS: 00010203
RAX: ffff8880a3ab1478 RBX: dffffc0000000000 RCX: 1ffff1101475628f
RDX: ffffc90001ef9000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90004957930 R08: ffffffff83c83887 R09: fffffbfff128923c
R10: fffffbfff128923c R11: 0000000000000000 R12: 0000000000000000
R13: 000000000002000e R14: 0000000000004001 R15: ffff8880a3ab1000
 invert_screen+0x255/0xdb0 drivers/tty/vt/vt.c:763
 set_selection_kernel+0xe5d/0x1880 drivers/tty/vt/selection.c:80
 set_selection_user+0x63/0x80 drivers/tty/vt/selection.c:177
 tioclinux+0x103/0x530 drivers/tty/vt/vt.c:3039
 vt_ioctl+0x3f1/0x3a70 drivers/tty/vt/vt_ioctl.c:364
 tty_ioctl+0xee6/0x15c0 drivers/tty/tty_io.c:2660
 do_vfs_ioctl+0x6e2/0x19b0 fs/ioctl.c:47
 ksys_ioctl fs/ioctl.c:749 [inline]
 __do_sys_ioctl fs/ioctl.c:756 [inline]
 __se_sys_ioctl fs/ioctl.c:754 [inline]
 __x64_sys_ioctl+0xe3/0x120 fs/ioctl.c:754
 do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45b349
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f81f0196c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f81f01976d4 RCX: 000000000045b349
RDX: 0000000020000000 RSI: 000000000000541c RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000549 R14: 00000000004c68ef R15: 000000000075bf2c
Modules linked in:
---[ end trace 173ea3d293ec0a6a ]---
RIP: 0010:fbcon_invert_region+0x81/0x2c0 drivers/video/fbdev/core/fbcon.c:2819
Code: c8 48 c1 e9 03 48 89 4d b0 41 89 dc 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 4d 89 ee 49 c1 ee 03 48 bb 00 00 00 00 00 fc ff df <41> 0f b6 04 1e 84 c0 0f 85 9b 01 00 00 45 0f b7 7d 00 48 8b 45 b0
RSP: 0018:ffffc900049578e0 EFLAGS: 00010203
RAX: ffff8880a3ab1478 RBX: dffffc0000000000 RCX: 1ffff1101475628f
RDX: ffffc90001ef9000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90004957930 R08: ffffffff83c83887 R09: fffffbfff128923c
R10: fffffbfff128923c R11: 0000000000000000 R12: 0000000000000000
R13: 000000000002000e R14: 0000000000004001 R15: ffff8880a3ab1000
FS:  00007f81f0197700(0000) GS:ffff8880aed00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000000 CR3: 00000000906dc000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
