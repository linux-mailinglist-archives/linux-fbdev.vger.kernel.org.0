Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98689112991
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Dec 2019 11:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfLDKya (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 4 Dec 2019 05:54:30 -0500
Received: from mail-qk1-f178.google.com ([209.85.222.178]:46992 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbfLDKya (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 4 Dec 2019 05:54:30 -0500
Received: by mail-qk1-f178.google.com with SMTP id f5so6601434qkm.13
        for <linux-fbdev@vger.kernel.org>; Wed, 04 Dec 2019 02:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=UXlbnLzz9HES2vhv5tD/Nn8F6D/cgg2//ybv0zzSBu4=;
        b=PY5OgnzZ4Yu71ua3ifLEJX+TnVmFVZPPd+rDe3LYuHdkA2Q89ea7a/ydRQVhgmK3UO
         1oKJRNNK79gNEkGXJPPZeaT5S57B+d5qrQl2+vGw1lLV3E5qRzKYHBUV9FbdK8TSrgai
         VpKo3qDvmkg9AiAPPUjZ/gBLdtDTpUgT7kKXq33EjeLxxa+G71JQiQTq+oR94FbFHObp
         OYNyNauSEcBBfb2Di8jAdibSsH+rFtV2rMhq+8rtvoJKsiVvgtBgzH28zAxImU19H5wX
         6bkUpFHvK3wmYa3x23xHHzitD0A5TLTjmkKTuK/fA/IaZT6BZ3MBJ3kobNKuhxiYNgkX
         SgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=UXlbnLzz9HES2vhv5tD/Nn8F6D/cgg2//ybv0zzSBu4=;
        b=N2morbVJWVxFmUrJepcK2OSeAYIDj5gt3SoSX6cmdtQ3zpjOFYh15p8kducUrfz9U8
         6JHYB6IO2De7oZIap8XSuESc5UnPcJNBRaiF+AwvqQlASOtQRgpT9S5u7mFHwV58ttB1
         orIwSTBqQXWb/2ANagf17RRJBHpf2LdGl5ED6QtbYD59Ou0Gw9L9oSNpGY0hG3iTrxU0
         t0WliSCFNFgec5kCNxHnVHeTkZFk+mOMqi3nXROy8rr/KtYNzAAf1VvoGpXYY8i6dAFd
         r5c+XClYwjtltOdoEBQ+2lDq9hnOnC0lnMfciA7GHSmWP36bQ6ERu6UIsoYHY3DKEU6l
         H5LA==
X-Gm-Message-State: APjAAAWGlVylBKH0KUsbBMd7FmNAVccWnxpwDEJ7361eWFI/8Uc2Pg/k
        DfHT4JfhThC0BMKb3/xQdM91WebJHNLppTeEOIdbig==
X-Google-Smtp-Source: APXvYqzI5+IudYP6psb24pDdmt6InHaR+nukd19DyGQKbpxqUP9wI4CfgPkz/74ZbB0k0OAg/00CkKehF8XeADp09tk=
X-Received: by 2002:a37:e312:: with SMTP id y18mr2229324qki.250.1575456868384;
 Wed, 04 Dec 2019 02:54:28 -0800 (PST)
MIME-Version: 1.0
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 4 Dec 2019 11:54:17 +0100
Message-ID: <CACT4Y+YjudGzx44Jw1UMgEPB4kfzp3jo-TcCVR62U+N+2C6tjA@mail.gmail.com>
Subject: cirrusfb: divide errors in cirrusfb_check_var/cirrusfb_check_pixclock/cirrusfb_set_par_foo
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

syzkaller has found 3 of divide errors in the cirrusfb driver.
Kernel is on c5db92909bedd Add linux-next specific files for 20191202.

divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 8133 Comm: syz-executor.5 Not tainted 5.4.0-next-20191202+ #13
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:cirrusfb_set_par_foo+0x1d17/0x64b0 drivers/video/fbdev/cirrusfb.c:836
Call Trace:
 cirrusfb_set_par+0x15/0x20 drivers/video/fbdev/cirrusfb.c:1272
 fb_set_var+0x518/0xdd0 drivers/video/fbdev/core/fbmem.c:1024
 do_fb_ioctl+0x50c/0x830 drivers/video/fbdev/core/fbmem.c:1104
 fb_ioctl+0xe6/0x130 drivers/video/fbdev/core/fbmem.c:1180
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:545 [inline]
 do_vfs_ioctl+0x1df/0x1420 fs/ioctl.c:732
 ksys_ioctl+0xa9/0xd0 fs/ioctl.c:749

divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 3 PID: 7639 Comm: syz-executor.0 Not tainted 5.4.0-next-20191202+ #12
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:cirrusfb_check_pixclock drivers/video/fbdev/cirrusfb.c:482 [inline]
RIP: 0010:cirrusfb_check_var+0x6e8/0x1150 drivers/video/fbdev/cirrusfb.c:623
Call Trace:
 fb_set_var+0x236/0xdd0 drivers/video/fbdev/core/fbmem.c:1005
 do_fb_ioctl+0x50c/0x830 drivers/video/fbdev/core/fbmem.c:1104
 fb_ioctl+0xe6/0x130 drivers/video/fbdev/core/fbmem.c:1180
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:545 [inline]
 do_vfs_ioctl+0x1df/0x1420 fs/ioctl.c:732
 ksys_ioctl+0xa9/0xd0 fs/ioctl.c:749

divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 12555 Comm: syz-executor.5 Not tainted 5.4.0-next-20191202+ #15
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:cirrusfb_check_var.cold.16+0x12e/0x1e7
drivers/video/fbdev/cirrusfb.c:581
Call Trace:
 fb_set_var+0x236/0xdd0 drivers/video/fbdev/core/fbmem.c:1005
 do_fb_ioctl+0x50c/0x830 drivers/video/fbdev/core/fbmem.c:1104
 fb_ioctl+0xe6/0x130 drivers/video/fbdev/core/fbmem.c:1180
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:545 [inline]
 do_vfs_ioctl+0x1df/0x1420 fs/ioctl.c:732
 ksys_ioctl+0xa9/0xd0 fs/ioctl.c:749
