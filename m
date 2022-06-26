Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4C355B121
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jun 2022 12:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiFZK3D (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 26 Jun 2022 06:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbiFZK3B (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 26 Jun 2022 06:29:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6592B11C31
        for <linux-fbdev@vger.kernel.org>; Sun, 26 Jun 2022 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656239334;
        bh=zr6BXlxetCVyV/LHpmtsvDPJ6vcq7LcY9ZdBWidb2x8=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=b3XPrU9Z1VbS0rcRWeEaWbRkMb+EZyNSncaSp4uVvSTtsYBNhshMA/ydgUQk7hq0d
         NGrgMnLQQi9dTgzsl3pPjCRwm1iZMvJ8XxXxp/JE+1hXo3NzMkcj8Oqrz1wrRwcUjD
         IbUQwgtjqufD7fWte7xDz3usr2t0iltFy3S/+4S8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1oDybB36tT-00UWUC; Sun, 26
 Jun 2022 12:28:54 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        daniel.vetter@ffwll.ch
Subject: [PATCH v6 4/4] fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()
Date:   Sun, 26 Jun 2022 12:28:53 +0200
Message-Id: <20220626102853.124108-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626102853.124108-1-deller@gmx.de>
References: <20220626102853.124108-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d62vnxq0gSwYN0NAZPzhYCuZEFpdMsDgaz1aXpBuXJBd348ZK4J
 D7HKnkH4f8CH5uQ7Ugc4jnO9LO1+undBCBAe4JnY7cDONbJ0FU6Nk/tuRGHbopkhr8bqRBB
 qJdWSlLE2bxzOaFye2ll/t0RIgc/rBYNrGlgUJld/uA25aLNGUbHa/eoPajLRGrOutExeq1
 X+GZMC9et7HAKcwtbNP7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YS8qdbKo1co=:Owb/+23yCDWsbaPBnDlpqO
 kDqdXVF4cPAyy3pbUTu4bwjRCefzt9V/K0tqllLUX1VlLXe7+sxmm1h3+ZbLTIWO08kzlfHsL
 KYHXvGqu505p1zGggTfkY0q5CxSp+rKZCjqCVNS9OFQxsT8cK85DLGrKgb9xG3E9lw+KNxHtz
 ImTmtCpdtypjWXZ+Jn2xHEt2/C3x+7361/piqsrRmVkJimpkZzEgaY5pmraYm4VDMCH+l8zZv
 S1fpBN/u9LF3nWyRMhmAS47qR0suaYCyZZefKF5wbhg+62LIGQLXvXKGoLQmCFmtB1eAoJnqe
 6AfCqXgS7GyQszbGDuYN3IG0Ynmnql6emsT9U/w4K1mmlOoVkfY6mvRaH+bvE+Y5K2Mj5p+B8
 aOuZBjhXpRgcUoES+RRBi6dQ0dSe10X2IWZCl2QKITDr0FBqBi5nt+iuCGLByRc/hf3s9DnuF
 LkottlRW12jwzCDwtkxyiNjpkSVq9sd788T17ZPfWDw0DY2d3EzMpH1V/YgwluRzppsCl4n30
 Kwcu16afchIEsUcsreM76ynESuqY/4THDlGKvwpuMVZpvvfHgWitQeWXmF/WRmAwJ2aR9VWa4
 TmYTtXSHFnwwTPJFRJWaJUfq6Wj7rxzWb1/odCVqGkmlEVC/ETemoobwmXuu5IxuEtGzgjRMp
 CFAycgJiETpkTx65gC6m3eheG6KTOMNHOFXc7WHR0WrSu7b1r6h3nbLNl+KAqozke0ikG5GAY
 MeCUt89se3+74DvTyA6KOSHnTM2yPLKEt8Xb5dLqDc+7kxPQOi/XomLKnqOE+ljHv72DM12W4
 vU05dbftKcsf+b9Rz93Xpen4bzxKP7mCAJgpTDGyfn5KALLtWiTbiyRp6xfzOMEeY/IwKpRt7
 hJ0juWYzO3Snag66sh3oOC/QMF36hXv6+IwC8YiF1P7DQI2mBhBPok/h46PHaeU5XcyItxlGJ
 UuLJQ3fVAEskP+bvLAK6sIC1kIfqesFOKN5NTGJqRt/uJmWOunSJgOq3nLr8hsBfhnj1jeVKq
 aWoo0Sc66FuKrebOF4jbb9O1q3lKEnNDp3TNe6yup52KKyEzk+nc/gaitIoRn+lMrv3irflnM
 EFSj2a8EZSTR4wwU7cPyzeO90PJzLwEXwBzK6uLvqghQPEJ2RO9ci2Zcw==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Use the fbcon_info_from_console() wrapper which was added to kernel
v5.19 with commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_=
info lookup").

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
=2D--
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 69c7261ac334..2ab7515ac842 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2751,7 +2751,7 @@ int fbcon_modechange_possible(struct fb_info *info, =
struct fb_var_screeninfo *va
 	/* prevent setting a screen size which is smaller than font size */
 	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
 		vc =3D vc_cons[i].d;
-		if (!vc || registered_fb[con2fb_map[i]] !=3D info)
+		if (!vc || fbcon_info_from_console(i) !=3D info)
 			continue;

 		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) =
||
=2D-
2.35.3

