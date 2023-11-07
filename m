Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C550D7E378B
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Nov 2023 10:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbjKGJUo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Nov 2023 04:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbjKGJUd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Nov 2023 04:20:33 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C590A114
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Nov 2023 01:20:30 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG5-0000UA-11; Tue, 07 Nov 2023 10:20:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG4-007Fmv-Jv; Tue, 07 Nov 2023 10:20:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG4-00ENXX-Ap; Tue, 07 Nov 2023 10:20:28 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 22/22] fb: omapfb/tpd12s015: Convert to platform remove callback returning void
Date:   Tue,  7 Nov 2023 10:18:03 +0100
Message-ID: <20231107091740.3924258-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BM9a+fM/lixBZNZcPucnNQynZ8Q+QQTeD5OtUZMImzI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgDN9zJoIuTQBAlJR80+NdgrWU0RdnoAvpfN/ BirwLi0XzyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAzQAKCRCPgPtYfRL+ TjZJB/sFG958INcVgLN+iQWd8qLHyGNDuKX2o6SoomEPqoVKsDrvtTQpEweM6IACZxTzX1DzlHQ xWhmA9O9x0p8FcZNIwr8Pvy7jaa+SrryEX41d/S5kC8PMC3HjZOVlYadp6qtlFhZTpNSJi+0vJA gUPDEd6eejT4to7I2V21TVpAL+985U0CSjjNnbpFoNYMAUkwafOLVTayKkhfhO9uJTuX4VooJX5 ObntA0+XNv7fFxsVjsEsUcLHBrfvsx9hHRQZSjdLknhKKNLOBu5fQBH8Y65J3MwmpKq3D70RQ+z sgXh+u3HFD3tcUPAWrOtY5vPbonu4oCjrKZit4r26lcPMdgt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
index 0bdedc0f6527..eb3926d0361b 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
@@ -283,7 +283,7 @@ static int tpd_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int tpd_remove(struct platform_device *pdev)
+static void tpd_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -300,8 +300,6 @@ static int tpd_remove(struct platform_device *pdev)
 		tpd_disconnect(dssdev, dssdev->dst);
 
 	omap_dss_put_device(in);
-
-	return 0;
 }
 
 static const struct of_device_id tpd_of_match[] = {
@@ -313,7 +311,7 @@ MODULE_DEVICE_TABLE(of, tpd_of_match);
 
 static struct platform_driver tpd_driver = {
 	.probe	= tpd_probe,
-	.remove	= tpd_remove,
+	.remove_new = tpd_remove,
 	.driver	= {
 		.name	= "tpd12s015",
 		.of_match_table = tpd_of_match,
-- 
2.42.0

