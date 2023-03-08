Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07C56B0004
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Mar 2023 08:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjCHHkp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Mar 2023 02:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCHHki (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Mar 2023 02:40:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A92A6174
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Mar 2023 23:39:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOv-0007SF-CD; Wed, 08 Mar 2023 08:39:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOu-002fIp-Nm; Wed, 08 Mar 2023 08:39:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZoOu-003EMY-0M; Wed, 08 Mar 2023 08:39:52 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 12/13] backlight: rt4831-backlight: Convert to platform remove callback returning void
Date:   Wed,  8 Mar 2023 08:39:44 +0100
Message-Id: <20230308073945.2336302-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=g2cQaPsB9lmUcpH7SFGia+z5n4IPlMpz741MUfM+I0I=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDu4mUxnffXzSsv6NL+8cHERRkcNh8rhmOeFV PzAcHA6Wu2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7uAAKCRDB/BR4rcrs CQmJB/9EIqRm170iOduJ80yQvL3X4aWNk4O/ckHBruIbAbGmNDejqBdwQIaxpBCKKV8TwANRpye YCJ6pYTunsYb8bcdKT6XKAsBfynUnzXuy1TLwkta8hT6rqeS45mxO63acoOn1HgR+doeAAplszg wYFhgVzv6M1CWm33kYWWOE6U9THTNdxoZd8xaJpuYw0oCOpN1HXWE5LU9qvugt+iDul25Rm7NUH ecEyUcRXlN5sAhelPCXDlZFay/RdkqAvZH31620EHgWu7qzmqRniFr3ucgPzT0L9ipY2XscdEdQ B1Vy2gBanROtCn09/BjrLzPy4WZdLn5qg5WlsWteKTe5dW0q
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
 drivers/video/backlight/rt4831-backlight.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index eb8c59e8713f..7d1af4c2ca67 100644
--- a/drivers/video/backlight/rt4831-backlight.c
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -203,15 +203,13 @@ static int rt4831_bl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rt4831_bl_remove(struct platform_device *pdev)
+static void rt4831_bl_remove(struct platform_device *pdev)
 {
 	struct rt4831_priv *priv = platform_get_drvdata(pdev);
 	struct backlight_device *bl_dev = priv->bl;
 
 	bl_dev->props.brightness = 0;
 	backlight_update_status(priv->bl);
-
-	return 0;
 }
 
 static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
@@ -226,7 +224,7 @@ static struct platform_driver rt4831_bl_driver = {
 		.of_match_table = rt4831_bl_of_match,
 	},
 	.probe = rt4831_bl_probe,
-	.remove = rt4831_bl_remove,
+	.remove_new = rt4831_bl_remove,
 };
 module_platform_driver(rt4831_bl_driver);
 
-- 
2.39.1

