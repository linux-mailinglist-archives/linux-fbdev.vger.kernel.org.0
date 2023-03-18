Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8C36BFDAC
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjCRXzN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjCRXy5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9CA1C58F
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNu-0004K8-Kg; Sun, 19 Mar 2023 00:54:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNt-0056ci-HV; Sun, 19 Mar 2023 00:54:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNs-005zWP-QF; Sun, 19 Mar 2023 00:54:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 44/51] video: fbdev: vesafb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:21 +0100
Message-Id: <20230318235428.272091-45-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2YxmySy91ABWHjFRtQioTwZYeyy9CkaQ8uG3B7FOamA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8MNsm1+puUlb3RzHBTGQ5gRsjxn4iCmMr0O eNGM/MmW4iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPDAAKCRCPgPtYfRL+ TnFAB/wKpd5Krj6VTB02/OhweQqT49m/XmdOBf8czRTWnYZsMPctVl5PMIE3dtEQMGLCAyfsfPi /ipv0fElcO33FUR3mRUwANzYVvUSzGtE6UeMFWKddm220jCWhM+43uuXDSsdL6OJkznlDmPLRIm 1VAW/hnsB0qp6YTuG81o6AmVX/0dhyysOmlVlBSBu48GZkfUCfVw/i0ORtRPpYmhejcd40lFFbC iKYiThDejuo8mbs4TzIbrCAbMO3v85mwnxCZG9iI3uvabjrBYKS3jM583ieGAMvrJQw1mbKEud0 o3vNPcWYit/2eCy41GhRwgH7QDvNGTVosijE1Uh2AHvNFU4c
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
 drivers/video/fbdev/vesafb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index 3f8bdfcf51f0..7451c607dc50 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -485,7 +485,7 @@ static int vesafb_probe(struct platform_device *dev)
 	return err;
 }
 
-static int vesafb_remove(struct platform_device *pdev)
+static void vesafb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
@@ -494,8 +494,6 @@ static int vesafb_remove(struct platform_device *pdev)
 
 	/* vesafb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
-
-	return 0;
 }
 
 static struct platform_driver vesafb_driver = {
@@ -503,7 +501,7 @@ static struct platform_driver vesafb_driver = {
 		.name = "vesa-framebuffer",
 	},
 	.probe = vesafb_probe,
-	.remove = vesafb_remove,
+	.remove_new = vesafb_remove,
 };
 
 module_platform_driver(vesafb_driver);
-- 
2.39.2

