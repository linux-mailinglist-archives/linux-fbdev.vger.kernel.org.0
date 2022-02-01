Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3679D4A5AF3
	for <lists+linux-fbdev@lfdr.de>; Tue,  1 Feb 2022 12:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbiBALOA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 1 Feb 2022 06:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbiBALN7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 1 Feb 2022 06:13:59 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59005C061714;
        Tue,  1 Feb 2022 03:13:59 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id k13so772469lfg.9;
        Tue, 01 Feb 2022 03:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=ZLYZfziVY8pFIn1AwlQRyIsot8ffWyZ6aY97MmqYPzA=;
        b=A1mXrWYeowDBUt8KZk4/ZUX0bARtJRkY7vu0JsIKVdSqPM1XFiZkvJm6qaBKFEPWaR
         IVmyKFdpCPfyl9D0Ym68nl0gprAyQqbew0ZJJPLeT2t9m9CoEIy07EW57kJ8zle8HJjc
         PLil9LfZVFUVm9axV33gEKG1L2uZgzt/dk7TN2RU0y5/1rqPLTx39z0lBJmHDk+k+CGP
         O5iDgGDnFldkqGxHOWfkNVYErACZv96QSjizeSD5w6MitJDNB5eNSM9uRQ4UE+ROfH5O
         bWZq2kUrcRQsP+EFFhdeGRouSMLCl6iFGIdP5vO6fuqDVJXyosD9rNzkUf53ZoKfYgqC
         YTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=ZLYZfziVY8pFIn1AwlQRyIsot8ffWyZ6aY97MmqYPzA=;
        b=wx2OGlYomXwyo38YghGE0WZYjjTM5NZ8K6P7PT/iyLrEhPby4AC+viAkKgaN6U8Kuu
         VcPQq0LOIYBYiu8S90hpBvbdihmE8jdqm3U43JBlnzgwbxfOr3vTKAxsrH3VhrVurL1T
         4KQFxmpVE+rcvINOoHgq3L20b8bvu8VwSBcT6qmTGSu3uEk0ZZpq4ILiJFxfsyfyFohq
         o6ZBrtMElLxrafmzJlPE3getGS5T6gqNnIfiJRSziVWiYWMiui4aX2740LHrUcaiw7ad
         z/NetrZ3yh8cB6B4aBN4vtKjyW8jtTcJ38vKDF176Ljt4apua4Ss2MyA+677Rij/v7Y2
         kg5A==
X-Gm-Message-State: AOAM530h7WEF75q+kKf8tKF/SRPZeYIqxU03ytG9oJmDGLajlFRKFrnw
        LPO5b+zWXeIBvIMTlJjsDyk=
X-Google-Smtp-Source: ABdhPJwHcLQnCeVCs6tFlKt2rjNiLnX1ifC0fhaynlqlF+0iVAOqMHmfof1sASzTBbfiBNi4WcUNXA==
X-Received: by 2002:a05:6512:e86:: with SMTP id bi6mr19223352lfb.321.1643714037544;
        Tue, 01 Feb 2022 03:13:57 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id f22sm4033821lfj.261.2022.02.01.03.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 03:13:57 -0800 (PST)
Date:   Tue, 1 Feb 2022 13:13:54 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/format-helper: Add
 drm_fb_gray8_to_mono_reversed()
Message-ID: <20220201131354.26ccae23@eldfell>
In-Reply-To: <e52560f0-bd0c-b51b-af1b-bd4be2df8702@suse.de>
References: <20220131201225.2324984-1-javierm@redhat.com>
        <20220131201225.2324984-3-javierm@redhat.com>
        <e52560f0-bd0c-b51b-af1b-bd4be2df8702@suse.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wm1.Z9QEq88r=0UglNQ17h8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

--Sig_/Wm1.Z9QEq88r=0UglNQ17h8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Feb 2022 10:59:43 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 31.01.22 um 21:12 schrieb Javier Martinez Canillas:
> > Add support to convert 8-bit grayscale to reversed monochrome for drive=
rs
> > that control monochromatic displays, that only have 1 bit per pixel dep=
th.
> >=20
> > This helper function was based on repaper_gray8_to_mono_reversed() from
> > the drivers/gpu/drm/tiny/repaper.c driver. =20
>=20
> You could convert repaper to the new helper.
>=20
> >=20
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> >=20
> >   drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++++++++++++++
> >   include/drm/drm_format_helper.h     |  2 ++
> >   2 files changed, 37 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_=
format_helper.c
> > index 0f28dd2bdd72..bf477c136082 100644
> > --- a/drivers/gpu/drm/drm_format_helper.c
> > +++ b/drivers/gpu/drm/drm_format_helper.c
> > @@ -584,3 +584,38 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned i=
nt dst_pitch, uint32_t dst_for
> >   	return -EINVAL;
> >   }
> >   EXPORT_SYMBOL(drm_fb_blit_toio);
> > +
> > +/**
> > + * drm_fb_gray8_to_mono_reversed - Convert grayscale to reversed monoc=
hrome
> > + * @dst: reversed monochrome destination buffer
> > + * @src: 8-bit grayscale source buffer
> > + * @clip: Clip rectangle area to copy
> > + *
> > + * DRM doesn't have native monochrome or grayscale support.
> > + * Such drivers can announce the commonly supported XR24 format to use=
rspace
> > + * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then=
 this
> > + * helper function to convert to the native format.
> > + */
> > +void drm_fb_gray8_to_mono_reversed(void *dst, void *src, const struct =
drm_rect *clip) =20
>=20
> IMHO it would be better to have a function that converts xrgb8888 to=20
> mono and let it handle the intermediate step of gray8.
>=20
> > +{
> > +	size_t width =3D drm_rect_width(clip);
> > +	size_t height =3D drm_rect_width(clip);
> > +
> > +	u8 *mono =3D dst, *gray8 =3D src;
> > +	unsigned int y, xb, i;
> > +
> > +	for (y =3D 0; y < height; y++)
> > +		for (xb =3D 0; xb < width / 8; xb++) { =20
>=20
> The inner loop should probably go into a separate helper function. See=20
> the drm_fb_*_line() helpers in this file
>=20
> At some point, we's want to have a single blit helper that takes source=20
> and destination formats/buffers. It would then pick the correct per-line=
=20
> helper for the conversion. So yeah, we'd want something composable.

Btw. VKMS is going to do blending, and it needs to support various
formats, so the latest patches from Igor probably do something similar.


Thanks,
pq


>=20
> Best regards
> Thomas
>=20
> > +			u8 byte =3D 0x00;
> > +
> > +			for (i =3D 0; i < 8; i++) {
> > +				int x =3D xb * 8 + i;
> > +
> > +				byte >>=3D 1;
> > +				if (gray8[y * width + x] >> 7)
> > +					byte |=3D BIT(7);
> > +			}
> > +			*mono++ =3D byte;
> > +		}
> > +}
> > +EXPORT_SYMBOL(drm_fb_gray8_to_mono_reversed);

--Sig_/Wm1.Z9QEq88r=0UglNQ17h8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmH5FfIACgkQI1/ltBGq
qqfehw//fDufH9R+Ixm9EtaZ0PihGdoA1VzB7XlyX7BAcSMRdGn9/VkWbeIR6ocQ
hgYInmKfKgYazvVaqTwSsTfa3Img4aOeEYhzSSokchH0OCsPPBH4uCH1+eL9nLEq
nHD10TYg7T9nRmRvCRCAdIlkwUz/20tFCLANrB5stAVob1NkwVwlTekqAbo9tbIC
EWe39C9DbztfLSjOvkdjKCgqmP4TXZDZRf7dJmrIpvSPBMRwopymWLszq0rgp/RK
lI5uJHi0r6mdvaQ3sf2NRGjFOegng36bsKjUmrc8rQms8fIrnon+XIR3zHew9EhS
u4pW29Y9CEV2P7EDqyl6RdODm0cm11N3X/YWjQO0IgJkN9/5/66a9GnQRDM+ea1H
3ObrPOLRRtQtzN1vQC6+KPkBqv8LpbC+Gf/LGaZwV/UZ/cO6fMCYAHI5heOVj6bu
qp9PZgX4lRGA0raMnAAQPy4Sh7uNZsqwvDF8eL8gs8dmktMgr15Fh97hfU0+lED9
G+EAo+RThIRcaEUMl0AaLVzjjWnBT9NIrNyXNObgH2PGTcnTfBOTDnX4iwwwtqgH
/JYZwuj/kxFDC/aSUlar/azuKC8XDHYqBPbrQgmvp5vDA3Iti1UoNf0uOt6Skty0
wBuz9y+eFIT5VOrm00+rdUI6+7zWd9EYPgNFTPmoGnJMZSJkt34=
=fmbL
-----END PGP SIGNATURE-----

--Sig_/Wm1.Z9QEq88r=0UglNQ17h8--
