Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC79B2DE76B
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Dec 2020 17:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbgLRQZO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Dec 2020 11:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbgLRQZN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Dec 2020 11:25:13 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BB6C06138C
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Dec 2020 08:24:06 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a109so2429213otc.1
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Dec 2020 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqQbpFMD6dkYLibiVClg3d7g7y7tRyurb1/VW+ic+G0=;
        b=MhcTzhtSsPXPCXJbfWKHsmWz86Veki87y6eADP+xTqJnN5ZPTGjxAb4fDGzbH4YBLt
         WjUjiYEfSKD7mmKYTplE11kGtdoITHmq58NPUS4k5ZNNp3GzDUpJfij4bNl6906lglYy
         wUVxADPIm1LYqZIpXEf+CWX27BGN6+uVe+kpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqQbpFMD6dkYLibiVClg3d7g7y7tRyurb1/VW+ic+G0=;
        b=pEBGhUU5g/OyD/0lO8gkJ2zL43wsiGzDlTfTvN+wpnVhtbN4TdQqgH05VCFYa0WZ26
         9o245j7tZ7QvfK1IUcA4l49C2VhzLKWA3Qkvj3eb6APBpuZ/41dcx0dcCdtSe/5Gu2+o
         eJgllOBQ9Y+u0OBji1h6uSyGSZucV+FInWvWH7TRCHRfctmqivhQ+/aWekLnFGnZs14X
         3w7jBFekjtGMbwRuzgVIwO5IsYcqV66yWpsXfIbH9HwOD9KxyVAy6Zi9Tn4tlir4t0Kl
         tK02bPHChoD/oc5K+A3PHJbafze4SKmuzW7FcURL/NbnVhNkPfwlVwFPfkuuB5P6RL8X
         d/KA==
X-Gm-Message-State: AOAM5310R6iGMEwitq9R+A7B8GQ1Nef1EdQPbbKw1u9b9ObndT9H5Znx
        QE54uwiwlxfghR7yyFxZziDMMNndGAzOoS/Aho5pEw==
X-Google-Smtp-Source: ABdhPJwcCzLk4SZo7l5u4xEQ9jFcCgTViVhvgvQnWJwu13ClsiUz4ogGyWTFmuZasY2Lmv3ZnmkKKq/LXncK/+CK+t0=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr3434686otb.281.1608308646236;
 Fri, 18 Dec 2020 08:24:06 -0800 (PST)
MIME-Version: 1.0
References: <000000000000cb6db205b68a971c@google.com> <CAKMK7uEiS5SrBYv-2w2wWL=9G4ByoHvtiWVsPqekswZzOGmzjg@mail.gmail.com>
 <20201216161621.GH2657@paulmck-ThinkPad-P72> <CAKMK7uH1agVS=e245b=25Lv9Q+u5c7=KL-_NF8Hte10nKTqAXw@mail.gmail.com>
 <20201218111031.226f8b59@gandalf.local.home>
In-Reply-To: <20201218111031.226f8b59@gandalf.local.home>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 18 Dec 2020 17:23:55 +0100
Message-ID: <CAKMK7uEOojWe=KEAkdor4fqWh8=Q6wZTYRNBPWaACaen-iyi0Q@mail.gmail.com>
Subject: Re: WARNING: suspicious RCU usage in modeset_lock
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        syzbot <syzbot+972b924c988834e868b2@syzkaller.appspotmail.com>,
        Josh Triplett <josh@joshtriplett.org>, rcu@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Dec 18, 2020 at 5:10 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 17 Dec 2020 11:03:20 +0100
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> > I think we're tripping over the might_sleep() all the mutexes have,
> > and that's not as good as yours, but good enough to catch a missing
> > rcu_read_unlock(). That's kinda why I'm baffled, since like almost
> > every 2nd function in the backtrace grabbed a mutex and it was all
> > fine until the very last.
> >
> > I think it would be really nice if the rcu checks could retain (in
> > debugging only) the backtrace of the outermost rcu_read_lock, so we
> > could print that when something goes wrong in cases where it's leaked.
> > For normal locks lockdep does that already (well not full backtrace I
> > think, just the function that acquired the lock, but that's often
> > enough). I guess that doesn't exist yet?
> >
> > Also yes without reproducer this is kinda tough nut to crack.
>
> I'm looking at drm_client_modeset_commit_atomic(), where it triggered after
> the "retry:" label, which to get to, does a bit of goto spaghetti, with
> a -EDEADLK detected and a goto backoff, which calls goto retry, and then
> the next mutex taken is the one that triggers the bug.

This is standard drm locking spaghetti using ww_mutexes. Enable
CONFIG_DEBUG_WW_MUTEX_SLOWPATH and you'll hit this all the time, in
all kinds of situations. We're using this all the time because it's
way too easy to to get the error cases wrong.

> As this is hard to reproduce, but reproducible by a fuzzer, I'm guessing
> there's some error return path somewhere in there that doesn't release an
> rcu_read_lock().

We're maybe a bit too happy to use funny locking schemes like
ww_mutex, but at least to my knowledge there's no rcu anywhere near
these. Or preempt disable fwiw (which I think the consensus is the
more likely culprit). So I have no idea how this leaks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
