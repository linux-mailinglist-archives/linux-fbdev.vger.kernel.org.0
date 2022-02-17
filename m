Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8874B9C58
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Feb 2022 10:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbiBQJqp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Feb 2022 04:46:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbiBQJqo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Feb 2022 04:46:44 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B84DF4C;
        Thu, 17 Feb 2022 01:46:30 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id n24so7374597ljj.10;
        Thu, 17 Feb 2022 01:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=HcorFhl/CKANEYKOlL5BhoEnFeIHTHQOS2F7iJiHPnE=;
        b=dvJXR0Glhlz5X26JKYpehPOhu+MuwIVPwOlU7CZ+qombV/ktFcB6JwekETZNvw+wzq
         bZ++m7o2Fqw4/3K0AGd+WefGiTXyAiA8s+SLbz5sxq3Wy20NAtO8x2H1J7Esl/xT0AAT
         fv8Zucd+VGgDH4k8KWAAdRsX1ZPPbHS81gZJlXyJo+ZCik4RtCiaE+S3qWgiFzfblWdH
         h8pyNKcjajaQEC/jmBXhJZHZ7uuaM6hPTj0UKbudcMzJTyXRNLK3tyyeGJIPnDRv1icX
         y3BAtYZ2iAsGdUv/N/bsGcxeoYXWFXz2ejeImKoWxHlLYcwB5YUAY8BdiR15PY22DPpY
         2ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=HcorFhl/CKANEYKOlL5BhoEnFeIHTHQOS2F7iJiHPnE=;
        b=Y99Dc2PG/r/RbKO419fz1jiad+XmtJgSWYAYRxGGOXkaRjujrE7gJ5ksRoSDttYvnH
         +Spce52viRpwkGT7Aikp9kgTiYsbFVEbjlpenpnyy5nkLyI6Al3aPHeG3/Mygx5xMzqY
         j7fqr01ZkNRXNdlPAvKVebgaEc6RsODBQovhP1s0PvOUGZSnSRogdYLjqcejd8pKEa9P
         1iF36HjKdyNP8X/Y8iYo0mJieIevikxiruyRHwZo9WlBABHLoAqogwdIdurk+tZlMeGl
         pX5LvmZCVuJfXQ9iILiTDXxFIS/RLf6B9gbWhIUvHKOJ+MliXb04l2i4Zmd1JcCK0PEz
         a0Aw==
X-Gm-Message-State: AOAM533uhXWo0HDoJJi1nKxuBs2f6M7HrKvY1ZBBodsx4V73eatLnqNk
        yui9k0Iz7qySnpNRySNtcMc=
X-Google-Smtp-Source: ABdhPJz1DxZT+ySvf4y6si2qjIZqvjAZBM53rG/UUK8KNz7Usv+PrxlQb40NVymujmTOs6Kv5J0iug==
X-Received: by 2002:a2e:b5a1:0:b0:244:d3b4:dc24 with SMTP id f1-20020a2eb5a1000000b00244d3b4dc24mr1611829ljn.83.1645091188340;
        Thu, 17 Feb 2022 01:46:28 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id f17sm461508lfk.221.2022.02.17.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 01:46:27 -0800 (PST)
Date:   Thu, 17 Feb 2022 11:46:17 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] drm/fourcc: Add DRM_FORMAT_C[124]
Message-ID: <20220217114617.582c3b7d@eldfell>
In-Reply-To: <20220215165226.2738568-2-geert@linux-m68k.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
        <20220215165226.2738568-2-geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3iRivHF=QF0GVYji/QgBxGk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

--Sig_/3iRivHF=QF0GVYji/QgBxGk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Feb 2022 17:52:19 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Introduce fourcc codes for color-indexed frame buffer formats with two,
> four, and sixteen color, and provide a suitable mapping from bit per
> pixel and depth to fourcc codes.
>=20
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Do we want to keep the rounding down if depth < bpp, or insist on depth
> =3D=3D bpp? I don't think the rounding down will still be needed after
> "[PATCH 4/8] drm/client: Use actual bpp when allocating frame buffers".
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 18 ++++++++++++++++++
>  include/uapi/drm/drm_fourcc.h |  3 +++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 07741b678798b0f1..60ce63d728b8e308 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -46,6 +46,18 @@ uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint3=
2_t depth)
>  	case 8:
>  		if (depth =3D=3D 8)
>  			fmt =3D DRM_FORMAT_C8;
> +		fallthrough;
> +	case 4:
> +		if (depth =3D=3D 4)
> +			fmt =3D DRM_FORMAT_C4;
> +		fallthrough;
> +	case 2:
> +		if (depth =3D=3D 2)
> +			fmt =3D DRM_FORMAT_C2;
> +		fallthrough;
> +	case 1:
> +		if (depth =3D=3D 1)
> +			fmt =3D DRM_FORMAT_C1;
>  		break;
> =20
>  	case 16:
> @@ -132,6 +144,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
>  const struct drm_format_info *__drm_format_info(u32 format)
>  {
>  	static const struct drm_format_info formats[] =3D {
> +		{ .format =3D DRM_FORMAT_C1,		.depth =3D 1,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 8, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_C2,		.depth =3D 2,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 4, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_C4,		.depth =3D 4,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 2, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_C8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R10,		.depth =3D 10, .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index fc0c1454d2757d5d..3f09174670b3cce6 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -99,6 +99,9 @@ extern "C" {
>  #define DRM_FORMAT_INVALID	0
> =20
>  /* color index */
> +#define DRM_FORMAT_C1		fourcc_code('C', '1', ' ', ' ') /* [0] C */
> +#define DRM_FORMAT_C2		fourcc_code('C', '2', ' ', ' ') /* [1:0] C */
> +#define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [3:0] C */

Hi Geert,

generally this looks fine to me though I'm not familiar with the
code. The thing I'm missing here is a more precise description of the
new pixel formats.

>  #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */

This description of C8 is a little vague maybe, but presumably one
pixel being one byte, the address of pixel x is just &bytes[x].

C4, C2 and C1 should also specify the pixel order within the byte.
There is some precedent of that in with some YUV formats in this file.=20

Maybe something like:=20

C2 /* [7:0] c0:c1:c2:c3 2:2:2:2 four pixels per byte */

or the other way around, which ever your ordering is?


Thanks,
pq

--Sig_/3iRivHF=QF0GVYji/QgBxGk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIOGWkACgkQI1/ltBGq
qqe5Sg//Uh9D3UOI0B4aI3SQxsqXUnJGJmcpyK0wfxKijz0p+CZDTBnK6109x4pP
8ohxSFY/IQZJQttfakRdby1kX6gmF7KmE+q+fSa0BLIL0MUMW1mOGIES62GprGMz
qEkKgajOrGsleVcPwXQm9vICVDeO7lTmWAXh9AI2xqQhKti5BytynvQHvzHnO21L
THab1x2sat/TeuPGeS08ibxPztZLgH1HDO0jMaUZwEY2kMsCFDGgmTJRV8u3ff5m
fDPqHUTp6KFItDowMpB5pHh+9/tWGEJz1qr0WOPKBkaq4cz1nkXPc9t4m0YJyVYQ
JLfFiFqqkiBsMC5iitJuCagrI2ZoVIPZ0wBGJwZ4im8Lz2cf2pXlhs1C5gf8z6ac
/8nia6+mfeg6vH4iWXlwFGsZAmbbl9LG+Ca7qDy1u9zI2v5z+c6XvIY9+bL6VEh3
FdGXKrYOOpS2iurD7L0kMdHs1wRlGknrWP20WNOF2ImD90W48y/4BNtWw+Z1fnkI
Y3KAGqHCXwUR5Gx3o4LvLaF9RWBAoU0hSsE0t5yAR4wp8iug864ijLOxQej9MevO
V8zagQkTQpTCw9uDos1zWKjNv70s3r2an3Uecp+Un1fpjUOfH47MM7fN8nNiickM
/fcSpNfFZVoozBtan5wrI0CsjsXR4HIe3kz3/3heK7z8mzNtspg=
=Rcp/
-----END PGP SIGNATURE-----

--Sig_/3iRivHF=QF0GVYji/QgBxGk--
