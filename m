Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E11F31170F7
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Dec 2019 16:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLIP6D (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 9 Dec 2019 10:58:03 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:34037 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLIP6C (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 9 Dec 2019 10:58:02 -0500
Received: by mail-io1-f69.google.com with SMTP id n26so6007808ioj.1
        for <linux-fbdev@vger.kernel.org>; Mon, 09 Dec 2019 07:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=haSirlvjghAy8O+UGZZ1CIdjmlMMpGQNnbPGRDREiuo=;
        b=b4a4e7GsMWcSJXS2vwpzGfDdVZzHByvrod6ka9jfTCCk6iQnVLcJqcZeBhrb7xfUCz
         QoT1g05lsEfXlaKIKO8xJjOdNTB240Wg53LIA9Miz1jXp3hxSilgjPeezzenyj2kh2nY
         ADkjz4Y6uRWI4OQNKy50qlSqQAVe4u+aEDX1X95IUTPbRD+0bU/8V6FhQh3q3r53Xpas
         yJgJ4QRAOf7lHxFw81Iy2sgfb+Rz2r2YFWU9cFVJj5Kj4MFoo6jZ3lAwaQnijsQiF/pu
         BER4meguBH/AJCS3SZLG9uRuxUnsND2uvXTPg87ZPlc0x27HxTPoUIlDPP4Rl29gl6Sp
         O8nA==
X-Gm-Message-State: APjAAAUAmWfSzwgW/MXuAmVb2iDChOXMOFkOrEOhBYMHHvzoU5OnPd+n
        R34SXSzlwTC1Jd73RAHjKkZdWt4JU/2EcXP0B1246zvXWrla
X-Google-Smtp-Source: APXvYqy7SHoywomGmpRRGQOfRHAlD50ocSW6nQ6ugt5VWZKCvCo8SfnyYovVgE3ZOkflrPwPuNULbNVTBJdi5Engji2jZ7ttDdZV
MIME-Version: 1.0
X-Received: by 2002:a92:45d2:: with SMTP id z79mr28552816ilj.76.1575907081960;
 Mon, 09 Dec 2019 07:58:01 -0800 (PST)
Date:   Mon, 09 Dec 2019 07:58:01 -0800
In-Reply-To: <00000000000000ffab05992442a7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d1c7150599477511@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in fb_pad_aligned_buffer
From:   syzbot <syzbot+0568d05e486eee0a1ba2@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, coreteam@netfilter.org,
        daniel.vetter@ffwll.ch, davem@davemloft.net,
        dri-devel@lists.freedesktop.org, gwshan@linux.vnet.ibm.com,
        kaber@trash.net, kadlec@blackhole.kfki.hu, kraxel@redhat.com,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mpe@ellerman.id.au,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, peda@axentia.se, ruscur@russell.cc,
        sam@ravnborg.org, stewart@linux.vnet.ibm.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot has bisected this bug to:

commit 2de50e9674fc4ca3c6174b04477f69eb26b4ee31
Author: Russell Currey <ruscur@russell.cc>
Date:   Mon Feb 8 04:08:20 2016 +0000

     powerpc/powernv: Remove support for p5ioc2

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13ea0aeae00000
start commit:   9455d25f Merge tag 'ntb-5.5' of git://github.com/jonmason/..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=101a0aeae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=17ea0aeae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a3b8f5088d4043a
dashboard link: https://syzkaller.appspot.com/bug?extid=0568d05e486eee0a1ba2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15ddeca6e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16df9e41e00000

Reported-by: syzbot+0568d05e486eee0a1ba2@syzkaller.appspotmail.com
Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
