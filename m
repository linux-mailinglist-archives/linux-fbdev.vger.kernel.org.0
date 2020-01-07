Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D73B132AA0
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jan 2020 17:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgAGQCJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Jan 2020 11:02:09 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45747 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbgAGQCJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Jan 2020 11:02:09 -0500
Received: by mail-qk1-f195.google.com with SMTP id x1so43033013qkl.12
        for <linux-fbdev@vger.kernel.org>; Tue, 07 Jan 2020 08:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m5L2Z7dBLaHFaGhh6t90np+r+vB2C1fkHc9c1XkE5eA=;
        b=SRKTOX73kQ0C7bZJyVEQPX5lrHCfn6wtB+TUgnlKYaqAcPOJxRX9W33hvgPLf/Cqni
         20bWZcvpVtp+u3kVVCy8Pr6p5WX771zG/aaYNm3a43PBoZMEWPkVUdafi6z8zdNbP875
         wtMMQXxTZrS4EHq5APXk2wYx3oJy+7yGEHag0xh0L78KeLuZ6Up0ZEKAeisMiKKEo5bD
         GnoA9zsPeHtXte1J8C12L3Ve4R2yJhPrmNnqIh1xILeh06Iq5UCkFiirkFczmkS1Durt
         VPuB0v7XEVsThI6kRHNHza1+1T1XUR1zTV2kSimviYK2TK4yxqHmw1gQJk9t+jf8ah8+
         YhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m5L2Z7dBLaHFaGhh6t90np+r+vB2C1fkHc9c1XkE5eA=;
        b=qa2RdPU4SHPO4fKlzNZq/lwhYdkauYfgZ85mNz5VufnmIGH6OaLuCT0TQElmgXQhM0
         vChL3Ew/5EPgfwb6y6CYC6Wa4CbsgumnGoqmQYrYbGMr8/KiIJHtc/8VuJiq7LrNJ7KT
         BbKmloqaASN+AsjptmRXBvtSXB4aUrFlcDZ/zrwSv2HSXAo7M6pi365j4GT8Za4ighT8
         yBbkltd4KYxOSlsemQuwECYUiBrBkQg/7vuk3YTV9LidIXqD8GkBMejoOCD+NUwnt0U0
         +yRP1yQO4FsPt5y8NiFGWvyApFOo1GiZJGSwnqbECv/0BSfRdcR0SUR1Kzd9a1oYWs7T
         mVXQ==
X-Gm-Message-State: APjAAAUijsMeI6Xbw+xBHIUl79kyKtlv+y6fsHFIIPIWQma9tCKgYkY5
        j3kERVJEykQnJ8EB0NWqt5YcZJ1CXYQMFcCIpF90rw==
X-Google-Smtp-Source: APXvYqzUW7seMxUlfo6okJae/fU1ZwL/kM+/uzTVDw6txhjzZH1cXINZE4qkaz5ynFXQaozCcU2Y+HQm3/FNG88d/6Y=
X-Received: by 2002:a37:e312:: with SMTP id y18mr18264qki.250.1578412928223;
 Tue, 07 Jan 2020 08:02:08 -0800 (PST)
MIME-Version: 1.0
References: <00000000000082b80f059a56da1f@google.com> <0000000000002074ef059a5c86e2@google.com>
 <20200107154755.GB43062@phenom.ffwll.local>
In-Reply-To: <20200107154755.GB43062@phenom.ffwll.local>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 7 Jan 2020 17:01:56 +0100
Message-ID: <CACT4Y+arQyPjzHSFy1MkVF2jNPJbu262_FTL5ma9AnWkXosY1g@mail.gmail.com>
Subject: Re: INFO: task hung in fb_release
To:     syzbot <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>,
        Rex.Zhu@amd.com, David Airlie <airlied@linux.ie>,
        alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        christian.koenig@amd.com, david1.zhou@amd.com,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jan 7, 2020 at 4:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Dec 23, 2019 at 02:31:01AM -0800, syzbot wrote:
> > syzbot has bisected this bug to:
> >
> > commit e3933f26b657c341055443103bad331f4537b113
> > Author: Rex Zhu <Rex.Zhu@amd.com>
> > Date:   Tue Jan 16 10:35:15 2018 +0000
> >
> >     drm/amd/pp: Add edit/commit/show OD clock/voltage support in sysfs
>
> Pretty sure you don't even have that driver loaded ... from the config:
>
> # CONFIG_DRM_AMDGPU is not set
>
> :-)

Yes, it seems the bug is very flaky and flakiness changes over time.
And this is combined with non-deterministic kernel build bug:
https://github.com/google/syzkaller/issues/1271#issuecomment-559093018
It builds the same kernel, but gets a different result, so it's like
"nope, this commit very much affects the kernel so could be the root
cause"...




> Cheers, Daniel
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b5a799e00000
> > start commit:   c6017471 Merge tag 'xfs-5.5-fixes-2' of git://git.kernel.o..
> > git tree:       upstream
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=11b5a799e00000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=16b5a799e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=7f6119e2e3675a73
> > dashboard link: https://syzkaller.appspot.com/bug?extid=d130c4a0890561cfac5b
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b1925e00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b9623ee00000
> >
> > Reported-by: syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com
> > Fixes: e3933f26b657 ("drm/amd/pp: Add edit/commit/show OD clock/voltage
> > support in sysfs")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20200107154755.GB43062%40phenom.ffwll.local.
