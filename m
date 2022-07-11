Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8EAE568C1E
	for <lists+linux-fbdev@lfdr.de>; Wed,  6 Jul 2022 17:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiGFPDF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 6 Jul 2022 11:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbiGFPDD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 6 Jul 2022 11:03:03 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E092610A
        for <linux-fbdev@vger.kernel.org>; Wed,  6 Jul 2022 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1657119775;
        bh=6nsnIbuD9mZnFTibCiOIJDiwvadf42q5xse7Z+WoK+w=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=ZapLm0vicn4SVzDEw3UV7LyGEnaPRP6H63+h36gNmsZT3NEB0kWsrSU1UkBDYcSzf
         EeCi9rBX9yqT17O6w8NWYmFuTz6V7qsqhLql2sktPtJK/lsb3u/QTxUdVs0LnHYYEF
         CtRAddwhemib80NC/bIFWBMHZmTbtlELuiMTAj68=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.134.81]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdebB-1nZUoo0QL3-00ZdQ5; Wed, 06
 Jul 2022 17:02:55 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH v3 3/4] fbmem: Check virtual screen sizes in fb_set_var()
Date:   Wed,  6 Jul 2022 17:02:52 +0200
Message-Id: <20220706150253.2186-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220706150253.2186-1-deller@gmx.de>
References: <20220706150253.2186-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SeCxky1SgBlGsDaUf6IAO5Vr8QY9AvIeAgdpQnv+NitNwtnCvfK
 C2ypOOAjGFp+lxWEH7bdu49Nz5BXPeOKQHQ2YdT9D/qPI6aYgWfgj8UNxLtCNVfPPCeL2nd
 agWNHhoKQAdWyJ1g67+KEmPnhp43bbqmWEMtvyfz3/XtWaLTMdhPMs0QC/3Ls7tGJWe3Ta5
 KlmG8RZ4iWzveNVfT0RPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vxGlGaAHhZg=:dxsQ30NaMFZl6soXcCcAY8
 hwHw0JmTZRfrrzZoUpiYORDcW9FoMuNvEipdUOD4Rn+OIOkn8p8e3RPOp3NDmWFKfHJ/Bdp2W
 v2qCSXcooGam7Z3gWZxQ8C23sIAFbQbdeQVXaE2oj0aUMbzNB7Mml2PGME7rgJoXagHMnPeBB
 St/YgRHRKlFehQ6xBVHZ56tRVJyZQwKoqSqOzBcyprBJvMhm2HSpszw0EeagZ6K0zlW0pg83e
 xp2e1haBDy8Se5x/F0iZEKbVA5Qpskz5kMVoiD5twU+xqnTWN+SvagetF6U6EIpIqh9ZK+JI4
 UrOJdxdCLi6sj3tYG3DnHHuGfM4aanUJ4B2bSL02ffvzUiF7GWchKUBg+9rmZ9NSDulR7Mexg
 0M1S4y8lZsSTX10CFs0H2xkARAa6ItIiS9K2dr7gfN5KSIyTc+4j4MYiAPNQnPQ1Y8Pbpx7/X
 wAzxeUBUBe9boHnw7Wdbruv0GLqP/66nZOiO+PGoRTOiDqskCb/uQf+/4De9IS9iNFBGWClu/
 SmYxduRSXxDvREfi83t5jVrWB01JWqwtWjeqQMFbRjRENBvHF73QSF3hlHO7FdOcz+M5tjYil
 bC/xErCr8ebkZFWVCTUAQYLsJ6RdNrLoTX3XUuy/G0kXubae01ugAnQZuvvmMi44720UzfOEF
 n43WdaaG09u2aZHd6ZOLyyXaD3IbK0u75nx9S73d3/n6VwitCEBteuWpWmnnpjQROP1GKOIYl
 UNNYeRO1tBNZ6Ll4vxb7AW5SsQBYKzE0ujNtyY4lIRj1ILKTK3SzRjWssQDWhqrQSqfL2VmTt
 iOlzzMhAc2ymuLortl8qO1NaH+HtNS3VtCaR5iGeBJtXURcVBeDAcRlmlX5u5XJ6XEmUQSlWY
 P8NCARBln+wsScLCFnijF+H32slvPNExSAmUm5pkYSkAkx7H0isinmGG2A742l2/Wq9oTecmw
 ruG4Iovtnn8KTTXt5fJhmnVaFR0kMiehEw/J8HG+4hFj2rhI4Y5776MH8ThA9z5HpEp+YFgge
 mQHSCRvqwExYPn7WKJiFAQtChYtMmucueYx6cd0rCZQ9jcykpOEeMeW9rAg2/nFx2W8YGNMTE
 mobmSZFhUXzfT6AsNxVr/Z4JbK3Hxs5VoUAAfcYkU1W7ZIRmDjMWR2+AA==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Verify that the fbdev or drm driver correctly adjusted the virtual
screen sizes. On failure report the failing driver and reject the screen
size change.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index 160389365a36..612b54c23ac7 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1016,6 +1016,17 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (ret)
 		return ret;

+	/* verify that virtual resolution >=3D physical resolution */
+	if (var->xres_virtual < var->xres ||
+	    var->yres_virtual < var->yres) {
+		pr_warn("WARNING: fbcon: Driver '%s' missed to adjust virtual"
+			" screen size (%dx%d vs. %dx%d)\n",
+			info->fix.id,
+			var->xres_virtual, var->yres_virtual,
+			var->xres, var->yres);
+		return -EINVAL;
+	}
+
 	if ((var->activate & FB_ACTIVATE_MASK) !=3D FB_ACTIVATE_NOW)
 		return 0;

=2D-
2.35.3

