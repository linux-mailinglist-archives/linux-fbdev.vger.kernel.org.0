Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC8956D732
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Jul 2022 09:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiGKH6Z (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Jul 2022 03:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiGKH6Y (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Jul 2022 03:58:24 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0ED1CB2A
        for <linux-fbdev@vger.kernel.org>; Mon, 11 Jul 2022 00:58:21 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id z9-20020a921a49000000b002dc74e8b144so1739189ill.6
        for <linux-fbdev@vger.kernel.org>; Mon, 11 Jul 2022 00:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=nuHzyqLwrYS9F/FU+kIVaEf3pJI2402Zo0uvkKPVm5s=;
        b=UaSnCPpT/V3PzyhBeGMDXZLWW23uM+p9h5RVxkIOB4uTz1+1eJcRnTj+Np5BjFPGFz
         G9O6RsZPk1NjyIbt7hNGU8QQbLicYChJXjEbQ4S6PvZgFlSH+5UCo63xoY/BpZhEYZfc
         6U4xYx3AL3TO+sWC6g54F+T725ZzZJBM58I51+FZDIMc/ffteGbpLeInbTJKgfnt48g+
         WlfuVznRA7SnnecvIhEpSiLyWOOPY8r9Ou4cyffUJg/WjY33nfpJU42W7m5xBM0SQOeh
         2BAZYSavE925GdIRGFOBw1t01WujCyTDzK2OpRpsCpReYzmcpVRKqafRHOf1vHvEeWgt
         GyuQ==
X-Gm-Message-State: AJIora8X8g6kiq/5ip2ixlWOZf2v9Nwuxx3pmmDzF/nxdCj2fOAfiHGE
        bzCX0JqNVCz4SF4UdN25L4mVFHUlR/46fb1U/zX1zMgt6w7X
X-Google-Smtp-Source: AGRyM1s7CkxoTRl5Wp9nmfqTaY4zp6kzTPL3lHEK3TTtDdNBrzYqrhU/hN3ro/yX21y1laE+hcJKuNUpq4kkvXXgW9gvYETNiJsB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1522:b0:2dc:457d:4094 with SMTP id
 i2-20020a056e02152200b002dc457d4094mr9164954ilu.198.1657526301166; Mon, 11
 Jul 2022 00:58:21 -0700 (PDT)
Date:   Mon, 11 Jul 2022 00:58:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000063154a05e382eae9@google.com>
Subject: [syzbot] BUG: unable to handle kernel paging request in
 bitfill_aligned (3)
From:   syzbot <syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com>
To:     daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org,
        javierm@redhat.com, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, sam@ravnborg.org,
        syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e35e5b6f695d Merge tag 'xsa-5.19-tag' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17f49bbc080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3bf7765b1ebd721
dashboard link: https://syzkaller.appspot.com/bug?extid=a168dbeaaa7778273c1b
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffffc90004331000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 11c00067 P4D 11c00067 PUD 11dc5067 PMD 1cffd067 PTE 0
Oops: 0002 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 11483 Comm: syz-executor.4 Not tainted 5.19.0-rc5-syzkaller-00056-ge35e5b6f695d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/29/2022
RIP: 0010:memset64 arch/x86/include/asm/string_64.h:49 [inline]
RIP: 0010:memset_l include/linux/string.h:128 [inline]
RIP: 0010:bitfill_aligned+0x1ad/0x270 drivers/video/fbdev/core/sysfillrect.c:53
Code: 08 49 31 ef eb 66 e8 32 9c 05 fd 45 89 e6 4c 8b 64 24 10 44 89 f0 31 d2 f7 f3 89 c3 48 8b 6c 24 08 48 89 e8 4c 89 e7 48 89 d9 <f3> 48 ab 31 ff 44 89 ee e8 26 a0 05 fd 4d 85 ed 74 5f 4d 8d 24 dc
RSP: 0018:ffffc9000ae3f7e8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000001800 RCX: 0000000000001200
RDX: 0000000000000000 RSI: 0000000000000bca RDI: ffffc90004331000
RBP: 0000000000000000 R08: ffffffff8481e07e R09: 0000000000000040
R10: 0000000000000002 R11: ffff88803938d880 R12: ffffc9000432e000
R13: 0000000000000000 R14: 0000000000060000 R15: ffffffffffffffff
FS:  00007f8c16811700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90004331000 CR3: 000000006dd66000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 sys_fillrect+0x5ce/0x7f0 drivers/video/fbdev/core/sysfillrect.c:281
 drm_fb_helper_sys_fillrect drivers/gpu/drm/drm_fb_helper.c:795 [inline]
 drm_fbdev_fb_fillrect+0x163/0x300 drivers/gpu/drm/drm_fb_helper.c:2310
 bit_clear_margins+0x3f1/0x6e0 drivers/video/fbdev/core/bitblit.c:232
 fbcon_clear_margins drivers/video/fbdev/core/fbcon.c:1304 [inline]
 fbcon_do_set_font+0xd7c/0x1330 drivers/video/fbdev/core/fbcon.c:2434
 fbcon_set_font+0xa9c/0xd80 drivers/video/fbdev/core/fbcon.c:2517
 con_font_set drivers/tty/vt/vt.c:4666 [inline]
 con_font_op+0xbe8/0x1070 drivers/tty/vt/vt.c:4710
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x172e/0x1d00 drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0x874/0xc60 drivers/tty/tty_io.c:2778
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
RIP: 0033:0x7f8c15689109
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8c16811168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8c1579bf60 RCX: 00007f8c15689109
RDX: 0000000020000040 RSI: 0000000000004b72 RDI: 0000000000000003
RBP: 00007f8c156e305d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffdfe77e39f R14: 00007f8c16811300 R15: 0000000000022000
 </TASK>
Modules linked in:
CR2: ffffc90004331000
---[ end trace 0000000000000000 ]---
RIP: 0010:memset64 arch/x86/include/asm/string_64.h:49 [inline]
RIP: 0010:memset_l include/linux/string.h:128 [inline]
RIP: 0010:bitfill_aligned+0x1ad/0x270 drivers/video/fbdev/core/sysfillrect.c:53
Code: 08 49 31 ef eb 66 e8 32 9c 05 fd 45 89 e6 4c 8b 64 24 10 44 89 f0 31 d2 f7 f3 89 c3 48 8b 6c 24 08 48 89 e8 4c 89 e7 48 89 d9 <f3> 48 ab 31 ff 44 89 ee e8 26 a0 05 fd 4d 85 ed 74 5f 4d 8d 24 dc
RSP: 0018:ffffc9000ae3f7e8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000001800 RCX: 0000000000001200
RDX: 0000000000000000 RSI: 0000000000000bca RDI: ffffc90004331000
RBP: 0000000000000000 R08: ffffffff8481e07e R09: 0000000000000040
R10: 0000000000000002 R11: ffff88803938d880 R12: ffffc9000432e000
R13: 0000000000000000 R14: 0000000000060000 R15: ffffffffffffffff
FS:  00007f8c16811700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90004331000 CR3: 000000006dd66000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	08 49 31             	or     %cl,0x31(%rcx)
   3:	ef                   	out    %eax,(%dx)
   4:	eb 66                	jmp    0x6c
   6:	e8 32 9c 05 fd       	callq  0xfd059c3d
   b:	45 89 e6             	mov    %r12d,%r14d
   e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  13:	44 89 f0             	mov    %r14d,%eax
  16:	31 d2                	xor    %edx,%edx
  18:	f7 f3                	div    %ebx
  1a:	89 c3                	mov    %eax,%ebx
  1c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  21:	48 89 e8             	mov    %rbp,%rax
  24:	4c 89 e7             	mov    %r12,%rdi
  27:	48 89 d9             	mov    %rbx,%rcx
* 2a:	f3 48 ab             	rep stos %rax,%es:(%rdi) <-- trapping instruction
  2d:	31 ff                	xor    %edi,%edi
  2f:	44 89 ee             	mov    %r13d,%esi
  32:	e8 26 a0 05 fd       	callq  0xfd05a05d
  37:	4d 85 ed             	test   %r13,%r13
  3a:	74 5f                	je     0x9b
  3c:	4d 8d 24 dc          	lea    (%r12,%rbx,8),%r12


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
