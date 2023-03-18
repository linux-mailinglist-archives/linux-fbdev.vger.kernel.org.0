Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50EF6BFD88
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjCRXyz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjCRXys (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F88E1BAC7
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNo-00046G-As; Sun, 19 Mar 2023 00:54:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNn-0056aS-Fp; Sun, 19 Mar 2023 00:54:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNm-005zUU-RY; Sun, 19 Mar 2023 00:54:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 15/51] video: fbdev: ffb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:53:52 +0100
Message-Id: <20230318235428.272091-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nTkQmkVJWNdBujbrdtnDFlWOA7LXxqZAA14hjs9xq9w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk63127WC8hR7M/L+zCAkWc9Qhq8mDe3jC4UB rt3666/tmiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOtwAKCRCPgPtYfRL+ TlvKCACiZHsyxjxIEHyU/fDz4FJtRyiOIm3K4W6Z8YhMqCriP9WFrm33vRoJ3SvAjhp/BWWw+2f FQyCCuGdFbiFvrLJFA3hNckTu+9HVXH3nXw9Tx8CWgKWuzrs5FpPzjW88KUSJungwNlNGMacJpH 9oKKmFBwsjBL1ystqUlpoa2r0C3www96aQ59i8FbgTqJ9teiaFLg93OUqx3hT8Ovzkcmny4sFqW DSfoSfwz6+RkK708+XIh6V6uvZt70TbPPrT11by5Z8gK+kPphxIHovokOav+dq49wtGy9b6Tt99 6ZcuK+GaibAqt1qw+PGz0lxaRzlnvkHeztEnbYmmTVoqDwND
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
 drivers/video/fbdev/ffb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index 7cba3969a970..c6d3111dcbb0 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -1023,7 +1023,7 @@ static int ffb_probe(struct platform_device *op)
 	return err;
 }
 
-static int ffb_remove(struct platform_device *op)
+static void ffb_remove(struct platform_device *op)
 {
 	struct fb_info *info = dev_get_drvdata(&op->dev);
 	struct ffb_par *par = info->par;
@@ -1035,8 +1035,6 @@ static int ffb_remove(struct platform_device *op)
 	of_iounmap(&op->resource[1], par->dac, sizeof(struct ffb_dac));
 
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static const struct of_device_id ffb_match[] = {
@@ -1056,7 +1054,7 @@ static struct platform_driver ffb_driver = {
 		.of_match_table = ffb_match,
 	},
 	.probe		= ffb_probe,
-	.remove		= ffb_remove,
+	.remove_new	= ffb_remove,
 };
 
 static int __init ffb_init(void)
-- 
2.39.2

