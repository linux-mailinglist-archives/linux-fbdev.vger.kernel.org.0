Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D6070C288
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 May 2023 17:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbjEVPgU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 May 2023 11:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbjEVPgT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 May 2023 11:36:19 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5848E6;
        Mon, 22 May 2023 08:36:17 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id EF42821DBE;
        Mon, 22 May 2023 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1684769775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iEa6ByHMD623qHdjGarG7iVgdLGI+kaMd16hqcmW7QI=;
        b=sRqxQ2+YaLANOe2qUgIzs3LqzgEyl/OocAWmOohRcyCEWjY1yVOtkolXxoxEx1F6afx7Wu
        v7TI1WctNtjMWYldDK8y9Yvp0n/6LyLuQeen1xLN2x1Hy84ddvbrLnynfPD+QknmO9qNH7
        C9ljZlAZPmj+ZDcOt7GCmtbwmivjT5o=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C35A113776;
        Mon, 22 May 2023 15:36:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sT7jLu+La2RtRgAAMHmgww
        (envelope-from <mkoutny@suse.com>); Mon, 22 May 2023 15:36:15 +0000
Date:   Mon, 22 May 2023 17:36:14 +0200
From:   Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To:     Zheng Wang <zyytlz.wz@163.com>
Cc:     deller@gmx.de, alex000young@gmail.com, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
        dri-devel@lists.freedesktop.org, javierm@redhat.com,
        1395428693sheep@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v2] video: imsttfb: Fix use after free bug in
 imsttfb_probe due to lack of error-handling of init_imstt
Message-ID: <34gbv2k3lc5dl4nbivslizfuor6qc34j63idiiuc35qkk3iohs@7bshmqu2ue7a>
References: <20230427030841.2384157-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rze7mjqamibzdgst"
Content-Disposition: inline
In-Reply-To: <20230427030841.2384157-1-zyytlz.wz@163.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--rze7mjqamibzdgst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Thu, Apr 27, 2023 at 11:08:41AM +0800, Zheng Wang <zyytlz.wz@163.com> wr=
ote:
>  static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_i=
d *ent)
> @@ -1529,10 +1530,10 @@ static int imsttfb_probe(struct pci_dev *pdev, co=
nst struct pci_device_id *ent)
>  	if (!par->cmap_regs)
>  		goto error;
>  	info->pseudo_palette =3D par->palette;
> -	init_imstt(info);
> -
> -	pci_set_drvdata(pdev, info);
> -	return 0;
> +	ret =3D init_imstt(info);
> +	if (!ret)
> +		pci_set_drvdata(pdev, info);
> +	return ret;
> =20
>  error:
>  	if (par->dc_regs)

This part caught my eye -- shouldn't the -ENODEV from init_imstt go
through the standard error with proper cleanup? (It seems like a leak
=66rom my 30000 ft view, i.e. not sure about imsttfb_{probe,remove}
pairing.)

Shouldn't there be something like the diff below on top of the existing cod=
e?

Regards,
Michal

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index 975dd682fae4..a116ac8ca020 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1419,7 +1419,6 @@ static int init_imstt(struct fb_info *info)
 	if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> 3) >=
 info->fix.smem_len
 	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
 		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.yr=
es, info->var.bits_per_pixel);
-		framebuffer_release(info);
 		return -ENODEV;
 	}
=20
@@ -1455,7 +1454,6 @@ static int init_imstt(struct fb_info *info)
 	fb_alloc_cmap(&info->cmap, 0, 0);
=20
 	if (register_framebuffer(info) < 0) {
-		framebuffer_release(info);
 		return -ENODEV;
 	}
=20
@@ -1531,8 +1529,10 @@ static int imsttfb_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
 		goto error;
 	info->pseudo_palette =3D par->palette;
 	ret =3D init_imstt(info);
-	if (!ret)
-		pci_set_drvdata(pdev, info);
+	if (ret)
+		goto error;
+
+	pci_set_drvdata(pdev, info);
 	return ret;
=20
 error:



--rze7mjqamibzdgst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTrXXag4J0QvXXBmkMkDQmsBEOquQUCZGuL6wAKCRAkDQmsBEOq
ucOZAP9eACOa+x8XFhfGm7icBBpVmtJLnxaAuj4pG874Tqf53wEAwyYW+IG7SR3D
bfpnLJNb4kEm101zRkgWoaGv6mH4iw0=
=Tk4a
-----END PGP SIGNATURE-----

--rze7mjqamibzdgst--
