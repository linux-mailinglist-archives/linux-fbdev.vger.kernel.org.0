Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726F063A2BF
	for <lists+linux-fbdev@lfdr.de>; Mon, 28 Nov 2022 09:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiK1IV2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 28 Nov 2022 03:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiK1IVO (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 28 Nov 2022 03:21:14 -0500
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE6210564;
        Mon, 28 Nov 2022 00:21:13 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 420775802F7;
        Mon, 28 Nov 2022 03:21:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 28 Nov 2022 03:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1669623670; x=1669630870; bh=QrDmBmVcXX
        6tVAPe5j+hdeIaostNrA78ZkYql/wyJkE=; b=gUkk4VUisc5QG0Im9OGlM+mwNJ
        FEbGfjekPQeBVEKlttoI3IpYx6+EotEYHDFW2wch9ldM1gB1hMSKIKu5DEnJxtzJ
        O+2C1I9BV2He0UxR/IlWUKBn7GcqLR2HFNNW40oyWfQzrY+qLuAkjTqN8xExQwMz
        dr3UpH3znp7t1VKNRpOfeObs5fhB1osGIGRJJie1rpmxfx9VfrT+/SVvt21a7am6
        deC2ZJMjaEpskb9liZGAraPPI0HdMWpJZzigA2+FWbrW+ESReNHvetAaK5jyWByb
        2xfbZmZchAGbFqQRfpfBv2Z/WB6IM7DbcevX5N5IXKONmem+gaWBGidV9WNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1669623670; x=1669630870; bh=QrDmBmVcXX6tVAPe5j+hdeIaostN
        rA78ZkYql/wyJkE=; b=KdY7OdawF7M0KnHmzKtvn+pmBsDEQBkjsr5a9ACWZU+l
        dgC+rN9erCOJuMmF/V0y3OKhfw365HlMionqpXzgk6CHZX9la0sVxZmsUJnU0qKu
        1YSTOSCXDNvJugG4H87lw2wNPIEvnhSPi4/M4b8WnTy+AACNDJ44dReuubBfwsG6
        yX7WHg2H9bJgNycbrvABHZnNfegQ6MB4RKIyJOmOizfm305VlZpWodH2OsBD+o0v
        RM8nCG3yvIlylSyYhWzI9zl/SL0KkBTrNsyB0oDfgj3VmzGctJMjrJITLyB2Y7nd
        AWP2Uc3R+8+ev/nfcDXKy90TFkE6KqNI3Yerz15+ng==
X-ME-Sender: <xms:dW-EY0JVYQ5R4oszEhIKAG0iyc_kXpqBDGKQ3Qwk8rgmScuIf9OJvA>
    <xme:dW-EY0K12K4WKXZLh7orNEjsImMGsF0HSLFKdbJlppe3QHSG57UpYuv2B-b8PriBg
    nVqEOaebZsZNYGNoqE>
X-ME-Received: <xmr:dW-EY0vRVnHpqPi6v9Y8-xJCW8_gHPXOVdPXVv_LOYvyLx17WP-E6S1fFiRXyqMmnVvTOV8Jpst-DiU_cx4WWDjmMrL6e_7-G93SyZ8kkIvnfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedugdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dm-EYxbrB4J7vAjia3zbfe9RrA14_lpIKy1RkSFik1ggo0UNxTVtSg>
    <xmx:dm-EY7agIINg9FqtOoozgH8Ao12N8BXFyUeNgYnypis6ngmUec0CXg>
    <xmx:dm-EY9CN9qHNmP9qB8HjbYc8Z1rlbmCyryEcXErpUsRd5Go7Etezmw>
    <xmx:dm-EY1aCCEUzsBJAvOXEH4n8qJUqPTnoxSftIzygJF4R0kS7lfAAlg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 03:21:09 -0500 (EST)
Date:   Mon, 28 Nov 2022 09:21:08 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 2/3] drm/simple-kms-helper: Add mode_fixup() to
 simple display pipe
Message-ID: <20221128082108.ntjhevb4ku6lnvib@houat>
References: <cover.1669406380.git.geert@linux-m68k.org>
 <3b0862187f1c8910089cb0d06a8669caa985042e.1669406382.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zqy4xi2ywhixazqh"
Content-Disposition: inline
In-Reply-To: <3b0862187f1c8910089cb0d06a8669caa985042e.1669406382.git.geert@linux-m68k.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--zqy4xi2ywhixazqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 25, 2022 at 09:31:09PM +0100, Geert Uytterhoeven wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> The mode fix-up function for simple display helpers is equivalent to the
> regular pipeline's CRTC mode fix-up function. It's called to adjust the
> CRTC's display mode for the encoder. Add this function for DRM fbconv
> helpers.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

It's not clear to me why you'd need a mode_fixup in the first place.
Like said in the documentation you added, atomic_check is usually the
better option for the atomic modesetting drivers.

So, why is it needed?

Maxime

--zqy4xi2ywhixazqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY4RvdAAKCRDj7w1vZxhR
xb4VAQDcYvGXzV71avNSXjnI5sHfzoooq+kEtEPF6PujiPIf0wD8CTGXFvB1JBls
QCJDVxr23M3Ch2byEX26PLsS/N5+FwY=
=K4PV
-----END PGP SIGNATURE-----

--zqy4xi2ywhixazqh--
