Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B15D129439
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Dec 2019 11:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfLWKbD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 23 Dec 2019 05:31:03 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:47208 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfLWKbD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 23 Dec 2019 05:31:03 -0500
Received: by mail-il1-f198.google.com with SMTP id x69so13960973ill.14
        for <linux-fbdev@vger.kernel.org>; Mon, 23 Dec 2019 02:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=dqTElktPjJ2Vq8ttJgKuJA9Bl554Cdxgp9MbKD3t3zo=;
        b=c77bcMh9/tURHtGlzasr8whOLRPziEVQFnBr92/HRGjxKanH8IPEryJktoNV9m+ClB
         7HoMipLYdjhAq/XgNADcd/C2Qn6lOONv++Gmp382CSDeTJsvfZ6RKy06N1QFLc+OC9UM
         nMxgeRKkYpE0LPRjQYIFQ3lKlHIlIuy1kBdjtw2/HK5afh5Ss+F70HjzS7ewtYjQ/qmn
         9eLHOJi4sbnxuFXjVpJA1cfMLlsbIWEvk64EKAJNJimD15ssPRedUT8QmiP3E37zvOzA
         YF4W702lYoySaiQLLG2Sd+ym+cqpYazhOF5JtNFtgul6l/7wJA/ndEC/CWvS0+Yf/xMk
         P6oQ==
X-Gm-Message-State: APjAAAXuSm5Awv9AKMLcRtVesT/QX7Is8WI3kQzfX3fZsAGoK2Nle7mP
        MhSogwzKEg0xecWAcjgcF6qgdx1OsBnlxJ+/l+z2UQ0md0Kb
X-Google-Smtp-Source: APXvYqxEBMubw04vHq957mYKngz32+OjAQ3cw+9AYwNkakf/69ewcoi2c7rjqs7UBeIlpsKYjtAm+5xfxmOXI3E52HSsX0TrkLqS
MIME-Version: 1.0
X-Received: by 2002:a02:7086:: with SMTP id f128mr22175027jac.12.1577097061494;
 Mon, 23 Dec 2019 02:31:01 -0800 (PST)
Date:   Mon, 23 Dec 2019 02:31:01 -0800
In-Reply-To: <00000000000082b80f059a56da1f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002074ef059a5c86e2@google.com>
Subject: Re: INFO: task hung in fb_release
From:   syzbot <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>
To:     Rex.Zhu@amd.com, airlied@linux.ie, alexander.deucher@amd.com,
        amd-gfx@lists.freedesktop.org, b.zolnierkie@samsung.com,
        christian.koenig@amd.com, daniel.vetter@ffwll.ch,
        david1.zhou@amd.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, rex.zhu@amd.com,
        sam@ravnborg.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot has bisected this bug to:

commit e3933f26b657c341055443103bad331f4537b113
Author: Rex Zhu <Rex.Zhu@amd.com>
Date:   Tue Jan 16 10:35:15 2018 +0000

     drm/amd/pp: Add edit/commit/show OD clock/voltage support in sysfs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b5a799e00000
start commit:   c6017471 Merge tag 'xfs-5.5-fixes-2' of git://git.kernel.o..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11b5a799e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16b5a799e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f6119e2e3675a73
dashboard link: https://syzkaller.appspot.com/bug?extid=d130c4a0890561cfac5b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b1925e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b9623ee00000

Reported-by: syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com
Fixes: e3933f26b657 ("drm/amd/pp: Add edit/commit/show OD clock/voltage  
support in sysfs")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
