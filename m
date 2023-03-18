Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69D26BFDAF
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjCRXzP (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjCRXy5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A683E3B3
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNr-0004Dn-Jy; Sun, 19 Mar 2023 00:54:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNq-0056bQ-5g; Sun, 19 Mar 2023 00:54:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNp-005zVJ-9i; Sun, 19 Mar 2023 00:54:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>, Stephen Kitt <steve@sk2.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 27/51] video: fbdev: mx3fb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:54:04 +0100
Message-Id: <20230318235428.272091-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VAiN0q9BdY506j8Egb/7ZXsMaPZm1ET63G9PkCRVWiY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7FMr+/uTsn1VaSiHfPUyoJyvRdmeAXGshQL Kw84kRM78CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOxQAKCRCPgPtYfRL+ TsWrB/0d/lND4TC643e1BOkT5wiQ2M1NPjmKHTWN441R2GG32/dNvEZgoe7hs91yXRdLYtdTjMN 6GBxL6CURV72mFKDuocuKoafAilKZ8lVWBccpVEaH2Ibm8l5XdFW9w4nlXpok1NIJqim7dce6Fv H5ULG1x5irz5nHZQci6+bCkB97meenjEhm9LZTEtinx+Fk+kj5EyxaZNj4ecAv6CLfwy8QMspfh 0viPm1zutlEB9cKULMnhhtZ7zYgwzRqohJyNBwiNpRPi/NvnLxoeeVsBgGyxlDBxvavwBOaFR3w 5EzgChp1GLtkdT+dbAZXChRS1CC1nIXtBU8pIikGi5KUKLQW
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
 drivers/video/fbdev/mx3fb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index 76771e126d0a..63c186e0364a 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -1616,7 +1616,7 @@ static int mx3fb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mx3fb_remove(struct platform_device *dev)
+static void mx3fb_remove(struct platform_device *dev)
 {
 	struct mx3fb_data *mx3fb = platform_get_drvdata(dev);
 	struct fb_info *fbi = mx3fb->fbi;
@@ -1632,7 +1632,6 @@ static int mx3fb_remove(struct platform_device *dev)
 	dmaengine_put();
 
 	iounmap(mx3fb->reg_base);
-	return 0;
 }
 
 static struct platform_driver mx3fb_driver = {
@@ -1640,7 +1639,7 @@ static struct platform_driver mx3fb_driver = {
 		.name = MX3FB_NAME,
 	},
 	.probe = mx3fb_probe,
-	.remove = mx3fb_remove,
+	.remove_new = mx3fb_remove,
 	.suspend = mx3fb_suspend,
 	.resume = mx3fb_resume,
 };
-- 
2.39.2

