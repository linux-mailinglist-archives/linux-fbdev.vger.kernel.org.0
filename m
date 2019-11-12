Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02216F9295
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Nov 2019 15:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKLObr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Nov 2019 09:31:47 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36291 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfKLObr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Nov 2019 09:31:47 -0500
Received: by mail-ot1-f68.google.com with SMTP id f10so14464801oto.3
        for <linux-fbdev@vger.kernel.org>; Tue, 12 Nov 2019 06:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=APYlBn4LTHO89hs47rgqnLkGOShadwleO0VkyeHX6bw=;
        b=Q2uAVe82aqSPRnToNF6tFcbNBpTse1Ha8OAnRonh6FL/a8WqaNvok/Y63US+8G4mm3
         +G6sgqy3m81ueBDAMCD+q94xs3EKa+ElBGCRt6pYHw39cgOij9OTQBPikb4/1h4ra12C
         LZMRQDI8fUIn1ErZeDvn6CencW9gt1bHZIPX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=APYlBn4LTHO89hs47rgqnLkGOShadwleO0VkyeHX6bw=;
        b=klJ6xSjZr2vmu8yJ6SaJ69rYQ/QY6tjoq15OZ+0AckBWRrxSU+mArM5Wbsy4VJd6Vl
         rRJHw64WG6W2Wh3XYb6+G6E7FMR8JituHlMLLLFujpWUVgvEzvN8ngKBQTKnHmmdf5h1
         eGxuom8gB8x2bEzVyRbESHCXJQEUJs0d0+OzM7n3nJrVCoki9Xx7T4z0wtsD4o4hWdwq
         Ne0/YqoN8BQI+mRgkT/94AX76k1P/SBVY/D9mZSR0USdNwD7CCR0AzbiKHbcmNIFlFMJ
         vHVTN3C9vizIIA5RbVmIhVILLcUMxZPnHetraSng6ZSCEf7GNOhLdGnGiH8Lo7QZAUGj
         LHeQ==
X-Gm-Message-State: APjAAAXPxTBXQ1I1dPeOjGcy2VC7usxUU/E720+DvxGH3FVVCtnork1/
        YUb69SA7i5L6FU8rHhXYVN3aJe4upOuABuW5OZHLjg==
X-Google-Smtp-Source: APXvYqzPx8i+5koNmIElg/zsr5FoA1NgNBlyfuPBAzyyH6/kp64ZYDygldVjOQbn5U2r+udnceYzkVwFH4IDlxb2Wfo=
X-Received: by 2002:a05:6830:22d0:: with SMTP id q16mr2441952otc.188.1573569105849;
 Tue, 12 Nov 2019 06:31:45 -0800 (PST)
MIME-Version: 1.0
References: <20191108123333.25274-1-tzimmermann@suse.de> <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org> <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
 <CAKMK7uF7M60NcPTGicQVJ=09pqf4ua4kWaCmdCcDaC13AgTFQw@mail.gmail.com> <6da6c49a-572a-343a-ddb1-103ca7080ccd@suse.de>
In-Reply-To: <6da6c49a-572a-343a-ddb1-103ca7080ccd@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 12 Nov 2019 15:31:33 +0100
Message-ID: <CAKMK7uHiXtg=FCpqv7ekpopd=2Hofrs7oR3qPNsf8e_E_Wv08w@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Nov 12, 2019 at 3:03 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 12.11.19 um 14:40 schrieb Daniel Vetter:
> > On Tue, Nov 12, 2019 at 12:55 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
> >>
> >> Hi
> >>
> >> Am 08.11.19 um 16:37 schrieb Noralf Tr=C3=B8nnes:
> >>>
> >>>
> >>> Den 08.11.2019 13.33, skrev Thomas Zimmermann:
> >>>> The udl driver can use the generic fbdev implementation. Convert it.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> ---
> >>>
> >>>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl=
_drv.c
> >>>> index 563cc5809e56..55c0f9dfee29 100644
> >>>> --- a/drivers/gpu/drm/udl/udl_drv.c
> >>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
> >>>
> >>>> @@ -47,6 +48,8 @@ static struct drm_driver driver =3D {
> >>>>      .driver_features =3D DRIVER_MODESET | DRIVER_GEM,
> >>>>      .release =3D udl_driver_release,
> >>>>
> >>>> +    .lastclose =3D drm_fb_helper_lastclose,
> >>>> +
> >>>
> >>> No need to set this, it's already wired up:
> >>>
> >>> drm_lastclose -> drm_client_dev_restore -> drm_fbdev_client_restore -=
>
> >>> drm_fb_helper_lastclose
> >>>
> >>>>      /* gem hooks */
> >>>>      .gem_create_object =3D udl_driver_gem_create_object,
> >>>>
> >>>
> >>>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_=
fb.c
> >>>> index f8153b726343..afe74f892a2b 100644
> >>>> --- a/drivers/gpu/drm/udl/udl_fb.c
> >>>> +++ b/drivers/gpu/drm/udl/udl_fb.c
> >>>> @@ -20,19 +20,9 @@
> >>>>
> >>>>  #include "udl_drv.h"
> >>>>
> >>>> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in =
jiffies */
> >>>> -
> >>>> -static int fb_defio =3D 0;  /* Optionally enable experimental fb_de=
fio mmap support */
> >>>>  static int fb_bpp =3D 16;
> >>>>
> >>>>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> >>>
> >>> Maybe fb_bpp can be dropped too?
> >>
> >> Sure, makes sense.
> >>
> >> The driver exposes a preferred color depth of 24 bpp, which we may wan=
t
> >> to change to 16 then. The internal framebuffer is only 16 bpp anyway.
> >
> > Just something that crossed my mind: Should we ensure that the
> > preferred format of the primary plane (should be the first in the
> > format array) matches up with the preferred bpp setting? Maybe even
> > enforce that for drivers with an explicit primary plane (i.e. atomic
> > drivers). I think tiny drivers get this right already.
>
> IMHO that makes if the userspace can handle it. The preferred bpp could
> also be retrieved from the formats array automatically. What about HW
> with multiple CRTCs with different format defaults (sounds weird, I know)=
?

Ime I haven't seen such a case yet. What I have seen is that the most
preferred format might be some fancy compressed format, which not all
formats support. But which you can't render into without mesa anyway,
so really doesn't matter for preferred bpp.

> WRT udl: For v3 of this patchset I've set the preferred color depth to
> 32 bpp; although the internal FB is always at 16 bpp. Because when I
> tested with a dual-screen setup (radeon + udl) X11 didn't support the 16
> bpp output on the second screen (the one driven by udl). Only setting
> both screen to 32 bpp worked out of the box. And the preferred 24 bpp
> are not even supported by udl.

Uh, if we can only set preferred bpp to make X happy, and X can only
support one preferred bpp, then everyone needs to set 32bit. Which
defeats the point (and we'd need to hardcode it to 32bpp). Is this
really the case?
-Daniel

>
> Best regards
> Thomas
>
> > -Daniel
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> It's possible to set it on the command line:
> >>>
> >>> video=3D<xres>x<yres>-<bpp>
> >>>
> >>> I haven't tried it so I can't say for certain that it actually works>
> >>> Ref: Documentation/fb/modedb.rst and drm_fb_helper_single_fb_probe()
> >>>
> >>>> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> >>>> -
> >>>
> >>>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl=
/udl_modeset.c
> >>>> index bc1ab6060dc6..1517d5e881b8 100644
> >>>> --- a/drivers/gpu/drm/udl/udl_modeset.c
> >>>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> >>>
> >>>> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *dev)
> >>>>
> >>>>  static const struct drm_mode_config_funcs udl_mode_funcs =3D {
> >>>>      .fb_create =3D udl_fb_user_fb_create,
> >>>> -    .output_poll_changed =3D NULL,
> >>>> +    .output_poll_changed =3D drm_fb_helper_output_poll_changed,
> >>>
> >>> No need to set this, it's already wired up:
> >>>
> >>> drm_kms_helper_hotplug_event -> drm_client_dev_hotplug ->
> >>> drm_fbdev_client_hotplug -> drm_fb_helper_hotplug_event
> >>>
> >>> Noralf.
> >>>
> >>>>  };
> >>>>
> >>>>  int udl_modeset_init(struct drm_device *dev)
> >>>>
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> >>
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
