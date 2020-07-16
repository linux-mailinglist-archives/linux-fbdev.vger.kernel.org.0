Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5E2222012
	for <lists+linux-fbdev@lfdr.de>; Thu, 16 Jul 2020 12:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgGPKAM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 16 Jul 2020 06:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgGPKAL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 16 Jul 2020 06:00:11 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01F0C08C5C0
        for <linux-fbdev@vger.kernel.org>; Thu, 16 Jul 2020 03:00:10 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c80so9735837wme.0
        for <linux-fbdev@vger.kernel.org>; Thu, 16 Jul 2020 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=p7ULmXvRXYxCcTo8wTXcMu3x+yaWMQIGr98XOBExKbA=;
        b=WiOCEj2aX2XvOMwJRHGb2nmKLYzIngZK3V8yvoeZMgI50rW5jzQZSaclNCu+hYD2fh
         W9Ax4Z9wBtrHU6XdeweO1EuJSpp4uBxsxMIvwZ3p2oBWvSvklN2/tqt+R++hmOJph1Pa
         Cg4wzU0cANnHCT1Vl9YvZXeDnZQsbNhLUpOQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=p7ULmXvRXYxCcTo8wTXcMu3x+yaWMQIGr98XOBExKbA=;
        b=RsErZ3RrzOTAICI2g2Q4gvnLIQVT6yopkE9b02w8uX7Ed97V1j0DHlSfHqJzFpT4e0
         MlBDgIyMCbLrdIdStpJ98ODbs9konxkO/ykkO1AzhtW3fAEkMOdPkWhcNtCW+Q6sZK2V
         tEYneuB9DkOS3zS6EW3IBbz51TEkzzTN+2QAEVq3djPVVHfRqR7zb+MoEzY+p0XgCC2V
         H9pfwQ6OyADcEX29yc0GKZyBnYgGnVZUvBNmD95wnEUYVfMcBk2h/8nmM1JSpXsgPvQf
         hLx7OJvgth0XaIGCAdr4SBwgGZgFGEENnZKvM5okc/OAn+Y6qH3Tgxs5deJy9sQZGJLf
         MPyg==
X-Gm-Message-State: AOAM5338TMBbQ8f+SjKN3OET9azxExIj2NcTauOaiaEC1hhwD8V16kQu
        rb/YSx+t8QU3wrDKToR8c7jtGQ==
X-Google-Smtp-Source: ABdhPJxn6oG23L3JWUoDJgbj2CK99jMIxywnQc6uT8hr9FP8YkPYYWAV3FpUvuGMkDhTuMGWgHs27g==
X-Received: by 2002:a05:600c:2249:: with SMTP id a9mr3448422wmm.163.1594893609246;
        Thu, 16 Jul 2020 03:00:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y16sm8215061wro.71.2020.07.16.03.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 03:00:08 -0700 (PDT)
Date:   Thu, 16 Jul 2020 12:00:06 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        George Kennedy <george.kennedy@oracle.com>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
Message-ID: <20200716100006.GN3278063@phenom.ffwll.local>
Mail-Followup-To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        George Kennedy <george.kennedy@oracle.com>,
        Jiri Slaby <jslaby@suse.com>, Dmitry Vyukov <dvyukov@google.com>
References: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
 <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200715094836.GD2571@kadam>
 <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
 <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
 <20200715151220.GE2571@kadam>
 <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jul 16, 2020 at 12:29:00AM +0900, Tetsuo Handa wrote:
> On 2020/07/16 0:12, Dan Carpenter wrote:
> > I've complained about integer overflows in fbdev for a long time...
> > 
> > What I'd like to see is something like the following maybe.  I don't
> > know how to get the vc_data in fbmem.c so it doesn't include your checks
> > for negative.
> 
> Yes. Like I said "Thus, I consider that we need more sanity/constraints checks." at
> https://lore.kernel.org/lkml/b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp/ ,
> we want basic checks. That's a task for fbdev people who should be familiar with
> necessary constraints.

I think the worldwide supply of people who understand fbdev and willing to
work on it is roughly 0. So if someone wants to fix this mess properly
(which likely means adding tons of over/underflow checks at entry points,
since you're never going to catch the driver bugs, there's too many and
not enough people who care) they need to fix this themselves.

Just to avoid confusion here.

> Anyway, my two patches are small and low cost; can we apply these patches regardless
> of basic checks?

Which two patches where?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
