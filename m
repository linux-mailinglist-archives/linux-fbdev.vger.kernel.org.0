Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0ED218C45B
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Mar 2020 01:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgCTAsD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 Mar 2020 20:48:03 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:54063 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgCTAsD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 Mar 2020 20:48:03 -0400
Received: by mail-il1-f197.google.com with SMTP id z19so3604417ils.20
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Mar 2020 17:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=KQIeV41BqSA2HWOsTXHaruLvJbTFku9df88EiZxeP2U=;
        b=OCK8z/TeuZvFoWfNV9sLaFjSXiRh78wnempLRhJMgBTOncNGoZPkLrDVYyMd22/rZu
         c4sudMCEWckdYCf9fBexO8iCOd0pODlTD0kvSd+7OsgfssfcSu7mCQgtqOhEHO6yPVS8
         a+wZ9y3dUqVgYgy8k+KD7HWSsCawuYp4bPgxdBfNSI5LIXuiYVonisHYzJ06IoDPuWL1
         GK5N37HK5ch24fdvtT2uo6YB2PtmQTCH4VDz1W5a1GTxdGRA8Nt9GzxT4ynjRuapwb5b
         m7V2RmwvSMyUCYK2puDkpeJGo/TdOwavHPwHo4ZoEUptK8szqB0Ykx2I7JS4RjB8wYkr
         e+SA==
X-Gm-Message-State: ANhLgQ0P9tnCwj6cErATCI3lgBnhLdrUyj8rLNPbdbx8OARO6+NPyUUZ
        03qTjdSRQpTcTzz2Gaw1vd+UVjaPcsxTF0nWw7Byd7QXESja
X-Google-Smtp-Source: ADFU+vtOqc6u9s+pMnAy4wggYF/r7nVtJrIj9IeIrcmEVypYawzs8Dh9C2t0kEbG2HqkEDMYGd/BujA1AdzgBk4Sx4zpBokunsE7
MIME-Version: 1.0
X-Received: by 2002:a6b:5406:: with SMTP id i6mr5275616iob.188.1584665282593;
 Thu, 19 Mar 2020 17:48:02 -0700 (PDT)
Date:   Thu, 19 Mar 2020 17:48:02 -0700
In-Reply-To: <00000000000074219d05a139e082@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000041ca9305a13ea3e0@google.com>
Subject: Re: general protection fault in sctp_ulpevent_nofity_peer_addr_change
From:   syzbot <syzbot+3950016bd95c2ca0377b@syzkaller.appspotmail.com>
To:     a@unstable.cc, b.a.t.m.a.n@lists.open-mesh.org,
        b.zolnierkie@samsung.com, davem@davemloft.net,
        dri-devel@lists.freedesktop.org, kuba@kernel.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sctp@vger.kernel.org, lkundrak@v3.sk,
        marcelo.leitner@gmail.com, mareklindner@neomailbox.ch,
        netdev@vger.kernel.org, nhorman@tuxdriver.com,
        sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com,
        vyasevich@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot has bisected this bug to:

commit da2648390ce3d409218b6bbbf2386d8ddeec2265
Author: Lubomir Rintel <lkundrak@v3.sk>
Date:   Thu Dec 20 18:13:09 2018 +0000

    pxa168fb: trivial typo fix

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1361e139e00000
start commit:   5076190d mm: slub: be more careful about the double cmpxch..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=10e1e139e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1761e139e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f894bd92023de02
dashboard link: https://syzkaller.appspot.com/bug?extid=3950016bd95c2ca0377b
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1162bbe3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c93b45e00000

Reported-by: syzbot+3950016bd95c2ca0377b@syzkaller.appspotmail.com
Fixes: da2648390ce3 ("pxa168fb: trivial typo fix")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
