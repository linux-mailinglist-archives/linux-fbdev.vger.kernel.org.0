Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E64069349C
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Feb 2023 00:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjBKXF4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 11 Feb 2023 18:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBKXF4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 11 Feb 2023 18:05:56 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF3283D6
        for <linux-fbdev@vger.kernel.org>; Sat, 11 Feb 2023 15:05:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQywK-0001tc-I5; Sun, 12 Feb 2023 00:05:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQywI-004J3b-EI; Sun, 12 Feb 2023 00:05:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQywI-002mD3-H7; Sun, 12 Feb 2023 00:05:50 +0100
Date:   Sun, 12 Feb 2023 00:05:45 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Jianhua Lu <lujianhua000@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <20230211230545.lv5g2f376rojlwyc@pengutronix.de>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
 <Y9eQ6QTngI18zUJn@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qwkgf64vf5d6bpiz"
Content-Disposition: inline
In-Reply-To: <Y9eQ6QTngI18zUJn@google.com>
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


--qwkgf64vf5d6bpiz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Mon, Jan 30, 2023 at 09:42:01AM +0000, Lee Jones wrote:
> On Fri, 27 Jan 2023, Uwe Kleine-K=F6nig wrote:
>=20
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
> >  drivers/video/backlight/ktz8866.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> Applied, thanks

Thanks, this patch didn't make it into next yet though. Is there a
problem other than pending tests before you publish it in your tree that
gets pulled into next?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qwkgf64vf5d6bpiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPoH0YACgkQwfwUeK3K
7AmvtQf8CZ1xnldsOEhsbgM0A3XY3DdZOaVJ6UTkFRkoBrJjoEl9SI6UdGczGNsI
+8lbaOfCTZc+cQ4zQlOYAgFBptunH40yJFp6hWo24VRcJPNt6VeflmF6ccv7/tJW
lP+IDQgmGaXsd9jw48R/bHn4Hl7+pCIo1qczjq8jxsQoSPlCFw8yfmkTk3yWmDVm
0WxHszd43dH67eMsr0dKhmT6VJUMr/KnJ0gUc3kaRbV9x9ei8drtsqhg33roi0lF
KhYvpfhu3f5qkCmVxZN0H4pjWbftTxgG/nvpmd/GKu+9YHKUmEnHYhtral0N5pT7
AGK69JeZtM/8AoYquZ/PHoGIdjWg8Q==
=ZsI9
-----END PGP SIGNATURE-----

--qwkgf64vf5d6bpiz--
