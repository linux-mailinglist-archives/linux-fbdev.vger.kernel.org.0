Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00D5175845
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Mar 2020 11:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgCBKZJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Mar 2020 05:25:09 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37616 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgCBKZI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Mar 2020 05:25:08 -0500
Received: by mail-lf1-f67.google.com with SMTP id j11so4157574lfg.4
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Mar 2020 02:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=892FcJS8S4Vn2JAxkKJV5fGwZMrhX4YJJCVmMHjxvOs=;
        b=TLT+b5AV5DbyjBjDrxuq+fALZIEdert1enYAHqnWCOYc2T+g9wfbGbZSKABXoOofHZ
         KlbhDpPK5H65TOk3ZCeoUl1wuQ/els8sH82mAm1ZzXnk9NjASq/kspesy11fjhjvFHTM
         l/RQiF/v92Hfvz6o9r/Kq40/wY90NJrQrA2A2hDDV1G/qO3X10o0AclIKiWHIjSguMyo
         g8bSfiq8QPr4yLqPkwhh/xTABC1c3OuPwo7WcD9D0mPt1H5VkEag59yZei/4mFXEkixe
         81z68N/9xwUhbQcDWTSaJPsqs2nvQOkZ7xtOZQCXj/jwVl0R2v86Hic+Sq9zB1RHtUeu
         WSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=892FcJS8S4Vn2JAxkKJV5fGwZMrhX4YJJCVmMHjxvOs=;
        b=tMK5Mx36euGHHvQ5set4pmS2jLCjAb220k2/amXnmJAbJi9Lgq/QfeMDq1RY2V1MXu
         kixfbEcfjcLZyF3kyosG3xbA7Ltg4eG0SsqldNNL8lD8dvsb5lqt1yVda2Gz85SFxrVc
         n1PHqUGmhlX+ZXIR083W7z0bYSYc9OCD4woKDoyFdmjxDLXyWn5kMtS5d8T9Cobxu9rt
         0T+QZvXgxNQasBpf7nnzk8ORobs4vQZero30LztYteoc2ykXZ6YOU2xnWz2sRUs3exJl
         DsRw5b155zNf+e01nMS1t0C4tcbBPQqgQjK4hh/qde/lbTsDkYUJz8CIjllsUFgJPAgE
         UyYA==
X-Gm-Message-State: ANhLgQ1NcrB44LXAsZfS5viQ8ZTTdfwFMZLa4NoPFHA8Ocvhhbr24KFS
        hp/4AyDgkv6DNGuhCSnNfJfWybtPs60=
X-Google-Smtp-Source: ADFU+vsm7dEsfShgF48A9yqTp2CguWfdPY2+QNtZA4Pqx/fnp3AdWRMHOCgUaj9Egi+gnnWpeA/AHQ==
X-Received: by 2002:a19:8c12:: with SMTP id o18mr10329324lfd.145.1583144704995;
        Mon, 02 Mar 2020 02:25:04 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id s17sm12840320ljo.18.2020.03.02.02.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 02:25:04 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] ARM/fbdev: sa11x0: Switch to use GPIO descriptors
Date:   Mon,  2 Mar 2020 11:22:58 +0100
Message-Id: <20200302102258.351197-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Rename the GPIO line to "shannon-lcden" as this GPIO
  line has semantics that are particular to the Shannon
  platform.
---
 arch/arm/mach-sa1100/shannon.c |  9 +++++++++
 drivers/video/fbdev/sa1100fb.c | 20 +++++++++-----------
 drivers/video/fbdev/sa1100fb.h |  3 +++
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-sa1100/shannon.c b/arch/arm/mach-sa1100/shannon.c
index 5bc82e2671c6..351f891b4842 100644
--- a/arch/arm/mach-sa1100/shannon.c
+++ b/arch/arm/mach-sa1100/shannon.c
@@ -104,6 +104,14 @@ static struct fixed_voltage_config shannon_cf_vcc_pdata __initdata = {
 	.enabled_at_boot = 1,
 };
 
+static struct gpiod_lookup_table shannon_display_gpio_table = {
+	.dev_id = "sa11x0-fb",
+	.table = {
+		GPIO_LOOKUP("gpio", 22, "shannon-lcden", GPIO_ACTIVE_HIGH),
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
index 5bb653db0cec..065cdbfa7aa4 100644
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
+	if (fbi->shannon_lcden)
+		gpiod_set_value(fbi->shannon_lcden, 1);
 
 	dev_dbg(fbi->dev, "DBAR1: 0x%08x\n", readl_relaxed(fbi->base + DBAR1));
 	dev_dbg(fbi->dev, "DBAR2: 0x%08x\n", readl_relaxed(fbi->base + DBAR2));
@@ -817,8 +817,8 @@ static void sa1100fb_disable_controller(struct sa1100fb_info *fbi)
 
 	dev_dbg(fbi->dev, "Disabling LCD controller\n");
 
-	if (machine_is_shannon())
-		gpio_set_value(SHANNON_GPIO_DISP_EN, 0);
+	if (fbi->shannon_lcden)
+		gpiod_set_value(fbi->shannon_lcden, 0);
 
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
+	fbi->shannon_lcden = gpiod_get_optional(&pdev->dev, "shannon-lcden",
+						GPIOD_OUT_LOW);
+	if (IS_ERR(fbi->shannon_lcden))
+		return PTR_ERR(fbi->shannon_lcden);
 
 	/* Initialize video memory */
 	ret = sa1100fb_map_video_memory(fbi);
diff --git a/drivers/video/fbdev/sa1100fb.h b/drivers/video/fbdev/sa1100fb.h
index d0aa33b0b88a..b4363444fa5d 100644
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
+	struct gpio_desc	*shannon_lcden;
 
 	/*
 	 * These are the addresses we mapped
-- 
2.24.1

