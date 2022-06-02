Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0091353BF4D
	for <lists+linux-fbdev@lfdr.de>; Thu,  2 Jun 2022 22:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236813AbiFBUGm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 Jun 2022 16:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239185AbiFBUGg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 2 Jun 2022 16:06:36 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C26036B4C
        for <linux-fbdev@vger.kernel.org>; Thu,  2 Jun 2022 13:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654200389;
        bh=IsKF4iCBq0sNXJ6MjC82oLlWI1Yp1QCRZB0HT/WCHFA=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=HEezxHjVRfLjrC3TUCgjSiWUCHqIaIpSqy3gj6uBC1XFmghmJgL1otT8SC9OQ7aox
         tQoS3wxWd0Rlq7XMhrs3eqNkL5jjO7wTdrD92a9s+1ZUMNBbTpVEIEQn9GkJsHhqXu
         a9pLGmv/M+swC/Mt4umO1NwwE+su8KoadKWzCR90=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.181.14]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUZ4-1nR6mf3Cm4-00pwLE; Thu, 02
 Jun 2022 22:06:29 +0200
Date:   Thu, 2 Jun 2022 22:06:28 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters
Message-ID: <YpkYRMojilrtZIgM@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Riat3W15xiHyRug7/i3UOhBY6b3BVi8Fws7yM36g2DKuCHT987m
 HmkkSWw0+riUMm4n2dBMVcsoQDrNFg/mfQR6hHU6nUcc0bcDXqjU3hhwH/CS7J3xrzM4Sf1
 0o//kE9I3vZTsvUJCd92u9lwWe8hwNS3SDuroz8baSxuBob4wo1+cpKU5JkxJLsfrAwfYjm
 xoVwsTdykeoPCXZ25vRqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MDYflrGxj5o=:2usV/A+HCeXBPglhWE8d/A
 nQQYXL9Wh+raURLV+shdiK80UTXujkGOSwYsKB08gguZG9ZFyE1CUkb4Ecj6jCFx3kIhRFnMH
 4+gRq0cvY7SWhQQEVokvjuGUIqLXu/3OdZjl2tfTrdC65c1eYKgrwu0XgT5eWpBGHBg5gbjmR
 +Jj5diSQDfvDQNcVR4ON0F0L7woK9PF+TyOPjo6ms1rdUOqAZyoK3fImsFkw4702RJeYGWJDr
 nWrPSiAckRqJJgQ+kDVIWxCUxnSbySbgkyuzW7Oxdhe5750VP2VaubOlodFgOSpZxe9OQluyU
 DBU7mq9b9pAkJOuC+W59lFsUQZeex/aw57/r493jYPM2fuXmbrhE2lwUy/o2Chj6FYpbJ7vV6
 X/l0FonX7i4SNao+zoWsYBobCcoRJznZjK/qoeN7Drmx34HX8dUDg3xkz1cgo8c6aUA0j4BSZ
 xXkuyb08PPt/K+plo70jzbcoWiAkuRzeM3vr5l3vjCfHh8GJPoAywv9kB1LXi5pMqkTmHSnwy
 yhC3bidi6LUf/g/PQINdHVZPEqz3XtGgOKwkuCxGAoOYm4alrjtV7w5w5BkV4qb04uepzKF+s
 GBpzf+qvldRtY6SXDMyjU6jzXHsatRnXmXzDad++cURJdvwyL+akICrX3Nlhlcg0Rya6h0GjR
 lTJw7xfxZi/3Fb+0X3dCddCZpDqlXp0x+QJSneUaQNjUzvW0N3ivfYgqUVtuj3asJGa3vsxWm
 TgxXzeaFttP/4fsG9VIXIxhqIYCYY0oaVVC3XtpSNyKvU1REY/f18CqOPTb1e0vL6Jd3f8Dci
 p9efiBrwnjh58FGLdZQ7wTsXT7II9en8A0BktVXg9Rx5cxVrBeqy0bVRLxXTwDYa3cIcQuT0y
 TpGJdW+dqCeml19opqmTwrkGJg4GDPe0b6hXw0mSI0yrTNsv1t+U9ZTV092YIreIOxJX/Xfqs
 G4Z0zw8kwvEW1emYVWxmf7RKTnbRJrVoJswioLItqVLvxF1D1YTiy6yRSV11ypOrkeGXF5IoR
 mWR13OZy621B1wOXmgorphlpgbPoRWihhRCHAhemypwmHaHbClhtQ4nWAMjUEYbNdlPNJh1fe
 ooKXMFXgTlCAm5eni/xO6OpzOiwFLmPSBviFBpB5NbyCqO2eoskNqdpVA==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The user may use the fbcon=3Dvc:<n1>-<n2> option to tell fbcon to take
over the given range (n1...n2) of consoles. The value for n1 and n2
needs to be a positive number and up to (MAX_NR_CONSOLES - 1).
The given values were not fully checked against those boundaries yet.

To fix the issue, convert first_fb_vc and last_fb_vc to unsigned
integers and check them against the upper boundary, and make sure that
first_fb_vc is smaller than last_fb_vc.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 2fc1b80a26ad..c2f9e5711c39 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -115,8 +115,8 @@ static int logo_lines;
    enums.  */
 static int logo_shown =3D FBCON_LOGO_CANSHOW;
 /* console mappings */
-static int first_fb_vc;
-static int last_fb_vc =3D MAX_NR_CONSOLES - 1;
+static unsigned int first_fb_vc;
+static unsigned int last_fb_vc =3D MAX_NR_CONSOLES - 1;
 static int fbcon_is_default =3D 1;
 static int primary_device =3D -1;
 static int fbcon_has_console_bind;
@@ -464,10 +464,12 @@ static int __init fb_console_setup(char *this_opt)
 			options +=3D 3;
 			if (*options)
 				first_fb_vc =3D simple_strtoul(options, &options, 10) - 1;
-			if (first_fb_vc < 0)
+			if (first_fb_vc >=3D MAX_NR_CONSOLES)
 				first_fb_vc =3D 0;
 			if (*options++ =3D=3D '-')
 				last_fb_vc =3D simple_strtoul(options, &options, 10) - 1;
+			if (last_fb_vc < first_fb_vc || last_fb_vc >=3D MAX_NR_CONSOLES)
+				last_fb_vc =3D MAX_NR_CONSOLES - 1;
 			fbcon_is_default =3D 0;
 			continue;
 		}
