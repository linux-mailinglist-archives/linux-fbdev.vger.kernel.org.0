Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75726BFDA2
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjCRXzJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjCRXyx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5A31B2D1
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNt-0004I0-D9; Sun, 19 Mar 2023 00:54:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNs-0056cQ-PI; Sun, 19 Mar 2023 00:54:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNs-005zWB-0D; Sun, 19 Mar 2023 00:54:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 40/51] video: fbdev: simplefb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:17 +0100
Message-Id: <20230318235428.272091-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=b4b607FxowyUjUELxWtsjxaitDLIUEa06hb9gkP9mSc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk73LG2ivyBvUeI2TvBAPWqclWkuHiP0FKaha +PCXHaV0mOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZO9wAKCRCPgPtYfRL+ Tr4RB/4kuWaOWK8zWzpwc1wWDQyXDpl5AXJv4IVIPon5Cx/RIfusbmTZNsEe9l6H6+sH0zMcvjl 73SoDz42U7bEwhJk1A2EGlYzXbbUpViaEZeXJMmB1+3MyZv6Jn8wcOmgtBh7KIX1l2tTjE0vnX3 B38YGR37Q0E0Noe5Hp5EdYh2GI+p3in8R1OnItxsT769rhCZqL07fDH/kT6o3SAG4j9m238jddq 6Ew3lwjr7jyo9CBuGKvhN8WcjYf2GmavccPTih7sRPvaXzGDFe21xo8CsobuqAFuZiXPKpAIGNP he9t/CEadssTabS21ncaw4Q/6mca5HlhOuhkeCuEyYEKaFhY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/simplefb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 10d71879d340..e4a13871bca6 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -538,14 +538,12 @@ static int simplefb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int simplefb_remove(struct platform_device *pdev)
+static void simplefb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
 	/* simplefb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
-
-	return 0;
 }
 
 static const struct of_device_id simplefb_of_match[] = {
@@ -560,7 +558,7 @@ static struct platform_driver simplefb_driver = {
 		.of_match_table = simplefb_of_match,
 	},
 	.probe = simplefb_probe,
-	.remove = simplefb_remove,
+	.remove_new = simplefb_remove,
 };
 
 module_platform_driver(simplefb_driver);
-- 
2.39.2

