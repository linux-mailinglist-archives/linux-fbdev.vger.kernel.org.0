Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D81074808
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jul 2019 09:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387994AbfGYHXg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jul 2019 03:23:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:43786 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387990AbfGYHXg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jul 2019 03:23:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D43B2AD12;
        Thu, 25 Jul 2019 07:23:34 +0000 (UTC)
Message-ID: <25a729cd1aa40fe5fc53760be48721d3f56b67e6.camel@suse.de>
Subject: Re: [PATCH v2] Staging: fbtft: Fix GPIO handling
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jan Sebastian =?ISO-8859-1?Q?G=F6tte?= <linux@jaseg.net>
Cc:     Phil Reid <preid@electromag.com.au>,
        dri-devel@lists.freedesktop.org, nishadkamdar@gmail.com,
        bhanusreemahesh@gmail.com, leobras.c@gmail.com,
        linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org
Date:   Thu, 25 Jul 2019 09:23:32 +0200
In-Reply-To: <20190725072132.GA18714@kroah.com>
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
         <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
         <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
         <75ada52f-afa1-08bc-d0ce-966fc1110e70@jaseg.net>
         <20190725072132.GA18714@kroah.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-dJ2ncZl/Tq5SUWotdfEp"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--=-dJ2ncZl/Tq5SUWotdfEp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-25 at 09:21 +0200, Greg KH wrote:
> On Wed, Jul 17, 2019 at 11:41:37PM +0900, Jan Sebastian G=C3=B6tte wrote:
> > Commit c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor
> > interface") breaks GPIO handling. In several places, checks to only set
> > a GPIO if it was configured ended up backwards.
> > I have tested this fix. The fixed driver works with a ili9486
> > display connected to a raspberry pi via SPI.
> >=20
> > Fixes: commit c440eee1a7a1d ("Staging: fbtft: Switch to the gpio descri=
ptor
> > interface")
> > Tested-by: Jan Sebastian G=C3=B6tte <linux@jaseg.net>
> > Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > Signed-off-by: Jan Sebastian G=C3=B6tte <linux@jaseg.net>
> > ---
>=20
> Can this go on top of Phil's patches?  Or does it replace it?

This is needed on top of Phil patches.

Regards,
Nicolas


--=-dJ2ncZl/Tq5SUWotdfEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl05WPUACgkQlfZmHno8
x/5gTAf/fIsoLKSE7JnAbBPihq8kbe1iDC8qQWHchEqQDL+A1r6QA0n+ujgSQfRY
Le/xoufXOHO29UeoJ4AUh05o8kaL7lDc8ip88dtd+4Kgl4p9LyQ1AbuKYi/ifGeW
u/AEbQhgsRu9gQMeUo1qjZQqzgbnNqSeRoimKNwelFruH0uIKwcgECcjiR6FHtvq
W7XoMzZ44YLGnS67QcbO0xtEqgWRetpXc2Li8xoWi1JT/vqYwT/My9udmNb1vvBE
SvfyGCry9zYS/7NL638P0qfTLm7WznpqHn41UV3Ptq7RaD6Idcm+Ai6OyczdviaF
wNVcIaFhx73LXuCdrESnpqF6CdhaHA==
=OcqC
-----END PGP SIGNATURE-----

--=-dJ2ncZl/Tq5SUWotdfEp--

