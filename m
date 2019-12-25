Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956E612A869
	for <lists+linux-fbdev@lfdr.de>; Wed, 25 Dec 2019 16:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfLYP0B (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 25 Dec 2019 10:26:01 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:45262 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfLYP0B (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 25 Dec 2019 10:26:01 -0500
Received: by mail-il1-f198.google.com with SMTP id w6so18711183ill.12
        for <linux-fbdev@vger.kernel.org>; Wed, 25 Dec 2019 07:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=A7S/GOq+N1/RvV3BsEeeY8VJ+E23sie3htdgMTQ6zh8=;
        b=lppa+Y8m6ATl1dXAcUz6MlSpu9hbWRWfbnyQ1T++Vn+YSfTc76p+98scq+CcsvmOgm
         6JzDoFaOs4Es7idUTSAsB7fhdTkVLjwqsyxLlGexUSP33HrOil/01VWPYJd9Nj0xdxGM
         YoMpy2GwW3rDDzUqw8MvMlODFDNOGKdFBc34oxtC4k2NvGs6YbAtqE8RHHqwF8+BYGD1
         I/hLcNkHZ2x5DfURjBrsJWou1IkTKtchl5tiEx3UwgJFs2hcAcJ8U79I1iwfhiOCjpg6
         aB178rUfOx0PPqvLKBHZlFUowcmqlEh9UIN8O1CtbKG1Vdq7v83jweCY3nUYoKV63ASK
         EzeQ==
X-Gm-Message-State: APjAAAW7CKdf8fnpxFZLHOj77l/A1Zj8/y6hzsBYmNr5/R68llBTTY2c
        GzDv6JlZ48jha0hZL8pD4eDixGGHmyLxwaU7g9T3jkz8SxTR
X-Google-Smtp-Source: APXvYqxEW020KE83xrHw3Gxo/vfwdXNrRfv9mftoPAYZg1BkC/8zDOT3yGFgKCXd/lTwsoyQohVTwsOf+XKRQkf+Diz+b0SqoodX
MIME-Version: 1.0
X-Received: by 2002:a92:3996:: with SMTP id h22mr34246521ilf.129.1577287560911;
 Wed, 25 Dec 2019 07:26:00 -0800 (PST)
Date:   Wed, 25 Dec 2019 07:26:00 -0800
In-Reply-To: <0000000000001b2f4605991a4cc0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c6e365059a88e032@google.com>
Subject: Re: KASAN: use-after-free Read in fb_mode_is_equal
From:   syzbot <syzbot+f11cda116c57db68c227@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch,
        daniel.vetter@intel.com, dri-devel@lists.freedesktop.org,
        hdanton@sina.com, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mojha@codeaurora.org, sam@ravnborg.org,
        shile.zhang@linux.alibaba.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot has bisected this bug to:

commit 13ff178ccd6d3b8074c542a911300b79c4eec255
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue May 28 09:02:53 2019 +0000

     fbcon: Call fbcon_mode_deleted/new_modelist directly

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1737c63ee00000
start commit:   46cf053e Linux 5.5-rc3
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=14b7c63ee00000
console output: https://syzkaller.appspot.com/x/log.txt?x=10b7c63ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed9d672709340e35
dashboard link: https://syzkaller.appspot.com/bug?extid=f11cda116c57db68c227
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12bf72c6e00000

Reported-by: syzbot+f11cda116c57db68c227@syzkaller.appspotmail.com
Fixes: 13ff178ccd6d ("fbcon: Call fbcon_mode_deleted/new_modelist directly")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
