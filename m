Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD577E3773
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Nov 2023 10:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbjKGJUi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Nov 2023 04:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbjKGJUb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Nov 2023 04:20:31 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB30D47
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Nov 2023 01:20:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG2-0000ME-CW; Tue, 07 Nov 2023 10:20:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG1-007Flm-PZ; Tue, 07 Nov 2023 10:20:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG1-00ENWe-GW; Tue, 07 Nov 2023 10:20:25 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 08/22] fb: omapfb/opa362: Don't put .remove() in .exit.text and drop suppress_bind_attrs
Date:   Tue,  7 Nov 2023 10:17:49 +0100
Message-ID: <20231107091740.3924258-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2uqVAKnjy8G96yCeARXFR2Z9OX9BeyxLVK2gJNh8zvE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgC91cv9ooqFLV7HLsl2cAnYggKE7cFhi1qFm dduevGUcbKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAvQAKCRCPgPtYfRL+ TvjECACLPZyeomhDC7xZl5XOHtPC+c3zUQ5tm5iOJV+yJpU3o/O7G2buptLMqescHFYUOf+Mlh3 efPFK1EzGUNuWXih8J1nzUHJGu6uf9ez8ADj9b/2hTdCxhWuta3FC4wOc8CspnC0hmlncx/7Dv4 kNbFwBBFq4Bw4n/i8q9KLTHRigVNSHJE48owIM4rgFZzwriMD9m4F0xvjn/GXm/gEOvgZHw8LSl 0G5+/nhWYKYrPiiPlZ+b7l/pc4qR3raEKpH///acpfnWXM+I2YyXSchPiA38c4BmZx35UhWE95g 0OIT8nGXgEdC4/nSO/1lnZRc7fTlfeGoFxgmZpNmw9NrHmql
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On today's platforms the memory savings of putting the remove function
in .exit isn't that relevant any more. It only matters for built-in
drivers and typically saves a few 100k.

The downside is that the driver cannot be unbound at runtime which is
ancient and also slightly complicates testing. Also it requires to mark
the driver struct with __refdata which is needed to suppress a (W=1)
modpost warning:

	WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410: section mismatch in reference: tfp410_driver+0x4 (section: .data) -> tfp410_remove (section: .exit.text)

To simplify matters, move the remove callback to .text and drop
.suppress_bind_attrs = true.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
index dd29dc5c77ec..866d71489358 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
@@ -231,7 +231,7 @@ static int opa362_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int __exit opa362_remove(struct platform_device *pdev)
+static int opa362_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -260,11 +260,10 @@ MODULE_DEVICE_TABLE(of, opa362_of_match);
 
 static struct platform_driver opa362_driver = {
 	.probe	= opa362_probe,
-	.remove	= __exit_p(opa362_remove),
+	.remove	= opa362_remove,
 	.driver	= {
 		.name	= "amplifier-opa362",
 		.of_match_table = opa362_of_match,
-		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.42.0

