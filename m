Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26157DE4D6
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Nov 2023 17:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344094AbjKAQuQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 1 Nov 2023 12:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343964AbjKAQuQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 1 Nov 2023 12:50:16 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2A9FD
        for <linux-fbdev@vger.kernel.org>; Wed,  1 Nov 2023 09:50:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9adb9fa7200so6149466b.0
        for <linux-fbdev@vger.kernel.org>; Wed, 01 Nov 2023 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698857411; x=1699462211; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeL4k8689m96l5Y4ms3ueSfun611lvzf6vVo9VUnw9g=;
        b=jNqGJ8onjiOy00Xqpq7s3oKUZHahubSTLuuiY7kdfcrvWNM50xNwaqq3mf9uA5IXDN
         HbZFd0oc1mMZWxg5UayAb63eNnCoIL3T3sWA7IOtYrQDhmMAQwr61tt2EmfPlDbX11Wa
         RYLZtbUObP01lWe6qtf8RhoDCm9vqtPcKvjLtLlZJzrQmzDDfkJadyPhJFoEiQv95n+A
         z55v81v565fyuNHg0hghVGdEjDs9UACKDGJ5g/EttaHG0tHp7kf0kvbxu5D/a5JEjlMm
         xV8EOgP7IyyG+t83bZVZFzPcmj0AA8SCmdIIhoptzlLr1qLsg9bu1GXMg0MlKQ499OoP
         pEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698857411; x=1699462211;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeL4k8689m96l5Y4ms3ueSfun611lvzf6vVo9VUnw9g=;
        b=iKMhn9TO9nAH0/w1H4xcstmHEX5MiBhUp1xtld/rQQHVtCw3Z4JEPIguDCLJXi53pA
         XFBA8yCbqXiA3K4U1uxflgZCTUqG2J9ugZIEMA07JC9/B6dBzymqNPGGjEJ3HMuZsTBS
         LCGeu61I2IjY3QR8GH05LXMW+M9G8dQ3v/042qldtG77z1ukkAw5NUquSvVJgTe267OM
         xlmVwMtyBEemoQxcDzCt1lYa+M0MZxH+6zp7EzCT//jJC1FeX338qrG1szX25hKDiaSL
         HbP19DK682GzIZlyKmEttyPxkTXgttmdk9yRYNiTOeY6UI3nG8mSIXvIPf/msPowP29Q
         G3zw==
X-Gm-Message-State: AOJu0YwS/OVvThxUN8FCGSc5hrAbTjERrouJSkLD0sE9PH8DAFB2fNK9
        DJVz3HWGm7LJZt/9m1chtKw=
X-Google-Smtp-Source: AGHT+IEzNJlj3njEpQ05m3lSiJ0Hxu6OgY2H/VIIqTbfltvKMwc9SdIzP6dHFJ4m+vh0ksnIDovDFA==
X-Received: by 2002:a17:906:fe41:b0:9ad:f60c:7287 with SMTP id wz1-20020a170906fe4100b009adf60c7287mr2445108ejb.28.1698857411190;
        Wed, 01 Nov 2023 09:50:11 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906560700b0099cc36c4681sm126524ejq.157.2023.11.01.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 09:50:10 -0700 (PDT)
Date:   Wed, 1 Nov 2023 17:50:09 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Helge Deller <deller@gmx.de>, Robert Foss <rfoss@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] fbdev/simplefb: Add support for generic power-domains
Message-ID: <ZUKBwZ3axCKQDXfz@orome.fritz.box>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
 <20231011143809.1108034-3-thierry.reding@gmail.com>
 <0bc4aac4-817a-4a6d-8e7c-d19269c47a40@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+/xFpIUyBUk/gF1c"
Content-Disposition: inline
In-Reply-To: <0bc4aac4-817a-4a6d-8e7c-d19269c47a40@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--+/xFpIUyBUk/gF1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 02:50:27PM +0200, Hans de Goede wrote:
> Hi,
>=20
> Thank you for your patches.
>=20
> On 10/11/23 16:38, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The simple-framebuffer device tree bindings document the power-domains
> > property, so make sure that simplefb supports it. This ensures that the
> > power domains remain enabled as long as simplefb is active.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/video/fbdev/simplefb.c | 93 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 91 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simpl=
efb.c
> > index 18025f34fde7..e69fb0ad2d54 100644
> > --- a/drivers/video/fbdev/simplefb.c
> > +++ b/drivers/video/fbdev/simplefb.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/of_clk.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/parser.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/regulator/consumer.h>
> > =20
> >  static const struct fb_fix_screeninfo simplefb_fix =3D {
> > @@ -78,6 +79,11 @@ struct simplefb_par {
> >  	unsigned int clk_count;
> >  	struct clk **clks;
> >  #endif
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +	unsigned int num_genpds;
> > +	struct device **genpds;
> > +	struct device_link **genpd_links;
> > +#endif
> >  #if defined CONFIG_OF && defined CONFIG_REGULATOR
> >  	bool regulators_enabled;
> >  	u32 regulator_count;
> > @@ -432,6 +438,83 @@ static void simplefb_regulators_enable(struct simp=
lefb_par *par,
> >  static void simplefb_regulators_destroy(struct simplefb_par *par) { }
> >  #endif
> > =20
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +static void simplefb_detach_genpds(void *res)
> > +{
> > +	struct simplefb_par *par =3D res;
> > +	unsigned int i =3D par->num_genpds;
> > +
> > +	if (par->num_genpds <=3D 1)
> > +		return;
> > +
> > +	while (i--) {
> > +		if (par->genpd_links[i])
> > +			device_link_del(par->genpd_links[i]);
> > +
> > +		if (!IS_ERR_OR_NULL(par->genpds[i]))
> > +			dev_pm_domain_detach(par->genpds[i], true);
> > +	}
>=20
> Using this i-- construct means that genpd at index 0 will
> not be cleaned up.

This is actually a common variant to clean up in reverse order. You'll
find this used a lot in core code and so on. It has the advantage that
you can use it to unwind (not the case here) because i will already be
set to the right value, typically. It's also nice because it works for
unsigned integers.

Note that this uses the postfix decrement, so evaluation happens before
the decrement and therefore the last iteration of the loop will run with
i =3D=3D 0. For unsigned integers this also means that after the loop the
variable will actually have wrapped around, but that's usually not a
problem since it isn't used after this point anymore.

> >  static int simplefb_probe(struct platform_device *pdev)
> >  {
> >  	int ret;
> > @@ -518,6 +601,10 @@ static int simplefb_probe(struct platform_device *=
pdev)
> >  	if (ret < 0)
> >  		goto error_clocks;
> > =20
> > +	ret =3D simplefb_attach_genpd(par, pdev);
> > +	if (ret < 0)
> > +		goto error_regulators;
> > +
> >  	simplefb_clocks_enable(par, pdev);
> >  	simplefb_regulators_enable(par, pdev);
> > =20
> > @@ -534,18 +621,20 @@ static int simplefb_probe(struct platform_device =
*pdev)
> >  	ret =3D devm_aperture_acquire_for_platform_device(pdev, par->base, pa=
r->size);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "Unable to acquire aperture: %d\n", ret);
> > -		goto error_regulators;
> > +		goto error_genpds;
>=20
> This is not necessary since simplefb_attach_genpd() ends with:
>=20
> 	devm_add_action_or_reset(dev, simplefb_detach_genpds, par)
>=20
> Which causes simplefb_detach_genpds() to run when probe() fails.

Yes, you're right. I've removed all these explicit cleanup paths since
they are not needed.

>=20
> >  	}
> >  	ret =3D register_framebuffer(info);
> >  	if (ret < 0) {
> >  		dev_err(&pdev->dev, "Unable to register simplefb: %d\n", ret);
> > -		goto error_regulators;
> > +		goto error_genpds;
> >  	}
> > =20
> >  	dev_info(&pdev->dev, "fb%d: simplefb registered!\n", info->node);
> > =20
> >  	return 0;
> > =20
> > +error_genpds:
> > +	simplefb_detach_genpds(par);
>=20
> As the kernel test robot (LKP) already pointed out this is causing
> compile errors when #if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DO=
MAINS
> evaluates as false.
>=20
> Since there is no simplefb_detach_genpds() stub in the #else, but as
> mentioned above this is not necessary so just remove it.

Yep, done.

Thanks,
Thierry

--+/xFpIUyBUk/gF1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVCgb4ACgkQ3SOs138+
s6EM3w/9FP7lqs9ZyGWbUDEYUymUwki1/1KqaUBA4DAQYrzllhGmvJSnNWSJz+p5
zjDxpvJ0tVhrwsVe5OHgluyWKLi5ck1QJVZOo9IyXObSBlx7Ecr0BtgTUxJda2MJ
YZ2nJemJVl2DCHKozdx/Raq8HK8wVE88jIkB6arXi8xRGjFBQ9IKvbelGP9YvI8i
VISMZYhPcKcvdotj0DrKQL4tcLL7XpM9Fup8Gt7CWPwjieH90PXf2EOgSlwqSYnX
V/HM3y9QVccQBhawXfmpvvKK80Ez+E8dPjjlsKhTEHG64ngqn7ulaVtVmdmgAYtu
LyKForoeboswYv/p+14n+O2ngEFt4FLNjYrMSCI7EcdMUADdpqgG03Fe4ex8ke/S
A13OQT4jXXaKecaSykJJYjE38LX1MQu+GxVotkxPD/k4urHV50XKuhk70Ai2I/dR
WI3tZysyPV5hXYltQdlz/h/wT901ApWCQZa2TLZmH4vjKHdMQJoqFYVQQnUvEKr9
Kaiv/8sVSNAMNvhYyfpmtInXhXEVGBgg50aWuOlhtnIx/M56ghmZ4BSb5tAhF6RW
8x6aAwwF5vLT7PUVFzI81hF40dWtq8GKWYwV85szjvW6dOoyKeEaouUbV+8FbEeV
VMdG5Dgi/XdnRmKUm2dbM9SltkUelVixE5baAymhLEyZiqXdRzw=
=pXpM
-----END PGP SIGNATURE-----

--+/xFpIUyBUk/gF1c--
