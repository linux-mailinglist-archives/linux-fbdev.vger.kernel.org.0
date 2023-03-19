Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC656BFDB8
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjCRXzS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjCRXy5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A67220555
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNw-0004U6-M4; Sun, 19 Mar 2023 00:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNv-0056dI-3P; Sun, 19 Mar 2023 00:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNu-005zWn-2s; Sun, 19 Mar 2023 00:54:50 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 50/51] video: fbdev: wmt_ge_rops: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:27 +0100
Message-Id: <20230318235428.272091-51-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tt1v6ExXKFa6WnHThNDqW4BNRPbPsXa4C5cw5RgOKpg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8fItxiS0oUIuvBJeeljfSj+XNcO/SN+d3VS OAlE4hIVXqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPHwAKCRCPgPtYfRL+ TgYzB/9iwlhlvr87LTOA3sXPA7rruz9J68CyQv6K+qWjSS+MneTbH7GZptsHICuGpC0T95N0yFx 9wVAJ5/GTfVOTHrxsWRbPyOnOz1+7UFyVqfYY6izt6Szdefde7l2xcXFCqjhFOOE0NLrHAt9Yq6 5t56AIMD6L3CLGjhrgsG66atpMnttNar1xPWTvtkzevFWKZASvh5S6kDIjm4JwnSZvP1imyBpa7 yaAqv515ekPYXoE+UczVCptIkcnXI2QMZ9c8Ns6jCitEJQApxGOq/b+II3pIqAYYj42QfAXEYi0 AHlN2a1cggZNiIIAby2Ajjv8RJtUrBZhoK0HhModON9EK6cn
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
 drivers/video/fbdev/wmt_ge_rops.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 42255d27a1db..6196b9a6c44d 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -145,10 +145,9 @@ static int wmt_ge_rops_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wmt_ge_rops_remove(struct platform_device *pdev)
+static void wmt_ge_rops_remove(struct platform_device *pdev)
 {
 	iounmap(regbase);
-	return 0;
 }
 
 static const struct of_device_id wmt_dt_ids[] = {
@@ -158,7 +157,7 @@ static const struct of_device_id wmt_dt_ids[] = {
 
 static struct platform_driver wmt_ge_rops_driver = {
 	.probe		= wmt_ge_rops_probe,
-	.remove		= wmt_ge_rops_remove,
+	.remove_new	= wmt_ge_rops_remove,
 	.driver		= {
 		.name	= "wmt_ge_rops",
 		.of_match_table = wmt_dt_ids,
-- 
2.39.2

