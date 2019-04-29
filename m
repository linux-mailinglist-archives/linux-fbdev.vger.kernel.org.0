Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA961E660
	for <lists+linux-fbdev@lfdr.de>; Mon, 29 Apr 2019 17:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbfD2P3W (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 29 Apr 2019 11:29:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36047 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbfD2P3W (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 29 Apr 2019 11:29:22 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <l.stach@pengutronix.de>)
        id 1hL8DX-0005f3-F3; Mon, 29 Apr 2019 17:29:19 +0200
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH] backlight: rave-sp: don't touch initial state and register with correct device
Date:   Mon, 29 Apr 2019 17:29:19 +0200
Message-Id: <20190429152919.27277-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This way the backlight can be referenced through its device node and
enabling/disabling can be managed through the panel driver.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/video/backlight/rave-sp-backlight.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/backlight/rave-sp-backlight.c b/drivers/video/backlight/rave-sp-backlight.c
index 462f14a1b19d..d296bfcf4396 100644
--- a/drivers/video/backlight/rave-sp-backlight.c
+++ b/drivers/video/backlight/rave-sp-backlight.c
@@ -48,15 +48,13 @@ static int rave_sp_backlight_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct backlight_device *bd;
 
-	bd = devm_backlight_device_register(dev, pdev->name, dev->parent,
+	bd = devm_backlight_device_register(dev, pdev->name, dev,
 					    dev_get_drvdata(dev->parent),
 					    &rave_sp_backlight_ops,
 					    &rave_sp_backlight_props);
 	if (IS_ERR(bd))
 		return PTR_ERR(bd);
 
-	backlight_update_status(bd);
-
 	return 0;
 }
 
-- 
2.20.1

