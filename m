Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF206BFD96
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCRXzD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjCRXyu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5AE1B2E1
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNq-0004Cu-H6; Sun, 19 Mar 2023 00:54:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNp-0056bE-J5; Sun, 19 Mar 2023 00:54:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNo-005zVB-Rl; Sun, 19 Mar 2023 00:54:44 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 25/51] video: fbdev: mb862xx: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:02 +0100
Message-Id: <20230318235428.272091-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=n0tjhuJrFGcP2NM1FYKiwu0flb4gjoOOgN8yfE1fLf8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7CzzJlOFhDIAbO9bMcxIi4HWcjmrLMbH4w+ TDRHhDAZ8yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOwgAKCRCPgPtYfRL+ TkDBCACIQx58+/h0Da9NaC6Idqt25R71OosMjeqa0annzR+Ar5g4w9iRWo6CxWhi4EkEL/9UBq0 7GsrQiQtItYvFfvQ5pzx48gIhz1VOorvNjISqM4SjpzEI9Nmyr3wk3YJ8iA01PvnRdOuSmmvwQB xlM+21v2Aj1i4Q+UH4FDGSKnaOYrxawNCvRuLpAPV1S3zxr5twb9vZnqkiHmE5XvpjQfxRfdSsP /EImaire8hQ8VAh4UZfliYFUSI1XnpaYraK6an4W521CGHuIGaW2H/FGQk6qjZh2uvCqKQQIC7t AbQCWObdZKeuIJr6IrLsVRDQs5TfQttkeeDjkv1A1BoqZP6U
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
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index a236fc910148..b5c8fcab9940 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -784,7 +784,7 @@ static int of_platform_mb862xx_probe(struct platform_device *ofdev)
 	return ret;
 }
 
-static int of_platform_mb862xx_remove(struct platform_device *ofdev)
+static void of_platform_mb862xx_remove(struct platform_device *ofdev)
 {
 	struct fb_info *fbi = dev_get_drvdata(&ofdev->dev);
 	struct mb862xxfb_par *par = fbi->par;
@@ -814,7 +814,6 @@ static int of_platform_mb862xx_remove(struct platform_device *ofdev)
 
 	release_mem_region(par->res->start, res_size);
 	framebuffer_release(fbi);
-	return 0;
 }
 
 /*
@@ -838,7 +837,7 @@ static struct platform_driver of_platform_mb862xxfb_driver = {
 		.of_match_table = of_platform_mb862xx_tbl,
 	},
 	.probe		= of_platform_mb862xx_probe,
-	.remove		= of_platform_mb862xx_remove,
+	.remove_new	= of_platform_mb862xx_remove,
 };
 #endif
 
-- 
2.39.2

