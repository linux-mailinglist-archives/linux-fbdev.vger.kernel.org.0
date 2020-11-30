Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5C22C86EA
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Nov 2020 15:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgK3Oh2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Nov 2020 09:37:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:54968 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbgK3Oh2 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Nov 2020 09:37:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 79297AB63;
        Mon, 30 Nov 2020 14:36:46 +0000 (UTC)
Subject: Re: [PATCH v2 21/28] video: fbdev: tmiofb: Fix set but not used
 warnings
To:     Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        Evgeny Novikov <novikov@ispras.ru>,
        Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Aditya Pakki <pakki001@umn.edu>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Jason Yan <yanaijie@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Qilong Zhang <zhangqilong3@huawei.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Gustavo Silva <gustavoars@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        George Kennedy <george.kennedy@oracle.com>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Alexander Klimov <grandmaster@al2klimov.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        Mike Rapoport <rppt@kernel.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-22-sam@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e2300be8-525f-f289-5e78-d4fd488c90d4@suse.de>
Date:   Mon, 30 Nov 2020 15:36:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-22-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QUsycVs42ZsdUMJRsopGrV3rUmjtQxy7P"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QUsycVs42ZsdUMJRsopGrV3rUmjtQxy7P
Content-Type: multipart/mixed; boundary="RlufnoLl5dw7XZkBLvZDTR2SAvzElte5l";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap
 <rdunlap@infradead.org>, Gustavo Silva <gustavoars@kernel.org>,
 Peter Rosin <peda@axentia.se>, George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Jingoo Han <jingoohan1@gmail.com>, Joe Perches <joe@perches.com>,
 Peilin Ye <yepeilin.cs@gmail.com>, Mike Rapoport <rppt@kernel.org>
Message-ID: <e2300be8-525f-f289-5e78-d4fd488c90d4@suse.de>
Subject: Re: [PATCH v2 21/28] video: fbdev: tmiofb: Fix set but not used
 warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-22-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-22-sam@ravnborg.org>

--RlufnoLl5dw7XZkBLvZDTR2SAvzElte5l
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix W=3D1 warnings by avoiding local variables and use direct reference=
s.

What's the bug here?

>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/video/fbdev/tmiofb.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/tmiofb.c b/drivers/video/fbdev/tmiofb.=
c
> index 50111966c981..b70faa3850f2 100644
> --- a/drivers/video/fbdev/tmiofb.c
> +++ b/drivers/video/fbdev/tmiofb.c
> @@ -802,10 +802,8 @@ static int tmiofb_remove(struct platform_device *d=
ev)
>   	const struct mfd_cell *cell =3D mfd_get_cell(dev);
>   	struct fb_info *info =3D platform_get_drvdata(dev);
>   	int irq =3D platform_get_irq(dev, 0);
> -	struct tmiofb_par *par;
>  =20
>   	if (info) {
> -		par =3D info->par;
>   		unregister_framebuffer(info);
>  =20
>   		tmiofb_hw_stop(dev);
> @@ -816,8 +814,8 @@ static int tmiofb_remove(struct platform_device *de=
v)
>   		free_irq(irq, info);
>  =20
>   		iounmap(info->screen_base);
> -		iounmap(par->lcr);
> -		iounmap(par->ccr);
> +		iounmap(((struct tmiofb_par *)info->par)->lcr);
> +		iounmap(((struct tmiofb_par *)info->par)->ccr);
>  =20
>   		framebuffer_release(info);
>   	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RlufnoLl5dw7XZkBLvZDTR2SAvzElte5l--

--QUsycVs42ZsdUMJRsopGrV3rUmjtQxy7P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/FA3wFAwAAAAAACgkQlh/E3EQov+DM
iA/+JgdFZnsq9XfA9+2juS/nvCSr+KP1c6p5lvq7E1zAAqKijVAWvyHrioVbJzja2cvpTf/DRHRp
PSReRllIA9PcampHYNUm4ZNGw3fVwpEoeSpiAtytDWiqmk/D8fmJW421ujLUjHrDER4OuNMsTxFW
zgiFHdixRLSNYISvKLKqrToLfLs8fZByOHKkY9G/gIcg7r2mNaIRJfpmRyc7VA2fDFu5gp21D64F
UJLbSBu8/f9hgbE95CZqIhX5l2kj2/a+ErR71PpGEb0A5U4Q0uo4pUHer4gRoMOhHRED4+DTrOeW
T64MlPPzYqqfsbbL1Knk+eIwKi8o6lBC51T0hVjAW4niPFmfb7tQvVRGi5zPB5c0A9aikEqfenuw
Q2fM6nbRAfNSE22qO00RkqzA84oE2rTu0ondBOOOLKV3OII9EzIz6IeSbEtCiyweqegse1nZtHm7
VOfwEjX14nhL1lzQgy0xgP5R+jZm5/iymoLx1Az8toMzHDCwKqrYoEXdtg29rEsF3JU4gkxw7zZq
pgAqdH+fwtPY/iyaeGLc0K9epbPLqBCtXXysQUtYVli1c8P2pHTHlpXz8gcD7cz0IETZB8bvN7XE
slERm6AxAeQEEJuMxtNKW12wJG4nD0Z7Ov/IBmalRnErhMymsXUp/Dr1J/Mb/DGcEySEX1xXiAWA
j2A=
=hmCa
-----END PGP SIGNATURE-----

--QUsycVs42ZsdUMJRsopGrV3rUmjtQxy7P--
