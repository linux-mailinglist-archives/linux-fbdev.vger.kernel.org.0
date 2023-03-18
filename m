Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E446BFD87
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCRXyy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjCRXys (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386AE1BAC4
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNo-00043m-09; Sun, 19 Mar 2023 00:54:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNn-0056aL-6H; Sun, 19 Mar 2023 00:54:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNm-005zUO-Fd; Sun, 19 Mar 2023 00:54:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Jones <pjones@redhat.com>, Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 13/51] video: fbdev: efifb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:53:50 +0100
Message-Id: <20230318235428.272091-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VIHoENgJQr+/TzO1wGTKACON8r8R977ccTJvqt5P9bY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk61yMu2jhPBMTpn1AgCe3qJRrJ3+Petc6RbV 1cVNbPvLHuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOtQAKCRCPgPtYfRL+ Tr59B/9mvfCIH/NOeCWvxdnnAc99kkHmTi+I1eFZe+fnL2jHtkq9WQ0UgxgG5ZOvVsnBSCbN3kX dvB9mIOLgqr4FNQiM06fNctolLo+6svqAEN6bI7qI0NtvY8dnXvzEk8VSOdVp/pLKH+8EWweZxR H9QqKmXMzh1tzwFJD2oC/swjMRSPZGC/mbnKKIhTpXyIcrjYCQ4YvQM+FMRbsubt4FsLU3P6ZgA Dr8622XlBc5dR8L8eSk+oXGut8jpLijgDRa5PKTe6A8Zg4UFW9In9l8wX3pqBd/gFXTEFr6oVoY ErmS+sVF3oIdet72Rd6U+BVceN2iPgm4MIepH94qtZ+Q7VbL
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
 drivers/video/fbdev/efifb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index a5779fb453a2..3d7be69ab593 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -621,15 +621,13 @@ static int efifb_probe(struct platform_device *dev)
 	return err;
 }
 
-static int efifb_remove(struct platform_device *pdev)
+static void efifb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
 	/* efifb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
 	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
-
-	return 0;
 }
 
 static struct platform_driver efifb_driver = {
@@ -637,7 +635,7 @@ static struct platform_driver efifb_driver = {
 		.name = "efi-framebuffer",
 	},
 	.probe = efifb_probe,
-	.remove = efifb_remove,
+	.remove_new = efifb_remove,
 };
 
 builtin_platform_driver(efifb_driver);
-- 
2.39.2

