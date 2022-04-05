Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572E14F3AC6
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Apr 2022 17:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237548AbiDELsG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 5 Apr 2022 07:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355435AbiDELOr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 5 Apr 2022 07:14:47 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FCC4D62E
        for <linux-fbdev@vger.kernel.org>; Tue,  5 Apr 2022 03:34:44 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 12so12909018oix.12
        for <linux-fbdev@vger.kernel.org>; Tue, 05 Apr 2022 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzmhcp5RxadQONeu9KvciYKiNgXbRJejI1iC090AVWg=;
        b=Ckyr/H4Efk9eg4/2J/KBC2fSKKkO3KzksdjLcY3RBSzT9NMCmfFcmXQP/tFtKO/470
         cq+ZnczUI9w3TuhLKpo/lVk0VJYzTyel84GgUrfYKCT9mv2hijbapBsI0e1FG7FrRJmb
         fLucT+sdtvHXDNR/H3K7C3fno1IoUuh9gjqUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzmhcp5RxadQONeu9KvciYKiNgXbRJejI1iC090AVWg=;
        b=sEBDq5QlTG8GJFMzLStbOVrzZUY4uc2uFt0bLw7EGuPpgqopfTIlR8YDEm48+WtX4C
         /VQFEz1SEEPCwcBDSXZfQ577/MCyWAZSDgzOeF3Ow34Okk2bkP0KydiUdGN18kUsqdc+
         DHStz+/TK49Vjd2LE5Y3b06zkvoJKSk2uPWnIpFQ8FJOAIklsozSHCUl6Epnq+703Caa
         dZy1CF9dRLZb1pUESVizkLR+zSqvTqKB8ht6McxxJ9fH6BSGlcgFXILwYemFEpBzuDOD
         BYDUxjE+x/ByUUgfZaZZieYnGXUV9YOY/NISu1XvOQVWvlWe+Tn/gzbkl4r3hBGxmVDq
         5AMA==
X-Gm-Message-State: AOAM531y9RxGypnUTCP61s1Hz+XSgTMix7okk5qozKRdGf/YJGYDUN0t
        oKxiFwZhYmHuaOL6kPR3CJUWzEfCqsyjfvGwae9wVw==
X-Google-Smtp-Source: ABdhPJzqoYVSx47i8TUU2SwXKC01iWiGjmQ1+pUIxIWzSlGlgOjCn7FBVo4L4bnb1FUmBmYZzaS59mRu1JbpVJ6Lf+k=
X-Received: by 2002:a05:6808:1596:b0:2f7:5d89:eec7 with SMTP id
 t22-20020a056808159600b002f75d89eec7mr1125899oiw.228.1649154883395; Tue, 05
 Apr 2022 03:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch> <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local> <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
 <408ffe9b-f09f-dc7e-7f5e-a93b311a06fa@redhat.com> <CAKMK7uHf6H8mhSm6eDHUruWK5Xc2cSPkJUX6v-jpeQfjS19dKw@mail.gmail.com>
 <e124af06-4f24-277a-543a-82b383f48cea@redhat.com>
In-Reply-To: <e124af06-4f24-277a-543a-82b383f48cea@redhat.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 5 Apr 2022 12:34:31 +0200
Message-ID: <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Zack Rusin <zackr@vmware.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilya Trukhanov <lahvuun@gmail.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Peter Jones <pjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 5 Apr 2022 at 11:52, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 4/5/22 11:24, Daniel Vetter wrote:
> > On Tue, 5 Apr 2022 at 11:19, Javier Martinez Canillas
>
> [snip]
>
> >>
> >> This is how I think that work, please let me know if you see something
> >> wrong in my logic:
> >>
> >> 1) A PCI device of OF device is registered for the GPU, this attempt to
> >>    match a registered driver but no driver was registered that match yet.
> >>
> >> 2) The efifb driver is built-in, will be initialized according to the link
> >>    order of the objects under drivers/video and the fbdev driver is registered.
> >>
> >>    There is no platform device or PCI/OF device registered that matches.
> >>
> >> 3) The DRM driver is built-in, will be initialized according to the link
> >>    order of the objects under drivers/gpu and the DRM driver is registered.
> >>
> >>    This matches the device registered in (1) and the DRM driver probes.
> >>
> >> 4) The DRM driver .probe kicks out any conflicting DRM drivers and pdev
> >>    before registering the DRM device.
> >>
> >>    There are no conflicting drivers or platform device at this point.
> >>
> >> 5) Latter at some point the drivers/firmware/sysfb.c init function is
> >>    executed, and this registers a platform device for the generic fb.
> >>
> >>    This device matches the efifb driver registered in (2) and the fbdev
> >>    driver probes.
> >>
> >>    Since that happens *after* the DRM driver already matched, probed
> >>    and registered the DRM device, that is a bug and what the reverted
> >>    patch worked around.
> >>
> >> So we need to prevent (5) if (1) and (3) already happened. Having a flag
> >> set in the fbdev core somewhere when remove_conflicting_framebuffers()
> >> is called could be a solution indeed.
> >>
> >> That is, the fbdev core needs to know that a DRM driver already probed
> >> and make register_framebuffer() fail if info->flag & FBINFO_MISC_FIRMWARE
> >>
> >> I can attempt to write a patch for that.
> >
> > Ah yeah that could be an issue. I think the right fix is to replace
> > the platform dev unregister with a sysfb_unregister() function in
> > sysfb.c, which is synced with a common lock with the sysfb_init
> > function and a small boolean. I think I can type that up quickly for
> > v3.
>
> It's more complicated than that since sysfb is just *one* of the several
> places where platform devices can be registered for video devices.
>
> For instance, the vga16fb driver registers its own platform device in
> its module_init() function so that can also happen after the conflicting
> framebuffers (and associated devices) were removed by a DRM driver probe.
>
> I tried to minimize the issue for that particular driver with commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0499f419b76f
>
> But the point stands, it all boils down to the fact that you have two
> different subsystems registering video drivers and they don't know all
> about each other to take a proper decision.
>
> Right now the drm_aperture_remove_conflicting_framebuffers() call signals
> in one direction from DRM to fbdev but there isn't a communication in the
> other direction, from fbdev to DRM.
>
> I believe the correct fix would be for the fbdev core to keep a list of
> the apertures struct that are passed to remove_conflicting_framebuffers(),
> that way it will know what apertures are not available anymore and prevent
> to register any fbdev framebuffer that conflicts with one already present.

Hm that still feels like reinventing a driver model, badly.

I think there's two cleaner solutions:
- move all the firmware driver platform_dev into sysfb.c, and then
just bind the special cases against that (e.g. offb, vga16fb and all
these). Then we'd have one sysfb_try_unregister(struct device *dev)
interface that fbmem.c uses.
- let fbmem.c call into each of these firmware device providers, which
means some loops most likely (like we can't call into vga16fb), so
probably need to move that into fbmem.c and it all gets a bit messy.

> Let me know if you think that makes sense and I can attempt to write a fix.

I still think unregistering the platform_dev properly makes the most
sense, and feels like the most proper linux device model solution
instead of hacks on top - if the firmware fb is unuseable because a
native driver has taken over, we should nuke that. And also the
firmware fb driver would then just bind to that platform_dev if it
exists, and only if it exists. Also I think it should be the
responsibility of whichever piece of code that registers these
platform devices to ensure that platform_dev actually still exists.
That's why I think pushing all that code into sysfb.c is probably the
cleanest solution.

fbdev predates all that stuff by a lot, hence the hand-rolling.

But maybe Greg has some more thoughts here too?
-Daniel

>
> --
> Best regards,
>
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
