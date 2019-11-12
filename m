Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE61CF90D8
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Nov 2019 14:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfKLNlI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Nov 2019 08:41:08 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33136 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbfKLNlI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Nov 2019 08:41:08 -0500
Received: by mail-ot1-f65.google.com with SMTP id u13so14315259ote.0
        for <linux-fbdev@vger.kernel.org>; Tue, 12 Nov 2019 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WEtD4NUsNII9Q5Y5URDwxzsb3Zvwk1zRHFdwetuuY/U=;
        b=CGVqN/929T51ir6AFCMC33cfbZ4w6S/tP81VFFe0MW1RydZkWuJdoXLKakHm7OEwyx
         nqa6sUdfU4r0gfK+LReWvmh84u4ullxuUs+Tx2sWIw6Bt6KFnXDL5OBcTQZD1QHzTcO9
         QciaedqtTV/vcOlot/6LPDm0e6J/u9KXNjL1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WEtD4NUsNII9Q5Y5URDwxzsb3Zvwk1zRHFdwetuuY/U=;
        b=UzYRTBFT3PFL8JU5gzL4SJP+JE02wED40pN5wpJ60fKrksaui3ft8cH7ZZyMYrMGIJ
         BRhld6ug3sW+7n/AX3ULd4dWpiETTINEjPp/Ci3K9DeLPuEAGfjA0jWuwFKN59QWI3Xt
         4TqG5HOAeNO/7ZH7vpIznq4iRr9FGsjUtOZsA3GKA8tE/yBEs6971Y0OENDqYS1LFMqY
         yZP8hRGOTdeHYUt7ZhgSsnvnDNe0x/nFSMUJJPv/y4VX1WovSN7YRi6AkcVG0A511bUf
         cCEiqGBlxF2w97F3C/WjKdG443v1LHaztFD3BL/IE2E+KzxAaOsZEAsUSXIGdcTPo18Z
         q4MQ==
X-Gm-Message-State: APjAAAUHGDUpDiXFBGswTuslHcNbKXWVCtENrwSeO1aEY9uC+FBLppB1
        l/sQnp1ETUhooiHkgstALbG8XIZCJ8P1DrnbCp2rnA==
X-Google-Smtp-Source: APXvYqz+trtRVvHuGhYuXNRd23JUvGyCZ5uPJlMHc9VjEKibVDcUhTyYPCQEbZ+1L3TP3/vpVDew2g3nlMoCBXcE1Eo=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr26098625otf.204.1573566065828;
 Tue, 12 Nov 2019 05:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20191108123333.25274-1-tzimmermann@suse.de> <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org> <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
In-Reply-To: <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 12 Nov 2019 14:40:54 +0100
Message-ID: <CAKMK7uF7M60NcPTGicQVJ=09pqf4ua4kWaCmdCcDaC13AgTFQw@mail.gmail.com>
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

On Tue, Nov 12, 2019 at 12:55 PM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> Am 08.11.19 um 16:37 schrieb Noralf Tr=C3=B8nnes:
> >
> >
> > Den 08.11.2019 13.33, skrev Thomas Zimmermann:
> >> The udl driver can use the generic fbdev implementation. Convert it.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >
> >> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_d=
rv.c
> >> index 563cc5809e56..55c0f9dfee29 100644
> >> --- a/drivers/gpu/drm/udl/udl_drv.c
> >> +++ b/drivers/gpu/drm/udl/udl_drv.c
> >
> >> @@ -47,6 +48,8 @@ static struct drm_driver driver =3D {
> >>      .driver_features =3D DRIVER_MODESET | DRIVER_GEM,
> >>      .release =3D udl_driver_release,
> >>
> >> +    .lastclose =3D drm_fb_helper_lastclose,
> >> +
> >
> > No need to set this, it's already wired up:
> >
> > drm_lastclose -> drm_client_dev_restore -> drm_fbdev_client_restore ->
> > drm_fb_helper_lastclose
> >
> >>      /* gem hooks */
> >>      .gem_create_object =3D udl_driver_gem_create_object,
> >>
> >
> >> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb=
.c
> >> index f8153b726343..afe74f892a2b 100644
> >> --- a/drivers/gpu/drm/udl/udl_fb.c
> >> +++ b/drivers/gpu/drm/udl/udl_fb.c
> >> @@ -20,19 +20,9 @@
> >>
> >>  #include "udl_drv.h"
> >>
> >> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in ji=
ffies */
> >> -
> >> -static int fb_defio =3D 0;  /* Optionally enable experimental fb_defi=
o mmap support */
> >>  static int fb_bpp =3D 16;
> >>
> >>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> >
> > Maybe fb_bpp can be dropped too?
>
> Sure, makes sense.
>
> The driver exposes a preferred color depth of 24 bpp, which we may want
> to change to 16 then. The internal framebuffer is only 16 bpp anyway.

Just something that crossed my mind: Should we ensure that the
preferred format of the primary plane (should be the first in the
format array) matches up with the preferred bpp setting? Maybe even
enforce that for drivers with an explicit primary plane (i.e. atomic
drivers). I think tiny drivers get this right already.
-Daniel

>
> Best regards
> Thomas
>
> >
> > It's possible to set it on the command line:
> >
> > video=3D<xres>x<yres>-<bpp>
> >
> > I haven't tried it so I can't say for certain that it actually works>
> > Ref: Documentation/fb/modedb.rst and drm_fb_helper_single_fb_probe()
> >
> >> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> >> -
> >
> >> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/u=
dl_modeset.c
> >> index bc1ab6060dc6..1517d5e881b8 100644
> >> --- a/drivers/gpu/drm/udl/udl_modeset.c
> >> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> >
> >> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *dev)
> >>
> >>  static const struct drm_mode_config_funcs udl_mode_funcs =3D {
> >>      .fb_create =3D udl_fb_user_fb_create,
> >> -    .output_poll_changed =3D NULL,
> >> +    .output_poll_changed =3D drm_fb_helper_output_poll_changed,
> >
> > No need to set this, it's already wired up:
> >
> > drm_kms_helper_hotplug_event -> drm_client_dev_hotplug ->
> > drm_fbdev_client_hotplug -> drm_fb_helper_hotplug_event
> >
> > Noralf.
> >
> >>  };
> >>
> >>  int udl_modeset_init(struct drm_device *dev)
> >>
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
