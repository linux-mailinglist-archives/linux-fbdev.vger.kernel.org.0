Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B952C7895
	for <lists+linux-fbdev@lfdr.de>; Sun, 29 Nov 2020 11:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgK2KIt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 29 Nov 2020 05:08:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:37860 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbgK2KIt (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 29 Nov 2020 05:08:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CCE78AC6A;
        Sun, 29 Nov 2020 10:08:06 +0000 (UTC)
Subject: Re: [PATCH v2 03/28] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
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
        Xiaofei Tan <tanxiaofei@huawei.com>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-4-sam@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6b7947a5-05d9-7d05-7c23-b41c8aec4c77@suse.de>
Date:   Sun, 29 Nov 2020 11:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-4-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VJY2dRwnvUOZMaikv8QPf4ItkoSqEu1tl"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VJY2dRwnvUOZMaikv8QPf4ItkoSqEu1tl
Content-Type: multipart/mixed; boundary="rGzynRqiuo45xMI1DpVJXx27eESZEURzH";
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
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <6b7947a5-05d9-7d05-7c23-b41c8aec4c77@suse.de>
Subject: Re: [PATCH v2 03/28] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-4-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-4-sam@ravnborg.org>

--rGzynRqiuo45xMI1DpVJXx27eESZEURzH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Fix kernel-doc warnings reported when using W=3D1
>=20
> v2:
>    - Improve subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> ---
>   drivers/video/fbdev/core/fb_notify.c | 3 ++-
>   drivers/video/fbdev/core/fbmon.c     | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev=
/core/fb_notify.c
> index 74c2da528884..d85717b6e14a 100644
> --- a/drivers/video/fbdev/core/fb_notify.c
> +++ b/drivers/video/fbdev/core/fb_notify.c
> @@ -38,7 +38,8 @@ EXPORT_SYMBOL(fb_unregister_client);
>  =20
>   /**
>    * fb_notifier_call_chain - notify clients of fb_events
> - *
> + * @val: value passed to callback
> + * @v: pointer passed to callback

Since you're at it, maybe add Returns.

>    */
>   int fb_notifier_call_chain(unsigned long val, void *v)
>   {
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/cor=
e/fbmon.c
> index 1bf82dbc9e3c..b0e690f41025 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -605,6 +605,7 @@ static void get_detailed_timing(unsigned char *bloc=
k,
>    * fb_create_modedb - create video mode database
>    * @edid: EDID data
>    * @dbsize: database size
> + * @specs: monitor specifications, may be NULL
>    *
>    * RETURNS: struct fb_videomode, @dbsize contains length of database
>    *
> @@ -1100,7 +1101,6 @@ static u32 fb_get_hblank_by_hfreq(u32 hfreq, u32 =
xres)
>    *                                    2 * M
>    *        M =3D 300;
>    *        C =3D 30;
> -
>    */
>   static u32 fb_get_hblank_by_dclk(u32 dclk, u32 xres)
>   {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rGzynRqiuo45xMI1DpVJXx27eESZEURzH--

--VJY2dRwnvUOZMaikv8QPf4ItkoSqEu1tl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/DcwMFAwAAAAAACgkQlh/E3EQov+Bl
/w/7B/gxnC+cCqzLZUtuNR5XlKR9lnrDMQzJjyzgn0qG3WnDX1vy0fOfT5dncMYa4IFKOp0Hez9w
9WV46rJf62D0dZClFG3YN7MrPbuQyrRboSfKf9SFMXu3j5FNlnkgFu2IoGoKkoHgPeyDgnWdmDoJ
c++2KyKcKc91ekv6winod1tYRKpCiDbvnk7/kfvwpUR/sum2vXHWWKOg9C7a6cDEN9iyfnz/A6di
kwVOEBx7GwnazsEgYg3BDtjozJtAeNaGJNzmpz+Oef2OhFP7iRuENdQIlCUa985xtxcI+20VvJ+H
8ImsVBd2kSs8ouXqBdwB9y9pfJLK7Jd0+ZAxc6d6IV5zsQ4NCPkIVVjHXvXuLYr4wABWdYGNukOX
CzUPO0TMAUpG9faP3rbCpt3rvxDkG1I1uE2KNwE4gjI2mIvI7zTKFwdQAPNGxKtEgAy55mfSS9rt
vANZEWkmapXAXlHniAuAr0GTMsFQ9ujC26n2pr4AOn0sdwpLnFUZ78k+7hQSLTIgVB22ARWMwkJK
Ik4OkHnMAee1wlypYSrWq30/KNgIxCzGMbq77DzRzonvZVvGFrb5xZaTbEHKHJn92if+I0pXmQMz
b+Unergea1+csh0Le3pad1uKlPy6A5m0D0hjfzsuhw7F3HhRz6QXwA/MmFPxPd1FLRJcj9sG59n4
6jk=
=a2TV
-----END PGP SIGNATURE-----

--VJY2dRwnvUOZMaikv8QPf4ItkoSqEu1tl--
