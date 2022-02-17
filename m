Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5B04BA2F4
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Feb 2022 15:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbiBQO24 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Feb 2022 09:28:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiBQO24 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Feb 2022 09:28:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3971B7C6;
        Thu, 17 Feb 2022 06:28:36 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id e5so10309593lfr.9;
        Thu, 17 Feb 2022 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=4MKpLBniRMlqG6xVPFK9q4G3y/c7z5bTRHjFHWC+P4E=;
        b=Uy6d1+1v/EBtwZzJi39zq3TyOxWSyR5iHwV6iO3mImOW3+vwe7WoqrcF0u+1PjyrqH
         zl9e3aull8w4Ztz/ojHp9VbbrkRCD15XGgtmmJs1u978PpPS0bFBxd1hk03dN0De0Ynl
         DQ33PEczicbd8IkN3LmgBMKKr5Nyvl4pb84hCqpAWybhC069Q1xNMehx/K4x1ImB82c5
         d2M6hGvhDYHodFJwGk7rQRJPl6AALxC0tjE33QwNN3yCiY8WPzQGSwlAQdvqWLzLCHv8
         RwozCIkbe9r1pDi0kOpy/ucbtLVeElwjXzKDPK0jrtS6oFJ516nkqnQjy+ja4H/Jygyx
         PXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=4MKpLBniRMlqG6xVPFK9q4G3y/c7z5bTRHjFHWC+P4E=;
        b=AY6iaE/kR6Yw5bPXFrdM918MLvhVhiix4tqFnoAiEDajS/Ya1MS/5qy2UpsN9HdFYR
         XO+rsnalrHm1NlJ0DK1fcIE5W34silnp9ou1oPtGNd4e9jhq+A4SwgYsI0h3rKypIIQi
         MN1Zs2WVq3bKbu/f+MqpoFfjX9J3/3rQDiwj0qj7zj3Mxxrw6U+ZRfO9uzBRhCR7GLsK
         YFZ50BjlsiRhicXDdOmeKTRq4wzOpZZW118n9sO/Wk9MEOaAgXSctAU3LSEQCizBgNXw
         nANYVb3bN8XnrjvcGljcPH60cvb2JkfAIvKZhLIcVl7ITr3iDZ2pL+NJiHYFl5Lp2lBl
         YeWQ==
X-Gm-Message-State: AOAM530Jd8/WOVNW5GGKyH9kxRwUimPO3wFOELKtYFvOUOdZUi6VRORX
        QG2VicpTN/kj9CAL2iTUY2E=
X-Google-Smtp-Source: ABdhPJz/W8nv0L2P36NgY3LW3RvMJOTOdlfzWd7ykJLCxUVZUhimcLIF83QfvVzC1IMQ/NgU+wmilQ==
X-Received: by 2002:ac2:528c:0:b0:443:58fe:f154 with SMTP id q12-20020ac2528c000000b0044358fef154mr2202421lfm.598.1645108114989;
        Thu, 17 Feb 2022 06:28:34 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id f21sm1562023ljn.76.2022.02.17.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 06:28:34 -0800 (PST)
Date:   Thu, 17 Feb 2022 16:28:23 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/8] drm/fourcc: Add DRM_FORMAT_D1
Message-ID: <20220217162823.050d5f17@eldfell>
In-Reply-To: <CAMuHMdXf3tFLb16Y=wh5C3QUYN4PdCjaYPCzMOTCye-eYS-N8w@mail.gmail.com>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
        <20220215165226.2738568-9-geert@linux-m68k.org>
        <20220217121033.0fc7f6ba@eldfell>
        <CAMuHMdXf3tFLb16Y=wh5C3QUYN4PdCjaYPCzMOTCye-eYS-N8w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nF0r/04lkj2eLx2H.hlGio4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

--Sig_/nF0r/04lkj2eLx2H.hlGio4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Feb 2022 11:42:29 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Pekka,
>=20
> On Thu, Feb 17, 2022 at 11:10 AM Pekka Paalanen <ppaalanen@gmail.com> wro=
te:
> > On Tue, 15 Feb 2022 17:52:26 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote: =20
> > > Introduce a fourcc code for a single-channel frame buffer format with=
 two
> > > darkness levels.  This can be used for two-level dark-on-light displa=
ys.
> > >
> > > As the number of bits per pixel is less than eight, this relies on
> > > proper block handling for the calculation of bits per pixel and pitch.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org> =20
>=20
> > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > @@ -151,6 +151,8 @@ const struct drm_format_info *__drm_format_info(u=
32 format)
> > >               { .format =3D DRM_FORMAT_C4,              .depth =3D 4,=
  .num_planes =3D 1,
> > >                 .char_per_block =3D { 1, }, .block_w =3D { 2, }, .blo=
ck_h =3D { 1, }, .hsub =3D 1, .vsub =3D 1 },
> > >               { .format =3D DRM_FORMAT_C8,              .depth =3D 8,=
  .num_planes =3D 1, .cpp =3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> > > +             { .format =3D DRM_FORMAT_D1,              .depth =3D 1,=
  .num_planes =3D 1,
> > > +               .char_per_block =3D { 1, }, .block_w =3D { 8, }, .blo=
ck_h =3D { 1, }, .hsub =3D 1, .vsub =3D 1 },
> > >               { .format =3D DRM_FORMAT_R1,              .depth =3D 1,=
  .num_planes =3D 1,
> > >                 .char_per_block =3D { 1, }, .block_w =3D { 8, }, .blo=
ck_h =3D { 1, }, .hsub =3D 1, .vsub =3D 1 },
> > >               { .format =3D DRM_FORMAT_R2,              .depth =3D 2,=
  .num_planes =3D 1,
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fou=
rcc.h
> > > index 8605a1acc6813e6c..c15c6efcc65e5827 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -104,6 +104,9 @@ extern "C" {
> > >  #define DRM_FORMAT_C4                fourcc_code('C', '4', ' ', ' ')=
 /* [3:0] C */
> > >  #define DRM_FORMAT_C8                fourcc_code('C', '8', ' ', ' ')=
 /* [7:0] C */
> > >
> > > +/* 1 bpp Darkness */
> > > +#define DRM_FORMAT_D1                fourcc_code('D', '1', ' ', ' ')=
 /* [0] D */
> > > + =20
> >
> > the same comment here as for C1 and R1 formats, need to specify pixel
> > ordering inside a byte. =20
>=20
> Right, will do.

Btw. does endianess of anything have any effect on these pixel formats?

That's probably a weird question, but I recall Pixman (the pixel
handling library of the X server nowadays known as Xorg) having pixel
formats where CPU endianess affects whether the first pixel in a byte
is found at the MSB or LSB.

> > I think it would also be good to explain the rationale why C1 and R1
> > are not suitable for this case and we need yet another 1-bit format in
> > the commit message.
> >
> > For posterity, of course. I roughly remember the discussions. =20
>=20
> C1 is color-indexed, which can be any two colors.
> R1 is light-on-dark.
> D1 is dark-on-light.
>=20
> > I also wonder if anyone would actually use D1. Should it be added
> > anyway? There is no rule that a pixel format must be used inside the
> > kernel AFAIK, but is there even a prospective userspace wanting this?
> >
> > Exposing R1 and inverting bits while copying to hardware might be
> > enough? =20
>=20
> That's an option.  The repaper driver does that:
>=20
>     drm_fb_xrgb8888_to_gray8(buf, 0, cma_obj->vaddr, fb, &clip);
>     repaper_gray8_to_mono_reversed(buf, fb->width, fb->height);
>=20
> Can drm_framebuffer objects be backed by graphics memory, i.e.
> can they be displayed without copying?

Yes, they can. That is actually their primary purpose. So the invert
bits approach only works with drivers that need to manually shovel the
data, but not with direct hardware scanout.

D1 might be useful on hardware that:
- can scanout the buffer directly, and
- does not have an optional inverter in its hardware pipeline, and
- does not benefit from a shadow buffer.

Do you happen to know any that fits the description?


Thanks,
pq

--Sig_/nF0r/04lkj2eLx2H.hlGio4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIOW4cACgkQI1/ltBGq
qqcovw//d/aAaCnYydXVNuiEcQVH+irHPcaqSE0I2UfelKYQCaUPq8wc98P3Izji
Gv4dhy3bbtwnT0q2wWNCsEhuBFRs23upZlFqZdxhqx2XM4kLIs4vspYMa5N3om8v
BhkHXftAQy51fA5lHOe7DYf07lgDMWDezRrqZ2kSr+b4CNdsJPiJ4lgMnWGRu1SO
92wBcdJNVm7bFb9qbVQiSitNr74ONQ7qS2AG5Z2nwLyzgvbZLg0+42+BL5IOxHGc
42vg4ds95UljaSPMCgFiIQpnTUwHkLiSDhMkXdoZbeNaq8CmfajMC0NNYrlo6E9i
thk0s7zgYoXVUuc0SyLhx9K7NyAWewOlvdGaKBscDTRcAjuGuvQrZJh108R2c+my
RG/WIR8flX9Ki3mDzEpHmKYZ1WhYAp2Cus4/IbsM4isKLf8Vt+Fl0cqzUv3jBX7p
wi2bdDTBxdLOlcUpk8ENyAFm99J5TuGOndHqPSvebuEjuGJJ96TD3pVZ6pIRe8UQ
PB1PyTUyaW4Z21oPFVQN2NFsD9d3tQHOtVXQ8tiKbp9BO0pPKGtF4pr2HUzUT6eg
exzQe6QATZTsTlzQZMh+oy6O0QZKNjPF09BTONL4I+jHMrRWgjWNgjSKCP7F0BsI
1pNlnW+CMUjRvTLEPe6Bh0f2rX/TFu1XTenp1t+7QjTmDkj8PYk=
=FgZf
-----END PGP SIGNATURE-----

--Sig_/nF0r/04lkj2eLx2H.hlGio4--
