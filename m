Return-Path: <linux-fbdev+bounces-2762-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF2944915
	for <lists+linux-fbdev@lfdr.de>; Thu,  1 Aug 2024 12:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED67F2831DC
	for <lists+linux-fbdev@lfdr.de>; Thu,  1 Aug 2024 10:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CEF183CA9;
	Thu,  1 Aug 2024 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fYfYrChN"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B31607A5
	for <linux-fbdev@vger.kernel.org>; Thu,  1 Aug 2024 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506958; cv=none; b=vCh9sJjT45FecxBTWRVPcmQRPlvaJXZu97Wb0I3IfgTbFHugU5Gw4XJQ2yChsoveEXClEHJP9ZUtjo8HGWUQBzwPy807zwwrLZ29sntN17iOPRhFwehklTyF9ySBZdRATFSyAictXYrMQWLkGtj6Lhc/X7tIcVvHKMG0AkVQ0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506958; c=relaxed/simple;
	bh=P6OMtUrQn4UZTjmQjF4bUCRTsCT8RkFp+l8NrubderE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUaZ3/aibN1WHaZrlSzhQVggR5NmD/rl4xDXfJGzMdNFTFf7kg5d9ZYh5WYWBQGZynA2k50x3cB+5dYbv0tMY2fHUpSDYrq6ktymi5xYAnxLMNlW5bwJi5Ptffm4NUNBc2PUMp0GNyrq4QsGIStx8KhgpKpM9riUN02TxYoA6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fYfYrChN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428163f7635so43260575e9.2
        for <linux-fbdev@vger.kernel.org>; Thu, 01 Aug 2024 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722506954; x=1723111754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6OMtUrQn4UZTjmQjF4bUCRTsCT8RkFp+l8NrubderE=;
        b=fYfYrChNJzpd/NDsCu+vJQ+cNcY0BDd7Sae43pYHV25I10lIPCDImhmzoU3abyWbLD
         Bpn3Ulo8VhfmoI5RcWpmn3q8srlkHyT3NwF/V6JjeRSyY7ueBF6qFLteOFzv6Ds4dGEW
         PHuE+0Y88FL6fsxtwhIz6fmMav86wy7pxCmdWYbptcwzaKxwfcFSEWtJUMPfe2uGGfOq
         F/4iuaxPehYNxJomgZpEuZiLu4lmZIVWRLFJCL/aGHIAgDHk97gR2mb5ieJsDzYRv89W
         VBwFuRYUWjVNL5axBA7kNmeOtZowgk7tuezcZoGhddxQN8qlwiKjRc//ZpejDtd+wPng
         9fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506954; x=1723111754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6OMtUrQn4UZTjmQjF4bUCRTsCT8RkFp+l8NrubderE=;
        b=oorc2VFxus4HUjIlM/1teNS+G9utp22gK1Q1JfWHkN1TnF9lLkdUMJfnoiFfLwmLQ1
         OW0MhthuOWM4mm6+JAViirYApj7T0tMpZWaHeYPb8I53cIkceZeFSqzV2FaPmDXQghtB
         7QoDb3x7oXDbWN2FS+crl4RlMzth4v+vrXphddRM8hx/hkfb8N/HzlpbGHSch0cMDr8V
         P35cERTdBHiJghTU7uE+2k3f2cxtVSIQEm+NNmLOFsn/EpslXbuuIoD6brmky8Q08xYM
         F4eLy1nkpNxmHrEEzLEb/6CavByQYuQg/K0i18CpB1PTWBuPsDY5qFM6fn++8sG7cRc3
         m45A==
X-Forwarded-Encrypted: i=1; AJvYcCXm4U+hfzJfqIGrAGgnbilxglQgdVE9zzyXG8CAVD0vtLxg3uThdHx13JtzpaqevsN3Ojuk89ntPuL5+hYRvzw7Grr3SEswKK7pSGQ=
X-Gm-Message-State: AOJu0Yy7R8x7fDDH8mQ5C4Ntmm8aBrh+XFhXcE3rfdIvXV2MM2QYwA12
	IjKGyEy56T5rLjbNRAqg/Zv4EeSWhgt4WqHTgA1yTq6t6VzyKRxMnfyhy0aOBpY=
X-Google-Smtp-Source: AGHT+IFD9Huqf9ehqE/yx/c33T4hC67DXyZNzDd7aRkxvgUynfl/kCK9JGFNCBCC68t+y1XFHOnwRg==
X-Received: by 2002:a05:600c:354e:b0:426:5b3a:96c with SMTP id 5b1f17b1804b1-428b4ad2353mr15186275e9.28.1722506954102;
        Thu, 01 Aug 2024 03:09:14 -0700 (PDT)
Received: from localhost ([193.196.194.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b867146fdsm6868598f8f.101.2024.08.01.03.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:09:13 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:09:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: 
	Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, 
	"lee@kernel.org" <lee@kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] backlight: pwm_bl: print errno for probe errors
Message-ID: <3ghsuulqhfqvktfqbo7hfewpgu2nbyxahjxmoqfkvpceepmqih@axneh72aegog>
References: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
 <fjke5js43aqxdxmoau2l275a26o52sq7hyjgzwxnnsrptqlcvs@mohkvblfqkhg>
 <00f4f77151de3c3a4964fe697a7d1841c670284b.camel@ginzinger.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7rid6e4qsgbmshkc"
Content-Disposition: inline
In-Reply-To: <00f4f77151de3c3a4964fe697a7d1841c670284b.camel@ginzinger.com>


--7rid6e4qsgbmshkc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Martin,

On Thu, Aug 01, 2024 at 09:52:01AM +0000, Kepplinger-Novakovic Martin wrote:
> Am Donnerstag, dem 01.08.2024 um 11:26 +0200 schrieb Uwe Kleine-K=C3=B6ni=
g:
> > On Thu, Aug 01, 2024 at 11:12:55AM +0200, Martin Kepplinger-Novakovi=C4=
=87
> > wrote:
> > > diff --git a/drivers/video/backlight/pwm_bl.c
> > > b/drivers/video/backlight/pwm_bl.c
> > > index f1005bd0c41e3..cc7e7af71891f 100644
> > > --- a/drivers/video/backlight/pwm_bl.c
> > > +++ b/drivers/video/backlight/pwm_bl.c
> > > @@ -502,7 +502,8 @@ static int pwm_backlight_probe(struct
> > > platform_device *pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 GPIOD_ASIS);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(pb->enable=
_gpio)) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D dev_err_probe(&pdev->dev, PTR_ERR(pb-
> > > >enable_gpio),
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to =
acquire enable
> > > GPIO\n");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to =
acquire enable GPIO:
> > > %ld\n",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(pb-=
>enable_gpio));
> >=20
> > AFAIK dev_err_probe already emits the error code passed as 2nd
> > parameter. So I wonder about this patch's benefit.
> >=20
>=20
> It does. Other messages only take the deferred_probe_reason without the
> error code. It's actually fine if users properly enable debugging after
> seeing an error and then this change is not needed :)

I'm unsure what you intend to say here. Do you agree that this patch
doesn't need to be applied as it doesn't add any information to the
emitted messages? Or do you think there is a value because "users don't
need to enable debugging" then. In the latter case I don't see where
users would see "failed to acquire enable GPIO" before, but not the
value of the error code.

Best regards
Uwe

--7rid6e4qsgbmshkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmarXsUACgkQj4D7WH0S
/k6l9Af/QvYMJbj5q+H1Wto4fcvjCBdCY5CVt+pMDOClbcj6r7dlMGxySz03mxdf
z8RSJeTXzShCNn8MTn07U90Xeip39HaubUQsNgxcRwPhUlnyvEu3Vyv4+hsFayIF
4CZpVXbG/yX3/xP7oj5cMeb3J7neOMn2Dq2wFSxcnum8jcEM95jEzIhnnw6C2LvH
u529HfA6RNKM/M/aUm4RYHjx+VcpRIUuiYXqmWm7x1kAXwxfMe2PRpG/u2gUOopW
THrzdZDFP/MJ8bjSl0dylfe1AmFBJMedleJhSDNiXLT+PMIXZp+PQGCtdJBV99R+
YUoAqBv0roilGt6tJ/qRNdZx+f8c0Q==
=VOJH
-----END PGP SIGNATURE-----

--7rid6e4qsgbmshkc--

