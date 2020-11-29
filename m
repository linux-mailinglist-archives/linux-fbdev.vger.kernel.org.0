Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52922C7891
	for <lists+linux-fbdev@lfdr.de>; Sun, 29 Nov 2020 11:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgK2KCA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 29 Nov 2020 05:02:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:35154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbgK2KCA (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 29 Nov 2020 05:02:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 58566AC6A;
        Sun, 29 Nov 2020 10:01:17 +0000 (UTC)
Subject: Re: [PATCH v2 01/28] video: Fix kernel-doc warnings in
 of_display_timing + of_videomode
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
 <20201128224114.1033617-2-sam@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ca28a1e4-3e73-fdfc-e288-eaac4b228610@suse.de>
Date:   Sun, 29 Nov 2020 11:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-2-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1CP4wDi8pjHzun2NLp2A5lx1R4XiEByF8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1CP4wDi8pjHzun2NLp2A5lx1R4XiEByF8
Content-Type: multipart/mixed; boundary="jaqFPb8WKCfAZnv0LLMhfQHuvq0rArc0Z";
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
Message-ID: <ca28a1e4-3e73-fdfc-e288-eaac4b228610@suse.de>
Subject: Re: [PATCH v2 01/28] video: Fix kernel-doc warnings in
 of_display_timing + of_videomode
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-2-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-2-sam@ravnborg.org>

--jaqFPb8WKCfAZnv0LLMhfQHuvq0rArc0Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Fix kernel-doc warnings reported when using W=3D1.
>=20
> v2:
>    - Improve subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-fbdev@vger.kernel.org
> ---
>   drivers/video/of_display_timing.c | 1 +
>   drivers/video/of_videomode.c      | 8 ++++----
>   2 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_displ=
ay_timing.c
> index abc9ada798ee..f93b6abbe258 100644
> --- a/drivers/video/of_display_timing.c
> +++ b/drivers/video/of_display_timing.c
> @@ -52,6 +52,7 @@ static int parse_timing_property(const struct device_=
node *np, const char *name,
>   /**
>    * of_parse_display_timing - parse display_timing entry from device_n=
ode
>    * @np: device_node with the properties
> + * @dt: display_timing that contains the result. I may be partially wr=
itten in case of errors
>    **/
>   static int of_parse_display_timing(const struct device_node *np,
>   		struct display_timing *dt)
> diff --git a/drivers/video/of_videomode.c b/drivers/video/of_videomode.=
c
> index 67aff2421c29..a5bb02f02b44 100644
> --- a/drivers/video/of_videomode.c
> +++ b/drivers/video/of_videomode.c
> @@ -13,10 +13,10 @@
>   #include <video/videomode.h>
>  =20
>   /**
> - * of_get_videomode - get the videomode #<index> from devicetree

What's wrong with this line? We use the dash in lots of places?

Besides this,

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> - * @np - devicenode with the display_timings
> - * @vm - set to return value
> - * @index - index into list of display_timings
> + * of_get_videomode: get the videomode #<index> from devicetree
> + * @np: devicenode with the display_timings
> + * @vm: set to return value
> + * @index: index into list of display_timings
>    *	    (Set this to OF_USE_NATIVE_MODE to use whatever mode is
>    *	     specified as native mode in the DT.)
>    *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--jaqFPb8WKCfAZnv0LLMhfQHuvq0rArc0Z--

--1CP4wDi8pjHzun2NLp2A5lx1R4XiEByF8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/DcWoFAwAAAAAACgkQlh/E3EQov+Ck
uw/+NZZaNKEM71OIftYGO99SmsspRN1l6oj4lkDaZgU1yG9zusGI5XBBVo5gOiSltWNNU8MSCOL4
FDiXieQ32OY5HxTLUofyWioY9HdT/RV2+sjoWJjSyJj1rYSjvIrr9ZTi//ZVefw5WyMB5KSsrr6O
o2CcrbA7r5OdUasslvNeBPV3zTJVaC15D34HfQs01wNhjHXoHg4bPpPTW/vdqzNdelx/ipcFxJ7w
nXUNvF/zDPn0YuaE/dGOgvUhyFm1xKq+o8VZXhRr0FGVPTjoYZUC9QHKHZAxDaVpgIe4wjU9lL0m
rrhGlp2NNQ6n7MueAb8CxJkuykZc+AhnGEdZMYWd6WtPvXIxSeyAl77V9b+euRELnpusB0x/rp/z
ElXEDB3Wo3vd1aa5HrDntePB4G0ls8UbW9DzhogSrKegQDqcgH5+ol4dsH5UvA4iaUAEfp5yJ4Ca
SIQBX1qosZQyRZpaBjeiM53szkAFbxCUIgx5TFRJz8LJQQFDoj+OxZBRbqFEozT7EIoaUf8WBowc
XNjRdjHjCJPzevI2Xe6Fzp8/ogKqM54FgP6HeJwNx2l17mTgsVrra5+xoABsJT//eALrc4sF0FVk
7AqCjCd0z22Ys3ISQa4+ISJ9YUzMhmeu9JlpxBDLTiTm2eC0uAfwKdyebeU0BjHzQP9wIOXEDJcq
C5o=
=E/2+
-----END PGP SIGNATURE-----

--1CP4wDi8pjHzun2NLp2A5lx1R4XiEByF8--
