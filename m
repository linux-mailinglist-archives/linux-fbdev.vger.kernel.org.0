Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D906BFDA6
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCRXzK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjCRXyy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF321BAC4
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNu-0004KH-FZ; Sun, 19 Mar 2023 00:54:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNt-0056cj-Hf; Sun, 19 Mar 2023 00:54:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNs-005zWI-EN; Sun, 19 Mar 2023 00:54:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 42/51] video: fbdev: tcx: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:19 +0100
Message-Id: <20230318235428.272091-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5xWiQY/5bER2ZivM6AFLT96N4ugAZFFWdMFQKD74Y+A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8DernaueoXw+RlfEYV8ABQTWbofG44K/Qwt BuE2CUawjqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPAwAKCRCPgPtYfRL+ TqkmB/9y+S/tGTseOiuL7qnohW3hsm2KXw4nu/0t57OK6r/bhdqQAyadXqjsujYgyUfQHkcsVGn OI5OGRrYRZnwSaT4pKBjMSPdsny+z+JsXWSVZbnLHAsIhp/GutpRPEfUWoBZqoJM32ntzjv8ssn cjInotIFnVrjl75h2LeLexqY7+M7CZ9+etb6Zzns6F2VGyCGMPqT3AR26C0Wv31BKmqHUS5M6Xb jHjrMsosBPRuR7AsL2mj6QHLxgw4Zn/lMU3Oc52+KKJYW/vl78KusG2gDg7i0NLUSTcAyJpJMib awjAw9BV/3fBgZVh8Z62Gjeco79D8+5x8lHL2IPOWjqW8r2k
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
 drivers/video/fbdev/tcx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index 01d87f53324d..30a460b6f204 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -487,7 +487,7 @@ static int tcx_probe(struct platform_device *op)
 	return err;
 }
 
-static int tcx_remove(struct platform_device *op)
+static void tcx_remove(struct platform_device *op)
 {
 	struct fb_info *info = dev_get_drvdata(&op->dev);
 	struct tcx_par *par = info->par;
@@ -498,8 +498,6 @@ static int tcx_remove(struct platform_device *op)
 	tcx_unmap_regs(op, info, par);
 
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static const struct of_device_id tcx_match[] = {
@@ -516,7 +514,7 @@ static struct platform_driver tcx_driver = {
 		.of_match_table = tcx_match,
 	},
 	.probe		= tcx_probe,
-	.remove		= tcx_remove,
+	.remove_new	= tcx_remove,
 };
 
 static int __init tcx_init(void)
-- 
2.39.2

