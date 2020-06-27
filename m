Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CA620BE6E
	for <lists+linux-fbdev@lfdr.de>; Sat, 27 Jun 2020 06:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgF0Ev5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 27 Jun 2020 00:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgF0Ev5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 27 Jun 2020 00:51:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFDEC03E979
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jun 2020 21:51:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k6so5037002pll.9
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jun 2020 21:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=2m5JaK8rotSonwx/sP/f5LHubDWMPNymxIpTxYlUo6A=;
        b=HdfxoZlWJQlGoozkGi3XYW/MiGAw4euyHjR+e7WfgPMw4zz7LBb41nC1qVtih34Ur5
         hjqDXgcA4iJ+/fBCVjwza6b9MLdjCr3cVosVUp+58OnQbYqfiCIV0GAYT0Vl5knrZFyH
         KIs4SYsGgUqG3SKmHTefnx5j1nrHsmYMlVrwzfpXZnhOZBon23SQUixaExCdhWp7v106
         SHnIOxAi2phCuEUz8VxTz3X75sbCPQpi1YMx3MuhPIwwOPPy5VTeCyf+RYpt8+I8EAk+
         DzxPZqDVcw4JDutORo9PvNVEWKEPsXRm8d94LgzyCQQAnuOramTHpu346Ii8zhHeFD4y
         Q6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=2m5JaK8rotSonwx/sP/f5LHubDWMPNymxIpTxYlUo6A=;
        b=As7es8vhvvA0lP30ySaC7FqHYb6UvebGZs5FBx3+7VSif8KZdbZWFg28AUq14pySQp
         b54Rb8OwGUYIJPiGib8qL+TJKvwUTHcGrvrX0iG0U4SazFyuxFXcsk/aAYBd2xGEdWMa
         HPre81kG7Q6op1yRu8F7O9sChbxNCjYJGT7KGRk0a2p2aYQgrIY5BxI0UMFDIGu0ddPh
         b1pJaarRXThyC8YGLHNU2w4FQ9dG4KN2kA28qRXk6/yHe5EoAOmoG900PCV6y1PTdBZj
         mS1xAe8TEV6GW6rBpOkX5e54MZfBYZ92ILPBwFXJLaV0ca2bOehN+x7t/TgUjrzmCRUZ
         agIg==
X-Gm-Message-State: AOAM530NOSeJsaQ+9qHt4BddgLR+iU572Qj61R30n2SFvcwheNko3Yh2
        usrFxWy38RuUdlaUcui+s7j+mA==
X-Google-Smtp-Source: ABdhPJxHyMwtOzx+gAvFq1xBuRoB6v6iA5rKjZad34+AZjGjKrJ6P0JsrDQTjuK5Sur8logNECvRNw==
X-Received: by 2002:a17:902:a585:: with SMTP id az5mr5227052plb.207.1593233516708;
        Fri, 26 Jun 2020 21:51:56 -0700 (PDT)
Received: from localhost ([2406:7400:73:59a9:908:f18a:1156:5c38])
        by smtp.gmail.com with ESMTPSA id t5sm5499821pgl.38.2020.06.26.21.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 21:51:55 -0700 (PDT)
From:   B K Karthik <bkkarthik@pesu.pes.edu>
X-Google-Original-From: B K Karthik <karthik.bk2000@live.com>
Date:   Sat, 27 Jun 2020 00:51:50 -0400
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jan Sebastian =?utf-8?B?R8O2dHRl?= <linux@jaseg.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbtft-bus.c: Removing that prohibited space before ')'
Message-ID: <20200627045150.ysqvd47o52f4a6rc@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t7rr5fenqhwyb57p"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


--t7rr5fenqhwyb57p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

fbtft-bus.c:

fixing ERROR: space prohibited before that close parenthesis ')' by removin=
g that space and ',' in line 65 and 67.

Signed-off-by: B K Karthik <karthik.bk2000@live.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtf=
t-bus.c
index 63c65dd67b17..847cbfbbd766 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                         =
    \
 EXPORT_SYMBOL(func);
=20
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
=20
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
--=20
2.20.1


--t7rr5fenqhwyb57p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEpIrzAt4LvWLJmKjp471Q5AHeZ2oFAl720GYACgkQ471Q5AHe
Z2qzmAv9H0yKGQeZE/+LG3U87JdxsfJKO6l2V+1+Bqb4T+jrD52zcitgEaKaPkMd
y5JqgAPxpFk1YNpSFbw+j4xsa36+TFKGYIDCuPIPmYhEtUfUG1Aj8roQPdqrs2Ir
oiGfJ293xMBp1GDYOMAAdB55BWNGHGiEgJ1GG++9AVSXz1Nm0R9SIJwPddoPq9yA
Ez+tYms6eNVfnk+CVEpsEjhUf6rk+WARb+UgfJ9lxzebU1damViQda/naEiIOPm5
MRt1V5PUUZcYYlGsrisCbc8DhTrMrD82j/j3uKyS/3Wm/+J39bq7WZO2t6kDcl9k
2vdUFUinO9szZJR9bfEbsZkRVZzkv3j5Qyqg4Sur09vy04se6JZWod2vTBaepnnx
vulIXywLvtsnfyZLVsBsRPit8zyO1BI2P+o1T+NRjfQKUuvkmzChmGt3DanuvGBB
Fop35oDLMjcbK/KIH8lQGXzt51kpQ8M5sCc8DAWxGlGJFK7h0bVUnOe5w/3G1S5G
YWNuuvZC
=Tfl7
-----END PGP SIGNATURE-----

--t7rr5fenqhwyb57p--
