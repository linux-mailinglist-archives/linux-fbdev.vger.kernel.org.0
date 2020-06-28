Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1252B20CB16
	for <lists+linux-fbdev@lfdr.de>; Mon, 29 Jun 2020 01:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgF1XkL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 28 Jun 2020 19:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgF1XkL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 28 Jun 2020 19:40:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4539C03E979;
        Sun, 28 Jun 2020 16:40:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f18so6720041wrs.0;
        Sun, 28 Jun 2020 16:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RNCJbGIKYfYYH6mEGJwQ5q1MGzI5m1G+vBtI454PIkw=;
        b=QHPa8nci5cvqxkBigNa3jkizya+yn/ucUSRyudR8Oa1YwQnbaLlgbzEkEjNefCV3Pr
         Utx0QWwqaCXu7A2dKNFe2LVmuaukxAbU4vYE1W8bF3QfaS8OGho7H+Xec4qU/pv8fVPj
         GbCYPc8nmwM8OQdGIcOTrybDPB/Cb/oU6JJDtEt6p9FiiFOdMpqQ9mAQkMBKbopiOObZ
         9PIXZ2wDjZw21hPU1MkuMuE3j+G2dVn+03kiwr25l91ZmNc4N49sQ1lbIXILp/3Y+1OM
         PJO0CaVuUR3+kvDLHtj5qqkfmK9fM0wfK3VUErwN/FJ4gRR5AlSFSJ5lZG1qy+ONvnuU
         8a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RNCJbGIKYfYYH6mEGJwQ5q1MGzI5m1G+vBtI454PIkw=;
        b=AU38KiSBu5fpGHdWJaqp/rpeHbOVhG9J+4BhJKe2szN/cXgZCRQ7SigFYBITJbHa3N
         7REkei/s3e63lzQsA+TEiGYCW/DMv3dVb4txXP1BdLG733Z549+RH4UMrHhi3H9CW0Op
         DhgJjzgCwfdYao2+7/b1/a3ZjhIswvvNjPGtj3ZwJtFyIQ+NpcN4s1tAXzBbkeVaI8fF
         pHvSwHF7uhIk+PxmYA4WQ9f5lQ29CkXSdwy9u0DFGBl6FRYmHtFZ58Ag8w7FkdY6CgTy
         I/kNzOkUO7fhyOaTU8A5c6nvDy8BtsJpfiM2/5GqW7pOnU9g1SV8aj4Vom8R2goJjzmr
         nQRA==
X-Gm-Message-State: AOAM5334nVTfi4B0PK9l/WiW0PVXgjQI3kWH/FmWFdBSGVKcBJgmUznd
        ctUXo0Ufe1yFa7/zFWUJJnUJU6q6QF3xtkh2KRs=
X-Google-Smtp-Source: ABdhPJzumMJGCmidqJhrb/R2PAWtRCPlCU4rDJsj63UGdFXrZtPulHbdrfhl8TCYVsnR8CbbuzAINKgqkTYC7O+Y8NA=
X-Received: by 2002:a5d:6907:: with SMTP id t7mr14380022wru.329.1593387609004;
 Sun, 28 Jun 2020 16:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200519163234.226513-1-sashal@kernel.org> <CAKMK7uGnSDHdZha-=dZN5ns0sJ2CEnK2693uix4tzqyZb9MXCQ@mail.gmail.com>
 <20200519203608.GG33628@sasha-vm>
In-Reply-To: <20200519203608.GG33628@sasha-vm>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Sun, 28 Jun 2020 17:39:58 -0600
Message-ID: <CADvTj4rmk85yVvFmqCbW+tdXH697FJ4mzf5-CZ-v9ELTZH9OKA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
To:     Sasha Levin <sashal@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Olof Johansson <olof.johansson@gmail.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Alex Deucher <alexander.deucher@amd.com>,
        "Wilson, Chris" <chris@chris-wilson.co.uk>,
        "Syrjala, Ville" <ville.syrjala@linux.intel.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        linux-hyperv@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        spronovo@microsoft.com, Wei Liu <wei.liu@kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        iourit@microsoft.com, "K. Y. Srinivasan" <kys@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, May 19, 2020 at 2:36 PM Sasha Levin <sashal@kernel.org> wrote:
>
> Hi Daniel,
>
> On Tue, May 19, 2020 at 09:21:15PM +0200, Daniel Vetter wrote:
> >Hi Sasha
> >
> >So obviously great that Microsoft is trying to upstream all this, and
> >very much welcome and all that.
> >
> >But I guess there's a bunch of rather fundamental issues before we
> >look into any kind of code details. And that might make this quite a
> >hard sell for upstream to drivers/gpu subsystem:
>
> Let me preface my answers by saying that speaking personally I very much
> dislike that the userspace is closed and wish I could do something about
> it.
>
> >- From the blog it sounds like the userspace is all closed. That
> >includes the hw specific part and compiler chunks, all stuff we've
> >generally expected to be able to look in the past for any kind of
> >other driver. It's event documented here:
> >
> >https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> >
> >What's your plan here?
>
> Let me answer with a (genuine) question: does this driver have anything
> to do with DRM even after we enable graphics on it? I'm still trying to
> figure it out.
>
> There is an open source DX12 Galluim driver (that lives here:
> https://gitlab.freedesktop.org/kusma/mesa/-/tree/msclc-d3d12) with open
> source compiler and so on.
>
> The plan is for Microsoft to provide shims to allow the existing Linux
> userspace interact with DX12; I'll explain below why we had to pipe DX12
> all the way into the Linux guest, but this is *not* to introduce DX12
> into the Linux world as competition. There is no intent for anyone in
> the Linux world to start coding for the DX12 API.
If that really is the case why is microsoft recommending developers to break
compatibility with native Linux and use the DX12 API's here:
https://devblogs.microsoft.com/directx/in-the-works-opencl-and-opengl-mapping-layers-to-directx/

Quote:
"Make it easier for developers to port their apps to D3D12. For developers
looking to move from older OpenCL and OpenGL API versions to D3D12,
the open source mapping layers will provide helpful example code on how
to use the D3D12 Translation Layer library."

If developers of applications that use OpenCL and OpenGL API's were to
follow this advice and transition to D3D12 their applications would no longer
work on Linux systems unless using WSL2. Is Microsoft planning on creating
a D3D12/DirectML frontend that doesn't depend on WSL2?
>
> This is why I'm not sure whether this touches DRM on the Linux side of
> things. Nothing is actually rendered on Linux but rather piped to
> Windows to be done there.
>
> >btw since the main goal here (at least at first) seems to be get
> >compute and ML going the official work-around here is to relabel your
> >driver as an accelerator driver (just sed -e s/vGPU/vaccel/ over the
> >entire thing or so) and then Olof and Greg will take it into
> >drivers/accel ...
>
> This submission is not a case of "we want it upstream NOW" but rather
> "let's work together to figure out how to do it right" :)
>
> I thought about placing this driver in drivers/hyper-v/ given that it's
> basically just a pipe between the host and the guest. There is no fancy
> logic in this drivers. Maybe the right place is indeed drivers/accel or
> drivers/hyper-v but I'd love if we agree on that rather than doing that
> as a workaround and 6 months down the road enabling graphics.
>
> >- Next up (but that's not really a surprise for a fresh vendor driver)
> >at a more technical level, this seems to reinvent the world, from
> >device enumeration (why is this not exposed as /dev/dri/card0 so it
> >better integrates with existing linux desktop stuff, in case that
> >becomes a goal ever) down to reinvented kref_put_mutex (and please
> >look at drm_device->struct_mutex for an example of how bad of a
> >nightmare that locking pattern is and how many years it took us to
> >untangle that one.
>
> I'd maybe note that neither of us here at Microsoft is an expert in the
> Linux DRM world. Stuff might have been done in a certain way because we
> didn't know better.
>
> >- Why DX12 on linux? Looking at this feels like classic divide and
>
> There is a single usecase for this: WSL2 developer who wants to run
> machine learning on his GPU. The developer is working on his laptop,
> which is running Windows and that laptop has a single GPU that Windows
> is using.
>
> Since the GPU is being used by Windows, we can't assign it directly to
> the Linux guest, but instead we can use GPU Partitioning to give the
> guest access to the GPU. This means that the guest needs to be able to
> "speak" DX12, which is why we pulled DX12 into Linux.
>
> >conquer (or well triple E from the 90s), we have vk, we have
> >drm_syncobj, we have an entire ecosystem of winsys layers that work
> >across vendors. Is the plan here that we get a dx12 driver for other
> >hw mesa drivers from you guys, so this is all consistent and we have a
> >nice linux platform? How does this integrate everywhere else with
> >linux winsys standards, like dma-buf for passing stuff around,
> >dma-fence/sync_file/drm_syncobj for syncing, drm_fourcc/modifiers for
> >some idea how it all meshes together?
>
> Let me point you to this blog post that has more information about the
> graphics side of things:
> https://www.collabora.com/news-and-blog/news-and-events/introducing-opencl-and-opengl-on-directx.html
> .
>
> The intent is to wrap DX12 with shims to work with the existing
> ecosystem; DX12 isn't a new player on it's own and thus isn't trying to
> divide/conquer anything.
Shouldn't tensorflow/machine learning be going through the opencl
compatibility layer/shims instead of talking directly to DX12/DirectML?

If tensorflow or any other machine learning software uses DX12 API's
directly then they won't be compatible with Linux unless running on top
of WSL2.
>
> >- There's been a pile of hallway track/private discussions about
> >moving on from the buffer-based memory managed model to something more
> >modern. That relates to your DXLOCK2 question, but there's a lot more
> >to userspace managed gpu memory residency than just that. monitored
> >fences are another part. Also, to avoid a platform split we need to
> >figure out how to tie this back into the dma-buf and dma-fence
> >(including various uapi flavours) or it'll be made of fail. dx12 has
> >all that in some form, except 0 integration with the linux stuff we
> >have (no surprise, since linux isn't windows). Finally if we go to the
> >trouble of a completely revamped I think ioctls aren't a great idea,
> >something like iouring (the gossip name is drm_uring) would be a lot
> >better. Also for easier paravirt we'd need 0 cpu pointers in any such
> >new interface. Adding a few people who've been involved in these
> >discussions thus far, mostly under a drm/hmm.ko heading iirc.
> >
> >I think the above are the really big ticket items around what's the
> >plan here and are we solving even the right problem.
>
> Part of the reason behind this implementation is simplicity. Again, no
> objections around moving to uring and doing other improvements.
>
> --
> Thanks,
> Sasha
>
>
>
