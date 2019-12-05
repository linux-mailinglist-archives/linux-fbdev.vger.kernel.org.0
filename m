Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E558113F42
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Dec 2019 11:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfLEKW2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 Dec 2019 05:22:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31971 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729017AbfLEKW2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 5 Dec 2019 05:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575541346;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HaIFegi+0Clb4nOD0Kmjt0kKgC/aYqjcyu4Ow354nhs=;
        b=HH5yT8PCDXUaHy9cWlxcjMcmKvQKEwj6Vs2pRQ7kHzEt2vaz3TN4D0nhic0F2kIHjrW2lA
        LTkwwyc47JCiLkiFxcn0gJeiwd6+OqCQJzjEsmX00+uJ0K7KaLWLgTNaKxNZIO14JSMmut
        4YgKSe7By5vtmq+l/0eJtEwJb7A6TFo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-TwE9bIRKMu2qG1l3Hmhipw-1; Thu, 05 Dec 2019 05:22:25 -0500
Received: by mail-wr1-f69.google.com with SMTP id z15so1350982wrw.0
        for <linux-fbdev@vger.kernel.org>; Thu, 05 Dec 2019 02:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HaIFegi+0Clb4nOD0Kmjt0kKgC/aYqjcyu4Ow354nhs=;
        b=rqQXIIl/R5NQd7csNej3ICMkmqJ4Oexnev+Jg2xoVJNEXByECkoqJnWyClVAfF6Qn6
         ZiCFAlH8dllRQhjqMCj97WibML9HuzcRTdbRXxJpNsaaHXZu5fozMRvUt+W+fae91guS
         4DHxCsfKs8rDIRNgsfVMZhT90NLIa1fXqbTBe8xKmmukSZ4OIVUAyypyy3OOF2uVK6ue
         x1EPKBwgGkBvL8w6AjVTEiKAz/SeqLGifIOFvyFTMMh0JDnm2igoY68+BwF+n60yUX7F
         kx4IGKWW4RSIQq+HkjOSISXXp5vVCqT8PXGcp7jW8yhYr1daZcVWGETP4ylRj1Pl5w04
         KXog==
X-Gm-Message-State: APjAAAXd1O4ZQLfc1zjzY+sUIOWKYTOTWsrQpQLjmxAmL1ZBjdLq8vtR
        m1eYXlBYO03dO4Sz53gLQ+EPl3jQ8xiGNc0oaX/7cCcETsbbGyYeHlC3yw7mfqnFRR+GXa9E1TQ
        WoAVSpOnsLqAxzoXwEHK1Kj8=
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr3707001wmm.145.1575541344296;
        Thu, 05 Dec 2019 02:22:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIBQBRqyvopjnTZJ1NeKsKZIwQ0OV7bU/UZtQCKNf5+J4JDf0f71xe1rLVBcdblu3GRJ9yUA==
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr3706957wmm.145.1575541344042;
        Thu, 05 Dec 2019 02:22:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:541f:a977:4b60:6802? ([2001:b07:6468:f312:541f:a977:4b60:6802])
        by smtp.gmail.com with ESMTPSA id c1sm11635129wrs.24.2019.12.05.02.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 02:22:23 -0800 (PST)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI <dri-devel@lists.freedesktop.org>, ghalat@redhat.com,
        Gleb Natapov <gleb@kernel.org>, gwshan@linux.vnet.ibm.com,
        "H. Peter Anvin" <hpa@zytor.com>, James Morris <jmorris@namei.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KVM list <kvm@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Russell Currey <ruscur@russell.cc>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, stewart@linux.vnet.ibm.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Kentaro Takeda <takedakn@nttdata.co.jp>,
        Thomas Gleixner <tglx@linutronix.de>,
        the arch/x86 maintainers <x86@kernel.org>
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
Date:   Thu, 5 Dec 2019 11:22:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: TwE9bIRKMu2qG1l3Hmhipw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 05/12/19 11:16, Dmitry Vyukov wrote:
> On Thu, Dec 5, 2019 at 11:13 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 04/12/19 22:41, syzbot wrote:
>>> syzbot has bisected this bug to:
>>>
>>> commit 2de50e9674fc4ca3c6174b04477f69eb26b4ee31
>>> Author: Russell Currey <ruscur@russell.cc>
>>> Date:   Mon Feb 8 04:08:20 2016 +0000
>>>
>>>     powerpc/powernv: Remove support for p5ioc2
>>>
>>> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=127a042ae00000
>>> start commit:   76bb8b05 Merge tag 'kbuild-v5.5' of
>>> git://git.kernel.org/p..
>>> git tree:       upstream
>>> final crash:    https://syzkaller.appspot.com/x/report.txt?x=117a042ae00000
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=167a042ae00000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=dd226651cb0f364b
>>> dashboard link:
>>> https://syzkaller.appspot.com/bug?extid=4455ca3b3291de891abc
>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11181edae00000
>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105cbb7ae00000
>>>
>>> Reported-by: syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com
>>> Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")
>>>
>>> For information about bisection process see:
>>> https://goo.gl/tpsmEJ#bisection
>>>
>>
>> Why is everybody being CC'd, even if the bug has nothing to do with the
>> person's subsystem?
> 
> The To list should be intersection of 2 groups of emails: result of
> get_maintainers.pl on the file identified as culprit in the crash
> message + emails extracted from the bisected to commit.

Ah, and because the machine is a KVM guest, kvm_wait appears in a lot of
backtrace and I get to share syzkaller's joy every time. :)

This bisect result is bogus, though Tetsuo found the bug anyway.
Perhaps you can exclude commits that only touch architectures other than
x86?

Paolo

