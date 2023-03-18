Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784D56BFD95
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjCRXzC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjCRXyt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B491C5A9
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNq-0004E1-TW; Sun, 19 Mar 2023 00:54:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNq-0056bU-93; Sun, 19 Mar 2023 00:54:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNp-005zVM-GU; Sun, 19 Mar 2023 00:54:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 28/51] video: fbdev: ocfb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:05 +0100
Message-Id: <20230318235428.272091-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4FMjJwr1rPhKgf5SBBUb9HyDGJHmP5Y5G10UeekMO5M=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxv2Pz/jN/5Ww9xG7+yKyO3+nBha2eTheLlZfF5z/0n Kj34rtcJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATqfDkYJgx2b54Grt/p3O4 Wp7duikF4Q9/zQzhXR9sXufgGVIROHPh+ltP/5XwWxwSibr7/Zhlyswgh8TkotlLJFY3fOIKDpO wWFxzy/pq4uM2J8VvIdYdjZK567+ZHpoeI5OqLMRQYOJ3scl2c+XzAtP0DbNn2d/LTL/0yu/pvE dnn3S9tbjW+Z81aso/T6/S2EzbWCsdNYUq8YKUXbPOR3ku0KvqO+RpOmXz+t6W9fkObwrnTpoYv Xwui+mqD2l8Zb/mrzLliLN4tm9txis1Eamkq3nvV/58uDqzocPVbVXD4zJjhqebyhu7VSMvsZ7I PMSQHH+mR1t6Td3j9SoN0dpMdQksGesqr8+f1Dt5wvUaAA==
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
 drivers/video/fbdev/ocfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ocfb.c b/drivers/video/fbdev/ocfb.c
index da7e1457e58f..7ebe794583e1 100644
--- a/drivers/video/fbdev/ocfb.c
+++ b/drivers/video/fbdev/ocfb.c
@@ -370,7 +370,7 @@ static int ocfb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ocfb_remove(struct platform_device *pdev)
+static void ocfb_remove(struct platform_device *pdev)
 {
 	struct ocfb_dev *fbdev = platform_get_drvdata(pdev);
 
@@ -383,8 +383,6 @@ static int ocfb_remove(struct platform_device *pdev)
 	ocfb_writereg(fbdev, OCFB_CTRL, 0);
 
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 static const struct of_device_id ocfb_match[] = {
@@ -395,7 +393,7 @@ MODULE_DEVICE_TABLE(of, ocfb_match);
 
 static struct platform_driver ocfb_driver = {
 	.probe  = ocfb_probe,
-	.remove	= ocfb_remove,
+	.remove_new = ocfb_remove,
 	.driver = {
 		.name = "ocfb_fb",
 		.of_match_table = ocfb_match,
-- 
2.39.2

