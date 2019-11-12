Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AED2F93C8
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Nov 2019 16:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfKLPNl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Nov 2019 10:13:41 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33337 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfKLPNl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Nov 2019 10:13:41 -0500
Received: by mail-ot1-f65.google.com with SMTP id u13so14596263ote.0
        for <linux-fbdev@vger.kernel.org>; Tue, 12 Nov 2019 07:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iLQQASb9QC5/Vcdf619lJ2+ZQUw9yenHcwVrrWAm/ZI=;
        b=H0HE+4kBowc14JIW6ER4XqlYJR58Ryg8OxWD1ASeNyW0kRZwCvy5VkmDHxBxJ+VguR
         6NtEvquAGHSrFV2dfFQwIaqjGl8EvH/AJXoG4xF02gG7dAsS/wV9RFzgJzbGOsal6NWI
         rXx8iymKx0B22BRAUsjPXjlcCgRnMjitVHXdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iLQQASb9QC5/Vcdf619lJ2+ZQUw9yenHcwVrrWAm/ZI=;
        b=OApmuicSttSLUB64/PTQqnulfBn0btDR7hNST+CppY4f6NqK5AZr33iBYWv95DDmRk
         4JaqJkJLyrHPzY2InQeFn7oAV7pG5+mYfPLNGwwEbhZdiCsZwNRyNF3SCfFl0f/5pZD0
         DeWTKmiv31NaG9okcxYdcsz0fS2wZZe+x9iHHjcWbm6dZjhu4I1e/RxupFQTb3IFgiuA
         VDZ7yLPkJvrEnSHoP1PAO6I1n4Ckk//lYea7/fXdQjL/DodYJdK8AXTQVQSDpCTSWHnI
         1oy9sHcn6lUeAkzlKpn9f169ggeIw9IbIVQ82y8HUbzZeAO7JKIoVfHR8DM3vCv7a31T
         Zhmg==
X-Gm-Message-State: APjAAAUi5uViCesSbAiFEot5HXPbka0UMOycUdemUSntQnwbT4jRFpVg
        TFE/AtinuF4OymEtPCDtta/hNqroUBdDV+JywNKUTQ==
X-Google-Smtp-Source: APXvYqz+GErdPzq32E/E7yOfEweEEIW7C4lShBKaCAx1NJb//BdYYwmO7RSGNuYFM53C9DDgb4a940DVlJ4vj2Sc88M=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr26452751otf.204.1573571619959;
 Tue, 12 Nov 2019 07:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20191108123333.25274-1-tzimmermann@suse.de> <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org> <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
 <CAKMK7uF7M60NcPTGicQVJ=09pqf4ua4kWaCmdCcDaC13AgTFQw@mail.gmail.com>
 <6da6c49a-572a-343a-ddb1-103ca7080ccd@suse.de> <CAKMK7uHiXtg=FCpqv7ekpopd=2Hofrs7oR3qPNsf8e_E_Wv08w@mail.gmail.com>
 <052a2dd7-9a18-bf0b-7b7f-3396cc5c0dcf@suse.de>
In-Reply-To: <052a2dd7-9a18-bf0b-7b7f-3396cc5c0dcf@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 12 Nov 2019 16:13:27 +0100
Message-ID: <CAKMK7uH_0KC5rh3YhHaoBK4xfK=GMqrs61mA6ZFzq0-EdM6BGw@mail.gmail.com>
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

On Tue, Nov 12, 2019 at 3:51 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 12.11.19 um 15:31 schrieb Daniel Vetter:
> > On Tue, Nov 12, 2019 at 3:03 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>
> >> Hi
> >>
> >> Am 12.11.19 um 14:40 schrieb Daniel Vetter:
> >>> On Tue, Nov 12, 2019 at 12:55 PM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> Am 08.11.19 um 16:37 schrieb Noralf Tr=C3=B8nnes:
> >>>>>
> >>>>>
> >>>>> Den 08.11.2019 13.33, skrev Thomas Zimmermann:
> >>>>>> The udl driver can use the generic fbdev implementation. Convert i=
t.
> >>>>>>
> >>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>> ---
> >>>>>
> >>>>>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/u=
dl_drv.c
> >>>>>> index 563cc5809e56..55c0f9dfee29 100644
> >>>>>> --- a/drivers/gpu/drm/udl/udl_drv.c
> >>>>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
> >>>>>
> >>>>>> @@ -47,6 +48,8 @@ static struct drm_driver driver =3D {
> >>>>>>      .driver_features =3D DRIVER_MODESET | DRIVER_GEM,
> >>>>>>      .release =3D udl_driver_release,
> >>>>>>
> >>>>>> +    .lastclose =3D drm_fb_helper_lastclose,
> >>>>>> +
> >>>>>
> >>>>> No need to set this, it's already wired up:
> >>>>>
> >>>>> drm_lastclose -> drm_client_dev_restore -> drm_fbdev_client_restore=
 ->
> >>>>> drm_fb_helper_lastclose
> >>>>>
> >>>>>>      /* gem hooks */
> >>>>>>      .gem_create_object =3D udl_driver_gem_create_object,
> >>>>>>
> >>>>>
> >>>>>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/ud=
l_fb.c
> >>>>>> index f8153b726343..afe74f892a2b 100644
> >>>>>> --- a/drivers/gpu/drm/udl/udl_fb.c
> >>>>>> +++ b/drivers/gpu/drm/udl/udl_fb.c
> >>>>>> @@ -20,19 +20,9 @@
> >>>>>>
> >>>>>>  #include "udl_drv.h"
> >>>>>>
> >>>>>> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay i=
n jiffies */
> >>>>>> -
> >>>>>> -static int fb_defio =3D 0;  /* Optionally enable experimental fb_=
defio mmap support */
> >>>>>>  static int fb_bpp =3D 16;
> >>>>>>
> >>>>>>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> >>>>>
> >>>>> Maybe fb_bpp can be dropped too?
> >>>>
> >>>> Sure, makes sense.
> >>>>
> >>>> The driver exposes a preferred color depth of 24 bpp, which we may w=
ant
> >>>> to change to 16 then. The internal framebuffer is only 16 bpp anyway=
.
> >>>
> >>> Just something that crossed my mind: Should we ensure that the
> >>> preferred format of the primary plane (should be the first in the
> >>> format array) matches up with the preferred bpp setting? Maybe even
> >>> enforce that for drivers with an explicit primary plane (i.e. atomic
> >>> drivers). I think tiny drivers get this right already.
> >>
> >> IMHO that makes if the userspace can handle it. The preferred bpp coul=
d
> >> also be retrieved from the formats array automatically. What about HW
> >> with multiple CRTCs with different format defaults (sounds weird, I kn=
ow)?
> >
> > Ime I haven't seen such a case yet. What I have seen is that the most
> > preferred format might be some fancy compressed format, which not all
> > formats support. But which you can't render into without mesa anyway,
> > so really doesn't matter for preferred bpp.
> >
> >> WRT udl: For v3 of this patchset I've set the preferred color depth to
> >> 32 bpp; although the internal FB is always at 16 bpp. Because when I
> >> tested with a dual-screen setup (radeon + udl) X11 didn't support the =
16
> >> bpp output on the second screen (the one driven by udl). Only setting
> >> both screen to 32 bpp worked out of the box. And the preferred 24 bpp
> >> are not even supported by udl.
> >
> > Uh, if we can only set preferred bpp to make X happy, and X can only
> > support one preferred bpp, then everyone needs to set 32bit. Which
> > defeats the point (and we'd need to hardcode it to 32bpp). Is this
> > really the case?
>
> I guess it would have worked if both screens preferred 16 bpp.

Just noticed that current depth is 24 bpp ... does that work with
current X? If not I think we should actually set it to 16 bpp, and fix
up X. Not as in "make it handle multi-bpp", that's too hard, but make
it pick a common format that works for all drivers (which usually
means go with 32bpp). Since if we just go with 32bpp to paper over X,
then the preferred bpp uapi becomes meaningless.
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
> >>> -Daniel
> >>>
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>>
> >>>>> It's possible to set it on the command line:
> >>>>>
> >>>>> video=3D<xres>x<yres>-<bpp>
> >>>>>
> >>>>> I haven't tried it so I can't say for certain that it actually work=
s>
> >>>>> Ref: Documentation/fb/modedb.rst and drm_fb_helper_single_fb_probe(=
)
> >>>>>
> >>>>>> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP=
);
> >>>>>> -
> >>>>>
> >>>>>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/u=
dl/udl_modeset.c
> >>>>>> index bc1ab6060dc6..1517d5e881b8 100644
> >>>>>> --- a/drivers/gpu/drm/udl/udl_modeset.c
> >>>>>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> >>>>>
> >>>>>> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *de=
v)
> >>>>>>
> >>>>>>  static const struct drm_mode_config_funcs udl_mode_funcs =3D {
> >>>>>>      .fb_create =3D udl_fb_user_fb_create,
> >>>>>> -    .output_poll_changed =3D NULL,
> >>>>>> +    .output_poll_changed =3D drm_fb_helper_output_poll_changed,
> >>>>>
> >>>>> No need to set this, it's already wired up:
> >>>>>
> >>>>> drm_kms_helper_hotplug_event -> drm_client_dev_hotplug ->
> >>>>> drm_fbdev_client_hotplug -> drm_fb_helper_hotplug_event
> >>>>>
> >>>>> Noralf.
> >>>>>
> >>>>>>  };
> >>>>>>
> >>>>>>  int udl_modeset_init(struct drm_device *dev)
> >>>>>>
> >>>>
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >>>> (HRB 36809, AG N=C3=BCrnberg)
> >>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> >>>>
> >>>
> >>>
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
