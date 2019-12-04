Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C649911372C
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Dec 2019 22:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbfLDVlC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 4 Dec 2019 16:41:02 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:51435 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbfLDVlC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 4 Dec 2019 16:41:02 -0500
Received: by mail-il1-f200.google.com with SMTP id x2so806915ilk.18
        for <linux-fbdev@vger.kernel.org>; Wed, 04 Dec 2019 13:41:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=JrNPfPX8ooL5t/Vw7RYAMqCMbF8rwCtCqkj0exct6ns=;
        b=DcyEJuIhFR86Xg7eidhHHN2cOHhVVuC5fGUh0M7Gnppm3nw+o8IQM6fvjJMzKcFQPn
         zzSuN9QxrXPek1eLFbvXrtxewSqmwbcKU/N7xjZ7LimCXu+6/hg6thMAXVJKvAzBVSAi
         sElCr6DnJ8hrp2ythGdT5r9MDzsF6PZkowILkbJD/Epo+mVOhvY77f1wUIYh0sATGq8H
         AzRg9RMjbuaE+pVtEDo844LEnoKKGwuzr5E+TysAJR+fi4PCD4a4bonS/kFHbvFZyFsq
         XzKVrIA0hFsrziXuM8wlbdluGNdXFc652IHx7RL2E0y3OJkqQYoFBlgzm5qFXuJ9/K2z
         aL+Q==
X-Gm-Message-State: APjAAAW/55QuKSh/Yebyz7F85BJMxaQYQIDiX2bvYmefCcSoQb3mbRgm
        Dia3L9AKkHVUD9kmhHFahTgq0AJkkDINn7lwga+VnMWNJRso
X-Google-Smtp-Source: APXvYqweHEd887dmgHwZ98tD32QtHsIIU9QUEjKbdT4mjyi6aPIBc1Zjh5EyBzHGg/jDulIxR32o86hj/XmAPTryABiezG7aI+6v
MIME-Version: 1.0
X-Received: by 2002:a05:6638:d3:: with SMTP id w19mr5157404jao.127.1575495661402;
 Wed, 04 Dec 2019 13:41:01 -0800 (PST)
Date:   Wed, 04 Dec 2019 13:41:01 -0800
In-Reply-To: <0000000000002cfc3a0598d42b70@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e640e0598e7abc3@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
From:   syzbot <syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com>
To:     aryabinin@virtuozzo.com, b.zolnierkie@samsung.com,
        daniel.thompson@linaro.org, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org, dvyukov@google.com,
        ghalat@redhat.com, gleb@kernel.org, gwshan@linux.vnet.ibm.com,
        hpa@zytor.com, jmorris@namei.org, kasan-dev@googlegroups.com,
        kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mingo@redhat.com,
        mpe@ellerman.id.au, pbonzini@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, ruscur@russell.cc,
        sam@ravnborg.org, serge@hallyn.com, stewart@linux.vnet.ibm.com,
        syzkaller-bugs@googlegroups.com, takedakn@nttdata.co.jp,
        tglx@linutronix.de, x86@kernel.org
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=127a042ae00000
start commit:   76bb8b05 Merge tag 'kbuild-v5.5' of git://git.kernel.org/p..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=117a042ae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=167a042ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd226651cb0f364b
dashboard link: https://syzkaller.appspot.com/bug?extid=4455ca3b3291de891abc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11181edae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105cbb7ae00000

Reported-by: syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com
Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
