Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913607A2070
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 Sep 2023 16:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbjIOOFc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 15 Sep 2023 10:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235533AbjIOOFb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 15 Sep 2023 10:05:31 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8E81FC9;
        Fri, 15 Sep 2023 07:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecoWdnhcaE64n5vhPeAkBvqMz2SlUy5WgD7Ej0TP8WOa6YOInDqxLKRRt6bW8AS8SvMMPt9HIz/o+oYxrMXSqUjBKLLvQbtLRSgf1r1Tym6KrsOAWH57DErE2wVfDWrRGCau7vMDRR7lQyM4FLyvvEU7jEAXwXTBh93VwMF2++D136Kun06emN+MgjdV2N1w68Ekj2iLGLJYwCw10RVeT544sSNdmg+iCqmrEcxG0FaXJhYSfm3f3BdEBaz7mF5n5944qyWugkXc9/t3qJQ+vMVJvA2iZxEwqTaky2sPV9vX0IKpDgRfdbfZNcwJ6UUftAG2gQlu0j12hBNyJDI4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUztNImp0OZV5roHMtqiVIMiH+hqjTAI7wBew/fPLb8=;
 b=EcY0jtbgVi6DLjrPtgM6R/3mAJb299118TqVqtnWytPtwy2qqVDdtuotthbMzGsfHN9Q2YdHY2ej6wqIDypUCpNcK0BMmuvH7JimV29rxWIGW/qUAt6OBGkRX6lMPBmDKFxHz+e/FRYuzoYrse8iPHF6Aso1uC7mEHmzIUbwTFY2L4IigHcQmEGdYsCg3VHgdme7al9jY01LyygH7SQJJ6pL7gU02aREe/xGFJdN03bK18t1O/l6ScfM+ZbFiA+3v14JUBkvlE9fv+RLgu5PKvFhbleN+6jD7FNSaROeF5U4g00/rkUEYy3FI1z1Es5/XjMJlZxN7vJggaUssJVoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=asem.it;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=asem.it;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUztNImp0OZV5roHMtqiVIMiH+hqjTAI7wBew/fPLb8=;
 b=Uai98W0RpNGaguESQrdn9YxfM5rffiScb0zn4tbIt7DmddTyHoPd4+yI0jfXjJRlFnhOErJ+udqr6uocoBM5CoI3YFYJAQGmQ37VrA4IHvPzudHV8v3FmLeWQbXQBL3yEDcQx1/9b5JQ+tRXcnsRVgj6ykI3/HumiuzLDJyop8k=
Received: from AM0PR04CA0091.eurprd04.prod.outlook.com (2603:10a6:208:be::32)
 by AS8PR01MB7208.eurprd01.prod.exchangelabs.com (2603:10a6:20b:253::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.8; Fri, 15 Sep
 2023 14:05:22 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:208:be:cafe::b5) by AM0PR04CA0091.outlook.office365.com
 (2603:10a6:208:be::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 14:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.0 via Frontend Transport; Fri, 15 Sep 2023 14:05:21 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
         Fri, 15 Sep 2023 16:05:20 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v2 2/2] backlight: mp3309c: Add support for MPS MP3309C
Date:   Fri, 15 Sep 2023 16:05:16 +0200
Message-Id: <20230915140516.1294925-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915140516.1294925-1-f.suligoi@asem.it>
References: <20230915140516.1294925-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Sep 2023 14:05:20.0358 (UTC) FILETIME=[A99D3060:01D9E7DD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|AS8PR01MB7208:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d0e0cacc-6bf6-4c32-2783-08dbb5f4cd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NGRBBbxCMUhBn57UXdMO82yHSH2x4/HF+2uKcaNpjhjYY3kqOzT7ZMdco+Sjd0ZBtyUY9OzUseeF/QYNybbM/UKnpiR3EhDZrM/fyySfpznXB3sEi6Uao6AlvyPEBeF0139CGLrtrRpCBURbdRkWRauL1LAoalw88j3MeB8CEHbEvJNmhd9IzMaqNi4oSeW+StuDxRIhkP6O0ZFrzvkOAYeGcs2QXTBJI/EhDGJg3YN/tLVTe6ZsNEGQNet42X5OCFZy9v7cIBj4PzCSzmJMfzaOB4m71UJeaC3yIj3gWhdrS8T2/NAU5P/tb4x2EpLAoy6mDdFy9kheizAn12r2+Hylt1zo10J+3/COj5e/ttIVod4b4cy6Cz195bTbtz0fsCKu7IUj3G3CWkxjYgYNvtfzI49buA4YQNuOdVB532XAQ+ynFSuabgqTmymy/wpz/Brz3cNkYO8Mdaal5ztAGuM24JA52B1nT1O9DFF0CdlsC0KudbLcapAf/Kj8ZCewDueEInVW16kYNwXhsKvCCxnIUMeOf5105yzlehsR2fbaBsCbKcxKi+xguyrnWB77YKRhwY29XGvjjQjt04GywUt+h4zhFdBIeGfz2Coe1QFMjoCmZhs+byA2D62M7HZz89Rt6LA3TR/WV+xBlM8YgC97W4kc+AwC47tsMscawwzXkA1nMZodH7v6MZkPkvb4dm8XT9wKtcT5mfnZTdDYVf00T8yDBdefiOaUkc0w2to=
X-Forefront-Antispam-Report: CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(346002)(396003)(39850400004)(376002)(136003)(82310400011)(186009)(451199024)(1800799009)(46966006)(36840700001)(36860700001)(40480700001)(478600001)(966005)(47076005)(4326008)(8676002)(8936002)(81166007)(356005)(316002)(110136005)(70586007)(36756003)(450100002)(70206006)(5660300002)(41300700001)(82740400003)(86362001)(30864003)(1076003)(26005)(336012)(2906002)(107886003)(2616005)(6666004)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 14:05:21.9266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e0cacc-6bf6-4c32-2783-08dbb5f4cd20
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7208
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
programmable switching frequency to optimize efficiency.
The brightness can be controlled either by I2C commands (called "analog"
mode) or by a PWM input signal (PWM mode).
This driver supports both modes.

For DT configuration details, please refer to:
- Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

The datasheet is available at:
- https://www.monolithicpower.com/en/mp3309c.html

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---

v2:
 - fix dependecies in Kconfig
 - fix Kconfig MP3309C entry order
 - remove switch-on-delay-ms property
 - remove optional gpio property to reset external devices
 - remove dimming-mode property (the analog-i2c dimming mode is the default; the
   presence of the pwms property, in DT, selects automatically the pwm dimming
   mode)
 - substitute three boolean properties, used for the overvoltage-protection
   values, with a single enum property
 - drop simple tracing messages
 - use dev_err_probe() in probe function
 - change device name from mp3309c_bl to the simple mp3309c
 - remove shutdown function
v1:
 - first version

 MAINTAINERS                       |   6 +
 drivers/video/backlight/Kconfig   |  11 +
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/mp3309c.c | 395 ++++++++++++++++++++++++++++++
 4 files changed, 413 insertions(+)
 create mode 100644 drivers/video/backlight/mp3309c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3be1bdfe8ecc..f779df433af1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14333,6 +14333,12 @@ S:	Maintained
 F:	Documentation/driver-api/tty/moxa-smartio.rst
 F:	drivers/tty/mxser.*
 
+MP3309C BACKLIGHT DRIVER
+M:	Flavio Suligoi <f.suligoi@asem.it>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
+F:	drivers/video/backlight/mp3309c.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 51387b1ef012..1144a54a35c0 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -402,6 +402,17 @@ config BACKLIGHT_LP8788
 	help
 	  This supports TI LP8788 backlight driver.
 
+config BACKLIGHT_MP3309C
+	tristate "Backlight Driver for MPS MP3309C"
+	depends on I2C && PWM
+	select REGMAP_I2C
+	help
+	  This supports MPS MP3309C backlight WLED driver in both PWM and
+	  analog/I2C dimming modes.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called mp3309c.
+
 config BACKLIGHT_PANDORA
 	tristate "Backlight driver for Pandora console"
 	depends on TWL4030_CORE
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index f72e1c3c59e9..1af583de665b 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
+obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
 obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
new file mode 100644
index 000000000000..470c960d7438
--- /dev/null
+++ b/drivers/video/backlight/mp3309c.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for MPS MP3309C White LED driver with I2C interface
+ *
+ * Copyright (C) 2023 ASEM Srl
+ * Author: Flavio Suligoi <f.suligoi@asem.it>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+#define REG_I2C_0	0x00
+#define REG_I2C_1	0x01
+
+#define REG_I2C_0_EN	0x80
+#define REG_I2C_0_D0	0x40
+#define REG_I2C_0_D1	0x20
+#define REG_I2C_0_D2	0x10
+#define REG_I2C_0_D3	0x08
+#define REG_I2C_0_D4	0x04
+#define REG_I2C_0_RSRV1	0x02
+#define REG_I2C_0_RSRV2	0x01
+
+#define REG_I2C_1_RSRV1	0x80
+#define REG_I2C_1_DIMS	0x40
+#define REG_I2C_1_SYNC	0x20
+#define REG_I2C_1_OVP0	0x10
+#define REG_I2C_1_OVP1	0x08
+#define REG_I2C_1_VOS	0x04
+#define REG_I2C_1_LEDO	0x02
+#define REG_I2C_1_OTP	0x01
+
+#define ANALOG_MAX_VAL	31
+#define ANALOG_REG_MASK 0x7c
+
+enum mp3309c_status_value {
+	FIRST_POWER_ON,
+	BACKLIGHT_OFF,
+	BACKLIGHT_ON,
+};
+
+enum mp3309c_dimming_mode_value {
+	DIMMING_PWM,
+	DIMMING_ANALOG_I2C,
+};
+
+struct mp3309c_platform_data {
+	u32 max_brightness;
+	u32 default_brightness;
+	u8  dimming_mode;
+	u8  over_voltage_protection;
+	bool sync_mode;
+	u8 status;
+};
+
+struct mp3309c_chip {
+	struct device *dev;
+	struct mp3309c_platform_data *pdata;
+	struct backlight_device *bl;
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+	struct pwm_device *pwmd;
+	int irq;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regmap_config mp3309c_regmap = {
+	.name = "mp3309c_regmap",
+	.reg_bits = 8,
+	.reg_stride = 1,
+	.val_bits = 8,
+	.max_register = REG_I2C_1,
+};
+
+static int mp3309c_enable_device(struct mp3309c_chip *chip)
+{
+	u8 reg_val;
+	int ret;
+
+	/* I2C register #0 - Device enable */
+	ret = regmap_update_bits(chip->regmap, REG_I2C_0, REG_I2C_0_EN,
+				 REG_I2C_0_EN);
+	if (ret)
+		return ret;
+
+	/*
+	 * I2C register #1 - Set working mode:
+	 *  - set one of the two dimming mode:
+	 *    - PWM dimming using an external PWM dimming signal
+	 *    - analog dimming using I2C commands
+	 *  - enable/disable synchronous mode
+	 *  - set overvoltage protection (OVP)
+	 */
+	reg_val = 0x00;
+	if (chip->pdata->dimming_mode == DIMMING_PWM)
+		reg_val |= REG_I2C_1_DIMS;
+	if (chip->pdata->sync_mode)
+		reg_val |= REG_I2C_1_SYNC;
+	reg_val |= chip->pdata->over_voltage_protection;
+	ret = regmap_write(chip->regmap, REG_I2C_1, reg_val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mp3309c_bl_update_status(struct backlight_device *bl)
+{
+	struct mp3309c_chip *chip = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+	struct pwm_state pwmstate;
+	unsigned int analog_val, bits_val;
+	int i, ret;
+
+	if (chip->pdata->dimming_mode == DIMMING_PWM) {
+		/*
+		 * PWM dimming mode
+		 */
+		pwm_get_state(chip->pwmd, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate, brightness,
+					    chip->pdata->max_brightness);
+		pwmstate.enabled = true;
+		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		if (ret)
+			return ret;
+
+		switch (chip->pdata->status) {
+		case FIRST_POWER_ON:
+		case BACKLIGHT_OFF:
+			/*
+			 * After 20ms of pwm off, we must enable the chip again
+			 */
+			if (brightness > 0) {
+				msleep_interruptible(10);
+				mp3309c_enable_device(chip);
+				chip->pdata->status = BACKLIGHT_ON;
+			} else {
+				chip->pdata->status = BACKLIGHT_OFF;
+			}
+			break;
+		case BACKLIGHT_ON:
+			if (brightness == 0)
+				chip->pdata->status = BACKLIGHT_OFF;
+			break;
+		}
+	} else {
+		/*
+		 * Analog dimming (by I2C command) dimming mode
+		 *
+		 * The first time, before setting brightness, we must enable the
+		 * device
+		 */
+		if (chip->pdata->status == FIRST_POWER_ON)
+			mp3309c_enable_device(chip);
+
+		/*
+		 * Dimming mode I2C command
+		 *
+		 * The 5 bits of the dimming analog value D4..D0 is allocated
+		 * in the I2C register #0, in the following way:
+		 *
+		 *     +--+--+--+--+--+--+--+--+
+		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
+		 *     +--+--+--+--+--+--+--+--+
+		 */
+		analog_val = DIV_ROUND_UP(ANALOG_MAX_VAL * brightness,
+					  chip->pdata->max_brightness);
+		bits_val = 0;
+		for (i = 0; i <= 5; i++)
+			bits_val += ((analog_val >> i) & 0x01) << (6 - i);
+		ret = regmap_update_bits(chip->regmap, REG_I2C_0,
+					 ANALOG_REG_MASK, bits_val);
+		if (ret)
+			return ret;
+
+		if (brightness > 0)
+			chip->pdata->status = BACKLIGHT_ON;
+		else
+			chip->pdata->status = BACKLIGHT_OFF;
+	}
+
+	return 0;
+}
+
+static const struct backlight_ops mp3309c_bl_ops = {
+	.update_status = mp3309c_bl_update_status,
+};
+
+static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
+				 struct mp3309c_platform_data *pdata)
+{
+	struct device_node *node = chip->dev->of_node;
+	struct property *prop;
+	int length, ret;
+	unsigned int tmp_value;
+
+	if (!node) {
+		dev_err(chip->dev, "failed to get DT node\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Dimming mode: the MP3309C provides two dimming control mode:
+	 *
+	 * - PWM mode
+	 * - Analog by I2C control mode (default)
+	 *
+	 * I2C control mode is assumed as default but, if the pwms property is
+	 * found in the backlight node, the mode switches to PWM mode.
+	 */
+	pdata->dimming_mode = DIMMING_ANALOG_I2C;
+	prop = of_find_property(node, "pwms", &length);
+	if (prop) {
+		chip->pwmd = devm_pwm_get(chip->dev, NULL);
+		if (IS_ERR(chip->pwmd))
+			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
+					     "error getting pwm data\n");
+		pdata->dimming_mode = DIMMING_PWM;
+		pwm_apply_args(chip->pwmd);
+	}
+
+	/* Dimming steps (levels): 0 .. max_brightness */
+	ret = of_property_read_u32(node, "max-brightness",
+				   &pdata->max_brightness);
+	if (ret < 0) {
+		dev_err(chip->dev, "failed to get max-brightness from DT\n");
+		return ret;
+	}
+
+	/* Default brightness at startup */
+	ret = of_property_read_u32(node, "default-brightness",
+				   &pdata->default_brightness);
+	if (ret < 0) {
+		dev_err(chip->dev,
+			"failed to get default-brightness from DT\n");
+		return ret;
+	}
+
+	/* Enable GPIO used in I2C dimming mode */
+	if (pdata->dimming_mode == DIMMING_ANALOG_I2C) {
+		chip->enable_gpio = devm_gpiod_get(chip->dev, "enable",
+						   GPIOD_OUT_HIGH);
+		if (IS_ERR(chip->enable_gpio))
+			return dev_err_probe(chip->dev, PTR_ERR(chip->enable_gpio),
+					     "error getting enable gpio\n");
+	}
+
+	/*
+	 * Over-voltage protection (OVP)
+	 *
+	 * This (optional) property values are:
+	 *
+	 *  - 13.5V
+	 *  - 24V
+	 *  - 35.5V (hardware default setting)
+	 *
+	 * If missing, the default value for OVP is 35.5V
+	 */
+	pdata->over_voltage_protection = REG_I2C_1_OVP1;
+	if (!of_property_read_u32(node, "mps,overvoltage-protection-microvolt",
+				  &tmp_value)) {
+		switch (tmp_value) {
+		case 13500000:
+			pdata->over_voltage_protection = 0x00;
+			break;
+		case 24000000:
+			pdata->over_voltage_protection = REG_I2C_1_OVP0;
+			break;
+		case 35500000:
+			pdata->over_voltage_protection = REG_I2C_1_OVP1;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/* Synchronous (default) and non-synchronous mode */
+	pdata->sync_mode = true;
+	if (of_property_read_bool(node, "mps,no-sync-mode"))
+		pdata->sync_mode = false;
+
+	return 0;
+}
+
+static int mp3309c_probe(struct i2c_client *client)
+{
+	struct mp3309c_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct mp3309c_chip *chip;
+	struct backlight_properties props;
+	struct pwm_state pwmstate;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "failed to check i2c functionality\n");
+		return -EOPNOTSUPP;
+	}
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &client->dev;
+
+	chip->regmap = devm_regmap_init_i2c(client, &mp3309c_regmap);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				     "failed to allocate register map\n");
+
+	i2c_set_clientdata(client, chip);
+
+	if (!pdata) {
+		pdata = devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata)
+			return -ENOMEM;
+
+		ret = pm3309c_parse_dt_node(chip, pdata);
+		if (ret)
+			return ret;
+	}
+	chip->pdata = pdata;
+
+	/* Backlight properties */
+	props.brightness = pdata->default_brightness;
+	props.max_brightness = pdata->max_brightness;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+	props.type = BACKLIGHT_RAW;
+	props.power = FB_BLANK_UNBLANK;
+	props.fb_blank = FB_BLANK_UNBLANK;
+	chip->bl = devm_backlight_device_register(chip->dev, "mp3309c",
+						  chip->dev, chip, &mp3309c_bl_ops,
+						  &props);
+	if (IS_ERR(chip->bl))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->bl),
+				     "error registering backlight device\n");
+
+	/* In PWM dimming mode, enable pwm device */
+	if (chip->pdata->dimming_mode == DIMMING_PWM) {
+		pwm_init_state(chip->pwmd, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate,
+					    chip->pdata->default_brightness,
+					    chip->pdata->max_brightness);
+		pwmstate.enabled = true;
+		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "error setting pwm device\n");
+	}
+
+	chip->pdata->status = FIRST_POWER_ON;
+	backlight_update_status(chip->bl);
+
+	return 0;
+}
+
+static void mp3309c_remove(struct i2c_client *client)
+{
+	struct mp3309c_chip *chip = i2c_get_clientdata(client);
+	struct backlight_device *bl = chip->bl;
+
+	bl->props.power = FB_BLANK_POWERDOWN;
+	bl->props.brightness = 0;
+	backlight_update_status(chip->bl);
+}
+
+static const struct of_device_id mp3309c_match_table[] = {
+	{ .compatible = "mps,mp3309c", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mp3309c_match_table);
+
+static const struct i2c_device_id mp3309c_id[] = {
+	{ "mp3309c", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mp3309c_id);
+
+static struct i2c_driver mp3309c_i2c_driver = {
+	.driver	= {
+			.name		= KBUILD_MODNAME,
+			.of_match_table	= mp3309c_match_table,
+	},
+	.probe		= mp3309c_probe,
+	.remove		= mp3309c_remove,
+	.id_table	= mp3309c_id,
+};
+
+module_i2c_driver(mp3309c_i2c_driver);
+
+MODULE_DESCRIPTION("Backlight Driver for MPS MP3309C");
+MODULE_AUTHOR("Flavio Suligoi <f.suligoi@asem.it>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

