Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE5256FEAF
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Jul 2022 12:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbiGKKRS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Jul 2022 06:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiGKKQx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Jul 2022 06:16:53 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD93C1FD1;
        Mon, 11 Jul 2022 02:35:21 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id C91F35C013F;
        Mon, 11 Jul 2022 05:35:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 11 Jul 2022 05:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1657532117; x=1657618517; bh=XbWPLMD2Em
        uATKpk1FD3KGRJwxeaul3Brd4v6K9DrL4=; b=OTp3vytlqDJB+2vPD994rtzUSQ
        jOws1ocqG9aslbnxMmio9bk1vaHERJXD7S921jfGSwXU7mfjCLmOJsp6N4kPa1nS
        WV+bhI42L3Q1gasRfbu21/LfY0yp4ykbp2LLnIpmwPlgl5kS7zo7bJ4wOXab1QmX
        nyqjD3zURMq1PW+SdxxfC3ISp70/EUiHicvVmCyCQV/8aMYfjd4PkHbR7IdFHaw1
        l3sQN0VEICD8f2wFihwiBH0UnLrKFGcIj2U33+YPCUoYu7jxye3iHB5GmE+3o3q4
        xjqnlZ7ZKympcszm3AzbT4jgpbqHFAbRu622d4YeNYOFHoQdsc4ArFJPEIww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657532117; x=1657618517; bh=XbWPLMD2EmuATKpk1FD3KGRJwxea
        ul3Brd4v6K9DrL4=; b=wzqDE7Xj1fV2ovXBsdHnlLejf5Lp0LnnASBzLWnrAtd6
        I1mRZmLfKZaPTBJA36z0FJdpWVDlOTxgEBXWk337UKwjnJS/CELoL+exFpjxhnny
        Bn/mYvq8yOSUTmsz5RCnSp/pWCXhiEuhvq84r6RvnzBlaz4CLB04jvetRtl7dzEV
        Ff02JrIeEvpdBOGVR7rKxmTK8YbouQ8NWTDCS3c5CnCD3t4JJA5+PbWS8Bwp75MC
        Qbo69Cm0TQrkaGTODiop7u90HKRB8S4dF//8t2U/V4ZDitxKL673K+6czR9mfhri
        OI0O1tctbPEc19fxRRFH1rEH2YKJdYe8RtxptgNqdw==
X-ME-Sender: <xms:1O7LYrfWPlt6trX7NfKre5g97Ec1Lir6hi7AzCPXbF6OVCPh-e_wZw>
    <xme:1O7LYhPyUzlv_7yTNqd4bNdxmw1nRf7BUYcdtSYMXVw3QzlSjoZlbghGnZGEmLltC
    un91fSE4jGKyC0N5Bs>
X-ME-Received: <xmr:1O7LYkh8H29Od_9Gxz0JVXp1ZTtb8ZJtMBOYwg8oNrw69Ysq1gs5pJPF4RAnjYKWUbPPHECySNl4efJJreLXlKjT7iTGCZ-P5A37jPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefgueeutdefgfevveehjeefgeehvdejjeefheekffduteeutdfgieeiieff
    uedtffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
    tghh
X-ME-Proxy: <xmx:1O7LYs8GVOEWlnc9qwTWEM4C4DNev4fE0gKiRfbG7ccgZA3AWxxQyg>
    <xmx:1O7LYnuk_HPXsKzJcilSyrY81HXlOyG7v8QtpLZFzj6WyDiUwcFZsw>
    <xmx:1O7LYrEmoyqlinUjKkWxXmWL3baAchrY7RW6VP4y4b2TxxwQhX9SVw>
    <xmx:1e7LYtAGRv69zomwAPy7p8ZXZ4MtM33m0b2hE1I6qKPxFx8ARLW5LA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 05:35:16 -0400 (EDT)
Date:   Mon, 11 Jul 2022 11:35:13 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named
 modes
Message-ID: <20220711093513.wilv6e6aqcuyg52w@houat>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x625msex36qfkynz"
Content-Disposition: inline
In-Reply-To: <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--x625msex36qfkynz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Jul 11, 2022 at 11:03:38AM +0200, Thomas Zimmermann wrote:
> Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > The mode parsing code recognizes named modes only if they are explicitly
> > listed in the internal whitelist, which is currently limited to "NTSC"
> > and "PAL".
> >=20
> > Provide a mechanism for drivers to override this list to support custom
> > mode names.
> >=20
> > Ideally, this list should just come from the driver's actual list of
> > modes, but connector->probed_modes is not yet populated at the time of
> > parsing.
>=20
> I've looked for code that uses these names, couldn't find any. How is this
> being used in practice? For example, if I say "PAL" on the command line, =
is
> there DRM code that fills in the PAL mode parameters?

We have some code to deal with this in sun4i:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_=
tv.c#L292

It's a bit off topic, but for TV standards, I'm still not sure what the
best course of action is. There's several interactions that make this a
bit troublesome:

  * Some TV standards differ by their mode (ie, PAL vs NSTC), but some
    other differ by parameters that are not part of drm_display_mode
    (NTSC vs NSTC-J where the only difference is the black and blanking
    signal levels for example).

  * The mode names allow to provide a fairly convenient way to add that
    extra information, but the userspace is free to create its own mode
    and might omit the mode name entirely.

So in the code above, if the name has been preserved we match by name,
but we fall back to matching by mode if it hasn't been, which in this
case means that we have no way to differentiate between NTSC, NTSC-J,
PAL-M in this case.

We have some patches downstream for the RaspberryPi that has the TV
standard as a property. There's a few extra logic required for the
userspace (like setting the PAL property, with the NTSC mode) so I'm not
sure it's preferable.

Or we could do something like a property to try that standard, and
another that reports the one we actually chose.

> And another question I have is whether this whitelist belongs into the
> driver at all. Standard modes exist independent from drivers or hardware.
> Shouldn't there simply be a global list of all possible mode names? Drive=
rs
> would filter out the unsupported modes anyway.

We should totally do something like that, yeah

Maxime

--x625msex36qfkynz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYsvu0QAKCRDj7w1vZxhR
xYfLAQCE7tFL3DFGFWWg7d+mu+PlmSZLGOBUYGT1QXAXIgy1PAEAszxH3TfwGPT4
YhVwpShCkoqgvPRPCUVP/woGKYyuWAM=
=5GMd
-----END PGP SIGNATURE-----

--x625msex36qfkynz--
