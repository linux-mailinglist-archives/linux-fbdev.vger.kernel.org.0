Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9272C8068
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Nov 2020 09:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgK3I6P (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Nov 2020 03:58:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:39080 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgK3I6P (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Nov 2020 03:58:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 81C1AAC95;
        Mon, 30 Nov 2020 08:57:33 +0000 (UTC)
Subject: Re: [PATCH v2 06/28] video: fbdev: aty: Fix set but not used warnings
 in mach64_ct
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
 <20201128224114.1033617-7-sam@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <60268a74-49b2-dfd9-a825-a2d5b0e3efaf@suse.de>
Date:   Mon, 30 Nov 2020 09:57:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-7-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yPglhTkNJaTwijK6h0ApyjMXcs9tfATAo"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yPglhTkNJaTwijK6h0ApyjMXcs9tfATAo
Content-Type: multipart/mixed; boundary="cIXnXtnfQFLjyTeh9Ow78NA8fx5wXR4oQ";
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
Message-ID: <60268a74-49b2-dfd9-a825-a2d5b0e3efaf@suse.de>
Subject: Re: [PATCH v2 06/28] video: fbdev: aty: Fix set but not used warnings
 in mach64_ct
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-7-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-7-sam@ravnborg.org>

--cIXnXtnfQFLjyTeh9Ow78NA8fx5wXR4oQ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Fix W=3D1 warnings about variables assigned but never used.
> - One variable is only used when CONFIG_FB_ATY_GENERIC_LCD is defined
>    Fix so variable is only defined with CONFIG_FB_ATY_GENERIC_LCD
> - Several variables was only assigned by a call to aty_ld_le32().
>    Drop the variables but keep the call to aty_ld_le32() as it may
>    have unexpected side-effects.
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/aty/mach64_ct.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/aty/mach64_ct.c b/drivers/video/fbdev/=
aty/mach64_ct.c
> index f87cc81f4fa2..011b07e44e0d 100644
> --- a/drivers/video/fbdev/aty/mach64_ct.c
> +++ b/drivers/video/fbdev/aty/mach64_ct.c
> @@ -281,10 +281,13 @@ static u32 aty_pll_to_var_ct(const struct fb_info=
 *info, const union aty_pll *pl
>   void aty_set_pll_ct(const struct fb_info *info, const union aty_pll *=
pll)
>   {
>   	struct atyfb_par *par =3D (struct atyfb_par *) info->par;
> -	u32 crtc_gen_cntl, lcd_gen_cntrl;
> +	u32 crtc_gen_cntl;
>   	u8 tmp, tmp2;
>  =20
> -	lcd_gen_cntrl =3D 0;
> +#ifdef CONFIG_FB_ATY_GENERIC_LCD
> +	u32 lcd_gen_cntrl =3D 0;
> +#endif
> +
>   #ifdef DEBUG
>   	printk("atyfb(%s): about to program:\n"
>   		"pll_ext_cntl=3D0x%02x pll_gen_cntl=3D0x%02x pll_vclk_cntl=3D0x%02x=
\n",
> @@ -402,7 +405,7 @@ static int aty_init_pll_ct(const struct fb_info *in=
fo, union aty_pll *pll)
>   	struct atyfb_par *par =3D (struct atyfb_par *) info->par;
>   	u8 mpost_div, xpost_div, sclk_post_div_real;
>   	u32 q, memcntl, trp;
> -	u32 dsp_config, dsp_on_off, vga_dsp_config, vga_dsp_on_off;
> +	u32 dsp_config;
>   #ifdef DEBUG
>   	int pllmclk, pllsclk;
>   #endif
> @@ -488,9 +491,9 @@ static int aty_init_pll_ct(const struct fb_info *in=
fo, union aty_pll *pll)
>  =20
>   	/* Allow BIOS to override */
>   	dsp_config =3D aty_ld_le32(DSP_CONFIG, par);
> -	dsp_on_off =3D aty_ld_le32(DSP_ON_OFF, par);
> -	vga_dsp_config =3D aty_ld_le32(VGA_DSP_CONFIG, par);
> -	vga_dsp_on_off =3D aty_ld_le32(VGA_DSP_ON_OFF, par);
> +	aty_ld_le32(DSP_ON_OFF, par);
> +	aty_ld_le32(VGA_DSP_CONFIG, par);
> +	aty_ld_le32(VGA_DSP_ON_OFF, par);
>  =20
>   	if (dsp_config)
>   		pll->ct.dsp_loop_latency =3D (dsp_config & DSP_LOOP_LATENCY) >> 16;=

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cIXnXtnfQFLjyTeh9Ow78NA8fx5wXR4oQ--

--yPglhTkNJaTwijK6h0ApyjMXcs9tfATAo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/Es/oFAwAAAAAACgkQlh/E3EQov+B8
eRAAkongme7Uw+O3g+OwLLKxgx98fSv2+lDtoMOsA2KvKh3Cun/3TsJbt6zyscSCqVPHdhxAvpNB
UA+zcXz6P6LA5axD84JlxlP6BiIcdkJ+tSuE8MAZz9FAbqn6WDc7hEn0U0xj4rKi3lICUIjKeEiq
V5jI+38E1XBOOxZaqM59UiJayvWHXdI73bKvm6SnDKNoxbFmhmylY1o9iOvXqjKgIe2+2TadChkT
GzAL1GoBiTz/1XojJLiwmcXaPtHH5ouvPond+TcAUxzDIXggk2v1nQOkUWwCE8TrruYeGzCk5uh/
2PH3aMfprXQz6qehnuXVAj6ofFbj1cBweQzEm+DMztbnEhkPxo7mQgRmYTNeWiFtY9llEdBp+6JU
v56iCKrp0fQiwc+5ZRGCmd4s7KupiYMbbW/SVxdot7Rdjdf/ljwYpLDwbHuDUj6jvTgDiHNsRaO2
CvymjRGuxQN5r2kUOba6pzd31BPe3HOPdgUrLNYv23KaWaOYgaOGUeuyBELHbmAtcVntUUBLaN3r
zyW/O5yjX5QIS28El/d77qfB+k+B53aWwpb5Xjcpa7hiJAkc2h296lLvdsU/P5xb2MP5GIhK2OGT
0527Si0+7F03Iw8kgIhxOjdPORJbbWiXq6xacN76EpPsC3i4khS/CG/9wI+JY+aGNWrJXHN3PpIZ
3KY=
=I+a3
-----END PGP SIGNATURE-----

--yPglhTkNJaTwijK6h0ApyjMXcs9tfATAo--
