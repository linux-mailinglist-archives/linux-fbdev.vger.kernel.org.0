Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29267E682D
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Nov 2023 11:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjKIKcl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Nov 2023 05:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjKIKcl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Nov 2023 05:32:41 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01991BF4
        for <linux-fbdev@vger.kernel.org>; Thu,  9 Nov 2023 02:32:38 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r12Kx-0000sw-OX; Thu, 09 Nov 2023 11:32:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r12Kw-007krC-OJ; Thu, 09 Nov 2023 11:32:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r12Kw-00Fs38-Eu; Thu, 09 Nov 2023 11:32:34 +0100
Date:   Thu, 9 Nov 2023 11:32:34 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        dri-devel@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Nathan Chancellor <nathan@kernel.org>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <20231109103234.rknpmepbhpukwbtd@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
 <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
 <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
 <20231108215220.3iw5sydxad32gufj@pengutronix.de>
 <656080fb-7d10-47ec-bdeb-a099ceee99bf@gmx.de>
 <20231109062459.5hk7vb54t4iy5kp6@pengutronix.de>
 <57de52b3-201b-4599-83ba-b0a7cc8db350@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wf3egznunlkkf5m2"
Content-Disposition: inline
In-Reply-To: <57de52b3-201b-4599-83ba-b0a7cc8db350@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--wf3egznunlkkf5m2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Helge,

On Thu, Nov 09, 2023 at 10:55:41AM +0100, Helge Deller wrote:
> On 11/9/23 07:24, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Wed, Nov 08, 2023 at 10:57:00PM +0100, Helge Deller wrote:
> > > On 11/8/23 22:52, Uwe Kleine-K=F6nig wrote:
> > > > But info and so info->fix live longer than the probe function, don't
> > > > they?
> > >=20
> > > Yes, they do.
> > > But AFAICS info->fix contains a *copy* of the initial atmel_lcdfb_fix=
 struct
> > > (and not a pointer to it). So that should be ok.
> >=20
> > If you say so that's good. I grepped a bit around and didn't find a
> > place where a copy is made. But that's probably me and I'll consider the
> > case closed.
>=20
> It's not directly obvious, but the copy happens in the line you pointed
> out previously.
>=20
> In include/linux/fb.h:
>=20
> struct fb_info {
> ...
>         struct fb_var_screeninfo var;   /* Current var */
>         struct fb_fix_screeninfo fix;   /* Current fix */
>=20
> so, "fb_info.fix" is a struct, and not a pointer.
>=20
> In drivers/video/fbdev/atmel_lcdfb.c:
> static int atmel_lcdfb_probe(struct platform_device *pdev)
> {
> ...
>         info->fix =3D atmel_lcdfb_fix;  //  (line 1065)
>=20
> this becomes effectively a:
> 	memcpy(&info->fix, &atmel_lcdfb_fix, sizeof(struct fb_fix_screeninfo));

Ah right. Thanks for that hint. I didn't spot this and grepped for
memcpy and memdup.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wf3egznunlkkf5m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVMtUEACgkQj4D7WH0S
/k45ewf+J2jgFy/NvgT6l7mXVl3BEWScvV8ubxVEjQCY6zI70o8IwWNTMEmy+omu
7GKpwQmBs/rhqVu4h8BWwrSwo2uc/ImVUxyd6HJdPSeI/WCnjwKYjLMIP5gurZWP
8qiA6lLFVWm9iDYQIbYFNUDN0UJGT3/bmKggHmqS0jlads15d8HrmE1Oyi2Detdf
MhOOpSXsfrQE84VMOL+fTw3wM40YwWFz9hDjyNKXRk0T341RQc+fhQNVDlWTVL+D
s8DOV1ror6AQ4xPs1l2s4vYPDC3mQ+MFx26/Ael9YTo9P2j7LNn7+Kbx0PNSrxOx
xGjic2PgrU7FSAUel5PDERXITTruzw==
=jg83
-----END PGP SIGNATURE-----

--wf3egznunlkkf5m2--
