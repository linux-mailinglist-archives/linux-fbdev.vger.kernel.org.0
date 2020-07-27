Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF0522F59C
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Jul 2020 18:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgG0QpJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 27 Jul 2020 12:45:09 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:36665 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgG0QpJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 27 Jul 2020 12:45:09 -0400
Received: by mail-il1-f200.google.com with SMTP id o191so9552241ila.3
        for <linux-fbdev@vger.kernel.org>; Mon, 27 Jul 2020 09:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=YHOnlUDfMk9Oce0Ou/WEOEHZ7nLvW59TMeR/2OpcF3Q=;
        b=t1XSkArz7xvVtWj1IpaWJ8zidzpzgfb0LcYltlXVPWupfR+Y1JiW7lWBdaJ2SG1OFy
         +kx9diqhz7LzrqZEH67sIr0dTzK7ehCVPZTvvTkbQyPWLcZ6kOPndVA9Q2tm9J0HqdJY
         tq3nege99Q16Ey7B0UBI4O/9A/ZO48XNPvH6cMx0LXq6kbBZoBrHPXHYX7+8J07GGPpA
         bDFsEx0aa18D/Y79IsBGCXUCuOhtt3ePVGPrGY3TTf0rV8vboKnaiar7UaeUOjs8zhgX
         Nopwvby251zAyMe9bzUVzmfZTmLXa13iwBFRilxGB4ut00rUMjj+OIZ3AqdWti1NCeys
         NbxQ==
X-Gm-Message-State: AOAM533PCJbmVVEwIsWa2Kezc8zy4juxNoq9qBE+R/j0qcQlxEk4w95I
        hIOpkHXPUkSnIOrIvYC0HPVfR9V47OdkMHp+HRDILLdr/6XM
X-Google-Smtp-Source: ABdhPJyWPqw6wdnxG6yEAcA0v1YAdXbJ62nm7W119h3e4RaBn+6wSQs6av1fBXa58L3cKtV8U9o26rlCi8xL4nuWsto7OXO4uR+Z
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1649:: with SMTP id a9mr18800320jat.115.1595868308050;
 Mon, 27 Jul 2020 09:45:08 -0700 (PDT)
Date:   Mon, 27 Jul 2020 09:45:08 -0700
In-Reply-To: <00000000000072cb4c0598d25a69@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009c18f005ab6f0bc0@google.com>
Subject: Re: divide error in fbcon_switch
From:   syzbot <syzbot+13013adc4a234406c29e@syzkaller.appspotmail.com>
To:     b.zolnierkie@samsung.com, daniel.thompson@linaro.org,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        ghalat@redhat.com, gregkh@linuxfoundation.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        maarten.lankhorst@linux.intel.com,
        penguin-kernel@I-love.SAKURA.ne.jp,
        penguin-kernel@i-love.sakura.ne.jp, sam@ravnborg.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit ce684552a266cb1c7cc2f7e623f38567adec6653
Author: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date:   Sun Jul 12 11:10:12 2020 +0000

    vt: Reject zero-sized screen buffer size.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=155549c4900000
start commit:   76bb8b05 Merge tag 'kbuild-v5.5' of git://git.kernel.org/p..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd226651cb0f364b
dashboard link: https://syzkaller.appspot.com/bug?extid=13013adc4a234406c29e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d69aeae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13fdcc2ae00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: vt: Reject zero-sized screen buffer size.

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
