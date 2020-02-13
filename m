Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9968D15BD8D
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Feb 2020 12:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbgBMLSN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Feb 2020 06:18:13 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:41831 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729781AbgBMLSN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Feb 2020 06:18:13 -0500
Received: by mail-il1-f197.google.com with SMTP id k9so4383580ili.8
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Feb 2020 03:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=sbgM305N5kE+FFc95c5/T4CXWImEt9TqPzbKgLEFUkk=;
        b=dgls5g11wZtxcBum7TLrR01TyTeDWHZnTJochzMSSwlNAOZuIj5nJ/Jrru+qKulV9p
         yP2+aoHyoyqVcBOKZjnXc0qvK3Bis/34AzZ25UWKT7c/1q2hIL5G2WzM790JEWL41vGM
         AQg8mYQxDb3n82FzVUKhTfmOrK89Kqiv+UWb8Q1tYk+mUog3LUJNZT6TRIxnkLeqNmX5
         mIo6rdbK0wTJvdDFgMXFZGRWpSbyicW5R0cFmQUH6R758slkdm6EQHrINz42yPwZg14x
         4Y5VyAWfx5a/+E1iqnKMlbHCk4uzoQjxUuJDJ9xhhQlIWIQn+WldrHb+lAnuIyherWTQ
         a9iQ==
X-Gm-Message-State: APjAAAU+GYdQ34fr22nktyvJqlJG0L3//wHFGFrhidEijHbH9LDQZR3c
        7k5bREedmCrICpZXKUebVSMAl9/CkpG/US4P0p79H/dJlrHq
X-Google-Smtp-Source: APXvYqxU75gzQMQUNwF5XwwzFcLU4HSB1PDd2Rhr8jXfwTeXLQsFt280UX8VoStviELQ94PhVVjx6QwIOuoLKq6mmB3OEkqzyKj5
MIME-Version: 1.0
X-Received: by 2002:a92:589a:: with SMTP id z26mr16353213ilf.19.1581592693024;
 Thu, 13 Feb 2020 03:18:13 -0800 (PST)
Date:   Thu, 13 Feb 2020 03:18:13 -0800
In-Reply-To: <000000000000ab87b6059990b486@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a5ad0f059e733e2b@google.com>
Subject: Re: general protection fault in fbcon_cursor
From:   syzbot <syzbot+6acf28c23c81badd89a7@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        sam@ravnborg.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    f2850dd5 Merge tag 'kbuild-fixes-v5.6' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120eaae6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=735296e4dd620b10
dashboard link: https://syzkaller.appspot.com/bug?extid=6acf28c23c81badd89a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c8fc09e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1364c07ee00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6acf28c23c81badd89a7@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0020000001: 0000 [#1] PREEMPT SMP KASAN
KASAN: probably user-memory-access in range [0x0000000100000008-0x000000010000000f]
CPU: 0 PID: 2873 Comm: kworker/0:35 Not tainted 5.6.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events console_callback
RIP: 0010:fbcon_cursor+0x114/0x660 drivers/video/fbdev/core/fbcon.c:1387
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 e6 04 00 00 4d 8b b4 24 a0 03 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c 89 f0 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 ba
RSP: 0018:ffffc90008f7faf0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: ffff8880a3860000 RCX: ffffffff83f31930
RDX: 0000000020000001 RSI: ffffffff83c5b4ec RDI: ffff88809c3573a0
RBP: ffffc90008f7fb30 R08: ffff88809ec02300 R09: ffffed10147ef884
R10: ffffed10147ef883 R11: ffff8880a3f7c41f R12: ffff88809c357000
R13: ffff8880a385c000 R14: 000000010000000c R15: ffff8880a385c468
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000455300 CR3: 00000000a7dad000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 set_cursor drivers/tty/vt/vt.c:908 [inline]
 set_cursor+0x1fb/0x280 drivers/tty/vt/vt.c:899
 redraw_screen+0x4e1/0x7d0 drivers/tty/vt/vt.c:1013
 complete_change_console+0x105/0x3a0 drivers/tty/vt/vt_ioctl.c:1264
 change_console+0x19b/0x2c0 drivers/tty/vt/vt_ioctl.c:1389
 console_callback+0x3a1/0x400 drivers/tty/vt/vt.c:2824
 process_one_work+0xa05/0x17a0 kernel/workqueue.c:2264
 worker_thread+0x98/0xe40 kernel/workqueue.c:2410
 kthread+0x361/0x430 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 10588331f3234462 ]---
RIP: 0010:fbcon_cursor+0x114/0x660 drivers/video/fbdev/core/fbcon.c:1387
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 e6 04 00 00 4d 8b b4 24 a0 03 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c 89 f0 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 ba
RSP: 0018:ffffc90008f7faf0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: ffff8880a3860000 RCX: ffffffff83f31930
RDX: 0000000020000001 RSI: ffffffff83c5b4ec RDI: ffff88809c3573a0
RBP: ffffc90008f7fb30 R08: ffff88809ec02300 R09: ffffed10147ef884
R10: ffffed10147ef883 R11: ffff8880a3f7c41f R12: ffff88809c357000
R13: ffff8880a385c000 R14: 000000010000000c R15: ffff8880a385c468
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000455300 CR3: 00000000a7dad000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

