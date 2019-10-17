Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6358BDADC9
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Oct 2019 15:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbfJQNFZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Oct 2019 09:05:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36734 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbfJQNFZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Oct 2019 09:05:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id w18so1709726wrt.3;
        Thu, 17 Oct 2019 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y67wkQY0Oxmesuc8oRfdce+PJjDB/BL3x9OqjRG73Bo=;
        b=BUfv6hZkeqS5Ncg6fG3RTimyYrWMqsVaS/TVWzUpAb/RV7cEloVYWOsbedj3Kq25B7
         yx0bjNoPzIyI2uhBk7YH5urlu0d25if75ybjGbiKCFIFYTM4oKCuCQzpofa7OTIF4fbS
         zxfd916BFunFRc9ODynmxfZaC4Gr/XBnjw1BP3bkknInzFBVkaBTCUvRoD1aGyCtSm4a
         SczAgsVPFVI+gE311CZpt/jMK8Z6LSobXVwDgdUzkemhoFM9in4sfcAVXLjQt3IMwzb0
         AnwdjkMalQQ0kfNqOmF/lE9cdzCwud7jaeKBK4Zb1AVx3+8Z1LfuK9r0fpA46bh23oVQ
         YMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y67wkQY0Oxmesuc8oRfdce+PJjDB/BL3x9OqjRG73Bo=;
        b=KJcQVsZPHIM4WB/K6xJBjd3dnwlEuhXh3iTIm3cMPKZjtdFs49yS0XamEiE8zCiINM
         DvALqSdpeyORlxkBOulGqnBABgpMu48dXMt7pGh5Fz+41eskIm67ByhdUkncdTXa/X/7
         b3EwzITq0GtxwzIB2KY8FNjHB65/6WkccrFPcd6K61uPhb+WYi3ZQ3jUKSWHm8WexeSC
         gaironsFJmduhdxWKoNEgrlpWQ40RP9pl9fwcA54DPb2bctY699TuOkX0+I3oahSvWGJ
         Z3pgqCTcw3Rn2Xi+V6M65+YkNVIP1G8tWjjCKAjdQrSF7Mz/I7UZcvOaaFpGbGNHuNfD
         mjEA==
X-Gm-Message-State: APjAAAX0bH5C4pFk/PZYGFRenfQFcLbb2QAcmFIeL68G4ykKvWlMNinm
        bN0A9QqADzFja7M8Yqfqjfk=
X-Google-Smtp-Source: APXvYqwuS7SYR6nxg8pFVPusASD+cnwL/eRM1xrf4l1VNTZripARxXo5b4VfZW8FOv5H2QJBtICtYw==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr2947143wrv.322.1571317521204;
        Thu, 17 Oct 2019 06:05:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id g1sm2437983wrv.68.2019.10.17.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 06:05:19 -0700 (PDT)
Date:   Thu, 17 Oct 2019 15:05:19 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pwm@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017130519.GC3768303@ulmo>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
 <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
 <CAHCN7xKogdqoLmbbTatPdtLzqz+MKh-jgrHkkCh+YA-bwwOkDA@mail.gmail.com>
 <CAHCN7xJFDrsqzR2H2mNYhKB8iF7xYWb9kM+HdzukjDix461gsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline
In-Reply-To: <CAHCN7xJFDrsqzR2H2mNYhKB8iF7xYWb9kM+HdzukjDix461gsg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 07:40:47AM -0500, Adam Ford wrote:
> On Thu, Oct 17, 2019 at 7:34 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Thu, Oct 17, 2019 at 7:19 AM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > On Thu, Oct 17, 2019 at 12:47:27PM +0100, Daniel Thompson wrote:
> > > > On Thu, Oct 17, 2019 at 10:10:59AM +0200, Uwe Kleine-K=C3=B6nig wro=
te:
> > > > > A previous change in the pwm core (namely 01ccf903edd6 ("pwm: Let
> > > > > pwm_get_state() return the last implemented state")) changed the
> > > > > semantic of pwm_get_state() and disclosed an (as it seems) common
> > > > > problem in lowlevel PWM drivers. By not relying on the period and=
 duty
> > > > > cycle being retrievable from a disabled PWM this type of problem =
is
> > > > > worked around.
> > > > >
> > > > > Apart from this issue only calling the pwm_get_state/pwm_apply_st=
ate
> > > > > combo once is also more effective.
> > > >
> > > > I'm only interested in the second paragraph here.
> > > >
> > > > There seems to be a reasonable consensus that the i.MX27 and cros-ec
> > > > PWM drivers should be fixed for the benefit of other PWM clients.
> > > > So we make this change because it makes the pwm-bl better... not to
> > > > work around bugs ;-).
> > >
> > > That's fine, still I think it's fair to explain the motivation of
> > > creating this patch.
> > >
> > > > > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/bac=
klight/pwm_bl.c
> > > > > index 746eebc411df..ddebd62b3978 100644
> > > > > --- a/drivers/video/backlight/pwm_bl.c
> > > > > +++ b/drivers/video/backlight/pwm_bl.c
> > > > > @@ -67,40 +62,27 @@ static void pwm_backlight_power_on(struct pwm=
_bl_data *pb)
> > > > >
> > > > >  static void pwm_backlight_power_off(struct pwm_bl_data *pb)
> > > > >  {
> > > > > -   struct pwm_state state;
> > > > > -
> > > > > -   pwm_get_state(pb->pwm, &state);
> > > > > -   if (!pb->enabled)
> > > > > -           return;
> > > > > -
> > > >
> > > > Why remove the pb->enabled check? I thought that was there to ensur=
e we
> > > > don't mess up the regular reference counts.
> > >
> > > I havn't looked yet, but I guess I have to respin. Expect a v2 later
> > > today.
> >
> > I would agree that a high-level fix is better than a series of low
> > level driver fixes.  For what its worth, your V1 patch worked fine on
> > my i.MX6Q.  I can test the V2 patch when its ready.
>=20
> I may have spoken too soon.  The patch fixes the display in that it
> comes on when it previously did not, but changes to brightness do not
> appear to do anything anymore.  I don't have an oscilloscope where I
> am now, so I cannot verify whether or not the PWM duty cycle changes.
>=20
> To my eye, the following do not appear to change the brightness of the sc=
reen:
>      echo 7 > /sys/devices/soc0/backlight-lvds/backlight/backlight-lvds/b=
rightness
>      echo 2 > /sys/devices/soc0/backlight-lvds/backlight/backlight-lvds/b=
rightness
>      echo 5 > /sys/devices/soc0/backlight-lvds/backlight/backlight-lvds/b=
rightness

Hi Adam,

can you try the i.MX PWM patch that I posted earlier instead? I really
think we need to fix this in the PWM drivers because they are broken.
pwm-backlight is not. -rc3 is really not a time to work around breakage
in consumers.

If my patch doesn't help, can you try reverting the offending patch? If
we can't come up with a good fix for the drivers, reverting is the next
best option.

Thierry

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2oZw4ACgkQ3SOs138+
s6HfMg/9Gy8G3OY/oPo9PBR5G7SaUJbK+owhtVcIxCqSYaRZTEqv9QjDiMDtTsIr
DkoX3twloAdvTifihh1M3iFq88U/t5hT0NA9E+xhigZsmml/ZWCW/uf74kILIQ8d
MUm3e0mnzlaI3mUoTof7JpO2fk01ib6Dh55RdKzVenwTaFtJaQjijvKCkwysIzuU
dGB+1zsHKRxhGcjyLEb4nYSPitz/ffre6TyLiQOpt7B6ARmmjYgZoGtOllb2hfej
QwMOcKo/2fX/7e30sfkYVNJPP2C7R8RAQcohZQiVB5K0QlexG9CJ33XRChgb+l/D
XOwwb7AK63Ndf79dEYwLL4RgnIJZO3PPiEf3gx8W2czFNpZ5tBXv+1RJyVGoGKrH
2A1oiA5aE4N0CI8G8XnG9GMX4m4hA+u+aOXBpLuZXySXnSFhgcz7E0F/ACqW+/lz
ok2Yy9Iq8JLZtdP8bIW6JuBTRKSjOr46xoviZLbfbfjbLPc7UbmClGRQTSvImlxH
rOZ7cQQ8rbOUPLC3tBmleL9ZdEAXrgvYJM9oD1NPOf5WWXjiPyvEmPWTP/wZecyK
r+Y25gbFle42SOLoaNwe5q2qpmLGuzx6H2FKMij2ddjV5vQV4LPUkuaY7wpOasOO
TZqlGpLHlDeMgPIdSsfoTGT8WoaKCg5xjGsmqtoMSdX6+uJ23ZU=
=QRHa
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
