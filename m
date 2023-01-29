Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C597167FC8F
	for <lists+linux-fbdev@lfdr.de>; Sun, 29 Jan 2023 04:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjA2DDn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 28 Jan 2023 22:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjA2DDm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 28 Jan 2023 22:03:42 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4EB8692
        for <linux-fbdev@vger.kernel.org>; Sat, 28 Jan 2023 19:03:41 -0800 (PST)
Received: by mail-io1-f70.google.com with SMTP id a2-20020a5d89c2000000b00717a8ac548cso1136688iot.9
        for <linux-fbdev@vger.kernel.org>; Sat, 28 Jan 2023 19:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryCFObQuc4O2HwRd/dmaSGlzJNnOWNihc9/B5WYtqyw=;
        b=jZMjOmUukcPXvG1aqeoS11dZX8w4L8VjAGDOd+7R1xCgyUC6stfyvrx2v7OzoorpCU
         F+3p32dl7qjfVkfJAeGl+i54sRXzj82wXGMLFgzj6qE2rEQ/IYoxFpbvUl5YTs8QkRlJ
         PCI+1Rbvv0a3nUK4XACF9iQyJEiDdfKvb8RWDdenQCMBXxgBnr6d1fLpEtb2rtnymk8N
         rPpFjbRN9sEJTcWKhsplARczAfsTV2UwMaLQXKXLVw7wPcsx/HKp/q3r3I6EYhnYnyeZ
         Q38hwaTuySsFKXvbtweAjNzDDz5xesx73E2qX9bBUfsY8z4GLdRWTKE31q9prw5lXGf6
         cTnA==
X-Gm-Message-State: AO0yUKXnyfhDLre1SMaCAzi7jEuGDGHFGaS6ntVnWwiaJhWZFBWkb5Yq
        i7XqnOBotnpewr0UdjKFZ7uHLo+10/MrWt6GHdbUY0zM5KgE
X-Google-Smtp-Source: AK7set/m7Nrs0ZW/eHVkON3NVLW5iUYbr4ZQFiO6ngLZ8Xp7lt/80ikJrRSnhsbwFC+bnTA5uylgw66zyVDl0jQZ4WBAWoTrwx09
MIME-Version: 1.0
X-Received: by 2002:a02:9085:0:b0:3ae:ea73:3a2a with SMTP id
 x5-20020a029085000000b003aeea733a2amr60103jaf.94.1674961420431; Sat, 28 Jan
 2023 19:03:40 -0800 (PST)
Date:   Sat, 28 Jan 2023 19:03:40 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a391b05f35e5892@google.com>
Subject: [syzbot] UBSAN: shift-out-of-bounds in fbcon_set_font
From:   syzbot <syzbot+ac877d1de3aa7263e7f4@syzkaller.appspotmail.com>
To:     daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org,
        geert+renesas@glider.be, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, sam@ravnborg.org,
        syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    691781f561e9 Add linux-next specific files for 20230123
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=148d1815480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=804cddf7ddbc6c64
dashboard link: https://syzkaller.appspot.com/bug?extid=ac877d1de3aa7263e7f4
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b92cb9480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=169917fe480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/95b9320565c9/disk-691781f5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c5f3482fee79/vmlinux-691781f5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/63516279b1a1/bzImage-691781f5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac877d1de3aa7263e7f4@syzkaller.appspotmail.com

================================================================================
UBSAN: shift-out-of-bounds in drivers/video/fbdev/core/fbcon.c:2489:33
shift exponent 38 is too large for 32-bit type 'int'
CPU: 0 PID: 5087 Comm: syz-executor580 Not tainted 6.2.0-rc5-next-20230123-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/12/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 ubsan_epilogue+0xa/0x31 lib/ubsan.c:151
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x187 lib/ubsan.c:321
 fbcon_set_font.cold+0x19/0x3c drivers/video/fbdev/core/fbcon.c:2489
 con_font_set drivers/tty/vt/vt.c:4624 [inline]
 con_font_op+0xb52/0xf10 drivers/tty/vt/vt.c:4671
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x620/0x2df0 drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0x762/0x1670 drivers/tty/tty_io.c:2777
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fadea3c92c9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffeb231fd88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fadea3c92c9
RDX: 0000000020000040 RSI: 0000000000004b72 RDI: 0000000000000003
RBP: 00007fadea38d0b0 R08: 000000000000000d R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fadea38d140
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
