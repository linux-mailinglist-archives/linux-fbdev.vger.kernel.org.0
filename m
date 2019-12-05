Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62409114195
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Dec 2019 14:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLENiC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 Dec 2019 08:38:02 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:52284 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbfLENiB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 5 Dec 2019 08:38:01 -0500
Received: by mail-io1-f71.google.com with SMTP id e124so2364348iof.19
        for <linux-fbdev@vger.kernel.org>; Thu, 05 Dec 2019 05:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=BPtd1lCkh28DO7EwzqWFu86aIj+E+y3RBRqfbiycXgU=;
        b=AktlRhHWG/E2TkP684vKrKOtdDkFHctgpSBW8xqbaMQaMpn/GOmf41DpwOPsC+q1xv
         kDP4qLwpgk7bpGhHKM/6rBJj8mClvsh5fPLGw1JTa7FxiV8cxOMTjdWlMPu52jrcGB02
         62XUGdLICUEt4izxhOUqN8WIfTqq/utXoeOsmL+LtN3Aq5b4JtkA62FGK2293lJOUIxF
         Gkn7z5zlmUUt3FuSwiIlwgy60dnMTg0M0s35EKzKwY0rk0KM3/2CrDhdEqDjbLtf5MIn
         ksx4qfpeyyT4S82zH5fsbbY7KD7JPZURjXRxPjb+RhAVuIuHeW2kyaWYDeG+9j0dKItH
         UMDA==
X-Gm-Message-State: APjAAAWsKreRXGZpu7zWGBfIBvnvbGbdIkFXnCwXrHmSl71p/uODRbKj
        c6wDDfOkNH9I0cEZWOE/lvEsQikW2Nva1Ilp12vCQNiGMxu/
X-Google-Smtp-Source: APXvYqw0yUIbNh+pGaBmjTGn6QTdUeXaeQPr8IF42eCrt+4KQEhGY66Ikiv3nYhzewKgZfr/soR4DDYF3lXcnPKyIFcc/jNYBhWi
MIME-Version: 1.0
X-Received: by 2002:a92:3984:: with SMTP id h4mr8301330ilf.36.1575553081339;
 Thu, 05 Dec 2019 05:38:01 -0800 (PST)
Date:   Thu, 05 Dec 2019 05:38:01 -0800
In-Reply-To: <0000000000006dff110598d25a9b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bcf3bc0598f5090d@google.com>
Subject: Re: INFO: task hung in fb_open
From:   syzbot <syzbot+a4ae1442ccc637162dc1@syzkaller.appspotmail.com>
To:     airlied@linux.ie, ayan.halder@arm.com, b.zolnierkie@samsung.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        kraxel@redhat.com, linux-arm-kernel@lists.infradead.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
        peda@axentia.se, sam@ravnborg.org, syzkaller-bugs@googlegroups.com,
        ville.syrjala@linux.intel.com, wens@csie.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot has bisected this bug to:

commit 979c11ef39cee79d6f556091a357890962be2580
Author: Ayan Kumar Halder <ayan.halder@arm.com>
Date:   Tue Jul 17 17:13:46 2018 +0000

     drm/sun4i: Substitute sun4i_backend_format_is_yuv() with format->is_yuv

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15d2f97ee00000
start commit:   596cf45c Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13d2f97ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8ab2e0e09c2a82
dashboard link: https://syzkaller.appspot.com/bug?extid=a4ae1442ccc637162dc1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14273edae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15e7677ae00000

Reported-by: syzbot+a4ae1442ccc637162dc1@syzkaller.appspotmail.com
Fixes: 979c11ef39ce ("drm/sun4i: Substitute sun4i_backend_format_is_yuv()  
with format->is_yuv")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
