Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D70B6B0009
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Mar 2023 08:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjCHHks (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Mar 2023 02:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjCHHkn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Mar 2023 02:40:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D90A90A9
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Mar 2023 23:40:04 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOv-0007TJ-MZ; Wed, 08 Mar 2023 08:39:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOv-002fIw-2G; Wed, 08 Mar 2023 08:39:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOt-003EMV-QJ; Wed, 08 Mar 2023 08:39:51 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 11/13] backlight: qcom-wled: Convert to platform remove callback returning void
Date:   Wed,  8 Mar 2023 08:39:43 +0100
Message-Id: <20230308073945.2336302-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uTuv8XDiycPiT9C588adO7M01bjKT+IKKoNN7QKnBsM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDu1+UvTE6oyO8GG7OvnkiB95CzIrtQ81YjwJ 19J/W/9t2OJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7tQAKCRDB/BR4rcrs CWHrB/9hkoIByU6wvnvoc+/S3xSkGUKcnP+2y4EYm4zz3Xe/yTwTxlyKBU0w17sOttoKz7rKFox 6EzHWYtXTjijuGEjRL1zw8Z8C1vCgapr1a1MsACI4Sl19CW0rUT8/kuMEceW7LFVFX/1bGsHmTv /rrZuEuHngbvbi5EHN8cyGZoovwkbQ6nTQbea/HohKWrsIuJJS0zlySVSBwgagRg8MbrVLfV6xd XLCwJ/GIQq8Dhcc8wysTaI8hHm0stjpTYct0KrahNMOWaHEsjjxgXJmmY6KewSTUT/8LYWaO62l QfqPmzNzXBWPPvR0nhU4a+Gq6+VVtGbxX22gm34/GcXCCv5f
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
 drivers/video/backlight/qcom-wled.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 527210e85795..8d88f36d8ff3 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1717,7 +1717,7 @@ static int wled_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(bl);
 };
 
-static int wled_remove(struct platform_device *pdev)
+static void wled_remove(struct platform_device *pdev)
 {
 	struct wled *wled = platform_get_drvdata(pdev);
 
@@ -1725,8 +1725,6 @@ static int wled_remove(struct platform_device *pdev)
 	cancel_delayed_work_sync(&wled->ovp_work);
 	disable_irq(wled->short_irq);
 	disable_irq(wled->ovp_irq);
-
-	return 0;
 }
 
 static const struct of_device_id wled_match_table[] = {
@@ -1742,7 +1740,7 @@ MODULE_DEVICE_TABLE(of, wled_match_table);
 
 static struct platform_driver wled_driver = {
 	.probe = wled_probe,
-	.remove = wled_remove,
+	.remove_new = wled_remove,
 	.driver	= {
 		.name = "qcom,wled",
 		.of_match_table	= wled_match_table,
-- 
2.39.1

