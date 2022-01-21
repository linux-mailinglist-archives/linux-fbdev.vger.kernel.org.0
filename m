Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2109495C5E
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jan 2022 09:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379276AbiAUIzi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jan 2022 03:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349505AbiAUIzi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jan 2022 03:55:38 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF41C061574
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jan 2022 00:55:37 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id q13-20020a9d4b0d000000b0059b1209d708so10932223otf.10
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jan 2022 00:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yrM5fABO5SZcVbJoe9Ix4MRfc99NE9JR6NJPbJC6LIw=;
        b=KdiG09w8aBvAILbJf1NNS5DPaRYfzCW+Q2zBiSQtGxosLVvdbNwIij9eBpVmRKEEfd
         RiRNQcPkdeCrvSHGjaGe0wdonu4KDRc+HZkaE+DdIjteru54VOeon+Jkt5l+H6OONHzd
         Nyn93CewKb0rN9iwOgv9qdnYX9xYsU8pQrCKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yrM5fABO5SZcVbJoe9Ix4MRfc99NE9JR6NJPbJC6LIw=;
        b=T/Rj2ztxmbr1/rmFYNH8021ezY+mi3WeCU5Ar248+ndJPuZLepkBmcLQlOoftoH4n2
         1mTm57T1qjY0p2ko0hji0i5BOxbVv0s985WZc3pSm18U3foWdgmdt1SheKxJIjgkFbrL
         nXB058dAVDEUNbMiny5Op0l5+BHx99qgDTPJ37Yrp1DdCXbKxE5/cvzzVTPdwrjzaZjI
         o4gL05GLusqJ9p+SzUNyjXG0LrD1QENtiZ+p0vlzEmChGY+gSes0dfpCTf1gjScH5VSM
         p7HLsrFyoyMF8r1CDlfIT0xZ9N0bIJ56BInvaXdxzl1AMfnh7EAudQ4d2PykZg4H91Ct
         /lAA==
X-Gm-Message-State: AOAM533GYJFjLHu8lw/WJHaQJ9GPGX3Y+2nJPdivszSFpWA89Hp2Hqc5
        V4SZJnUDGrzTeijFoEArs/uNl9hGFIlEOTjiPDCAHA==
X-Google-Smtp-Source: ABdhPJwrgrd7mUq8sWYme18g4XUw+hqETrkJjUSeUFg9R3q8K6f9Zr4UIqjlIxPMWOCnbdhuDzG7lMe27pz7wBHqx+4=
X-Received: by 2002:a05:6830:2704:: with SMTP id j4mr2063258otu.323.1642755337197;
 Fri, 21 Jan 2022 00:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de> <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de> <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de> <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
 <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de> <20220120125015.sx5n7ziq3765rwyo@sirius.home.kraxel.org>
In-Reply-To: <20220120125015.sx5n7ziq3765rwyo@sirius.home.kraxel.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 21 Jan 2022 09:55:25 +0100
Message-ID: <CAKMK7uF-V20qWTxQLvTC6GjC8Sg+Pst+UJ3pWCLQ4Q7Khgy62g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Jan 21, 2022 at 9:46 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > What I still don't understand: why are you so keen on maintaining an
> > interface that only serves the console? Nothing else uses fbdev these days.
> > Why not improve DRM/userspace to the point where it fits your requirements?
> > Long-term, the latter would make a lot more sense.
>
> And note that it is *much* easier to write drm drivers these days.
> We got alot of helpers, we got generic fbdev emulation and more.
>
> If you are curious just compare the initial commit of the bochs drm
> driver with the current code.  Initially the driver had to manage ttm
> and fbdev and whatnot else.  These days writing a (non-accelerated) drm
> driver is basically some boilerplate picking the helpers which work best
> for your hardware, the code to actually program the hardware and that's
> it.
>
> The "new drivers should be drm" policy exists for years already btw,
> exactly because of the unfixable fbdev API limitations.  The bochs drm
> was a fbdev driver initially.  Never merged.  Got rewritten as drm
> driver and that was merged instead.  In 2013, almost a decade ago.
>
> And, yes, it very well might be that drm misses some piece here and
> there for specific hardware, such as fbdev emulation not supporting
> rgb332.  But I fully agree with Thomas here:  Improving drm is probably
> a much better way to spend your time.  drm is where the development
> happens.  fbdev is only kept alive.

Just to clarify, since we had lots of smaller and bigger
misunderstandings in the thread thus far: DRM_FORMAT_RGB332 exists, so
drm support that already. The fbdev emulation doesn't yet, but all
that's needed for that is filling out the code to remap the drm
description to the fbdev format description for this case. Plus
testing it all works ofc with fbcon and whatelse. Note that RGB332  is
a bit more work than e.g. C4, since atm fbdev still uses only bpp to
identify formats, so would need to be switch over to drm_fourcc first
before adding anything which aliases with something existing (we have
C8 already wired up).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
