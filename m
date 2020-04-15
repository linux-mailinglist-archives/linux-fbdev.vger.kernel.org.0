Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913EA1AAECE
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Apr 2020 18:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410505AbgDOQxF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 15 Apr 2020 12:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410499AbgDOQxB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 15 Apr 2020 12:53:01 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82049C061A0C
        for <linux-fbdev@vger.kernel.org>; Wed, 15 Apr 2020 09:53:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m8so4507855lji.1
        for <linux-fbdev@vger.kernel.org>; Wed, 15 Apr 2020 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3n1NbqDTv3TDFJsp8RAhjgCcmdyVmO+DIXy7Ax4C+70=;
        b=yZln0JxF0JkhlYWZDCcx3d5UL9x+yG3efwj80GQxenRq8R8lVn7bnQBt9qjzvR2zo3
         brAZ6h4GlRoiYvAltQo898Ojznxb7IBAXDDui5SDKQ7w09X14tHPzce/0On/NPFV1Qpb
         b642EUOuttE8TL22DZjnkhT5MgSb31fLtlJULb76PTUffnslA5mg0RZVBXt0D/nPhnGB
         ZXTGcoO2iU5yHh8W9wevvAKh9VAFuAWUg3JdnW5QnTUCS40V7RSIEl5FUduh3oz1g6HH
         hR4aTctYYmxHndCm++5yebclcFS/1tvKU9WhFJkc7eZydVbp3oedZCEVfbJx2Mxg1QaY
         DnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3n1NbqDTv3TDFJsp8RAhjgCcmdyVmO+DIXy7Ax4C+70=;
        b=prLtdsfL0xtFbrmGPOmMMUSvqi6C6ZFenYCsOT/oT69Bceq2/r/gWTGZ+xglp2BtyM
         Zj7BiloDkuMmnfkYkljLFA7mGSY4VumTTmyQ/LoY7Bh0c/Mf5FGEhqfBBw128iJ/vAwi
         zZdinFn5abRVkxhZ14G9peJTHeI6w0QWAh31OI7DpNBBehmWJZ2utdZctYJs85+TmRCp
         UqJPRffDvR+Wx/EQid6aSqFVJOEDSAVOrO5njuVmj+6cNGPrhbaFhcWrNEcVoeQKCjZZ
         zWZ3sR+fw6rVKQidawVCEv0R2MItS1jaV1GhJnd7oscCLMMSZKyHIW7FU3pYQ/0PX0k1
         gQWA==
X-Gm-Message-State: AGi0PuY1V+cH5dQqVdoYlDYg9Cmib17jnykn6e8DjpYT8hrBgjBS2brz
        V19MeQUos2hcGN8JjevG0ty82g==
X-Google-Smtp-Source: APiQypJKPntrSwFLddEDg1hoKUt5edawERaDp4sJ0jqy3+9EG/2i2g3Q+9ybx0fsWo0POvTTADreVQ==
X-Received: by 2002:a2e:4942:: with SMTP id b2mr3974129ljd.135.1586969578959;
        Wed, 15 Apr 2020 09:52:58 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id e186sm13146959lfd.83.2020.04.15.09.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:52:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 RESEND] ARM/fbdev: sa11x0: Switch to use GPIO descriptors
Date:   Wed, 15 Apr 2020 18:50:55 +0200
Message-Id: <20200415165055.193113-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
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
index 2d285cc384cf..3e6e13f7a831 100644
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
2.25.2

