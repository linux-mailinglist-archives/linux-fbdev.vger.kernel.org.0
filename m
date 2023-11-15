Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17347E6036
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Nov 2023 22:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjKHVw0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Nov 2023 16:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjKHVw0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Nov 2023 16:52:26 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF24258A
        for <linux-fbdev@vger.kernel.org>; Wed,  8 Nov 2023 13:52:24 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0qTG-0006JX-7B; Wed, 08 Nov 2023 22:52:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0qTF-007d0V-DT; Wed, 08 Nov 2023 22:52:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0qTF-00FUl2-47; Wed, 08 Nov 2023 22:52:21 +0100
Date:   Wed, 8 Nov 2023 22:52:20 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Nathan Chancellor <nathan@kernel.org>, linux-fbdev@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        llvm@lists.linux.dev, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        dri-devel@lists.freedesktop.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <20231108215220.3iw5sydxad32gufj@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
 <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
 <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jmxjragmypaomjv7"
Content-Disposition: inline
In-Reply-To: <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--jmxjragmypaomjv7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 10:24:09PM +0100, Helge Deller wrote:
> On 11/8/23 22:00, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 08, 2023 at 11:48:05AM -0700, Nathan Chancellor wrote:
> > > diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/=
atmel_lcdfb.c
> > > index 88c75ae7d315..9e391e5eaf9d 100644
> > > --- a/drivers/video/fbdev/atmel_lcdfb.c
> > > +++ b/drivers/video/fbdev/atmel_lcdfb.c
> > > @@ -220,7 +220,7 @@ static inline void atmel_lcdfb_power_control(stru=
ct atmel_lcdfb_info *sinfo, int
> > >   	}
> > >   }
> > >=20
> > > -static const struct fb_fix_screeninfo atmel_lcdfb_fix __initconst =
=3D {
> > > +static const struct fb_fix_screeninfo atmel_lcdfb_fix =3D {
> > >   	.type		=3D FB_TYPE_PACKED_PIXELS,
> > >   	.visual		=3D FB_VISUAL_TRUECOLOR,
> > >   	.xpanstep	=3D 0,
> >=20
> > I wonder if this was broken already before my patch. atmel_lcdfb_probe()
> > does
> >=20
> > 	info->fix =3D atmel_lcdfb_fix;
> >=20
> > and unless I miss something (this is well possible) that is used e.g. in
> > atmel_lcdfb_set_par() -> atmel_lcdfb_update_dma(). So atmel_lcdfb_fix
> > should better not live in .init memory?! Someone with more knowledge
> > about fbdev might want to take a look and decide if this justifies a
> > separate fix that should then be backported to stable, too?!
>=20
> I don't think a backport this is necessary.
> The "__initconst" atmel_lcdfb_fix struct was only copied in the
> "__init" atmel_lcdfb_probe() function.
> So, both were dropped at the same time in older kernels.

But info and so info->fix live longer than the probe function, don't
they? So a call to atmel_lcdfb_update_dma() should better not happen
when .init is already discarded, right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jmxjragmypaomjv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVMAxQACgkQj4D7WH0S
/k5YSQf6AxPchEkuYUXk6gx411eVDK/R4tn3tfcNjk8/B9Mq3j8sLPqQoRfQ7K7N
fHQQ/JrC48o2oc+EF80BM8gKMf0RoaaB7phh8SKbrnWJa9oriQtQURkHkE27+hTt
fM1njMKAZL1d4evY22cQEk1pzPPlQv4gb9pJ1vr7RSZ9quqF5hTi04syTbWdoAxa
R2GyrjZirtoIiJwfg8c+RaQrVvrMPxu+9c68q0rUBevVFZIFGqN/flOAp4ZurvB3
gDlZjQJk6q8OodLo6okDbTFusdoA2picLzXUGT7gnX/N6kIqHHymWnZjch/hPOza
5Mw9ByKx6RcAkWb8TQopR9NeCIGWeg==
=xFUk
-----END PGP SIGNATURE-----

--jmxjragmypaomjv7--
