Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51665174817
	for <lists+linux-fbdev@lfdr.de>; Sat, 29 Feb 2020 17:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgB2Qgw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 29 Feb 2020 11:36:52 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32956 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgB2Qgw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 29 Feb 2020 11:36:52 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so6878616lji.0
        for <linux-fbdev@vger.kernel.org>; Sat, 29 Feb 2020 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKV7NPKD+Ch81IqjSrRGCVDwaUcEo7AiWRKMOW2+aLg=;
        b=Zu478Hc0EOhIdAbSdtWW7u3gn+wtXrP6fc8m6G4rsMrvyA24DH3J/bwHCcL9TaXt72
         u3j/ZMiWV5YEtxec3FDIm2g4rLEyo00kvIAfAJz0A7sXEsnaJGMQ+p3Mo5Gy5FdHYBUX
         4HVvzEkfyH/Y6Ob13QTz3qfnteh05LvoqwNPBiLwCzayMZRThx0rxry193JRXLO5DobE
         O6y17LVBSWdj5Fckx3qnwsTg5z1GnEfACjGzqq0cUX6+bQXE9Rlxan0kWWnN4iQ3AdKV
         IpxtW5dE0qHVjYmEfPZMLW7kmat4+lvEcg/XF8TdPuI/oG311LRRCQo0gd0Mg9UlpGcj
         3wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKV7NPKD+Ch81IqjSrRGCVDwaUcEo7AiWRKMOW2+aLg=;
        b=SF1kD3xdcQTBAZW51wySB32CZiwiqgq1w8XM/va37WGlwHik4yvQG01/AwEfpYMm2d
         7aBozP9iGegb2inCY7YZOW0U9ByyLS5ohHaVB/q1yXR5XUTm5is82HQ3Iw9riA0M/nuz
         V6iUmmi86amhlUx6wFTj1dKX++gBihwiCcXL1Lo7YA4LB3wRCh7XYrJ6aoAzJliENMdV
         r4mUbXWx0YEx52rRaLBp2eH0F2UZbJNxcwx2GMUPPL9JUEvIHZhSdqcmKzgGh3M7g+yy
         Y81AsOMFQKiGoki8th87vzI9fNbwdIGA7+Fgrd7bKGlCPImQQAzPn8Rqmb+owF89J2j6
         ntIQ==
X-Gm-Message-State: ANhLgQ18puw4xdRtCN30sEFity0yCnXboteiziqFqlFzaf57Nxy4h/Cw
        gzA54NVpQB1Z8s3ru2pvlz3aQQ==
X-Google-Smtp-Source: ADFU+vvXTk+eW2FtLSEaPQBg+MOVgGCCN5OEMInpSCH37K5WvoDeQPvR5vuiM7oQDHpTISIRGElydw==
X-Received: by 2002:a2e:9592:: with SMTP id w18mr6319453ljh.98.1582994209597;
        Sat, 29 Feb 2020 08:36:49 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id o7sm8551938ljp.95.2020.02.29.08.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 08:36:48 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM/fbdev: sa11x0: Switch to use GPIO descriptors
Date:   Sat, 29 Feb 2020 17:34:41 +0100
Message-Id: <20200229163441.90639-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This converts the SA11x0 frame buffer driver to use
GPIO descriptors. Get the GPIO optional and register
a look-up table specifically for the Shannon machine.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-sa1100/shannon.c |  9 +++++++++
 drivers/video/fbdev/sa1100fb.c | 20 +++++++++-----------
 drivers/video/fbdev/sa1100fb.h |  3 +++
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-sa1100/shannon.c b/arch/arm/mach-sa1100/shannon.c
index 5bc82e2671c6..f1f825ed0b3a 100644
--- a/arch/arm/mach-sa1100/shannon.c
+++ b/arch/arm/mach-sa1100/shannon.c
@@ -104,6 +104,14 @@ static struct fixed_voltage_config shannon_cf_vcc_pdata __initdata = {
 	.enabled_at_boot = 1,
 };
 
+static struct gpiod_lookup_table shannon_display_gpio_table = {
+	.dev_id = "sa11x0-fb",
+	.table = {
+		GPIO_LOOKUP("gpio", 22, "enable", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init shannon_init(void)
 {
 	sa11x0_register_fixed_regulator(0, &shannon_cf_vcc_pdata,
@@ -113,6 +121,7 @@ static void __init shannon_init(void)
 	sa11x0_register_pcmcia(0, &shannon_pcmcia0_gpio_table);
 	sa11x0_register_pcmcia(1, &shannon_pcmcia1_gpio_table);
 	sa11x0_ppc_configure_mcp();
+	gpiod_add_lookup_table(&shannon_display_gpio_table);
 	sa11x0_register_lcd(&shannon_lcd_info);
 	sa11x0_register_mtd(&shannon_flash_data, &shannon_flash_resource, 1);
 	sa11x0_register_mcp(&shannon_mcp_data);
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index 5bb653db0cec..cdea3b31a54f 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -173,7 +173,7 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/cpufreq.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/mutex.h>
@@ -799,8 +799,8 @@ static void sa1100fb_enable_controller(struct sa1100fb_info *fbi)
 	writel_relaxed(fbi->dbar2, fbi->base + DBAR2);
 	writel_relaxed(fbi->reg_lccr0 | LCCR0_LEN, fbi->base + LCCR0);
 
-	if (machine_is_shannon())
-		gpio_set_value(SHANNON_GPIO_DISP_EN, 1);
+	if (fbi->enable)
+		gpiod_set_value(fbi->enable, 1);
 
 	dev_dbg(fbi->dev, "DBAR1: 0x%08x\n", readl_relaxed(fbi->base + DBAR1));
 	dev_dbg(fbi->dev, "DBAR2: 0x%08x\n", readl_relaxed(fbi->base + DBAR2));
@@ -817,8 +817,8 @@ static void sa1100fb_disable_controller(struct sa1100fb_info *fbi)
 
 	dev_dbg(fbi->dev, "Disabling LCD controller\n");
 
-	if (machine_is_shannon())
-		gpio_set_value(SHANNON_GPIO_DISP_EN, 0);
+	if (fbi->enable)
+		gpiod_set_value(fbi->enable, 0);
 
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	add_wait_queue(&fbi->ctrlr_wait, &wait);
@@ -1173,12 +1173,10 @@ static int sa1100fb_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (machine_is_shannon()) {
-		ret = devm_gpio_request_one(&pdev->dev, SHANNON_GPIO_DISP_EN,
-			GPIOF_OUT_INIT_LOW, "display enable");
-		if (ret)
-			return ret;
-	}
+	fbi->enable = gpiod_get_optional(&pdev->dev, "enable",
+					 GPIOD_OUT_LOW);
+	if (IS_ERR(fbi->enable))
+		return PTR_ERR(fbi->enable);
 
 	/* Initialize video memory */
 	ret = sa1100fb_map_video_memory(fbi);
diff --git a/drivers/video/fbdev/sa1100fb.h b/drivers/video/fbdev/sa1100fb.h
index d0aa33b0b88a..9711bbcd6e99 100644
--- a/drivers/video/fbdev/sa1100fb.h
+++ b/drivers/video/fbdev/sa1100fb.h
@@ -10,6 +10,8 @@
  * for more details.
  */
 
+struct gpio_desc;
+
 #define LCCR0           0x0000          /* LCD Control Reg. 0 */
 #define LCSR            0x0004          /* LCD Status Reg. */
 #define DBAR1           0x0010          /* LCD DMA Base Address Reg. channel 1 */
@@ -33,6 +35,7 @@ struct sa1100fb_info {
 	struct device		*dev;
 	const struct sa1100fb_rgb *rgb[NR_RGB];
 	void __iomem		*base;
+	struct gpio_desc	*enable;
 
 	/*
 	 * These are the addresses we mapped
-- 
2.24.1

