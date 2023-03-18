Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B556BFD9F
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjCRXzH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjCRXyw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F86C1ACE7
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNq-0004Cc-FB; Sun, 19 Mar 2023 00:54:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNp-0056b8-Fu; Sun, 19 Mar 2023 00:54:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNo-005zV2-ET; Sun, 19 Mar 2023 00:54:44 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>,
        Helge Deller <deller@gmx.de>, Shawn Guo <shawnguo@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 23/51] video: fbdev: imxfb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:00 +0100
Message-Id: <20230318235428.272091-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=d2UxhYplIb+y7dtlgqGR5bljlwCocj0tp5fWaYnzofc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7AFX7lRZe3IG+TM6r9J0oHT6oxMUap03OE5 HO7g4qsf3GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOwAAKCRCPgPtYfRL+ TjtHB/9NiEUh3vulSBr8kh5lrEs6NsW1YfckgBLlFX9LXDkmOYBgjVZIc+2UWk7WcWJBdojAY9L c0ThFO6d4uvlaIF9IkZwuUOPsaO7+cu1v9/+nDn3t1/RuxQcKR1zS8RNq3D4mh/ZPE46//2jVac glaq8EYbuqR9A8Py7enMnorz+0e8dLGe2rU/G3WHwzvozL1YmC92qCR9B60ICTBLzFqDjrAvtpU YHcl1yL/Q5JCHEyW7O8vBmW3KS2EWQqYMpA+brKnQNL+6OG7Rt+6QPt/OpxlrdKjvQmNvzKdLxh /HMhLXF12d4sO84scf+ceyz/DUR2moeRsgkrHYS1PHxgC6Ct
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
 drivers/video/fbdev/imxfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 51fde1b2a793..adf36690c342 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -1051,7 +1051,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imxfb_remove(struct platform_device *pdev)
+static void imxfb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 	struct imxfb_info *fbi = info->par;
@@ -1064,8 +1064,6 @@ static int imxfb_remove(struct platform_device *pdev)
 		    fbi->map_dma);
 	kfree(info->pseudo_palette);
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static int __maybe_unused imxfb_suspend(struct device *dev)
@@ -1097,7 +1095,7 @@ static struct platform_driver imxfb_driver = {
 		.pm	= &imxfb_pm_ops,
 	},
 	.probe		= imxfb_probe,
-	.remove		= imxfb_remove,
+	.remove_new	= imxfb_remove,
 	.id_table	= imxfb_devtype,
 };
 module_platform_driver(imxfb_driver);
-- 
2.39.2

