Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784A9574CCD
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 Jul 2022 14:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238723AbiGNMGU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 Jul 2022 08:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238696AbiGNMGS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 Jul 2022 08:06:18 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60615C9CC;
        Thu, 14 Jul 2022 05:06:14 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 554005C0172;
        Thu, 14 Jul 2022 08:06:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 14 Jul 2022 08:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1657800374; x=1657886774; bh=b5gmUsLswc
        M+GqSPANxZXShuD2xhkT0GXvBfBDz9dEo=; b=O58bELvDHpaw1FLXNwwEFFKex+
        OUE3n//oKnzRiP7dGhkfPd2scMkHWB2LyVWVP/9pRtCBAS3gVnU8mj+/ryqOjnhr
        GXuUpYBrLna8QpXLPF7Dz7XBlkQ9sFuvx9/A0gLQMyPC9zGd9XSHe24C/TXxqI2G
        leDhm0sRFr+fqIJzbvmprQRb8xpRN5wHtiYYoVnSs6Xi6aLykRLhHdMDMcZDj9z+
        /qFDLlSSfEBhZYMy+3FSYy0K2zsqUsuFtUC3wHNOOq2mIlNR0Cz7TSJsP8jZpAO0
        GR1Ytkb4fSOCcg3bBe2n0eX8gFOaWJa/nqkkzIbxL/L/h+ppuJ3VAIc2LhnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657800374; x=1657886774; bh=b5gmUsLswcM+GqSPANxZXShuD2xh
        kT0GXvBfBDz9dEo=; b=aJhIEcmAXBOFqUJxyJuQIjmvOqHLYTwSEG9RBTKJWT3o
        7Sjw/vys0EgZQv5WbA9i4/xkYeQMszi+sFi3BNAYBsh2HsBqwP+10d2ylxjZZibd
        R168w/NfX55gamugm7X9HTfO/LlEn44dmlnaokZci67vou5r+NofGmKyfP16Qkx5
        3ocB9b7M/P2IsEC9uuAQTtMUv5mTNw5cGIHin4w0MpzsUtbIdjd/3vUHJRu50q9d
        Id/AOxAB6mJA1iIE7egOw8afD6euVPboxkz4F0+wBp04TaueS5YbWIhzv6+XkReS
        K55cxlfwBA9lAc2im/bcIDn7HyeWTK5z5SEDhOvIGw==
X-ME-Sender: <xms:tQbQYqS61j29KeWLerE4Ad2V12AcJjoOzpw2D4FkqXn9hWNsBXiVHw>
    <xme:tQbQYvzrQs9YU1L9PZvUIhXjeZey1q-ePdn46nNbQuJX6rrXoFpMvh4FxyQG5NooB
    fV2v-aWLcGDZijBq0E>
X-ME-Received: <xmr:tQbQYn06M2vWzMUFePVbTZ_e4cwd9qzAj_lMUmWtZtmeWgutroBzwhnQpwEpPEF8x_vrp4WifmQ6KloGb2h4Uk7tVgPhJhKBWGJxE-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tQbQYmChe0GfokCELHZruX3VdRiUm4xY_3magtm8RfC7ak96Fqb9gw>
    <xmx:tQbQYji6YzW73I_gDRY21WRb3vTw_xb3KTnUm90gcuyGKdBeRf_UhQ>
    <xmx:tQbQYio2SxFlO_q-QeUdaDs7ER-6Aapx14JNYrTIcLLlORL2MtDSzw>
    <xmx:tgbQYkW8yTbx2M_M2hsCtUvpnztOnHiKSC7f9lhlXPxTc3ZDsD2ucg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 08:06:12 -0400 (EDT)
Date:   Thu, 14 Jul 2022 14:06:11 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/modes: parse_cmdline: Add support for named
 modes containing dashes
Message-ID: <20220714120611.hpzq2gkxf73hlupw@houat>
References: <cover.1657788997.git.geert@linux-m68k.org>
 <2eb205da88c3cb19ddf04d167ece4e16a330948b.1657788997.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5owdr3n7gktrcrdt"
Content-Disposition: inline
In-Reply-To: <2eb205da88c3cb19ddf04d167ece4e16a330948b.1657788997.git.geert@linux-m68k.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--5owdr3n7gktrcrdt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 11:04:10AM +0200, Geert Uytterhoeven wrote:
> It is fairly common for named video modes to contain dashes (e.g.
> "tt-mid" on Atari, "dblntsc-ff" on Amiga).  Currently such mode names
> are not recognized, as the dash is considered to be a separator between
> mode name and bpp.
>=20
> Fix this by skipping any dashes that are not followed immediately by a
> digit when looking for the separator.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Ditto, we should have a test for that

Maxime

--5owdr3n7gktrcrdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYtAGswAKCRDj7w1vZxhR
xXrWAP9DRGAZ4CDEQwJ0dx/IJwhV3KNEE9cndYaREAlrtTeR4gEA2IHGASXNLZc6
vKDJnEMcDo1+uRYEdLs55KOrwI3LxAA=
=fYfY
-----END PGP SIGNATURE-----

--5owdr3n7gktrcrdt--
