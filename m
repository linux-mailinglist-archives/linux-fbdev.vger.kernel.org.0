Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 927B2115B80
	for <lists+linux-fbdev@lfdr.de>; Sat,  7 Dec 2019 08:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfLGHXI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 7 Dec 2019 02:23:08 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42815 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfLGHXH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 7 Dec 2019 02:23:07 -0500
Received: by mail-qt1-f196.google.com with SMTP id j5so9606145qtq.9
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Dec 2019 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WKRU5pSG2PRY1i50C6ckRyYjlPu0mkUgyvtTtKKNwF4=;
        b=TSgkeFFjw9IXx/DReyCPlEeIMmu0k9IyhNUDT03zvwWvvnOt4VzeW6knY8j/T4K5zc
         JMzRL2mIa03FbkvOn3Wq+DnFMm1HZiqVi23oZL63A1ZKFBqOZ942cxk6h3ZDSTnP+6mb
         tJx2BEfefiTerW4vzKLvOLGzyU6N27A0nDi0mFMcMM5BJwmnGDf7DdbI1yg1NozpJxft
         Ven48GSQ08+cKs07SJsnB7OVl7W6S0QJhBBgsgZKtiqKZfNnd6W9v0Rf/3Y9s/dEDHRC
         khXrqNPdvJnIgOAV8r8/cTFE+mCQ/KGb4nkhTKqU3htoekizxTxrYC5GouMtlWrdWiPg
         5YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WKRU5pSG2PRY1i50C6ckRyYjlPu0mkUgyvtTtKKNwF4=;
        b=osI1WZmo7/i8QQQajT5oyYF7xebtHOVQKIBILW3W/MfDZGkVRBEBvDkhVqPO+4pF/b
         1YPZMyLfAwQBpIxHA1/tb0Pnu5oUSP/a3yUmI2EciYwd/Xrhk7zf7nKuh/giUE2FAAMi
         hnN9UF187vN/QffHAtO/3Az8sfIl0iwd9hs2qW7cCm5vWwsOM+bBm91fL8ni2wEkyp9g
         Pd8ngIP8MNopjj9tRUT3g8Iyucdcsa+kuFccIm8vzsufCsVLgqG5nvVHtMjY7YyDFgdU
         r7hTr7bEIwAoQyX96IyRz7c2BwOchPcCFb+fRZZYULEQnk0IysnejnMUwzBniSYt8ERj
         kkYg==
X-Gm-Message-State: APjAAAXRft3G20effzP/S7qpMUK6rD6j/66FpCVsVhvFya2kwvAntbzW
        4hXJkO06cKCb/QnZ7Cg23WyrihnA1o2W9XSP3EmwRQ==
X-Google-Smtp-Source: APXvYqzADYcdsyMtAGfTGhS9VBKWgLIVQ8HeiaaMSQTOXcfnjmm1OYt8/HHEC3dw5lwpNOgSzkdKcfJ7rQeL88sn7Ro=
X-Received: by 2002:ac8:3905:: with SMTP id s5mr16470924qtb.158.1575703386571;
 Fri, 06 Dec 2019 23:23:06 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e1d639059908223b@google.com> <000000000000fdd04105990b9c93@google.com>
In-Reply-To: <000000000000fdd04105990b9c93@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 7 Dec 2019 08:22:55 +0100
Message-ID: <CACT4Y+ahbULUDLhmNxqEffU1BbAiMuZ7Da6DurdX4XwUftROmg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in soft_cursor
To:     syzbot <syzbot+cf43fb300aa142fb024b@syzkaller.appspotmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        coreteam@netfilter.org, David Miller <davem@davemloft.net>,
        DRI <dri-devel@lists.freedesktop.org>, gwshan@linux.vnet.ibm.com,
        Patrick McHardy <kaber@trash.net>,
        Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        netdev <netdev@vger.kernel.org>,
        NetFilter <netfilter-devel@vger.kernel.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Russell Currey <ruscur@russell.cc>, stewart@linux.vnet.ibm.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Dec 6, 2019 at 5:34 PM syzbot
<syzbot+cf43fb300aa142fb024b@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit 2de50e9674fc4ca3c6174b04477f69eb26b4ee31
> Author: Russell Currey <ruscur@russell.cc>
> Date:   Mon Feb 8 04:08:20 2016 +0000
>
>      powerpc/powernv: Remove support for p5ioc2

Another weird one, I must be missing something obvious about how git
bisect works... I keep adding these to:
https://github.com/google/syzkaller/issues/1527

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1512d1bce00000
> start commit:   b0d4beaa Merge branch 'next.autofs' of git://git.kernel.or..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=1712d1bce00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1312d1bce00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f07a23020fd7d21a
> dashboard link: https://syzkaller.appspot.com/bug?extid=cf43fb300aa142fb024b
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1745a90ee00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1361042ae00000
>
> Reported-by: syzbot+cf43fb300aa142fb024b@syzkaller.appspotmail.com
> Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000fdd04105990b9c93%40google.com.
