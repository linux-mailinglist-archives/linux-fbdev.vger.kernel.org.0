Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7813462F712
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Nov 2022 15:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242249AbiKROTV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Nov 2022 09:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242287AbiKROTR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Nov 2022 09:19:17 -0500
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD60AF21;
        Fri, 18 Nov 2022 06:19:14 -0800 (PST)
Received: from localhost.localdomain ([172.16.0.254])
        (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 2AIEGVXC002760-2AIEGVXF002760
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Nov 2022 22:16:36 +0800
From:   Dongliang Mu <dzm91@hust.edu.cn>
To:     Helge Deller <deller@gmx.de>, Dongliang Mu <dzm91@hust.edu.cn>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: da8xx-fb: add missing regulator_disable() in fb_probe
Date:   Fri, 18 Nov 2022 22:14:06 +0800
Message-Id: <20221118141431.3005015-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The error handling code in fb_probe misses regulator_disable if
regulator_enable is called successfully. The previous commit only
adds regulator_disable in the .remove(), forgetting the error
handling code in the .probe.

Fix this by adding a new error label to call regulator_disable.

Fixes: 611097d5daea("fbdev: da8xx: add support for a regulator")
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/video/fbdev/da8xx-fb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 11922b009ed7..cd07e401b326 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1431,7 +1431,7 @@ static int fb_probe(struct platform_device *device)
 		dev_err(&device->dev,
 			"GLCD: kmalloc for frame buffer failed\n");
 		ret = -EINVAL;
-		goto err_release_fb;
+		goto err_disable_reg;
 	}
 
 	da8xx_fb_info->screen_base = (char __iomem *) par->vram_virt;
@@ -1475,7 +1475,7 @@ static int fb_probe(struct platform_device *device)
 
 	ret = fb_alloc_cmap(&da8xx_fb_info->cmap, PALETTE_SIZE, 0);
 	if (ret)
-		goto err_release_fb;
+		goto err_disable_reg;
 	da8xx_fb_info->cmap.len = par->palette_sz;
 
 	/* initialize var_screeninfo */
@@ -1529,6 +1529,9 @@ static int fb_probe(struct platform_device *device)
 err_dealloc_cmap:
 	fb_dealloc_cmap(&da8xx_fb_info->cmap);
 
+err_disable_reg:
+	if (par->lcd_supply)
+		regulator_disable(par->lcd_supply);
 err_release_fb:
 	framebuffer_release(da8xx_fb_info);
 
-- 
2.35.1

