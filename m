Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101CA6AFFFB
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Mar 2023 08:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjCHHkk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Mar 2023 02:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjCHHkg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Mar 2023 02:40:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BCC59E8
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Mar 2023 23:39:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOt-0007OM-Ku; Wed, 08 Mar 2023 08:39:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOs-002fID-VX; Wed, 08 Mar 2023 08:39:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOs-003ELz-4C; Wed, 08 Mar 2023 08:39:50 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 03/13] backlight: cr_bllcd: Convert to platform remove callback returning void
Date:   Wed,  8 Mar 2023 08:39:35 +0100
Message-Id: <20230308073945.2336302-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=y8vqN29Di5PVrbOEowmiQzdaiL6RCBenKXJql6Jvatk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDubkN1ZRPbIBrEHjp5fc3iKPta7T4R6JZRqv 9gAhDAsFUOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7mwAKCRDB/BR4rcrs Cbl7CACaz76dYbu/gGCK/3DYJ8DN5YcESTe9HQ7T6A9YBnLdLR5ETJy8PhlWbNYld8zSS+7TLOm oZoODUcNhdF6lcKy30uJA+vh3Xm7Y6WqerR+GExQYa3z2ediCjoj4wWdrkQ3JKOv84gACypgTHk XWujA5b38trj9rV+9LatkpZ/Vl/RycWq8ChmNBAvv1Ukbrf0221txRs3Aw35Y4r+qt1nJxpmCF3 qAUP6tmt23lfG6Ztr/WmvGi9+UwzdsaMtHhXiDBSKLGHgBBfgzuh4oMq8QRsgC3ShTRbpzrQa1k YdtM5gcKiKkJE1my7wsqwsmPGOYjAp4MJkM+Gj+rYbOwiouP
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
 drivers/video/backlight/cr_bllcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlight/cr_bllcd.c
index 4ad0a72531fe..781aeecc451d 100644
--- a/drivers/video/backlight/cr_bllcd.c
+++ b/drivers/video/backlight/cr_bllcd.c
@@ -210,7 +210,7 @@ static int cr_backlight_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int cr_backlight_remove(struct platform_device *pdev)
+static void cr_backlight_remove(struct platform_device *pdev)
 {
 	struct cr_panel *crp = platform_get_drvdata(pdev);
 
@@ -220,13 +220,11 @@ static int cr_backlight_remove(struct platform_device *pdev)
 	cr_backlight_set_intensity(crp->cr_backlight_device);
 	cr_lcd_set_power(crp->cr_lcd_device, FB_BLANK_POWERDOWN);
 	pci_dev_put(lpc_dev);
-
-	return 0;
 }
 
 static struct platform_driver cr_backlight_driver = {
 	.probe = cr_backlight_probe,
-	.remove = cr_backlight_remove,
+	.remove_new = cr_backlight_remove,
 	.driver = {
 		   .name = "cr_backlight",
 		   },
-- 
2.39.1

