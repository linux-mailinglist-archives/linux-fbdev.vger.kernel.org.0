Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7EFA115577
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Dec 2019 17:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLFQeC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Dec 2019 11:34:02 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:40026 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfLFQeB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Dec 2019 11:34:01 -0500
Received: by mail-io1-f71.google.com with SMTP id d1so5168113ioe.7
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Dec 2019 08:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=eN4yK+b1Bwvylv7Nm0VpeOFgnJkXHsh0eveEUiwrQH8=;
        b=XMuOzMwIVwLk+zp7ZHzCmo94NQZIIt93JoxoLvll+22BxM264fNnDjgvZvYvYtETqb
         n6f7k6Y20KkG1gAaRJXh/5nAXji/2SbObAGg0dbYkuVqnNR5XSSMSeS40BexlkBYVa3O
         gz1JDVdYoRJdYMQcAMx+uXOHs/+fJ94VNVuy9uNJPLumGx2SSdDgd1Owz05U3t9GN+Z0
         9o8Lcdh3yYD6qx6Oda9N0JtVJmewTBeZrP1LrXTHo465aNfpT6bnnBULG6IKS0w/Daaz
         Gk+cSuCAmqv1M+XO+UIlK4rMeLeCGiiSMtQZ/mMseZXIM4XZ2HoIMmNICb/zthDKOhF1
         G+gw==
X-Gm-Message-State: APjAAAUFLTPwxDs/waOFd6YRM5E7nH2qWiPg9mvnbDfdT1e19Isx9zo0
        3KPfINLpOGQ5BuByDAJP+GlVvwJLCtTPfDCLtkoPAmsRfPA+
X-Google-Smtp-Source: APXvYqzZYpNyvisihbt8EN3KnLhQ+QrZm3JeQEpbdA8h9nBmjE1AdDXOmVmenOawWmDOfOfWECCiqsoRsetDdfRKflEyZvm4mUC+
MIME-Version: 1.0
X-Received: by 2002:a92:4891:: with SMTP id j17mr14417440ilg.33.1575650041118;
 Fri, 06 Dec 2019 08:34:01 -0800 (PST)
Date:   Fri, 06 Dec 2019 08:34:01 -0800
In-Reply-To: <000000000000e1d639059908223b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fdd04105990b9c93@google.com>
Subject: Re: KASAN: use-after-free Read in soft_cursor
From:   syzbot <syzbot+cf43fb300aa142fb024b@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1512d1bce00000
start commit:   b0d4beaa Merge branch 'next.autofs' of git://git.kernel.or..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1712d1bce00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1312d1bce00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f07a23020fd7d21a
dashboard link: https://syzkaller.appspot.com/bug?extid=cf43fb300aa142fb024b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1745a90ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1361042ae00000

Reported-by: syzbot+cf43fb300aa142fb024b@syzkaller.appspotmail.com
Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
