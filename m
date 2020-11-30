Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607282C83FF
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Nov 2020 13:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgK3MRb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Nov 2020 07:17:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:49782 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgK3MRb (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Nov 2020 07:17:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A3D34AE6D;
        Mon, 30 Nov 2020 12:16:48 +0000 (UTC)
Subject: Re: [PATCH v2 15/28] video: fbdev: neofb: Fix set but not used
 warning for CursorMem
To:     Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc:     Aditya Pakki <pakki001@umn.edu>,
        Alexander Klimov <grandmaster@al2klimov.de>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Evgeny Novikov <novikov@ispras.ru>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        George Kennedy <george.kennedy@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gustavo Silva <gustavoars@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Jason Yan <yanaijie@huawei.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Joe Perches <joe@perches.com>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mike Rapoport <rppt@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Qilong Zhang <zhangqilong3@huawei.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-16-sam@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b27a7dc1-7f09-57e2-7356-bb2a3f3e8204@suse.de>
Date:   Mon, 30 Nov 2020 13:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-16-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4Y7UxgMc6TgXteUKbdi0lV678loDCJ9Ly"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4Y7UxgMc6TgXteUKbdi0lV678loDCJ9Ly
Content-Type: multipart/mixed; boundary="QXEs9MxKdZRg0Mhi10RjBI97xuRMPvrUm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Alex Dewar <alex.dewar90@gmail.com>, Antonino Daplas <adaplas@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Evgeny Novikov <novikov@ispras.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Silva <gustavoars@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Jason Yan <yanaijie@huawei.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Joe Perches <joe@perches.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Peter Rosin <peda@axentia.se>, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan
 <tanxiaofei@huawei.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <b27a7dc1-7f09-57e2-7356-bb2a3f3e8204@suse.de>
Subject: Re: [PATCH v2 15/28] video: fbdev: neofb: Fix set but not used
 warning for CursorMem
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-16-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-16-sam@ravnborg.org>

--QXEs9MxKdZRg0Mhi10RjBI97xuRMPvrUm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix W=3D1 warnings by removing unused code
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Evgeny Novikov <novikov@ispras.ru>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/neofb.c | 4 ----
>   1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
> index 09a20d4ab35f..c0f4f402da3f 100644
> --- a/drivers/video/fbdev/neofb.c
> +++ b/drivers/video/fbdev/neofb.c
> @@ -1843,7 +1843,6 @@ static int neo_init_hw(struct fb_info *info)
>   	struct neofb_par *par =3D info->par;
>   	int videoRam =3D 896;
>   	int maxClock =3D 65000;
> -	int CursorMem =3D 1024;
>   	int CursorOff =3D 0x100;
>  =20
>   	DBG("neo_init_hw");
> @@ -1895,19 +1894,16 @@ static int neo_init_hw(struct fb_info *info)
>   	case FB_ACCEL_NEOMAGIC_NM2070:
>   	case FB_ACCEL_NEOMAGIC_NM2090:
>   	case FB_ACCEL_NEOMAGIC_NM2093:
> -		CursorMem =3D 2048;
>   		CursorOff =3D 0x100;
>   		break;
>   	case FB_ACCEL_NEOMAGIC_NM2097:
>   	case FB_ACCEL_NEOMAGIC_NM2160:
> -		CursorMem =3D 1024;
>   		CursorOff =3D 0x100;
>   		break;
>   	case FB_ACCEL_NEOMAGIC_NM2200:
>   	case FB_ACCEL_NEOMAGIC_NM2230:
>   	case FB_ACCEL_NEOMAGIC_NM2360:
>   	case FB_ACCEL_NEOMAGIC_NM2380:
> -		CursorMem =3D 1024;
>   		CursorOff =3D 0x1000;
>  =20
>   		par->neo2200 =3D (Neo2200 __iomem *) par->mmio_vbase;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--QXEs9MxKdZRg0Mhi10RjBI97xuRMPvrUm--

--4Y7UxgMc6TgXteUKbdi0lV678loDCJ9Ly
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/E4q4FAwAAAAAACgkQlh/E3EQov+CH
SBAAopMN3BkNPFw4VASPIZ5g5VSwuH7EpRYKe43piUrNT5IzRdQdltP4f2vuJzBsyNoPE/VmUPYx
oqZN1IsalduqcB+4/i/tAV+ysBK1Jrb/BjCRY/x7jIRFLDLHcUVU5VHE5n1D3LClLjWwgkDxJWMJ
SusXAzflbY+R/fO4Ji4w//614GRw1jPB6flapbGM33x6LSGeMwGHOkSMnVC0+ajXRmDz0idbhlOE
NaatIZmFIBEpHCsWMxSsQAKCD4ZacSC7cVnn1E60PbYiSDIaYK8GqJQ2f4Mw94tn+Yt3uv/G+TXN
EOVPvZ4c5N+D95ydtX0iu8Yz3EwmYCvYsCwZTS2XN8zBbH8ZiWJxx2AX/0Jq8EyqgLMZeIgD14Ak
sdBOzX0Kqlmh3iTl+E7G0b+VpsL7JfGIcYlHzMZUUHLWv9gM8O1wBC4FJ0EoME6ecz7Zk8clGOI+
BQB+O2CPqSTJbRhF0UhsuTNYLc/JNlZ+zzInbPfQV8j5bGHdyqKDvb+d716nXISFO3fIlun8AY8A
/EusZBo4ZUf8yx1l4XSFON9l6k1xD7RfBFs64JQWyTdyU8cFIA8hp6GEekXTPgkiHerWt1ToLB09
6h1wIPtRMbFcNG8WrSltVQnVQrFO/ITTW+M/2ff4oSPIKOn9rpGaaJhwIX8HfDItbJhXy0WOiYo2
7r0=
=5w5w
-----END PGP SIGNATURE-----

--4Y7UxgMc6TgXteUKbdi0lV678loDCJ9Ly--
