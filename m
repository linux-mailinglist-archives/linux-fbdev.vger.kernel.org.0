Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CC8560AC4
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jun 2022 22:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiF2UAf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 Jun 2022 16:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiF2UAd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 Jun 2022 16:00:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6877064DE
        for <linux-fbdev@vger.kernel.org>; Wed, 29 Jun 2022 13:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656532825;
        bh=eg5Jt30VKi0F1euM/29YUUlIJ1+3/C3w7lH5uaKtqGg=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=PC+DCi88lZZUdYutB+Xvt6QQKg4zbqFGYJXs2KbG3f4bnu1ycWyOhh/eF7nLz0lsU
         SvvgQ5T3239e5gb0CTOAhIiSNM4f6c3Ujn/ffy6/CtcN+miI/cvQyo2k8Zyewcg2d0
         j8o+vMX+FjFpGgcZkl9BVbH6K/ApwYCp8+qzCtBc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.51]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1njCmg2FRb-00yQIP; Wed, 29
 Jun 2022 22:00:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
Date:   Wed, 29 Jun 2022 22:00:21 +0200
Message-Id: <20220629200024.187187-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220629200024.187187-1-deller@gmx.de>
References: <20220629200024.187187-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q5+c9cZcND93/SaTomtSiwbsb+VbOqovOUpIZS0ava/zByW+J8o
 rhLxhaYe7F2M/xVMFV7cyEKB/B4UPif+t5076IgmQzpQxyBc7MleMJq0rUey7rDQFWUmy+F
 DV1ZAkzUMjt2D+7TCoIP6T+QevdfKDNXTWLNpdnLSsGdPfRLacfyIm9KicY5pkdMjCDENKB
 n02cmy4KigvBG+Jp1bshw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qfax8JBg+6M=:sLiqfQCREClG2PgYQhj4yh
 /to3tfh8v8KUXiNNV5gk9g60qQdbTAOOZoPMHnUkupOuTpiB1orf5WtSGPbO9lP2Cu3XCNg6U
 05+WNf8NtASvCmoudbEKHT86lIfgAD7fFdHrpBnSGZZuTwVRZ9eQfN6lSlw3d4MArKPsrnNf+
 4AB96BXEvh9NzWd8U9I6Dnht+2r53XjA/OvNuTY15oN70d4WsJsFd6w3OkN3QU5VI61fZfWgX
 hOxVUZQFS1OihLuTap/8hgTgCmrEQQ0xD7Po5jvtpD1HFNMbwOfQ2jSwZyMs76Srije8Kdb5n
 tvO5Ir5xd9nSZB7Naw0Cw/dl5PdZ4fvFfr6/DjISeZAZMioXHOMuRhnVoZLVsA3hxJTQE6DXW
 1g9MtpgoPgJZHpVM/UZwPbxC7JFsA8BhcEG5dsLP46WuV57cEpQDWs/1he+aAR2qxSAA8C4oi
 I2n1y3N+GcM1D/S+L2D973TToLx6tihCcRdf/ZSIC0T2BiaMey4jdCOkKHapkH4ScAalt2wx2
 m6ddqauHyAWwrH2nhZJgAAdlcsDR41eK1ALow6OGjD47dUcVVBoZ/ZIrhbTYoQJiVVzoa6tPN
 mXS7TY+N/7Q0j2eOGjd6sIianl4S9ymV/mJle7bCJ07aev61rJAVBQPcKA8/25msRm07ibZCg
 40ZMRlbIidl4DCA4v+sDjq7qfx40gagv75TQCeFTqEZmG0/e3aYHk9IdTPguxBEvwtqZW5XEG
 GwLdHfs+akqHqR24fr0NANSoFe24Kmau4taXFQaHIJ0j54Kbsk9sVHaxrmX8HTxhsP5OAEdLf
 gd+9uwNUj+gLPeMdU8bHeOYh2h76yWC/EEtw9Ky0087Y2yDsCx56XWmHXSIjfPXTlIBAXSzG3
 91EqEb5SgvejcvldBqyyuPRE5EtU2m8Pg+HN5k6oSlp4fuosQANPQjYr6TSSghCEVncH1GkDH
 ucphMP8OKZM1yIcF9JtuqbxcSmjALweBVk9GKX6+zEo1qtN1sWRGyVRMQv4Y0c9nqy87mevaw
 DZsgc3THtkFs2WrHwDsv+/0ipScSyNgDY8MBJ9iCgIsrG277dLD+aBG9vr0F1c5pVxnesr26d
 XpiBajKOSQE2ADPzjDD8J0alQ7ZE1DgG7MdldI6AUp7kYpvGedYBX8S/w==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The virtual screen size can't be smaller than the physical screen size.
Based on the general rule that we round up user-provided input if
neccessary, adjust the virtual screen size as well if needed.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index afa2863670f3..e645b96d2700 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, unsig=
ned int cmd,
 			return -EFAULT;
 		console_lock();
 		lock_fb_info(info);
+		/* adjust virtual screen size if user missed it */
+		if (var.xres_virtual < var.xres)
+			var.xres_virtual =3D var.xres;
+		if (var.yres_virtual < var.yres)
+			var.yres_virtual =3D var.yres;
 		ret =3D fb_set_var(info, &var);
 		if (!ret)
 			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
=2D-
2.35.3

