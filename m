Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8E0A6BFDDC
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCRX5A (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRX47 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:56:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA2A23DB8
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:56:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNq-00049d-6A; Sun, 19 Mar 2023 00:54:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNo-0056ax-QG; Sun, 19 Mar 2023 00:54:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNo-005zUv-2i; Sun, 19 Mar 2023 00:54:44 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
        Helge Deller <deller@gmx.de>
Cc:     linux-nvidia@lists.surfsouth.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 21/51] video: fbdev: hgafb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:53:58 +0100
Message-Id: <20230318235428.272091-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eZDLRnCYCHs1tJmhSerH6czPGGhxyCBJVPFxfmdREKI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6+Sn8GIhneX9f4FUvTnzrvH6+k+jeAbM5l5 cRU+3VEcSaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOvgAKCRCPgPtYfRL+ TqAxB/4uqBAqyawo+IG//gd0+thIZaI9iAjCHiaQxqom+G+7FhMVFGrpxoHPe/F0W8v0adXyUzA qWdO1fhdk5wtwTf9G/UJmM9s+D3xuduv1fZJdslgcf3fyigZ6HMXc2eyqhcInj5E4+zkyCnhgp+ +7WtItI3Mo/4fMxEwOxGaKjdWeEF1wQhqpPXwWd2/nCMCcCU4DuC8WsquqBvJeQLB0+ojElrvrD /b2yxtVkch+cIAugPF1IfdWXJqAt2G0dFqJf7erdkC3PUjphhnzRvs58oLTwHb0dioHBLsUlRgh 6uftCA5Zn01NRizIbyhin1Zauls+UFQzxZqox2hznOhp9fAz
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
 drivers/video/fbdev/hgafb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index bd3d07aa4f0e..20bdab738ab7 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -595,7 +595,7 @@ static int hgafb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int hgafb_remove(struct platform_device *pdev)
+static void hgafb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
@@ -614,13 +614,11 @@ static int hgafb_remove(struct platform_device *pdev)
 
 	if (release_io_port)
 		release_region(0x3bf, 1);
-
-	return 0;
 }
 
 static struct platform_driver hgafb_driver = {
 	.probe = hgafb_probe,
-	.remove = hgafb_remove,
+	.remove_new = hgafb_remove,
 	.driver = {
 		.name = "hgafb",
 	},
-- 
2.39.2

