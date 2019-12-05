Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0FB1114012
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Dec 2019 12:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfLEL1t (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 Dec 2019 06:27:49 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:39651 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbfLEL1t (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 5 Dec 2019 06:27:49 -0500
Received: by mail-qv1-f66.google.com with SMTP id y8so1128996qvk.6
        for <linux-fbdev@vger.kernel.org>; Thu, 05 Dec 2019 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RN4UxK4XX/wD+FOSD/QSslR64zPY0NoSPi7sfqEDTcg=;
        b=HcygGCX60Afhxpnw9ZYlpuKkkt5wdM44SN/KOzDuDxVXQAJYVla5vHk6t3E4umUT94
         WY3Uy/DUPWgjn0jDpNuvlQTfbRf6E7c08Qp9KQdy8d9VELeRNDHm65ZdVHDB3uZSyxM7
         eHufFLkzIjwZBrX6+UXDf4ik+qPNtMwBIdCqJDm4sA2uNoBYHBhVnpbaMdg/VJS1UEn8
         AM0jTK3oFUhIZANAHf2pmaFrBnf0iz7jtAqeryjk6H+rOQm8s1DrQnC4hXGmy2QVdwbA
         KebmWYKIj3F0ms5Jw0G2v2v3JX7QX7bocZ4OdEkrQzuV2CoGugRaRRbvp9/fH59JF56p
         S+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RN4UxK4XX/wD+FOSD/QSslR64zPY0NoSPi7sfqEDTcg=;
        b=b6kCfdOAOIZtey09LIeBwsL593UVy4Icog8qIic3+PF1IeA1i6Hr6iYaV/fbUufM1L
         SdGd6xwn3+plnF1fwE5vN+0psNu1clr+cAb41mSVQRj+nDP5uQftqLGSS+m20mBBQFtX
         z/hbMY57HvbNysBK/Ky7RlC4k+JbB9if7owoqyCI2vO1lqtzLzLSB16SY0ld+wzyvW8F
         9+3VtrLsOmHMJzldsV28CXGTmQL42gEobGLSVhS8EtopkpEZ3d1DjxOi/qw2dA8nhH0M
         p/A7SQ6q3W8mjS/I/xkP1fsXdTAaO+cDVTCc+7sHgBzITqzQJF1Swv/661hTzxEqMEPV
         bPbQ==
X-Gm-Message-State: APjAAAVzaolisnBldJqJDbJltpHfMmSD5TiV9iIYW91hxqkJjB9zQtg0
        Cajl+m6GZZyTCmjlqlLY4Yhf/2/gNUguZGbg81lmYQ==
X-Google-Smtp-Source: APXvYqxH9YNJe5L8BxMqoB1aZ+mLyrbeKewaHX+sfn84IGKLFUtHvCbxNr7Nz7Mt9VNZMqmAAHeTZG/lcpsKaNbOTFE=
X-Received: by 2002:a0c:f8d1:: with SMTP id h17mr7099085qvo.80.1575545267533;
 Thu, 05 Dec 2019 03:27:47 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003e640e0598e7abc3@google.com> <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com> <CACT4Y+ZHCmTu4tdfP+iCswU3r6+_NBM9M-pAZEypVSZ9DEq3TQ@mail.gmail.com>
 <e03140c6-8ff5-9abb-1af6-17a5f68d1829@redhat.com>
In-Reply-To: <e03140c6-8ff5-9abb-1af6-17a5f68d1829@redhat.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 5 Dec 2019 12:27:35 +0100
Message-ID: <CACT4Y+YopHoCFDRHCE6brnWfHb5YUsTJS1Mc+58GgO8CDEcgHQ@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To:     Paolo Bonzini <pbonzini@redhat.com>
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
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Dec 5, 2019 at 11:53 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 05/12/19 11:31, Dmitry Vyukov wrote:
> >> Ah, and because the machine is a KVM guest, kvm_wait appears in a lot of
> >> backtrace and I get to share syzkaller's joy every time. :)
> > I don't see any mention of "kvm" in the crash report.
>
> It's there in the stack trace, not sure if this is what triggered my Cc:
>
>  [<ffffffff810c7c3a>] kvm_wait+0xca/0xe0 arch/x86/kernel/kvm.c:612
>
> Paolo


Oh, you mean the final bisection crash. Indeed it contains a kvm frame
and it turns out to be a bug in syzkaller code that indeed
misattributed it to kvm instead of netfilter.
Should be fixed now, you may read the commit message for details:
https://github.com/google/syzkaller/commit/4fb74474cf0af2126be3a8989d770c3947ae9478

Overall this "making sense out of kernel output" task is the ultimate
insanity, you may skim through this file to get a taste of amount of
hardcoding and special corner cases that need to be handled:
https://github.com/google/syzkaller/blob/master/pkg/report/linux.go
And this is never done, such "exception from exception corner case"
things pop up every week. There is always something to shuffle and
tune. It only keeps functioning due to 500+ test cases for all
possible insane kernel outputs:
https://github.com/google/syzkaller/tree/master/pkg/report/testdata/linux/report
https://github.com/google/syzkaller/tree/master/pkg/report/testdata/linux/guilty

So thanks for persisting and questioning! We are getting better with
each new test.
