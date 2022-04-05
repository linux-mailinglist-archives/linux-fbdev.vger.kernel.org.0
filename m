Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFEC94F4169
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Apr 2022 23:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbiDEPYy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 5 Apr 2022 11:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386953AbiDEPQX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 5 Apr 2022 11:16:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6760682333;
        Tue,  5 Apr 2022 06:33:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1205B81C6E;
        Tue,  5 Apr 2022 13:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331FFC385A4;
        Tue,  5 Apr 2022 13:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1649165600;
        bh=CBA2EAefza7sewFFjIzIq1z2XKbUW8pjGadNcSBPGto=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H2G1wKcKFDPYZULBTu+9yrvlg6EOforRHsWSf+0zypgQ6tkuCbI9ZUGGfT6iT47ci
         N/1V6LofCZLdmVERDu1rgsLQF6VO31znqXcDRODYDKG8NlioxCVLxFL/7AG1pe6k/6
         PUExOebafCkZo14vPKGWvidkW/+1Pb6uAQDzJJGg=
Date:   Tue, 5 Apr 2022 15:33:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Javier Martinez Canillas <javierm@redhat.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Zack Rusin <zackr@vmware.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilya Trukhanov <lahvuun@gmail.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Peter Jones <pjones@redhat.com>
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
Message-ID: <YkxFHUdm/YeiVY+D@kroah.com>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
 <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local>
 <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
 <408ffe9b-f09f-dc7e-7f5e-a93b311a06fa@redhat.com>
 <CAKMK7uHf6H8mhSm6eDHUruWK5Xc2cSPkJUX6v-jpeQfjS19dKw@mail.gmail.com>
 <e124af06-4f24-277a-543a-82b383f48cea@redhat.com>
 <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
 <CAMuHMdWr0L0r+MVU-=+_yeHKwK8BjF7_EJQxiJT5jMqS9FJUeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWr0L0r+MVU-=+_yeHKwK8BjF7_EJQxiJT5jMqS9FJUeQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Apr 05, 2022 at 03:24:40PM +0200, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Tue, Apr 5, 2022 at 1:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, 5 Apr 2022 at 11:52, Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> > > On 4/5/22 11:24, Daniel Vetter wrote:
> > > > On Tue, 5 Apr 2022 at 11:19, Javier Martinez Canillas
> > > >> This is how I think that work, please let me know if you see something
> > > >> wrong in my logic:
> > > >>
> > > >> 1) A PCI device of OF device is registered for the GPU, this attempt to
> > > >>    match a registered driver but no driver was registered that match yet.
> > > >>
> > > >> 2) The efifb driver is built-in, will be initialized according to the link
> > > >>    order of the objects under drivers/video and the fbdev driver is registered.
> > > >>
> > > >>    There is no platform device or PCI/OF device registered that matches.
> > > >>
> > > >> 3) The DRM driver is built-in, will be initialized according to the link
> > > >>    order of the objects under drivers/gpu and the DRM driver is registered.
> > > >>
> > > >>    This matches the device registered in (1) and the DRM driver probes.
> > > >>
> > > >> 4) The DRM driver .probe kicks out any conflicting DRM drivers and pdev
> > > >>    before registering the DRM device.
> > > >>
> > > >>    There are no conflicting drivers or platform device at this point.
> > > >>
> > > >> 5) Latter at some point the drivers/firmware/sysfb.c init function is
> > > >>    executed, and this registers a platform device for the generic fb.
> > > >>
> > > >>    This device matches the efifb driver registered in (2) and the fbdev
> > > >>    driver probes.
> > > >>
> > > >>    Since that happens *after* the DRM driver already matched, probed
> > > >>    and registered the DRM device, that is a bug and what the reverted
> > > >>    patch worked around.
> > > >>
> > > >> So we need to prevent (5) if (1) and (3) already happened. Having a flag
> > > >> set in the fbdev core somewhere when remove_conflicting_framebuffers()
> > > >> is called could be a solution indeed.
> > > >>
> > > >> That is, the fbdev core needs to know that a DRM driver already probed
> > > >> and make register_framebuffer() fail if info->flag & FBINFO_MISC_FIRMWARE
> > > >>
> > > >> I can attempt to write a patch for that.
> > > >
> > > > Ah yeah that could be an issue. I think the right fix is to replace
> > > > the platform dev unregister with a sysfb_unregister() function in
> > > > sysfb.c, which is synced with a common lock with the sysfb_init
> > > > function and a small boolean. I think I can type that up quickly for
> > > > v3.
> > >
> > > It's more complicated than that since sysfb is just *one* of the several
> > > places where platform devices can be registered for video devices.
> > >
> > > For instance, the vga16fb driver registers its own platform device in
> > > its module_init() function so that can also happen after the conflicting
> > > framebuffers (and associated devices) were removed by a DRM driver probe.
> > >
> > > I tried to minimize the issue for that particular driver with commit:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0499f419b76f
> > >
> > > But the point stands, it all boils down to the fact that you have two
> > > different subsystems registering video drivers and they don't know all
> > > about each other to take a proper decision.
> > >
> > > Right now the drm_aperture_remove_conflicting_framebuffers() call signals
> > > in one direction from DRM to fbdev but there isn't a communication in the
> > > other direction, from fbdev to DRM.
> > >
> > > I believe the correct fix would be for the fbdev core to keep a list of
> > > the apertures struct that are passed to remove_conflicting_framebuffers(),
> > > that way it will know what apertures are not available anymore and prevent
> > > to register any fbdev framebuffer that conflicts with one already present.
> >
> > Hm that still feels like reinventing a driver model, badly.
> >
> > I think there's two cleaner solutions:
> > - move all the firmware driver platform_dev into sysfb.c, and then
> > just bind the special cases against that (e.g. offb, vga16fb and all
> > these). Then we'd have one sysfb_try_unregister(struct device *dev)
> > interface that fbmem.c uses.
> > - let fbmem.c call into each of these firmware device providers, which
> > means some loops most likely (like we can't call into vga16fb), so
> > probably need to move that into fbmem.c and it all gets a bit messy.
> >
> > > Let me know if you think that makes sense and I can attempt to write a fix.
> >
> > I still think unregistering the platform_dev properly makes the most
> 
> That doesn't sound very driver-model-aware to me. The device is what
> the driver binds to; it does not cease to exist.

I agree, that sounds odd.

The device should always stick around (as the bus creates it), it's up
to the driver to bind to the device as needed.

> > sense, and feels like the most proper linux device model solution
> > instead of hacks on top - if the firmware fb is unuseable because a
> > native driver has taken over, we should nuke that. And also the
> > firmware fb driver would then just bind to that platform_dev if it
> > exists, and only if it exists. Also I think it should be the
> > responsibility of whichever piece of code that registers these
> > platform devices to ensure that platform_dev actually still exists.
> > That's why I think pushing all that code into sysfb.c is probably the
> > cleanest solution.
> 
> Can't you unbind the generic driver first, and bind the specific driver
> afterwards? Alike writing to sysfs unbind/driver_override/bind,
> but from code?

That too feels odd, what is so special about the fbdev code that the
normal driver functions do not work for them?  It shouldn't matter if
multiple subsystems register video devices, why can't we handle more
than one fb device?

thanks,

greg k-h
