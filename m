Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399BF6618D5
	for <lists+linux-fbdev@lfdr.de>; Sun,  8 Jan 2023 20:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjAHTwo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 8 Jan 2023 14:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233805AbjAHTwn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 8 Jan 2023 14:52:43 -0500
X-Greylist: delayed 598 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 Jan 2023 11:52:42 PST
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB9ED102
        for <linux-fbdev@vger.kernel.org>; Sun,  8 Jan 2023 11:52:41 -0800 (PST)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.1.59])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id 2C44E21E16
        for <linux-fbdev@vger.kernel.org>; Sun,  8 Jan 2023 19:32:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-47dbt (unknown [10.110.103.73])
        by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 82FB61FDA8;
        Sun,  8 Jan 2023 19:32:50 +0000 (UTC)
Received: from sk2.org ([37.59.142.110])
        by ghost-submission-6684bf9d7b-47dbt with ESMTPSA
        id suVQGmIau2PZhg0A1/aQ0w
        (envelope-from <steve@sk2.org>); Sun, 08 Jan 2023 19:32:50 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-110S004d95a66cd-0637-4714-9dc0-8c81f479a7fd,
                    5128B599F7D401446F64D4771BE19AB2B9CD7A8B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date:   Sun, 8 Jan 2023 20:32:46 +0100
From:   Stephen Kitt <steve@sk2.org>
To:     Sam Ravnborg via B4 Submission Endpoint 
        <devnull+sam.ravnborg.org@kernel.org>
Cc:     <sam@ravnborg.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
        Helge Deller <deller@gmx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated
 fb_blank property
Message-ID: <20230108203246.3ca507df@heffalump.sk2.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
        <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yBkUQ5TN6WQX1gLgYbjZw/r";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 1901926421308278406
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepfeffgefhgfeuueeffeejieefieefgfefffethfdtudegvdejueelhffhfeegjeeinecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqfhgsuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

--Sig_/yBkUQ5TN6WQX1gLgYbjZw/r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Jan 2023 19:26:29 +0100, Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:

> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/backlight.c |  2 --
>  include/linux/backlight.h           | 22 ----------------------
>  2 files changed, 24 deletions(-)
>=20
> diff --git a/drivers/video/backlight/backlight.c
> b/drivers/video/backlight/backlight.c index b788ff3d0f45..9b0557d094c5
> 100644 --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -118,14 +118,12 @@ static int fb_notifier_callback(struct notifier_blo=
ck
> *self, bd->fb_bl_on[node] =3D true;
>  		if (!bd->use_count++) {
>  			bd->props.state &=3D ~BL_CORE_FBBLANK;
> -			bd->props.fb_blank =3D FB_BLANK_UNBLANK;
>  			backlight_update_status(bd);
>  		}
>  	} else if (fb_blank !=3D FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
>  		bd->fb_bl_on[node] =3D false;
>  		if (!(--bd->use_count)) {
>  			bd->props.state |=3D BL_CORE_FBBLANK;
> -			bd->props.fb_blank =3D fb_blank;
>  			backlight_update_status(bd);
>  		}
>  	}
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 614653e07e3a..c8622d6cc8c5 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -218,25 +218,6 @@ struct backlight_properties {
>  	 */
>  	int power;
> =20
> -	/**
> -	 * @fb_blank: The power state from the FBIOBLANK ioctl.
> -	 *
> -	 * When the FBIOBLANK ioctl is called @fb_blank is set to the
> -	 * blank parameter and the update_status() operation is called.
> -	 *
> -	 * When the backlight device is enabled @fb_blank is set
> -	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
> -	 * @fb_blank is set to FB_BLANK_POWERDOWN.
> -	 *
> -	 * Backlight drivers should avoid using this property. It has been
> -	 * replaced by state & BL_CORE_FBLANK (although most drivers should
> -	 * use backlight_is_blank() as the preferred means to get the blank
> -	 * state).
> -	 *
> -	 * fb_blank is deprecated and will be removed.
> -	 */
> -	int fb_blank;
> -
>  	/**
>  	 * @type: The type of backlight supported.
>  	 *
> @@ -366,7 +347,6 @@ static inline int backlight_enable(struct
> backlight_device *bd) return 0;
> =20
>  	bd->props.power =3D FB_BLANK_UNBLANK;
> -	bd->props.fb_blank =3D FB_BLANK_UNBLANK;
>  	bd->props.state &=3D ~BL_CORE_FBBLANK;
> =20
>  	return backlight_update_status(bd);
> @@ -382,7 +362,6 @@ static inline int backlight_disable(struct
> backlight_device *bd) return 0;
> =20
>  	bd->props.power =3D FB_BLANK_POWERDOWN;
> -	bd->props.fb_blank =3D FB_BLANK_POWERDOWN;
>  	bd->props.state |=3D BL_CORE_FBBLANK;
> =20
>  	return backlight_update_status(bd);
> @@ -403,7 +382,6 @@ static inline int backlight_disable(struct
> backlight_device *bd) static inline bool backlight_is_blank(const struct
> backlight_device *bd) {
>  	return bd->props.power !=3D FB_BLANK_UNBLANK ||
> -	       bd->props.fb_blank !=3D FB_BLANK_UNBLANK ||
>  	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
>  }
> =20
>=20
> --=20
> 2.34.1

Reviewed-by: Stephen Kitt <steve@sk2.org>

--Sig_/yBkUQ5TN6WQX1gLgYbjZw/r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO7Gl4ACgkQgNMC9Yht
g5y/2w//YCUl1TkgG93owd5rHJe5atRiC7gzYhi2cXiLb4frAyT/Sq738el5nh/Z
6/kSEgZzvvj/iz1dFtHOpIyTANzgs3yBsojNX4ho8fkvt3J/dAKj30B14B0mJs0P
mLGiJUxnW0fDk+fMdFcZnLoy2gf9urLiFq/p96r0lSehWJPXDisX/Me4DYjzbJq4
UlhEPo4j3lqG8624kue9o8gTptP07mUVVs3O3dGvwTFXWw8PJmnyg3nsQ+rgpXUq
iPbugQwwQf4AAnJQJ7UfYYeKEu/I5edKumccCgWwOC/oIh6JcJ9I0C1UUz2g32YD
IU24rf9kRptTdECdkIHPD4h8EHN4PZa5IFKEQ6xXBb7vpyxCEMiuXw2ey3UcRLc3
K/lsX1EBfzGEIgPVH0uSPyFyoIHrz8azEL2p9Eq+DnZfF5UKhXHFFQiL5vAVECiH
RupGAdt83VvLAw4l7Lz2Pi3yFs109SBqHcM/mVQTVEn2Zl+0xmjrywo3Avnh2ECw
87e12iSv8J2QckPFlzQDVHrmnNqk5Ue9dTLiYDnMW4aiYxVsiHzEC6cXlQtiOofE
MS0UF5PBVgSc1BXa6v9tSVoHsPSNh/GWRTY6Mm74AHKjIxsOy/tLf9KFyDP+Lt2e
M5T4OHPlMrKyE5e0ULdVRc9fF50cFsb/jbJHbdPiZ7lIKlKVUko=
=PJeH
-----END PGP SIGNATURE-----

--Sig_/yBkUQ5TN6WQX1gLgYbjZw/r--
