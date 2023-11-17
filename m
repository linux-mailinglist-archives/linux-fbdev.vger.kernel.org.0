Return-Path: <linux-fbdev+bounces-134-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B6E7EF750
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Nov 2023 19:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0081C2811AB
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Nov 2023 18:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB25431A7F;
	Fri, 17 Nov 2023 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-fbdev@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E336DD5B
	for <linux-fbdev@vger.kernel.org>; Fri, 17 Nov 2023 10:07:44 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r43Fh-0007T5-KT; Fri, 17 Nov 2023 19:07:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r43Fg-009jIK-4J; Fri, 17 Nov 2023 19:07:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r43Ff-003C8h-Q2; Fri, 17 Nov 2023 19:07:35 +0100
Date: Fri, 17 Nov 2023 19:07:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/1] backlight: pwm_bl: Use dev_err_probe
Message-ID: <20231117180733.4p5zkhzxwfur6dcg@pengutronix.de>
References: <20231117120625.2398417-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jy5iil4yjrcrfou5"
Content-Disposition: inline
In-Reply-To: <20231117120625.2398417-1-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org


--jy5iil4yjrcrfou5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexander,

On Fri, Nov 17, 2023 at 01:06:25PM +0100, Alexander Stein wrote:
> Use dev_err_probe to simplify error paths. Also let dev_err_probe handle
> the -EPROBE_DEFER case and add an entry to
> /sys/kernel/debug/devices_deferred when deferred.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jy5iil4yjrcrfou5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVXq+QACgkQj4D7WH0S
/k5VEQf/SRCjx28hkWDbqq/1JesvS2n1hzirF0hHfkH6Sf0dbm+KxS5XTYihmUsd
eusJBb6h8kt9vU/CsB2kYLK3GvbcYd33zakz5wZaL45oDn1kVezHmmGr5XHYJK8Y
V52WZupXXWKQ78FmMXjp+CeOLp9CEPD/vvbLvoMpXpQF4FzpHgWlb8Oj59kEvdNE
vn6UeLFCpqW7pjJJX/tZyGSEqbyQ3Ghmb5LYJ2ehFad/dDELFmFLBsiLwrIYxkS+
qHyrOCpe6cIAHtAQ309LdZ2p4FdeSqG6WtDWG3ig1TKTycpjjgIQy1qbGe5Yav52
d8RJiorK9cM5cWYbL4xP4sbJYQlbdw==
=ZNb9
-----END PGP SIGNATURE-----

--jy5iil4yjrcrfou5--

