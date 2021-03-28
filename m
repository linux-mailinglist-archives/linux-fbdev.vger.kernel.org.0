Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E4D34BCE0
	for <lists+linux-fbdev@lfdr.de>; Sun, 28 Mar 2021 17:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhC1PYp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 28 Mar 2021 11:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhC1PY3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 28 Mar 2021 11:24:29 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39966C061756;
        Sun, 28 Mar 2021 08:24:28 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t20so3202865plr.13;
        Sun, 28 Mar 2021 08:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bcFi1iGmwKHNoPhG76n+6y15gxw1bFR2T0H0Ryydu4g=;
        b=cS+oJEWoKDFrHeBwzi8cuZDmnY2J6PKxEgjMPSLfLCovaqRVfg/RlLYvLabnfIxZtd
         JG9pyy+CufFMBmxXM7bMY0NdGv7QbdNW+zDxrGpvZpzjBxes57qstKv96AczvacJCfr4
         FHHHRS4rTb3gMxzI1keklb44RsSORDWJh/1CfFakUI+MNgtqfviddMuMMPR2/iRwbz98
         OEiwoZjP6UJTE5A2DHKX9es2RTVm76nt5XvF/uoQyNzyT++2JOgSN79GC139bqV+/49m
         ZPRMZxv6/PqbLBZZT/fC5hMhC4Wt5wTvXuWF5MC6z5QTFppN0cB1XtTxdXx6L+A7wTkk
         zoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bcFi1iGmwKHNoPhG76n+6y15gxw1bFR2T0H0Ryydu4g=;
        b=MUMkyjoyE9xoh22aE5GFOxmG1Q1z3xZ9/iP+6WHtUWZJ9F6D8DPn9zQD3RbR7hWpfI
         hdSJUNKw2A1HMRON1ZRbIF85kIJ7Kzd+4JA/Q4VFmAXkEKDkD60G/1973Cqb/IBEDq8e
         9PICZEZF7Ahd47O50n5KxTDrg3nYLkgEpi3HdbObbW5MLQDfQv/Dyyn3kCkxhM53DLGR
         8putbEMPl2NmrgWAQ5/FjgLzW89UWIdHVbKT0HCkYkacYCtiMd304+2zWEMKqRpVf2kd
         00ePzzVrTAk1HNQQ4Z8steuuzw4NB7FQAXKed+o3iY0zUw6r8mRB/653K67kgwQzfnEA
         myXw==
X-Gm-Message-State: AOAM531qBS8cM9/xd8ZZnf2MBj0kcJzR3Dvi+tbmssyWrQJDTCAC40NC
        tnqhzqm4YBR10j2TNTn2OzA=
X-Google-Smtp-Source: ABdhPJzXLhCwJ8T+0fxwcBGD30FMrxrK3LLyg8zFFPCLzqrzoXwIk6aZzVTX4GZhNREvwe7MChb+fw==
X-Received: by 2002:a17:90a:9903:: with SMTP id b3mr22663191pjp.59.1616945067526;
        Sun, 28 Mar 2021 08:24:27 -0700 (PDT)
Received: from localhost.localdomain (1-171-1-114.dynamic-ip.hinet.net. [1.171.1.114])
        by smtp.gmail.com with ESMTPSA id j188sm14651174pfd.64.2021.03.28.08.24.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Mar 2021 08:24:26 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH v6 1/4] mfd: rt4831: Adds support for Richtek RT4831
Date:   Sun, 28 Mar 2021 23:24:16 +0800
Message-Id: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

This adds support Richtek RT4831 core. It includes four channel WLED driver
and Display Bias Voltage outputs.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
The RT4831 regulator patches are already on main stream, and can be referred to
9351ab8b0cb6 regulator: rt4831: Adds support for Richtek RT4831 DSV regulator
934b05e81862 regulator: rt4831: Adds DT binding document for Richtek RT4831 DSV regulator

since v6
- Respin the date from 2020 to 2021.
- Rmove the shutdown routine.
- Change the macro OF_MFD_CELL to MFD_CELL_OF.


since v5
- Rename file name from rt4831-core.c to rt4831.c
- Change RICHTEK_VID to RICHTEK_VENDOR_ID.
- Change gpio_desc nameing from 'enable' to 'enable_gpio' in probe.
- Change variable 'val' to the meaningful name 'chip_id'.
- Refine the error log when vendor id is not matched.
- Remove of_match_ptr.

since v2
- Refine Kconfig descriptions.
- Add copyright.
- Refine error logs in probe.
- Refine comment lines in remove and shutdown.
---
 drivers/mfd/Kconfig  |  10 +++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/rt4831.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/mfd/rt4831.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index b74efa4..3f43834 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1065,6 +1065,16 @@ config MFD_RDC321X
 	  southbridge which provides access to GPIOs and Watchdog using the
 	  southbridge PCI device configuration space.
 
+config MFD_RT4831
+	tristate "Richtek RT4831 four channel WLED and Display Bias Voltage"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  This enables support for the Richtek RT4831 that includes 4 channel
+	  WLED driving and Display Bias Voltage. It's commonly used to provide
+	  power to the LCD display and LCD backlight.
+
 config MFD_RT5033
 	tristate "Richtek RT5033 Power Management IC"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 834f546..5986914 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -235,6 +235,7 @@ obj-$(CONFIG_MFD_MENF21BMC)	+= menf21bmc.o
 obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
 obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
+obj-$(CONFIG_MFD_RT4831)	+= rt4831.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
 
diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
new file mode 100644
index 00000000..b169781
--- /dev/null
+++ b/drivers/mfd/rt4831.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021 Richtek Technology Corp.
+ *
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define RT4831_REG_REVISION	0x01
+#define RT4831_REG_ENABLE	0x08
+#define RT4831_REG_I2CPROT	0x15
+
+#define RICHTEK_VENDOR_ID	0x03
+#define RT4831_VID_MASK		GENMASK(1, 0)
+#define RT4831_RESET_MASK	BIT(7)
+#define RT4831_I2CSAFETMR_MASK	BIT(0)
+
+static const struct mfd_cell rt4831_subdevs[] = {
+	MFD_CELL_OF("rt4831-backlight", NULL, NULL, 0, 0, "richtek,rt4831-backlight"),
+	MFD_CELL_NAME("rt4831-regulator")
+};
+
+static bool rt4831_is_accessible_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= RT4831_REG_REVISION && reg <= RT4831_REG_I2CPROT)
+		return true;
+	return false;
+}
+
+static const struct regmap_config rt4831_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RT4831_REG_I2CPROT,
+
+	.readable_reg = rt4831_is_accessible_reg,
+	.writeable_reg = rt4831_is_accessible_reg,
+};
+
+static int rt4831_probe(struct i2c_client *client)
+{
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+	unsigned int chip_id;
+	int ret;
+
+	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(enable_gpio)) {
+		dev_err(&client->dev, "Failed to get 'enable' GPIO\n");
+		return PTR_ERR(enable_gpio);
+	}
+
+	regmap = devm_regmap_init_i2c(client, &rt4831_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(&client->dev, "Failed to initialize regmap\n");
+		return PTR_ERR(regmap);
+	}
+
+	ret = regmap_read(regmap, RT4831_REG_REVISION, &chip_id);
+	if (ret) {
+		dev_err(&client->dev, "Failed to get H/W revision\n");
+		return ret;
+	}
+
+	if ((chip_id & RT4831_VID_MASK) != RICHTEK_VENDOR_ID) {
+		dev_err(&client->dev, "Chip vendor ID 0x%02x not matched\n", chip_id);
+		return -ENODEV;
+	}
+
+	/*
+	 * Used to prevent the abnormal shutdown.
+	 * If SCL/SDA both keep low for one second to reset HW.
+	 */
+	ret = regmap_update_bits(regmap, RT4831_REG_I2CPROT, RT4831_I2CSAFETMR_MASK,
+				 RT4831_I2CSAFETMR_MASK);
+	if (ret) {
+		dev_err(&client->dev, "Failed to enable I2C safety timer\n");
+		return ret;
+	}
+
+	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO, rt4831_subdevs,
+				    ARRAY_SIZE(rt4831_subdevs), NULL, 0, NULL);
+}
+
+static int rt4831_remove(struct i2c_client *client)
+{
+	struct regmap *regmap = dev_get_regmap(&client->dev, NULL);
+
+	/* Disable WLED and DSV outputs */
+	return regmap_update_bits(regmap, RT4831_REG_ENABLE, RT4831_RESET_MASK, RT4831_RESET_MASK);
+}
+
+static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+	{ .compatible = "richtek,rt4831", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt4831_of_match);
+
+static struct i2c_driver rt4831_driver = {
+	.driver = {
+		.name = "rt4831",
+		.of_match_table = rt4831_of_match,
+	},
+	.probe_new = rt4831_probe,
+	.remove = rt4831_remove,
+};
+module_i2c_driver(rt4831_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

