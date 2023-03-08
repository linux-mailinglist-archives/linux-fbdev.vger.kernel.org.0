Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71B56B0007
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Mar 2023 08:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjCHHkr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Mar 2023 02:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjCHHkk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Mar 2023 02:40:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A4CA908B
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Mar 2023 23:40:00 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOv-0007S3-9y; Wed, 08 Mar 2023 08:39:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOu-002fIm-LH; Wed, 08 Mar 2023 08:39:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOt-003EMQ-JK; Wed, 08 Mar 2023 08:39:51 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 10/13] backlight: pwm_bl: Convert to platform remove callback returning void
Date:   Wed,  8 Mar 2023 08:39:42 +0100
Message-Id: <20230308073945.2336302-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EyHwZ45DOvCsEOKFuFODC9cTmunjdcxbvJGok00zlVk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDuxvyiycJggmXlrpugayin0HBGPvHbf/m482 JluKQTIn6+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7sQAKCRDB/BR4rcrs CfKMB/9APLRwWUubeqImx/pQHz8/6tXF7AdNZjNV9w9wQHwxWMQHwqIV4XXBLss7rWtSH0iacII yDoS5trYouR3rAaCIpnH7flNHJJ1aJ3saoUWeV5Ad25poHiOgToR5JHHZ4LLYXrdDYWDSHOZSE+ DCqHr8dTEwiRSNWjRrslkNh0SThgUGF9OUZxVszVJSKr8mT++jUL4s7HsXpjIMeFl3NXOxVJErq iR9Y2eeK1gBrnBlIJLvD0awtA8PjjKjN2Ow6I/ixkvWbucfCOl7qS+YnTVwzvW9f0VgRB9yH6y6 4K/+2zIKLgQ+MoXBVdj7mS5O9fOsg+28phdmQ8RY0rC3NmaU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/video/backlight/pwm_bl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index fb388148d98f..fce412234d10 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -625,7 +625,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pwm_backlight_remove(struct platform_device *pdev)
+static void pwm_backlight_remove(struct platform_device *pdev)
 {
 	struct backlight_device *bl = platform_get_drvdata(pdev);
 	struct pwm_bl_data *pb = bl_get_data(bl);
@@ -635,8 +635,6 @@ static int pwm_backlight_remove(struct platform_device *pdev)
 
 	if (pb->exit)
 		pb->exit(&pdev->dev);
-
-	return 0;
 }
 
 static void pwm_backlight_shutdown(struct platform_device *pdev)
@@ -690,7 +688,7 @@ static struct platform_driver pwm_backlight_driver = {
 		.of_match_table	= of_match_ptr(pwm_backlight_of_match),
 	},
 	.probe		= pwm_backlight_probe,
-	.remove		= pwm_backlight_remove,
+	.remove_new	= pwm_backlight_remove,
 	.shutdown	= pwm_backlight_shutdown,
 };
 
-- 
2.39.1

