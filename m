Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40570579535
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Jul 2022 10:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiGSI0W (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Jul 2022 04:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbiGSI0T (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Jul 2022 04:26:19 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC378B1DF
        for <linux-fbdev@vger.kernel.org>; Tue, 19 Jul 2022 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=taUF6
        l7V+UeJySwvC+OdyXLBLpx76CPkyiOEfCj7O2k=; b=ZS9sskyIdWcF6smAAdaKD
        rmCC1ofUJIrXlE7FOhvMvi5WVD4imb31sEqpfEeYtb0iS3VBEj40JFWY8Q8JoF60
        j3x6xgEvFOZf5dx2dC09GExorbjtgnRsOX8tsd5dL50aGWpu+0TZFYElkD1yNyQM
        KO+XZtJetcjywCACsif1lw=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowAC3+_qQatZiYiEgFQ--.14447S2;
        Tue, 19 Jul 2022 16:25:52 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     linux@armlinux.org.uk, deller@gmx.de, linux-fbdev@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] video: fbdev: amba-clcd: Fix refcount leak bugs
Date:   Tue, 19 Jul 2022 16:25:46 +0800
Message-Id: <20220719082546.1209627-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAC3+_qQatZiYiEgFQ--.14447S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ary8KFW3XryfuFWkGF18Grg_yoW8Zry7pF
        45KFWa9ry5JF17Gw12yF1DZFsYya1I9FW2kFy7K3sYkFnxAws5Zr1UKF909FZ5ZFykJa4Y
        grsrta1Yva4UurDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5uciUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhFDF18RPhVYIgAAsU
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In clcdfb_of_init_display(), we should call of_node_put() for the
references returned by of_graph_get_next_endpoint() and
of_graph_get_remote_port_parent() which have increased the refcount.

Besides, we should call of_node_put() both in fail path or when
the references are not used anymore.

Fixes: d10715be03bd ("video: ARM CLCD: Add DT support")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/video/fbdev/amba-clcd.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 8080116aea84..f65c96d1394d 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -698,16 +698,18 @@ static int clcdfb_of_init_display(struct clcd_fb *fb)
 		return -ENODEV;
 
 	panel = of_graph_get_remote_port_parent(endpoint);
-	if (!panel)
-		return -ENODEV;
+	if (!panel) {
+		err = -ENODEV;
+		goto out_endpoint_put;
+	}
 
 	err = clcdfb_of_get_backlight(&fb->dev->dev, fb->panel);
 	if (err)
-		return err;
+		goto out_panel_put;
 
 	err = clcdfb_of_get_mode(&fb->dev->dev, panel, fb->panel);
 	if (err)
-		return err;
+		goto out_panel_put;
 
 	err = of_property_read_u32(fb->dev->dev.of_node, "max-memory-bandwidth",
 			&max_bandwidth);
@@ -736,11 +738,21 @@ static int clcdfb_of_init_display(struct clcd_fb *fb)
 
 	if (of_property_read_u32_array(endpoint,
 			"arm,pl11x,tft-r0g0b0-pads",
-			tft_r0b0g0, ARRAY_SIZE(tft_r0b0g0)) != 0)
-		return -ENOENT;
+			tft_r0b0g0, ARRAY_SIZE(tft_r0b0g0)) != 0) {
+		err = -ENOENT;
+		goto out_panel_put;
+	}
+
+	of_node_put(panel);
+	of_node_put(endpoint);
 
 	return clcdfb_of_init_tft_panel(fb, tft_r0b0g0[0],
 					tft_r0b0g0[1],  tft_r0b0g0[2]);
+out_panel_put:
+	of_node_put(panel);
+out_endpoint_put:
+	of_node_put(endpoint);
+	return err;
 }
 
 static int clcdfb_of_vram_setup(struct clcd_fb *fb)
-- 
2.25.1

