Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 215B57E377F
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Nov 2023 10:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbjKGJUl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Nov 2023 04:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbjKGJUc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Nov 2023 04:20:32 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236D5D7D
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Nov 2023 01:20:30 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG3-0000Or-3K; Tue, 07 Nov 2023 10:20:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG2-007FmG-IT; Tue, 07 Nov 2023 10:20:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG2-00ENWu-9L; Tue, 07 Nov 2023 10:20:26 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Atul Raut <rauji.raut@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 12/22] fb: amifb: Convert to platform remove callback returning void
Date:   Tue,  7 Nov 2023 10:17:53 +0100
Message-ID: <20231107091740.3924258-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LBrHk7l/sRzpT17sNdGsTjRIKe97lngNxP0AN4wUMRA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgDCS2rN+KI+7vqLW4uiMwg40fkTfk87P0Luv v4WpuAz2HqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAwgAKCRCPgPtYfRL+ TteCB/kBUZQ4MTFblNL0O0JCsu+Tau4uDAI/yiUtqy71MQYA8Tb892NzRk9ubqkq4NwgtV3jx/Z lskA5802bwg/5ZoEeUMS/ursiDR7LPmyQPgAC71Dpy3CC7xjv6LM9u5mrJfI9bCGT5GtwiYUIdF 6bSx60oTcHlSMXvvy3Knmw0au3ir7LBIiReAN4PNOCIVg12XneKq2S1DCgvKjHzyBn0uHobBv7n KQR+zvZ/aLJuEFWQvthihfHhLmPJ6CCgl/mxoNK02RM+apJYCqJEmL0ZcHt6+wRFv6o7I/BvoHX VUrZsVMYLCSKsZXIoFVKKzTBzPiDg90L4aqd34nHgwNTrFWd
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
 drivers/video/fbdev/amifb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 85da43034166..8ff5d0e0b6e9 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3752,7 +3752,7 @@ static int amifb_probe(struct platform_device *pdev)
 }
 
 
-static int amifb_remove(struct platform_device *pdev)
+static void amifb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
@@ -3765,12 +3765,11 @@ static int amifb_remove(struct platform_device *pdev)
 	chipfree();
 	framebuffer_release(info);
 	amifb_video_off();
-	return 0;
 }
 
 static struct platform_driver amifb_driver = {
 	.probe = amifb_probe,
-	.remove = amifb_remove,
+	.remove_new = amifb_remove,
 	.driver = {
 		.name	= "amiga-video",
 	},
-- 
2.42.0

