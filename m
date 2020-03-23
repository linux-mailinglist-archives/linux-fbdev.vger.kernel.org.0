Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D526190026
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Mar 2020 22:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgCWVQq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 23 Mar 2020 17:16:46 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34115 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgCWVQq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 23 Mar 2020 17:16:46 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jGUR6-0004GR-5B; Mon, 23 Mar 2020 22:16:40 +0100
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jGUR3-0006TG-DH; Mon, 23 Mar 2020 22:16:37 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: imxfb: ensure balanced regulator usage
Date:   Mon, 23 Mar 2020 22:16:26 +0100
Message-Id: <20200323211626.24812-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The fbdev framework doesn't care to call the .set_power callback only on
changes. So the driver has to care for itself that the regulator doesn't
get disabled more often than enabled.

This fixes the regulator warning

	unbalanced disables for lcd supply

which can be triggered by doing

	echo 4 > /sys/class/lcd/imxfb-lcd/lcd_power

twice.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/imxfb.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 370bf2553d43..884b16efa7e8 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -172,6 +172,7 @@ struct imxfb_info {
 	int			num_modes;
 
 	struct regulator	*lcd_pwr;
+	int			lcd_pwr_enabled;
 };
 
 static const struct platform_device_id imxfb_devtype[] = {
@@ -801,16 +802,30 @@ static int imxfb_lcd_get_power(struct lcd_device *lcddev)
 	return FB_BLANK_UNBLANK;
 }
 
+static int imxfb_regulator_set(struct imxfb_info *fbi, int enable)
+{
+	int ret;
+
+	if (enable == fbi->lcd_pwr_enabled)
+		return 0;
+
+	if (enable)
+		ret = regulator_enable(fbi->lcd_pwr);
+	else
+		ret = regulator_disable(fbi->lcd_pwr);
+
+	if (ret == 0)
+		fbi->lcd_pwr_enabled = enable;
+
+	return ret;
+}
+
 static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
 {
 	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
 
-	if (!IS_ERR(fbi->lcd_pwr)) {
-		if (power == FB_BLANK_UNBLANK)
-			return regulator_enable(fbi->lcd_pwr);
-		else
-			return regulator_disable(fbi->lcd_pwr);
-	}
+	if (!IS_ERR(fbi->lcd_pwr))
+		return imxfb_regulator_set(fbi, power == FB_BLANK_UNBLANK);
 
 	return 0;
 }
-- 
2.25.1

