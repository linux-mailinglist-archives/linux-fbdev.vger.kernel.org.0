Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A722277B3
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Jul 2020 06:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgGUEmU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Jul 2020 00:42:20 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:55881 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUEmU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Jul 2020 00:42:20 -0400
Received: by mail-il1-f197.google.com with SMTP id b2so12629775ilh.22
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Jul 2020 21:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Katev7es+Tw30gWBrxnYxlAA+IrkGIil3BdIjpNkBSU=;
        b=FbwMI72Cuumkz1AovdoNIMyhFuxihzMHcElJRbN1XqtK7DrN3yBZbHqJparmN3JWLU
         N46/QWiOUMTFiJu1vaYJ5TrkP1WZ5oTke57US/gABJKtr5soFjMi4qt9kjyVFsxUDmln
         74nv36ykWiElA3Lq7+Hycj3uN4SgLuJOl0ecvxKh8SrUp+JPTAC01hd0BlRZlFXvf168
         Z3+W3rYDFfkdcDcl9x6golfmY2acfJumAwiZ2HccmvBYWeWtJqB1WQtnv0HFD/CNRm7u
         pSrWTFthbSO8O/jirTK+MmEnpEdsCZ6estbSmZP7jYxrSsNq08jDWPxPyz7hW5Mn+Pl7
         Ev3g==
X-Gm-Message-State: AOAM532F5BvFA0CZJ6E/cIg5lEN/bWPaYgadFFpCrh5Npc6KwM0zXiks
        gi3Ys+x53PbeK3nXVPKg1vktwoJ7dFnjgB6xiMhZySRdSjTR
X-Google-Smtp-Source: ABdhPJydDec5HyAd8YK8qPZCatWKhDRmcka4pyOtp5HHtI1/2WGYR2OZL1BY2xNDRiWn0Q5TiM35nhvsqdF2VZjDIsc1ygpB+Xvh
MIME-Version: 1.0
X-Received: by 2002:a92:4913:: with SMTP id w19mr24874586ila.185.1595306539009;
 Mon, 20 Jul 2020 21:42:19 -0700 (PDT)
Date:   Mon, 20 Jul 2020 21:42:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000090cd5905aaec3f2c@google.com>
Subject: KASAN: stack-out-of-bounds Write in sys_imageblit
From:   syzbot <syzbot+ba5bd977df7bb87862c4@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    4fa640dc Merge tag 'vfio-v5.8-rc7' of git://github.com/awi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17ec2d58900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=575b381064b1cba2
dashboard link: https://syzkaller.appspot.com/bug?extid=ba5bd977df7bb87862c4
compiler:       gcc (GCC) 10.1.0-syz 20200507
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ba5bd977df7bb87862c4@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
BUG: KASAN: stack-out-of-bounds in sys_imageblit+0x117f/0x1290 drivers/video/fbdev/core/sysimgblt.c:275
Write of size 4 at addr ffffc900097d7d90 by task syz-executor.1/11925

CPU: 1 PID: 11925 Comm: syz-executor.1 Not tainted 5.8.0-rc6-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x436 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
 sys_imageblit+0x117f/0x1290 drivers/video/fbdev/core/sysimgblt.c:275
 drm_fb_helper_sys_imageblit+0x1c/0x180 drivers/gpu/drm/drm_fb_helper.c:763
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
 bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x33c/0x3f0 drivers/video/fbdev/core/fbcon.c:1362
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:683
 invert_screen+0x1d4/0x600 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:84 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
 vc_do_resize+0x1099/0x13f0 drivers/tty/vt/vt.c:1230
 fbcon_do_set_font+0x4ad/0x950 drivers/video/fbdev/core/fbcon.c:2609
 fbcon_set_font+0x767/0x8b0 drivers/video/fbdev/core/fbcon.c:2706
 con_font_set drivers/tty/vt/vt.c:4571 [inline]
 con_font_op+0xd25/0x1110 drivers/tty/vt/vt.c:4636
 vt_ioctl+0x1180/0x2670 drivers/tty/vt/vt_ioctl.c:928
 vt_compat_ioctl+0x168/0x6b0 drivers/tty/vt/vt_ioctl.c:1249
 tty_compat_ioctl+0x19c/0x410 drivers/tty/tty_io.c:2847
 __do_compat_sys_ioctl+0x1d3/0x230 fs/ioctl.c:847
 do_syscall_32_irqs_on+0x3f/0x60 arch/x86/entry/common.c:428
 __do_fast_syscall_32 arch/x86/entry/common.c:475 [inline]
 do_fast_syscall_32+0x7f/0x120 arch/x86/entry/common.c:503
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f48569
Code: Bad RIP value.
RSP: 002b:00000000f5d430bc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000004b61
RDX: 0000000020000080 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000


Memory state around the buggy address:
 ffffc900097d7c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc900097d7d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc900097d7d80: 00 00 f1 f1 f1 f1 00 00 f3 f3 00 00 00 00 00 00
                         ^
 ffffc900097d7e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc900097d7e80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
