Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9749B39C853
	for <lists+linux-fbdev@lfdr.de>; Sat,  5 Jun 2021 15:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhFENCV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 5 Jun 2021 09:02:21 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:35658 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhFENCV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 5 Jun 2021 09:02:21 -0400
Received: by mail-io1-f71.google.com with SMTP id w17-20020a6b4a110000b0290492680338ecso8241028iob.2
        for <linux-fbdev@vger.kernel.org>; Sat, 05 Jun 2021 06:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=iFXTtA8X2z+eX4opBgGHQYkpp91LW96NGV28D3XR+Ng=;
        b=HH1L12yi8zUsT5y+GbrHXCNnJWUo6nPTwsw9J0u1aGQNBNy3+Goocx9VZtB/691OUn
         rgUCd9iOJsX0ezubmLqnX91RzfUI2cJcBSfJ1TqC0o3kLzS8GwciTB8B5RVNrpyNnJR/
         h3Za90cXry5OGs1FL3/visQEP6PcaOim3Olxm4x2AlFqDnvnPvDXtBCBw3VA2gL11VZk
         6OstqqqDOY0Q4nvWZO6njzlKj0cKGNKZavWBdSiE/rh/eS9s5eIDF4QHNa5u9uX6Zjw8
         U5e6/J/7xVk9KOrI/jlfLqU82VAfwlIrvPRIWs9qW1Q5Tzpk+iRIdD7kHzOZd5NANdQR
         kD2A==
X-Gm-Message-State: AOAM533rMlgdKeX7Y0nDrTjmZtpP0nPWaJqn6p6fMYktB9bFQG9rZl6t
        7GM6LcMcXNKUZBMWWzxXn8vEKWstgttJswRgE7FIfYujvkeK
X-Google-Smtp-Source: ABdhPJxtDacZtV+pZIa+ZFcWZKxKwjVxI6fAAwh1dDcQ4+ayVG4yStlGizPDvEBT3naENRsqWpk52UnlWZEPebrRZZHbdFh5UbRF
MIME-Version: 1.0
X-Received: by 2002:a5d:83ce:: with SMTP id u14mr7879807ior.45.1622898019609;
 Sat, 05 Jun 2021 06:00:19 -0700 (PDT)
Date:   Sat, 05 Jun 2021 06:00:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f7365905c4046327@google.com>
Subject: [syzbot] WARNING in dlfb_set_video_mode/usb_submit_urb
From:   syzbot <syzbot+b70e32fc4c6568d6d19e@syzkaller.appspotmail.com>
To:     bernie@plugable.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    c2131f7e Merge tag 'gfs2-v5.13-rc2-fixes' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1204b5d3d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2ecf1aa681aadc1
dashboard link: https://syzkaller.appspot.com/bug?extid=b70e32fc4c6568d6d19e
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15282db7d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1763504dd00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b70e32fc4c6568d6d19e@syzkaller.appspotmail.com

usb 1-1: Read EDID byte 0 failed: -71
usb 1-1: Read EDID byte 0 failed: -71
usb 1-1: Read EDID byte 0 failed: -71
usb 1-1: Unable to get valid EDID from device/display
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 8629 at drivers/usb/core/urb.c:494 usb_submit_urb+0xacd/0x1550 drivers/usb/core/urb.c:493
Modules linked in:
CPU: 0 PID: 8629 Comm: kworker/0:4 Not tainted 5.13.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xacd/0x1550 drivers/usb/core/urb.c:493
Code: d8 48 c1 e8 03 42 8a 04 28 84 c0 0f 85 bd 07 00 00 44 8b 03 48 c7 c7 80 86 e1 8a 4c 89 f6 4c 89 fa 89 e9 31 c0 e8 63 c7 8f fb <0f> 0b 4c 8b 74 24 30 45 89 f7 4c 89 ff 48 c7 c6 70 e1 8d 8d e8 6a
RSP: 0018:ffffc90001f36660 EFLAGS: 00010246
RAX: 0baf7fe5b4c01b00 RBX: ffffffff8ae184ac RCX: ffff888035c09c40
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: 0000000000000003 R08: ffffffff81655632 R09: ffffed1017345f90
R10: ffffed1017345f90 R11: 0000000000000000 R12: ffff888017813700
R13: dffffc0000000000 R14: ffffffff8ae226e0 R15: ffff888017212b90
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe721263740 CR3: 0000000017ff3000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 dlfb_submit_urb drivers/video/fbdev/udlfb.c:1969 [inline]
 dlfb_set_video_mode+0x1b2a/0x3500 drivers/video/fbdev/udlfb.c:315
 dlfb_ops_set_par+0x731/0xb50 drivers/video/fbdev/udlfb.c:1110
 dlfb_usb_probe+0x184e/0x21b0 drivers/video/fbdev/udlfb.c:1732
 usb_probe_interface+0x633/0xb40 drivers/usb/core/driver.c:396
 really_probe+0x3cb/0x1020 drivers/base/dd.c:580
 driver_probe_device+0x178/0x350 drivers/base/dd.c:763
 bus_for_each_drv+0x16a/0x1f0 drivers/base/bus.c:431
 __device_attach+0x301/0x560 drivers/base/dd.c:938
 bus_probe_device+0xb8/0x1f0 drivers/base/bus.c:491
 device_add+0x11fc/0x1670 drivers/base/core.c:3324
 usb_set_configuration+0x1a86/0x2100 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x83/0x140 drivers/usb/core/generic.c:238
 usb_probe_device+0x13a/0x260 drivers/usb/core/driver.c:293
 really_probe+0x3cb/0x1020 drivers/base/dd.c:580
 driver_probe_device+0x178/0x350 drivers/base/dd.c:763
 bus_for_each_drv+0x16a/0x1f0 drivers/base/bus.c:431
 __device_attach+0x301/0x560 drivers/base/dd.c:938
 bus_probe_device+0xb8/0x1f0 drivers/base/bus.c:491
 device_add+0x11fc/0x1670 drivers/base/core.c:3324
 usb_new_device+0xd45/0x1790 drivers/usb/core/hub.c:2556
 hub_port_connect+0x1055/0x27a0 drivers/usb/core/hub.c:5276
 hub_port_connect_change+0x5d0/0xbf0 drivers/usb/core/hub.c:5416
 port_event+0xaee/0x1140 drivers/usb/core/hub.c:5562
 hub_event+0x48d/0xd90 drivers/usb/core/hub.c:5644
 process_one_work+0x833/0x10c0 kernel/workqueue.c:2276
 worker_thread+0xac1/0x1300 kernel/workqueue.c:2422
 kthread+0x39a/0x3c0 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
