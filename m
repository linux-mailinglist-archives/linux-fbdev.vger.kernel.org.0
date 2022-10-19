Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC4F60475B
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Oct 2022 15:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbiJSNhZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Oct 2022 09:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiJSNgn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Oct 2022 09:36:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE08C19988F
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Oct 2022 06:25:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ol93a-0007SU-8N; Wed, 19 Oct 2022 15:24:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ol93Z-0008Bo-8k; Wed, 19 Oct 2022 15:24:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ol93Y-00959K-DQ; Wed, 19 Oct 2022 15:24:24 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Make xilinxfb_release() return void
Date:   Wed, 19 Oct 2022 15:24:22 +0200
Message-Id: <20221019132422.78505-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zgQ95tX37l+i3rzWGDsA2eXO8ZpZOiXZNXQFIEV1dMs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjT/qD0nQjV3lggT4L6PJF4K0dIfYR+Qvr3J+z7c2C efRGSZ2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY0/6gwAKCRDB/BR4rcrsCXRlB/ 0aou6dUCbn42TN1hG5JvHL3D8yW1yaq0ET6F9dWt4jvkSXKv1LET9auWs3J2l5P2Y6enz37dW0ez22 libPSU+icAfV+KqvLGMeqyL0Ts5KY7VENCF57vqaCtrijUxW1mL5/woY5WDPByzbIz/J39pGhE5cAt Xc7vz8NbF/d+7H/fqT6EYG6LMIUhsnjHBAtskGAsg8IatPn8LdWXA4/NsJm2lcH+aC8zm734te6BBY UA4rvPU5Vy38jcYjQb6/Hu3IiXaE1OqzgaqRSL2zKPu4giVFaaQIc8QCFXTJLTmqtKta05Z2SU5J5+ TBt58zr6xQl3N65qlyTwPM9gvebcq6
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

The function xilinxfb_release() returns zero unconditionally. Make it
return void. There is no semantic change, the only effect is that it
becomes obvious that the driver's .remove() callback always returns zero.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/xilinxfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 438e2c78142f..1ac83900a21c 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -376,7 +376,7 @@ static int xilinxfb_assign(struct platform_device *pdev,
 	return rc;
 }
 
-static int xilinxfb_release(struct device *dev)
+static void xilinxfb_release(struct device *dev)
 {
 	struct xilinxfb_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -402,8 +402,6 @@ static int xilinxfb_release(struct device *dev)
 	if (!(drvdata->flags & BUS_ACCESS_FLAG))
 		dcr_unmap(drvdata->dcr_host, drvdata->dcr_len);
 #endif
-
-	return 0;
 }
 
 /* ---------------------------------------------------------------------
@@ -480,7 +478,9 @@ static int xilinxfb_of_probe(struct platform_device *pdev)
 
 static int xilinxfb_of_remove(struct platform_device *op)
 {
-	return xilinxfb_release(&op->dev);
+	xilinxfb_release(&op->dev);
+
+	return 0;
 }
 
 /* Match table for of_platform binding */

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.37.2

