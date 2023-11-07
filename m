Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009557E3768
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Nov 2023 10:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbjKGJUf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Nov 2023 04:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjKGJUb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Nov 2023 04:20:31 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1116A106
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Nov 2023 01:20:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG1-0000IZ-7N; Tue, 07 Nov 2023 10:20:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG0-007FlL-Ap; Tue, 07 Nov 2023 10:20:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG0-00ENW7-1c; Tue, 07 Nov 2023 10:20:24 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Atul Raut <rauji.raut@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 01/22] fb: amifb: Stop using platform_driver_probe()
Date:   Tue,  7 Nov 2023 10:17:42 +0100
Message-ID: <20231107091740.3924258-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2258; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oG9a0u8ePiuLkRlvrucgb/21kgy596LDbVG/7UHObeY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgC1g6l8kfiGZf6ynAygClDXnAjXuiMZglr7D 301DDl/mpuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAtQAKCRCPgPtYfRL+ TmqUB/wK6QlmNM5mlXhL8RKtrnCHxGYe0CQuYyJnA1GDGHLA5/LyyVw0Csuu9SdZT3jdPqdglPp Fb/K6ywolgkCzdfaGWUatEjvAmoc1fSbL+7cAQuZ96RivUKoQyFBPLMYfD3XY9hCXqogjRTf1WE BzcQ/YKDbFoHuVqE4SGRyV5ovVirgZmQrDPWIydy/nFglqlQRIEbwqhEfGnC1gjEuBvTYV0bPAl jXQhFIRu39qDNiaJOC1GsbtEhugprWuTAgPjp/UPxoIoUWDDU4oSRbNzPIdFfJIlGVRfkte2TyA 9Zo6dID5j4LjKqo7nXTlwIQOmTGhiaOa0UfpvVWIf6jpWBKn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On today's platforms the benefit of platform_driver_probe() isn't that
relevant any more. It allows to drop some code after booting (or module
loading) for .probe() and discard the .remove() function completely if
the driver is built-in. This typically saves a few 100k.

The downside of platform_driver_probe() is that the driver cannot be
bound and unbound at runtime which is ancient and also slightly
complicates testing. There are also thoughts to deprecate
platform_driver_probe() because it adds some complexity in the driver
core for little gain. Also many drivers don't use it correctly. This
driver for example misses to mark the driver struct with __refdata which
is needed to suppress a (W=1) modpost warning:

	WARNING: modpost: drivers/video/fbdev/amifb: section mismatch in reference: amifb_driver+0x4 (section: .data) -> amifb_remove (section: .exit.text)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/amifb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index b18c6b4f129a..85da43034166 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3530,7 +3530,7 @@ static inline void chipfree(void)
 	 * Initialisation
 	 */
 
-static int __init amifb_probe(struct platform_device *pdev)
+static int amifb_probe(struct platform_device *pdev)
 {
 	struct fb_info *info;
 	int tag, i, err = 0;
@@ -3752,7 +3752,7 @@ static int __init amifb_probe(struct platform_device *pdev)
 }
 
 
-static int __exit amifb_remove(struct platform_device *pdev)
+static int amifb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
@@ -3769,13 +3769,13 @@ static int __exit amifb_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver amifb_driver = {
-	.remove = __exit_p(amifb_remove),
-	.driver   = {
+	.probe = amifb_probe,
+	.remove = amifb_remove,
+	.driver = {
 		.name	= "amiga-video",
 	},
 };
-
-module_platform_driver_probe(amifb_driver, amifb_probe);
+module_platform_driver(amifb_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:amiga-video");
-- 
2.42.0

