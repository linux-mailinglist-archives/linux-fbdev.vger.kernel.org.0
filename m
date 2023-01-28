Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C46C67F81A
	for <lists+linux-fbdev@lfdr.de>; Sat, 28 Jan 2023 14:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbjA1NdQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 28 Jan 2023 08:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbjA1NdL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 28 Jan 2023 08:33:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E542B1CAE6
        for <linux-fbdev@vger.kernel.org>; Sat, 28 Jan 2023 05:32:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLlKA-0002I2-QJ; Sat, 28 Jan 2023 14:32:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLlKA-0011Kp-3X; Sat, 28 Jan 2023 14:32:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLlK8-00GXdA-FG; Sat, 28 Jan 2023 14:32:52 +0100
Date:   Sat, 28 Jan 2023 14:32:39 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <20230128133239.ndanz4gzm73wwaiv@pengutronix.de>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
 <Y9RuDM9VAMBzj4vd@Gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i2z6tfpcc3xmnfcs"
Content-Disposition: inline
In-Reply-To: <Y9RuDM9VAMBzj4vd@Gentoo>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--i2z6tfpcc3xmnfcs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jan 28, 2023 at 08:36:28AM +0800, Jianhua Lu wrote:
> On Fri, Jan 27, 2023 at 04:26:39PM +0100, Uwe Kleine-K=F6nig wrote:
> > The probe function doesn't make use of the i2c_device_id * parameter so
> > it can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > there is an ongoing effort to convert all drivers to .probe_new to
> > eventually drop .probe with the i2c_device_id parameter. This driver
> > currently sits in next so wasn't on my radar before.
> >=20
> > My plan is to tackle that after the next merge window. So I ask you to
> > either apply this patch during the next merge window or accept that it
> > will go in via the i2c tree together with the patch that drops .probe().
> >=20
> > Best regards
> > Uwe
> >=20
> >  drivers/video/backlight/ktz8866.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backligh=
t/ktz8866.c
> > index 97b723719e13..d38c13ad39c7 100644
> > --- a/drivers/video/backlight/ktz8866.c
> > +++ b/drivers/video/backlight/ktz8866.c
> > @@ -124,8 +124,7 @@ static void ktz8866_init(struct ktz8866 *ktz)
> >  		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
> >  }
> > =20
> > -static int ktz8866_probe(struct i2c_client *client,
> > -			 const struct i2c_device_id *id)
> > +static int ktz8866_probe(struct i2c_client *client)
> >  {
> >  	struct backlight_device *backlight_dev;
> >  	struct backlight_properties props;
> > @@ -197,7 +196,7 @@ static struct i2c_driver ktz8866_driver =3D {
> >  		.name =3D "ktz8866",
> >  		.of_match_table =3D ktz8866_match_table,
> >  	},
> > -	.probe =3D ktz8866_probe,
> > +	.probe_new =3D ktz8866_probe,
>=20
> I think .probe_new() will be renamed to new .probe() again when there are
> patches dropping old .probe().

Right, the plan is to reintroduce .probe with the prototype that
=2Eprobe_new has today.

> I prefer that you pack this commit to the i2c-tree commit that drops
> old .probe().=20

That's fine for me. Can I interpret this as an Ack for this patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--i2z6tfpcc3xmnfcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPVI/QACgkQwfwUeK3K
7Ak50Af/cZ56lGGlxAeINnOC9w5SHml5d6VS6RzfIFR1FEQ2ukiXhnjNoDHS3RZM
PJMVbrkhb3Y1UxV+ujZ9GCA/fdNBHtmZU5LkvF6Hs0OTP3kGxa1VxqnmtJO0MRBg
Fn4asbXSeBxEcLgqxS93yCKLPP7PWpW1FlfZ0qE6hOxxZmlkAmY/xxeNujhiJvbB
Eq9sQhPJgAQQRwySPATiQvXR3LHLhw9Ez9wwYo+E3VRU8UMLkNzvBxnGAwaxblaf
xesdA8F4bJ4gCpjeDGK0lAgpNlf031hl5YZ+o7T/vSomock18Mtr3vIdH16uSGHO
bF5qSpDnsHnqblz/Q3pKfF3z5uGNQQ==
=uzRg
-----END PGP SIGNATURE-----

--i2z6tfpcc3xmnfcs--
