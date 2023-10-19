Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827A07CF5E1
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Oct 2023 12:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbjJSKw3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 Oct 2023 06:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235234AbjJSKw2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 Oct 2023 06:52:28 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65601B6
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Oct 2023 03:52:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtQcb-0002Wd-GE; Thu, 19 Oct 2023 12:51:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtQcZ-002lnZ-81; Thu, 19 Oct 2023 12:51:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtQcY-001W9b-T9; Thu, 19 Oct 2023 12:51:18 +0200
Date:   Thu, 19 Oct 2023 12:51:18 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
Message-ID: <20231019105118.64gdzzixwqrztjir@pengutronix.de>
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yn2iyczv5acooknv"
Content-Disposition: inline
In-Reply-To: <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--yn2iyczv5acooknv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
> Hi Sean,
>=20
> On 10/17/23 11:17, Sean Young wrote:
> > Some drivers require sleeping, for example if the pwm device is connect=
ed
> > over i2c. The pwm-ir-tx requires precise timing, and sleeping causes ha=
voc
> > with the generated IR signal when sleeping occurs.
> >=20
> > This patch makes it possible to use pwm when the driver does not sleep,
> > by introducing the pwm_can_sleep() function.
> >=20
> > Signed-off-by: Sean Young <sean@mess.org>
>=20
> I have no objection to this patch by itself, but it seems a bit
> of unnecessary churn to change all current callers of pwm_apply_state()
> to a new API.

The idea is to improve the semantic of the function name, see
https://lore.kernel.org/linux-pwm/20231013180449.mcdmklbsz2rlymzz@pengutron=
ix.de
for more context. I think it's very subjective if you consider this
churn or not. While it's nice to have every caller converted in a single
step, I'd go for

	#define pwm_apply_state(pwm, state) pwm_apply_cansleep(pwm, state)

, keep that macro for a while and convert all users step by step. This
way we don't needlessly break oot code and the changes to convert to the
new API can go via their usual trees without time pressure.

> Why not just keep pwm_apply_state() as is and introduce a new
> pwm_apply_state_atomic() for callers which want to apply state
> in a case where sleeping is not allowed ?

There is a big spontaneous growth of function name patterns. I didn't
claim having done a complete research, but not using a suffix for the
fast variant and _cansleep for the sleeping one at least aligns to how
the gpio subsystem names things.

Grepping a bit more:

 - regmap has: regmap_might_sleep() and struct regmap::can_sleep
   The actual API doesn't have different functions to differentiate
   sleeping and non-sleeping calls. (Though there is
   regmap_read_poll_timeout_atomic().)

 - kmap() + kmap_atomic()
 - set_pte() + set_pte_atomic()

 - There is scmi_is_transport_atomic() and scmi_handle::is_transport_atomic=
()
   (Is this also about sleeping?)

 - There are quite a lot more symbols ending in _atomic and in
   _cansleep, but several of them don't exists to differentiate a slow
   and a fast procedure.  (e.g. drm_mode_atomic)

Not entirely sure what to read out of that.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yn2iyczv5acooknv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUxCiUACgkQj4D7WH0S
/k4jlwgAgQS/Vm8QPoZFBjT4W6JQXxJRPwUsXBOa7whQZfAYqlzZZ35+WjXKug70
1nq/INcUz96H0aYtK2aHLUeOEQH+cDau32nAM9dYk0S4qWXOEgC1gFbPwGTrF1SE
gEPMEkOMezwBlon9ik8cPddAGP5rDSXD8YKeiGy5O6gbXi/iKChFxnamOn5K7B+j
mgPy/pP0tTP79r0tsVIKta7hnJ1uGfv8cWRQqvPTyT9YuEiBfKRzgi7rxXq9gH2X
DS+SMO7jtBXFEl5kzKsw1oKpR5VqInvebeBJHSnsH3T/sXAuyJj379046bjbKq7c
rp0jBis0JVqrfUguEpnfRBuxuTilXQ==
=OvnQ
-----END PGP SIGNATURE-----

--yn2iyczv5acooknv--
