Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2391DA514
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 May 2020 01:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgESXBa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 May 2020 19:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgESXBa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 May 2020 19:01:30 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD064C061A0F
        for <linux-fbdev@vger.kernel.org>; Tue, 19 May 2020 16:01:28 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id y85so1260847oie.11
        for <linux-fbdev@vger.kernel.org>; Tue, 19 May 2020 16:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npvWnReb2IJt3VMAmxpMhac7mlmWW3J/lX24SrgS9qE=;
        b=UOcCbH88owtzIRMNcPE+vdkyIkUinAEqPG/2YOPPDTTUWNJRr1tgJdTZlr0vWZgJGW
         yMEPgA/E7XaOt0KFHP+BLdJZWh3BqrXHdORvRWc7/00F6kdrdK9wmiaR1ixpDzDBn91V
         JDrLsJZoYRkuGucu7UUe46PhrZjYmm6C4BcrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npvWnReb2IJt3VMAmxpMhac7mlmWW3J/lX24SrgS9qE=;
        b=AbJ3pFFh0ep3/SsnB8TzQbtCST0ryvq1sSxxoFdbATMImV1HbMRaQwX2xJm06p93HU
         a9cRUcqCDIebAf22Idt2/wabv0gHI304/zFUHwv6ZtBQsipWzWjDT5MvtdU8EwtTs2d8
         0jBQ6Mcqkr0c0/1sigWcHnfQ8XLKUiKwOIeRYW9IKuTo78BnZ2RU5Fauz0slYWt2IGPo
         FqZUL6yw7ReBc4wq/aOworJqLzAcZUhuNFiQiqVARxpDBOrOmtAj1XYE/fJ5axAIDFxz
         Du3kg8qSZgaGwV+fShhGXfwC8/rd2XYuFRKtkydQoul35NHVdnQQUSzxEut9gju07kl8
         F7SQ==
X-Gm-Message-State: AOAM533wwr9BKId7MbSuA86v3p6IctirAP7Q7JqwSUFxVsEodxr1dTxY
        y0et+xXXrr9ABGWKobR6SriG7gCAIbfGIHizNf1eTw==
X-Google-Smtp-Source: ABdhPJzSeSchW1yQuuAJC6w8IpTar3IEvAnrtbLequiDAv30+NoQ1PDJ2Oj/ZnR5ghBhUq8zNh/OM7ccdGUffFcjoNM=
X-Received: by 2002:aca:1e12:: with SMTP id m18mr1294095oic.128.1589929288064;
 Tue, 19 May 2020 16:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200519163234.226513-1-sashal@kernel.org> <CAPM=9txZpiCGkv3jiBC1F8pTe4A2pqWpQDyjRBXk2roFqw+0+Q@mail.gmail.com>
In-Reply-To: <CAPM=9txZpiCGkv3jiBC1F8pTe4A2pqWpQDyjRBXk2roFqw+0+Q@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 20 May 2020 01:01:16 +0200
Message-ID: <CAKMK7uEa0FH5_AyopVH+wpAXOOxoeo8Acck2qwzzyVnq0UuSZA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
To:     Dave Airlie <airlied@gmail.com>
Cc:     Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>,
        "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        spronovo@microsoft.com,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        iourit@microsoft.com,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, May 20, 2020 at 12:42 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Wed, 20 May 2020 at 02:33, Sasha Levin <sashal@kernel.org> wrote:
> >
> > There is a blog post that goes into more detail about the bigger
> > picture, and walks through all the required pieces to make this work. It
> > is available here:
> > https://devblogs.microsoft.com/directx/directx-heart-linux . The rest of
> > this cover letter will focus on the Linux Kernel bits.
> >
> > Overview
> > ========
> >
> > This is the first draft of the Microsoft Virtual GPU (vGPU) driver. The
> > driver exposes a paravirtualized GPU to user mode applications running
> > in a virtual machine on a Windows host. This enables hardware
> > acceleration in environment such as WSL (Windows Subsystem for Linux)
> > where the Linux virtual machine is able to share the GPU with the
> > Windows host.
> >
> > The projection is accomplished by exposing the WDDM (Windows Display
> > Driver Model) interface as a set of IOCTL. This allows APIs and user
> > mode driver written against the WDDM GPU abstraction on Windows to be
> > ported to run within a Linux environment. This enables the port of the
> > D3D12 and DirectML APIs as well as their associated user mode driver to
> > Linux. This also enables third party APIs, such as the popular NVIDIA
> > Cuda compute API, to be hardware accelerated within a WSL environment.
> >
> > Only the rendering/compute aspect of the GPU are projected to the
> > virtual machine, no display functionality is exposed. Further, at this
> > time there are no presentation integration. So although the D3D12 API
> > can be use to render graphics offscreen, there is no path (yet) for
> > pixel to flow from the Linux environment back onto the Windows host
> > desktop. This GPU stack is effectively side-by-side with the native
> > Linux graphics stack.
>
> Okay I've had some caffiene and absorbed some more of this.
>
> This is a driver that connects a binary blob interface in the Windows
> kernel drivers to a binary blob that you run inside a Linux guest.
> It's a binary transport between two binary pieces. Personally this
> holds little of interest to me, I can see why it might be nice to have
> this upstream, but I don't forsee any other Linux distributor ever
> enabling it or having to ship it, it's purely a WSL2 pipe. I'm not
> saying I'd be happy to see this in the tree, since I don't see the
> value of maintaining it upstream, but it probably should just exists
> in a drivers/hyperv type area.

Yup as-is (especially with the goal of this being aimed at ml/compute
only) drivers/hyperv sounds a bunch more reasonable than drivers/gpu.

> Having said that, I hit one stumbling block:
> "Further, at this time there are no presentation integration. "
>
> If we upstream this driver as-is into some hyperv specific place, and
> you decide to add presentation integration this is more than likely
> going to mean you will want to interact with dma-bufs and dma-fences.
> If the driver is hidden away in a hyperv place it's likely we won't
> even notice that feature landing until it's too late.

I've recently added regex matches to MAINTAINERS so we'll see
dma_buf/fence/anything show up on dri-devel. So that part is solved
hopefully.

> I would like to see a coherent plan for presentation support (not
> code, just an architectural diagram), because I think when you
> contemplate how that works it will change the picture of how this
> driver looks and intergrates into the rest of the Linux graphics
> ecosystem.

Yeah once we have the feature-creep to presentation support all the
integration fun starts, with all the questions about "why does this
not look like any other linux gpu driver". We have that already with
nvidia insisting they just can't implement any of the upstream gpu
uapi we have, but at least they're not in-tree, so not our problem
from an upstream maintainership pov.

But once this dx12 pipe is landed and then we want to extend it it's
still going to have all the "we can't ever release the sources to any
of the parts we usually expect to be open for gpu drivers in upstream"
problems. Then we're stuck at a rather awkward point of why one vendor
gets an exception and all the others dont.

> As-is I'd rather this didn't land under my purview, since I don't see
> the value this adds to the Linux ecosystem at all, and I think it's
> important when putting a burden on upstream that you provide some
> value.

Well there is some in the form of "more hw/platform support". But
given that gpus evolved rather fast, including the entire integration
ecosystem (it's by far not just the hw drivers that move quickly). So
that value deprecates a lot faster than for other kernel subsystems.
And all that's left is the pain of not breaking anything without
actually being able to evolve the overall stack in any meaningful way.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
