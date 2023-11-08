Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452A27E5F8C
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Nov 2023 22:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjKHVAY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Nov 2023 16:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjKHVAY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Nov 2023 16:00:24 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F242113
        for <linux-fbdev@vger.kernel.org>; Wed,  8 Nov 2023 13:00:21 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0peu-0003B3-BA; Wed, 08 Nov 2023 22:00:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0pet-007cR6-12; Wed, 08 Nov 2023 22:00:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0pes-00FSwl-Ni; Wed, 08 Nov 2023 22:00:18 +0100
Date:   Wed, 8 Nov 2023 22:00:18 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     linux-fbdev@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Helge Deller <deller@gmx.de>, llvm@lists.linux.dev,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        dri-devel@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7uvy3c4ehr5gy3xk"
Content-Disposition: inline
In-Reply-To: <20231108184805.GA1579138@dev-arch.thelio-3990X>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--7uvy3c4ehr5gy3xk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 08, 2023 at 11:48:05AM -0700, Nathan Chancellor wrote:
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atme=
l_lcdfb.c
> index 88c75ae7d315..9e391e5eaf9d 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -220,7 +220,7 @@ static inline void atmel_lcdfb_power_control(struct a=
tmel_lcdfb_info *sinfo, int
>  	}
>  }
> =20
> -static const struct fb_fix_screeninfo atmel_lcdfb_fix __initconst =3D {
> +static const struct fb_fix_screeninfo atmel_lcdfb_fix =3D {
>  	.type		=3D FB_TYPE_PACKED_PIXELS,
>  	.visual		=3D FB_VISUAL_TRUECOLOR,
>  	.xpanstep	=3D 0,

I wonder if this was broken already before my patch. atmel_lcdfb_probe()
does

	info->fix =3D atmel_lcdfb_fix;
=09
and unless I miss something (this is well possible) that is used e.g. in
atmel_lcdfb_set_par() -> atmel_lcdfb_update_dma(). So atmel_lcdfb_fix
should better not live in .init memory?! Someone with more knowledge
about fbdev might want to take a look and decide if this justifies a
separate fix that should then be backported to stable, too?!

> @@ -841,7 +841,7 @@ static void atmel_lcdfb_task(struct work_struct *work)
>  	atmel_lcdfb_reset(sinfo);
>  }
> =20
> -static int __init atmel_lcdfb_init_fbinfo(struct atmel_lcdfb_info *sinfo)
> +static int atmel_lcdfb_init_fbinfo(struct atmel_lcdfb_info *sinfo)
>  {
>  	struct fb_info *info =3D sinfo->info;
>  	int ret =3D 0;

This is only a problem since my patch.

Thanks for your report and patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7uvy3c4ehr5gy3xk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVL9uEACgkQj4D7WH0S
/k6QTwgAs3hz+9I2oyuLS4W5VyOEl5j+eqdh9r/RyhxT6WsofBp25JPOJRzS0m8D
/SIJjXGkYYbF93ME9qUnoU1dtI8O76SUHGEIuRDR8Rnc9LqEmdOQTcxVo5scJ5Sp
aWmp6gMksOi4j83xA+mejp/pi8APLuyAJtARNxF9D7r7tg4ivzHKynfD3IsPM3Zx
+qr2IW6loeSW8fn8BO2bw84+50RDYFH78QwBbSLZw+Fr4zZOlTWfaR2V+mJahzRV
6CQl+gMvIiz+Nn26tlfBVoNP+G+5uhdkjb1hjhK8vAlGxLEvMxEGbI7xJ+gX2bnD
xJMQJKwYCc6r5vJvKXa73T3bGu2YTQ==
=9Asl
-----END PGP SIGNATURE-----

--7uvy3c4ehr5gy3xk--
