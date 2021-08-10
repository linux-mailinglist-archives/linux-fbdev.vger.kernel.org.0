Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD55A3E5E60
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Aug 2021 16:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241917AbhHJOvL (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 10 Aug 2021 10:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241938AbhHJOt6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 10 Aug 2021 10:49:58 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D09C061798
        for <linux-fbdev@vger.kernel.org>; Tue, 10 Aug 2021 07:49:00 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id b25-20020a4ac2990000b0290263aab95660so5382008ooq.13
        for <linux-fbdev@vger.kernel.org>; Tue, 10 Aug 2021 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lsM74LGQdwKcOOf8FqPV9S8g1kidgq4fXYEQaQYkzBw=;
        b=gfH5nspkpPkuAmf0v8/++cM8edO2l0gEiNXFyf9Rme9pQjN2NGyTD3TRALfidXdofb
         xirSOeOw3Fhha/DgUX2GHODdBHhJaOz0tPdPDEdcskYvTvbK0m/NJbaiOMztzHtO0BfK
         6tlgFHt8FYHamLCAX+DUaw2rSnUqY0RaYQBWlbEWqwK8OVeLOZqZPUW/OrZBMPRh1+47
         LVaT/B03EYhlrYFKxwxH6ETGWGFY9CVNjmYV+oe56fRWwLF+lEwxVHiF0X+cvNG67USp
         IYKFBZisJjs0NKedNYjplvHaeJa31e2tlw9A9Y9zuct7hKetUUTKwkUhBPuFNuF5PYwh
         N4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lsM74LGQdwKcOOf8FqPV9S8g1kidgq4fXYEQaQYkzBw=;
        b=p9T/E5wLOExPBRP/c0tFjgmTkCdBbnY98XmfBqIkD4jjQf0HaEJriRGnHw+debrwy4
         JHGssXz+t/u+HWGjsEXrMD5X7+18DBY/oJlzTwwYX8kL7McRr958vvZehjj7DgRnHtPl
         NQf6QdH7q2HiFYwgn7UlIGW/x5r0uGelMf/XRPBRxpQuO8p6bSjHNtqJEAEKinzHuBq4
         7XSH1EByepCJNaB14YcjTq0Bwyk74UtzjSsf4ITK0EAl6+rOCWWHwQ85+QTqubBI/Krv
         PHghTskCTfpRMSFeQVeT8wD3DY+tOnqnU+o6jdWcJl99z8nJtJEnX/ltUfhD/MpOlukX
         4cQw==
X-Gm-Message-State: AOAM5322+HsoYpCX+/AsFqAumh4zrhbpdf48/YWqK+oIOQoxi/n2vZHN
        ISdcKJ6ZhBh3RHwWxdQZZQU38BuXgnIfq+hGKnI=
X-Google-Smtp-Source: ABdhPJzIAm+EOG6KiSLzJgnJqp+2NTOLJ4ifPln6rlixx8lUqfef4a5XWVDuiaB+Q2wFtfzSTt5pMnrHTfTA4D7uBiQ=
X-Received: by 2002:a4a:c989:: with SMTP id u9mr7092050ooq.61.1628606939631;
 Tue, 10 Aug 2021 07:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210802133551.1904964-1-imre.deak@intel.com> <20210809133146.2478382-1-imre.deak@intel.com>
 <20210810083629.GA2517380@ideak-desk.fi.intel.com>
In-Reply-To: <20210810083629.GA2517380@ideak-desk.fi.intel.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Aug 2021 10:48:48 -0400
Message-ID: <CADnq5_Pjz2gP2465S1aEzKMZXiSB2WqEPUdkpqh58XzJcKLu+g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] fbdev/efifb: Release PCI device's runtime
 PM ref during FB destroy
To:     Imre Deak <imre.deak@intel.com>
Cc:     "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Aug 10, 2021 at 4:36 AM Imre Deak <imre.deak@intel.com> wrote:
>
> Hi Kai-Heng, Alex,
>
> could you add your ack if the fix looks ok and you're ok if I push it to
> the i915 tree?
>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> Thanks,
> Imre
>
> On Mon, Aug 09, 2021 at 04:31:46PM +0300, Imre Deak wrote:
> > Atm the EFI FB platform driver gets a runtime PM reference for the
> > associated GFX PCI device during probing the EFI FB platform device and
> > releases it only when the platform device gets unbound.
> >
> > When fbcon switches to the FB provided by the PCI device's driver (for
> > instance i915/drmfb), the EFI FB will get only unregistered without the
> > EFI FB platform device getting unbound, keeping the runtime PM reference
> > acquired during the platform device probing. This reference will prevent
> > the PCI driver from runtime suspending the device.
> >
> > Fix this by releasing the RPM reference from the EFI FB's destroy hook,
> > called when the FB gets unregistered.
> >
> > While at it assert that pm_runtime_get_sync() didn't fail.
> >
> > v2:
> > - Move pm_runtime_get_sync() before register_framebuffer() to avoid its
> >   race wrt. efifb_destroy()->pm_runtime_put(). (Daniel)
> > - Assert that pm_runtime_get_sync() didn't fail.
> > - Clarify commit message wrt. platform/PCI device/driver and driver
> >   removal vs. device unbinding.
> >
> > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/video/fbdev/efifb.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > index 8ea8f079cde26..edca3703b9640 100644
> > --- a/drivers/video/fbdev/efifb.c
> > +++ b/drivers/video/fbdev/efifb.c
> > @@ -47,6 +47,8 @@ static bool use_bgrt = true;
> >  static bool request_mem_succeeded = false;
> >  static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
> >
> > +static struct pci_dev *efifb_pci_dev;        /* dev with BAR covering the efifb */
> > +
> >  static struct fb_var_screeninfo efifb_defined = {
> >       .activate               = FB_ACTIVATE_NOW,
> >       .height                 = -1,
> > @@ -243,6 +245,9 @@ static inline void efifb_show_boot_graphics(struct fb_info *info) {}
> >
> >  static void efifb_destroy(struct fb_info *info)
> >  {
> > +     if (efifb_pci_dev)
> > +             pm_runtime_put(&efifb_pci_dev->dev);
> > +
> >       if (info->screen_base) {
> >               if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
> >                       iounmap(info->screen_base);
> > @@ -333,7 +338,6 @@ ATTRIBUTE_GROUPS(efifb);
> >
> >  static bool pci_dev_disabled;        /* FB base matches BAR of a disabled device */
> >
> > -static struct pci_dev *efifb_pci_dev;        /* dev with BAR covering the efifb */
> >  static struct resource *bar_resource;
> >  static u64 bar_offset;
> >
> > @@ -569,17 +573,22 @@ static int efifb_probe(struct platform_device *dev)
> >               pr_err("efifb: cannot allocate colormap\n");
> >               goto err_groups;
> >       }
> > +
> > +     if (efifb_pci_dev)
> > +             WARN_ON(pm_runtime_get_sync(&efifb_pci_dev->dev) < 0);
> > +
> >       err = register_framebuffer(info);
> >       if (err < 0) {
> >               pr_err("efifb: cannot register framebuffer\n");
> > -             goto err_fb_dealoc;
> > +             goto err_put_rpm_ref;
> >       }
> >       fb_info(info, "%s frame buffer device\n", info->fix.id);
> > -     if (efifb_pci_dev)
> > -             pm_runtime_get_sync(&efifb_pci_dev->dev);
> >       return 0;
> >
> > -err_fb_dealoc:
> > +err_put_rpm_ref:
> > +     if (efifb_pci_dev)
> > +             pm_runtime_put(&efifb_pci_dev->dev);
> > +
> >       fb_dealloc_cmap(&info->cmap);
> >  err_groups:
> >       sysfs_remove_groups(&dev->dev.kobj, efifb_groups);
> > @@ -603,8 +612,6 @@ static int efifb_remove(struct platform_device *pdev)
> >       unregister_framebuffer(info);
> >       sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> >       framebuffer_release(info);
> > -     if (efifb_pci_dev)
> > -             pm_runtime_put(&efifb_pci_dev->dev);
> >
> >       return 0;
> >  }
> > --
> > 2.27.0
> >
