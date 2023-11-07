Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D5C7E4982
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Nov 2023 21:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbjKGUBp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Nov 2023 15:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjKGUBo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Nov 2023 15:01:44 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F90E7
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Nov 2023 12:01:42 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0SGV-0008C6-Vx; Tue, 07 Nov 2023 21:01:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0SGU-007MtR-VY; Tue, 07 Nov 2023 21:01:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0SGU-00En5h-M9; Tue, 07 Nov 2023 21:01:34 +0100
Date:   Tue, 7 Nov 2023 21:01:34 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Nicolas Ferre <nicolas.ferre@microchip.com>,
        dri-devel@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <20231107200134.jsowrcruisrtnspw@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sjmfdg57sgsypwrr"
Content-Disposition: inline
In-Reply-To: <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--sjmfdg57sgsypwrr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 10:17:43AM +0100, Uwe Kleine-K=F6nig wrote:
> On today's platforms the benefit of platform_driver_probe() isn't that
> relevant any more. It allows to drop some code after booting (or module
> loading) for .probe() and discard the .remove() function completely if
> the driver is built-in. This typically saves a few 100k.
>=20
> The downside of platform_driver_probe() is that the driver cannot be
> bound and unbound at runtime which is ancient and also slightly
> complicates testing. There are also thoughts to deprecate
> platform_driver_probe() because it adds some complexity in the driver
> core for little gain. Also many drivers don't use it correctly. This
> driver for example misses to mark the driver struct with __refdata which
> is needed to suppress a (W=3D1) modpost warning:
>=20
> 	WARNING: modpost: drivers/video/fbdev/atmel_lcdfb: section mismatch in r=
eference: atmel_lcdfb_driver+0x4 (section: .data) -> atmel_lcdfb_remove (se=
ction: .exit.text)
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/fbdev/atmel_lcdfb.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atme=
l_lcdfb.c
> index a908db233409..b218731ef732 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -1017,7 +1017,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_i=
nfo *sinfo)
>  	return ret;
>  }
> =20
> -static int __init atmel_lcdfb_probe(struct platform_device *pdev)
> +static int atmel_lcdfb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct fb_info *info;
> @@ -1223,7 +1223,7 @@ static int __init atmel_lcdfb_probe(struct platform=
_device *pdev)
>  	return ret;
>  }
> =20
> -static int __exit atmel_lcdfb_remove(struct platform_device *pdev)
> +static int atmel_lcdfb_remove(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct fb_info *info =3D dev_get_drvdata(dev);
> @@ -1301,7 +1301,8 @@ static int atmel_lcdfb_resume(struct platform_devic=
e *pdev)
>  #endif
> =20
>  static struct platform_driver atmel_lcdfb_driver =3D {
> -	.remove		=3D __exit_p(atmel_lcdfb_remove),
> +	.probe		=3D atmel_lcdfb_probe,
> +	.remove		=3D atmel_lcdfb_remove,
>  	.suspend	=3D atmel_lcdfb_suspend,
>  	.resume		=3D atmel_lcdfb_resume,
>  	.driver		=3D {
> @@ -1310,7 +1311,7 @@ static struct platform_driver atmel_lcdfb_driver =
=3D {
>  	},
>  };
> =20
> -module_platform_driver_probe(atmel_lcdfb_driver, atmel_lcdfb_probe);
> +module_platform_driver(atmel_lcdfb_driver, );

Argh, the , must be removed. I had this in my working copy but forgot to
squash it into this commit. Sorry!

Can you squash in the following please?:

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_=
lcdfb.c
index 0531d6f6dcc5..88c75ae7d315 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1308,8 +1308,7 @@ static struct platform_driver atmel_lcdfb_driver =3D {
 		.of_match_table	=3D atmel_lcdfb_dt_ids,
 	},
 };
-
-module_platform_driver(atmel_lcdfb_driver, );
+module_platform_driver(atmel_lcdfb_driver);
=20
 MODULE_DESCRIPTION("AT91 LCD Controller framebuffer driver");
 MODULE_AUTHOR("Nicolas Ferre <nicolas.ferre@atmel.com>");

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sjmfdg57sgsypwrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVKl50ACgkQj4D7WH0S
/k79igf+NcsaKUuX+n6J099hutP7e/6l1H4tbP734q1G0NfcM88RoImECYSikOS7
kjD3nZNRkIZZI4wvwUHVDVWeG53uzR9j1/M92J2iPBbeixxiF7oJvpoDtySYTMxm
J4KbgDb1F1cNXXfG5DhDv+Av7db0QVX1nWr8ClrN8OpXPg7RRLbDeve0DyVVNThx
Wq/JyMW+UeucJCf+j/b9YS1+8F+cDCztNwmcQYxycRCKplItqkjnUyfHGFZYZzUg
cN/S3Km57tPKwxKHxpKaVPIF9hFGFkZKKNTJaXA0PDPyxwGpFj/vATYlNNovFYhL
X/hoC1DjhyzoIS6OBmwOsD9YX8AALg==
=NGWh
-----END PGP SIGNATURE-----

--sjmfdg57sgsypwrr--
