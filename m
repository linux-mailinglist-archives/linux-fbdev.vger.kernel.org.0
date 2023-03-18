Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B386BFDB0
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjCRXzQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjCRXy5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F811B572
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNw-0004Rf-Fr; Sun, 19 Mar 2023 00:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNu-0056d7-JL; Sun, 19 Mar 2023 00:54:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNt-005zWk-SU; Sun, 19 Mar 2023 00:54:49 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 49/51] video: fbdev: wm8505fb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:26 +0100
Message-Id: <20230318235428.272091-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=B7n0rWq6GxbW5rJ5Dqd2jXn+/vWBf6udLaZCZyY1GYc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxf5nFX9Ve9Gy5Gz29V7Zb/sYW/8l5tzSnSk9eqhLb+ fJsx/1/nYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBM5FwW+/94NSXOl/GFXY3v H3GVTBadJltutFL34ZZktXUNCorCh2pWqJ19emaWP2vsH7bZOtx//q3lvyY6qXbm15lq6Qzu2wz L7t38zK/Xf3Zpb1mT9P0Ajq4P8g7Waw5fyXnXtmr13VoxhuwrEj6cLx/cMQvoFfAL9rrRKiJ8XZ n/i9OZRwWLjiq0KH3227A1yrx85S+JVUG1D9wbtOt+shj7Pcn+xhp7MzHlza1vrO4z99rHFAvYn zPRnde25Ne5Kr5dMxin7NQNW2fHWBfI5qr2/altYpeoPGMKp7K/+6yUQ7Z7iy8c8voc8Yw7ViFp 4hGr41Znjkt4Zlu0z036xb/d20+I+fYqwaowrVnBMSsSAQ==
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
 drivers/video/fbdev/wm8505fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/wm8505fb.c b/drivers/video/fbdev/wm8505fb.c
index 8f4d674fa0d0..cf0ac6c2d4c7 100644
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -374,7 +374,7 @@ static int wm8505fb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wm8505fb_remove(struct platform_device *pdev)
+static void wm8505fb_remove(struct platform_device *pdev)
 {
 	struct wm8505fb_info *fbi = platform_get_drvdata(pdev);
 
@@ -384,8 +384,6 @@ static int wm8505fb_remove(struct platform_device *pdev)
 
 	if (fbi->fb.cmap.len)
 		fb_dealloc_cmap(&fbi->fb.cmap);
-
-	return 0;
 }
 
 static const struct of_device_id wmt_dt_ids[] = {
@@ -395,7 +393,7 @@ static const struct of_device_id wmt_dt_ids[] = {
 
 static struct platform_driver wm8505fb_driver = {
 	.probe		= wm8505fb_probe,
-	.remove		= wm8505fb_remove,
+	.remove_new	= wm8505fb_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.of_match_table = wmt_dt_ids,
-- 
2.39.2

