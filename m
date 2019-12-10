Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E961188FE
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Dec 2019 13:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfLJM7C (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 10 Dec 2019 07:59:02 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:41833 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfLJM7B (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 10 Dec 2019 07:59:01 -0500
Received: by mail-io1-f70.google.com with SMTP id m13so4780689iol.8
        for <linux-fbdev@vger.kernel.org>; Tue, 10 Dec 2019 04:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=K7gPl1FphJWhh8zq+KZGN6d9O0Mc9hz+Z8xkj8vZdlQ=;
        b=oW3X4TlUHZXXsdhHFcSKrzrjdAaZLWl5bfGHuHvqIBYRss1uOcvBnxBba31/AbR4ae
         MPygDEISBkB9Gx7TOg92awWlxTs6NjIRtRF5M9LVSUiPqmk268qtavoecnds3d31Vrik
         ZiFqGOYvFapNWXo+EE6SUAGnvFKU2gPcg8ls9w2+k2afeOW2LAgGIyZwAvTcvT9qcM81
         tbuSihQv08c7lP05gF6yJwt8cWBZbsG3cm0iqWOXR/5E3d3EpZAb7uNYq+HjA/0Rvj4a
         4gyLLFxd2yY2kHqyLrq4wDr19m2eS/QcKURu0QY3ZiPDSy974S7y58oKKxFlmbsTBeHW
         JY/g==
X-Gm-Message-State: APjAAAVb3n0hsEQ+h8DAKk6DPf7h2pxzEEredEJVFvtq7wWk6QgLV7ui
        d22lGTvM6wC61L5f+fvRTjZ5yCldzsOtdLr5TEyNdC2zxmTz
X-Google-Smtp-Source: APXvYqwDCe80r9YbW2QQnA0KjjLSvil/nEblKeil0eEsHFedCe59r/gm8ekpcNZa3NtXqCgGqqZ6wrMr2kggORAQDm9RLlN60DpJ
MIME-Version: 1.0
X-Received: by 2002:a92:5e4b:: with SMTP id s72mr32788228ilb.211.1575982741163;
 Tue, 10 Dec 2019 04:59:01 -0800 (PST)
Date:   Tue, 10 Dec 2019 04:59:01 -0800
In-Reply-To: <0000000000007f075c0598f7aa38@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007598ae0599591335@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bit_putcs
From:   syzbot <syzbot+998dec6452146bd7a90c@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, coreteam@netfilter.org,
        davem@davemloft.net, dri-devel@lists.freedesktop.org,
        gwshan@linux.vnet.ibm.com, kaber@trash.net,
        kadlec@blackhole.kfki.hu, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, ruscur@russell.cc, stewart@linux.vnet.ibm.com,
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16af042ae00000
start commit:   9455d25f Merge tag 'ntb-5.5' of git://github.com/jonmason/..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=15af042ae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=11af042ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a3b8f5088d4043a
dashboard link: https://syzkaller.appspot.com/bug?extid=998dec6452146bd7a90c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12fa5c2ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e327f2e00000

Reported-by: syzbot+998dec6452146bd7a90c@syzkaller.appspotmail.com
Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
