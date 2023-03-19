Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED7E6BFD7B
	for <lists+linux-fbdev@lfdr.de>; Sun, 19 Mar 2023 00:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCRXyq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Mar 2023 19:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRXyp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Mar 2023 19:54:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5177119699
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Mar 2023 16:54:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNl-00041e-LA; Sun, 19 Mar 2023 00:54:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNk-0056ZQ-Vp; Sun, 19 Mar 2023 00:54:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdgNk-005zTh-Bh; Sun, 19 Mar 2023 00:54:40 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jaya Kumar <jayalk@intworks.biz>, Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
Subject: [PATCH 02/51] video: fbdev: arcfb: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 00:53:39 +0100
Message-Id: <20230318235428.272091-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=khEvERgJEkssw4rj4oBb73Nu59F45R+4z26OZ36GvRc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxvxW+6Ukf+DkN6n47/tF76COyivtyfdxElUt85cm/g /onmF7vZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BeAirez/YzZYWn9Tu3SqdU3s 6596XEb/Qo+FLcoXn6e3pPPUvEjXV79qLL99Kww/dL5L9GrrKoHChC6vE3/Et8W9vPP6d/zGxvO bqlNPqSqbeN4R+VmtK7alXb3Xs7zi7Km3/SqC8r5+B5e8c2Zgvxy93Wv6noPmn5IDK5XbfxosKS 6VKhfUW5lqse6nk4Ty2rcXvbxfsK76c2jqXs8J3rYLlsiW2Jw4qPtnOf/a/SEzI5rStN4xO1tNd XQKPcLgfGOB+UUXL9/1Skf7khQ17S2NhHen17HZhk4vUkwtWVWVpnyp3ZTl8y75xSwHbnVIMByK LboRvzIv5+WH2hvzAoIfNH8QFmR24NAzUj1S3NKf7wsA
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
 drivers/video/fbdev/arcfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 45e64016db32..7db593b78334 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -587,7 +587,7 @@ static int arcfb_probe(struct platform_device *dev)
 	return retval;
 }
 
-static int arcfb_remove(struct platform_device *dev)
+static void arcfb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
 
@@ -598,12 +598,11 @@ static int arcfb_remove(struct platform_device *dev)
 		vfree((void __force *)info->screen_base);
 		framebuffer_release(info);
 	}
-	return 0;
 }
 
 static struct platform_driver arcfb_driver = {
 	.probe	= arcfb_probe,
-	.remove = arcfb_remove,
+	.remove_new = arcfb_remove,
 	.driver	= {
 		.name	= "arcfb",
 	},
-- 
2.39.2

