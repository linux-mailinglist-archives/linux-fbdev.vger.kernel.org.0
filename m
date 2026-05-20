Return-Path: <linux-fbdev+bounces-7315-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JdaBGN9DWpEyAUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7315-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 May 2026 11:22:43 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C258AA68
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 May 2026 11:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87EA13206A77
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 May 2026 08:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878C4375AAB;
	Wed, 20 May 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WJdF61jH"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9FE34D4EA
	for <linux-fbdev@vger.kernel.org>; Wed, 20 May 2026 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266804; cv=none; b=MVcJ7cymFlQj7TC53grL54x0LBde6WWauOY0GPR6mmhX1DIpPHrXER4NgItwxmJqbjJMl5A1s+yY9yXP9klbP8R6mq7App5C8vqcE+hIt+omYWzpEpWKrwJxve1z6VwcKuLDujQEPZrjEHVZhwO5OzZrdTC51J+KAJ8EbyhN57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266804; c=relaxed/simple;
	bh=EuNb7c+M5izNWaIX3sDUu+oSgbsnPpwC3h9wiA6CPGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/iy/phpubayqZFzGKsDVD0whkkUpGSierZN9eSAM+WRxcK6P4rtlVMHCRbw8RJnmQ85hqxx3R3wxlLP+Rn8lp3LMVs2p2CI6X3VvZ/rn8RtBQ5vF6N6Jmoeg5ZkD3lC1sfNCJeYFx5NbkGwaalguKkfCY2JZRBVle5pDwHBPpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WJdF61jH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43eb05b1875so2499538f8f.3
        for <linux-fbdev@vger.kernel.org>; Wed, 20 May 2026 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779266800; x=1779871600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U53nOZsze2BOUUWxn8xrqWn0udiJAimX6PJ2o0xVGTg=;
        b=WJdF61jHG2kyvi6q/MrZRQrtCPML/KMtNakZx1H93IhZ8YGI6Eti3U6XPurZjnnR9T
         YRe2g3iMBF6VuhXQohMGttOO162iPe0pEiacJZnXNGDfcnBJNLE+RZ4SEdWgwiXuNmZH
         H0uGPS1Jpsl/mBwFpsML7G7dUAGycqyjC7YK9S4fSfGAc9xNNSTRdbjLIDNRtQ3RC+7D
         h9vXDlhL6Dh7DwXmPtg2+1ugJmkzj6v+lhVV+FoCbjwHo3MjSQOa9CkWLLky4DLJL7Hy
         mdTTRAnCzhdVHMvwSGsm7T0r5SLHkJc/sGVZGyOvXeEguvh8GktAIaGqUP/CwXJPwaor
         m7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266800; x=1779871600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U53nOZsze2BOUUWxn8xrqWn0udiJAimX6PJ2o0xVGTg=;
        b=Q+3i/xHKOY7LQ0nKQDY4rYRdPiAkmwcRk0yMouHqlA+1ziLo0OmCGF2Ptl7KT5iWkU
         i/0Po7uN8JexKcdzB2bF3RIFbexIUaZwJ06MFKbOoHpTdqzeLsX4rE/MNuzKwsmdWK+b
         RhjHrhz9p0I6vci3FqDG9XOTAS0vHr2Zo7Vg3FVJwg52bDCCHp5Ag2iBLKZ2XTlFrYGF
         oCoYxW5am1jdy9FrnukXcc5OGolehcRiO4q18k4mI7hzG4jGTPSCgtDKUoFUF0Xlb4p1
         GNSyXRXCwfWgTbDsmY40Wv4OJFI36iYqMYulgnBW8dUYXiOJzXM6nuNYWSART1C2V67B
         t5rg==
X-Forwarded-Encrypted: i=1; AFNElJ+cH597jwN/QJMDrdkKFCS4+XRCP/fi2mI/cNR4ACXynqaLtT+ovj6TBS9c5UClB3INGIi2d+60NWwtHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHaBKg79IY5AcyY8a5TiSMENjzRUw/HwWeATDQURZ6QHMePELq
	STQZhMC1nbzVoZLVZPmrL+u3HzuKyudntkjR4nxIwgUKRBLHS/aNsh/VhXirsQTSwYEZB+EtQOW
	KWHByQ1NpRw==
X-Gm-Gg: Acq92OHHfJHxRVJWQdB+7l+bMbHy5cNn19MTGAwbs1l1rb5oVuXIoSFtEePV+NVv7g7
	xOv2f11Up0j5FUaFK4hpBC/uTn2qfgNGM2cHGaDo9Q2g6okxlW47qyRPLCPkI/FaaVGvU2UfDiN
	ceMJYs06W2H1oVI/aZEYC4RKSGpRtFS+oaXvB8DVpyoxUOhkcbGdx8FI7y8S8pxoE3vte8fzUiJ
	scMVEYIGwE011XkJFuJXEWuZk0ccqKrOgUteVngOHRMrM4DFRlw7syoHB3xJMh0B3IHslHit+wW
	uabhfqsd/pz/sVRnpj8sc+QNPZLTzBiihs0D7HHO9rv9j4KS8mpCZKFWrAUKBFBwbzd0vCvXQWY
	GZ6V6blJ6/QC3aOXQIgnWNPCKcDZYdtg5/7A7JwtgTUDySz1UIUy4+GxTAy1M5zug3IgXWTBOYg
	wwaXiYKPGEwtm9ao4WGlkQgosjuqSTtyA/9ng+ir4NcDAp7mVx3Z3bYC2Yp+aLb/aksLpPFYps7
	YAPxrXWs0J5iS8=
X-Received: by 2002:a5d:5d82:0:b0:439:c299:4d8f with SMTP id ffacd0b85a97d-45e5c5cbe4bmr36382479f8f.17.1779266800378;
        Wed, 20 May 2026 01:46:40 -0700 (PDT)
Received: from localhost (p200300f65f47db04a02ef40d8e5825ac.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a02e:f40d:8e58:25ac])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0a19b1dsm51573666f8f.17.2026.05.20.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:46:39 -0700 (PDT)
Date: Wed, 20 May 2026 10:46:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>, 
	Antonino Daplas <adaplas@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] fbdev: Consistently define pci_device_ids using named
 initializers
Message-ID: <ag1xQVCCzXkc_Ucu@monoceros>
References: <20260430111637.211336-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4j765bpqgzr2splh"
Content-Disposition: inline
In-Reply-To: <20260430111637.211336-2-u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	TAGGED_FROM(0.00)[bounces-7315-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_CC(0.00)[kernel.crashing.org,armlinux.org.uk,queued.net,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,baylibre.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:dkim]
X-Rspamd-Queue-Id: 680C258AA68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--4j765bpqgzr2splh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fbdev: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0

Hello,

On Thu, Apr 30, 2026 at 01:16:36PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/f=
bdev/matrox/matroxfb_base.c
> index e1a4bc7c2318..22774eb1b14c 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_base.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_base.c
> @@ -1642,7 +1642,7 @@ static int initMatrox2(struct matrox_fb_info *minfo=
, struct board *b)
>  	int err;
> =20
>  	static const struct pci_device_id intel_82437[] =3D {
> -		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437) },
> +		{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_82437) },
>  		{ },
>  	};
> =20

after further sharpening my tooling there is an additional change that
IMHO should be done here:

-		{ },
+		{ }

and ...

> diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
> index 3f6384e631b1..06aefad75f46 100644
> --- a/drivers/video/fbdev/pvr2fb.c
> +++ b/drivers/video/fbdev/pvr2fb.c
> @@ -993,9 +993,8 @@ static void pvr2fb_pci_remove(struct pci_dev *pdev)
>  }
> =20
>  static const struct pci_device_id pvr2fb_pci_tbl[] =3D {
> -	{ PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_NEON250,
> -	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
> -	{ 0, },
> +	{ PCI_VDEVICE(NEC, PCI_DEVICE_ID_NEC_NEON250), },
> +	{ },
>  };
> =20
>  MODULE_DEVICE_TABLE(pci, pvr2fb_pci_tbl);

=2E.. here:

-	{ PCI_VDEVICE(NEC, PCI_DEVICE_ID_NEC_NEON250), },
+	{ PCI_VDEVICE(NEC, PCI_DEVICE_ID_NEC_NEON250) },
-	{ },
+	{ }

Would you mind squashing that into the patch you already applied, maybe
adding:

	While touching all these arrays, unify usage of whitespace and
	comma in a few drivers.

to the commit log? I can also send a v2 of the patch with these changes
included if that's easier for you.

Otherwise I will put sending these modifications separately on my todo
list.

Best regards
Uwe

--4j765bpqgzr2splh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoNdOsACgkQj4D7WH0S
/k7n3AgAmiu0dkGSmVN5iwDMsbx9u5oGpxoTfYsBdf+ieZ5EzDYhZzjAd5M4GNMS
dajrNSdkatRRbEZFE3PYDscIkW69PVck72sxOJdTDyAVSPf2hgi3mbElPpXW5ZEl
V5s0iKhXHTafmLPl+5cAsDOdMG19WulP1A3QfTepuM0kOEAKsQ4UwUV4AWlpBgH6
GMiJdyUX4viX+gD8zOIgyKPCjqvBa8CMPkgQORFA1fuD+eEbv1Iw1b0xDr/AinyG
8Jfn/ZzaAAnTJje43x8rP+Q5hw6uVI6bBHTrhypMFQ0C9ofIZBsv2BUyQ8Hp5i85
TX3Z+lJoWmwknV9WI68+rtnMMOgSCg==
=on22
-----END PGP SIGNATURE-----

--4j765bpqgzr2splh--

