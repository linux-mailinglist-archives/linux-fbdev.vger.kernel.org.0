Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9966FB95F
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 May 2023 23:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233759AbjEHVU0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 8 May 2023 17:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjEHVUY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 8 May 2023 17:20:24 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B64E658B
        for <linux-fbdev@vger.kernel.org>; Mon,  8 May 2023 14:20:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so2110003e87.3
        for <linux-fbdev@vger.kernel.org>; Mon, 08 May 2023 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683580818; x=1686172818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9I/Z9v0khLJ/dFA45l8m+kaD8pFbfPgeSZ6r7wbMHsQ=;
        b=lMvVYaZUcEFKzhwfnJ1p7aXj1pOZ+PjOzXHuyIKE88+cAzHhxCNjsnuNaYO5lSS3G5
         ICy2b8LkbdeJcambKmemQPPdWmkfAw8JVaVYYGq2KruTY647JGLO3/DH6mhe+vxpIhZX
         W9nMSLGuUYG461JiOR3px/gMOkKnuJRmtxjSmriYsyHJ0K5DO8bP/UViFIuaLOAoAYCp
         kjaXj6XpSTYARRgOTsY+8LJ+nfxR0TBSc8utkCsTPTut3pgF/cYa4GBS3b3gr0X1cqFp
         5W1F8hcWpXkjoHQ8SCmu3saQ79tbmr8K2SgGICIXBIJ+hoPP1ZqtRDCdcy8I6+VgdW62
         /VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683580818; x=1686172818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9I/Z9v0khLJ/dFA45l8m+kaD8pFbfPgeSZ6r7wbMHsQ=;
        b=llZP3W1pvj3uj+NblccRqewUZJbOdFUW15bL3EFbG2BhmtjdEWxRJ+0Pg9WSEoJwp8
         Njs2Ff85MoJxntDMjUBfW4XwG3oM4wm7+PsdAkmc6HFWg6SCyX0dlMs5CTNFpoASbQTY
         SwJlJQ38sAnH0Wj00Nn/cCDtEo+7UACFWYH5XpIgtcb59W/W7JyuZa1vQmekpHug8xml
         VvcY/Zyz4wAUh8AceEqbWDy+4+0xScEbyoWsJyNE0YzNyKXNEiMsOJaiwQtg23ex6S26
         PHkUhx905+IE4ETM0snErJT9A+i1ORvNBgNJE5Jl9wy165/Kj8PEnBNgxWRqXJqgkUEs
         pu/A==
X-Gm-Message-State: AC+VfDxtFSEDukhI9oZjXOPT5SEP5RfBalnmQa2W4gASHMMYsvD4dc4Q
        /hzW4ZGLeEfcA+nXVO+Km6Cc6h18jmA2k1W8oWQ=
X-Google-Smtp-Source: ACHHUZ5bYyxTWMeEl9rAnycDEUNVRJOdtGPutuP4iHOZ2T5rSwZCG/qJHNbIJb+LlNvvG3/O+LYvYw==
X-Received: by 2002:ac2:508b:0:b0:4f1:4812:e12b with SMTP id f11-20020ac2508b000000b004f14812e12bmr118812lfm.52.1683580817828;
        Mon, 08 May 2023 14:20:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4-20020ac24844000000b004edc3bd7fa1sm102164lfy.201.2023.05.08.14.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 14:20:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 08 May 2023 23:20:06 +0200
Subject: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Helge Deller <deller@gmx.de>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mmc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The Nokia 770 is using GPIOs from the global numberspace on the
CBUS node to pass down to the LCD controller. This regresses when we
let the OMAP GPIO driver use dynamic GPIO base.

The Nokia 770 now has dynamic allocation of IRQ numbers, so this
needs to be fixed for it to work.

As this is the only user of LCD MIPID we can easily augment the
driver to use a GPIO descriptor instead and resolve the issue.

The platform data .shutdown() callback wasn't even used in the
code, but we encode a shutdown asserting RESET in the remove()
callback for completeness sake.

The CBUS also has the ADS7846 touchscreen attached.

Populate the devices on the Nokia 770 CBUS I2C using software
nodes instead of platform data quirks. This includes the LCD
and the ADS7846 touchscreen so the conversion just brings the LCD
along with it as software nodes is an all-or-nothing design
pattern.

The ADS7846 has some limited support for using GPIO descriptors,
let's convert it over completely to using device properties and then
fix all remaining boardfile users to provide all platform data using
software nodes.

Dump the of includes and of_match_ptr() in the ADS7846 driver as part
of the job.

Since we have to move ADS7846 over to obtaining the GPIOs it is
using exclusively from descriptors, we provide descriptor tables
for the two remaining in-kernel boardfiles using ADS7846:

- PXA Spitz
- MIPS Alchemy DB1000 development board

It was too hard for me to include software node conversion of
these two remaining users at this time: the spitz is using a
hscync callback in the platform data that would require further
GPIO descriptor conversion of the Spitz, and moving the hsync
callback down into the driver: it will just become too big of
a job, but it can be done separately.

The MIPS Alchemy DB1000 is simply something I cannot test, so take
the easier approach of just providing some GPIO descriptors in
this case as I don't want the patch to grow too intrusive.

As we see that several device trees have incorrect polarity flags
and just expect to bypass the gpiolib polarity handling, fix up
all device trees too, in a separate patch.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Fix all board file polarity flags to be active low, because
  this pendown signal is active low.
- Fix all erroneous device trees too.
- Drop some unnecessary commas.
ChangeLog v2->v3:
- Drop leftover OF ifdefs no longer needed and causing compile
  errors.
---
 arch/arm/mach-omap1/board-nokia770.c    |  98 +++++++++++++++++----------
 arch/arm/mach-pxa/spitz.c               |  11 +++-
 arch/mips/alchemy/devboards/db1000.c    |  11 +++-
 drivers/input/touchscreen/ads7846.c     | 113 ++++++++++++--------------------
 drivers/video/fbdev/omap/lcd_mipid.c    |  10 +++
 include/linux/platform_data/lcd-mipid.h |   2 -
 include/linux/spi/ads7846.h             |   2 -
 7 files changed, 135 insertions(+), 112 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a501a473ffd6..8a1f2572deea 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -8,15 +8,16 @@
 #include <linux/irq.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/input.h>
 #include <linux/omapfb.h>
 
 #include <linux/spi/spi.h>
-#include <linux/spi/ads7846.h>
 #include <linux/workqueue.h>
 #include <linux/delay.h>
 
@@ -35,6 +36,25 @@
 #include "clock.h"
 #include "mmc.h"
 
+static const struct software_node nokia770_mpuio_gpiochip_node = {
+	.name = "mpuio",
+};
+
+static const struct software_node nokia770_gpiochip1_node = {
+	.name = "gpio-0-15",
+};
+
+static const struct software_node nokia770_gpiochip2_node = {
+	.name = "gpio-16-31",
+};
+
+static const struct software_node *nokia770_gpiochip_nodes[] = {
+	&nokia770_mpuio_gpiochip_node,
+	&nokia770_gpiochip1_node,
+	&nokia770_gpiochip2_node,
+	NULL
+};
+
 #define ADS7846_PENDOWN_GPIO	15
 
 static const unsigned int nokia770_keymap[] = {
@@ -85,40 +105,46 @@ static struct platform_device *nokia770_devices[] __initdata = {
 	&nokia770_kp_device,
 };
 
-static void mipid_shutdown(struct mipid_platform_data *pdata)
-{
-	if (pdata->nreset_gpio != -1) {
-		printk(KERN_INFO "shutdown LCD\n");
-		gpio_set_value(pdata->nreset_gpio, 0);
-		msleep(120);
-	}
-}
-
-static struct mipid_platform_data nokia770_mipid_platform_data = {
-	.shutdown = mipid_shutdown,
-};
+static struct mipid_platform_data nokia770_mipid_platform_data = { };
 
 static const struct omap_lcd_config nokia770_lcd_config __initconst = {
 	.ctrl_name	= "hwa742",
 };
 
+static const struct property_entry nokia770_mipid_props[] = {
+	PROPERTY_ENTRY_GPIO("reset-gpios", &nokia770_gpiochip1_node,
+			    13, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct software_node nokia770_mipid_swnode = {
+	.name = "lcd_mipid",
+	.properties = nokia770_mipid_props,
+};
+
 static void __init mipid_dev_init(void)
 {
-	nokia770_mipid_platform_data.nreset_gpio = 13;
 	nokia770_mipid_platform_data.data_lines = 16;
 
 	omapfb_set_lcd_config(&nokia770_lcd_config);
 }
 
-static struct ads7846_platform_data nokia770_ads7846_platform_data __initdata = {
-	.x_max		= 0x0fff,
-	.y_max		= 0x0fff,
-	.x_plate_ohms	= 180,
-	.pressure_max	= 255,
-	.debounce_max	= 10,
-	.debounce_tol	= 3,
-	.debounce_rep	= 1,
-	.gpio_pendown	= ADS7846_PENDOWN_GPIO,
+static const struct property_entry nokia770_ads7846_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 4096),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 4096),
+	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 256),
+	PROPERTY_ENTRY_U32("touchscreen-average-samples", 10),
+	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
+	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
+	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
+			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct software_node nokia770_ads7846_swnode = {
+	.name = "ads7846",
+	.properties = nokia770_ads7846_props,
 };
 
 static struct spi_board_info nokia770_spi_board_info[] __initdata = {
@@ -128,13 +154,14 @@ static struct spi_board_info nokia770_spi_board_info[] __initdata = {
 		.chip_select    = 3,
 		.max_speed_hz   = 12000000,
 		.platform_data	= &nokia770_mipid_platform_data,
+		.swnode         = &nokia770_mipid_swnode,
 	},
 	[1] = {
 		.modalias       = "ads7846",
 		.bus_num        = 2,
 		.chip_select    = 0,
 		.max_speed_hz   = 2500000,
-		.platform_data	= &nokia770_ads7846_platform_data,
+		.swnode         = &nokia770_ads7846_swnode,
 	},
 };
 
@@ -212,14 +239,16 @@ static inline void nokia770_mmc_init(void)
 #endif
 
 #if IS_ENABLED(CONFIG_I2C_CBUS_GPIO)
-static struct gpiod_lookup_table nokia770_cbus_gpio_table = {
-	.dev_id = "i2c-cbus-gpio.2",
-	.table = {
-		GPIO_LOOKUP_IDX("mpuio", 9, NULL, 0, 0), /* clk */
-		GPIO_LOOKUP_IDX("mpuio", 10, NULL, 1, 0), /* dat */
-		GPIO_LOOKUP_IDX("mpuio", 11, NULL, 2, 0), /* sel */
-		{ },
-	},
+
+static const struct software_node_ref_args nokia770_cbus_gpio_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 9, 0),
+	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 10, 0),
+	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 11, 0),
+};
+
+static const struct property_entry nokia770_ads7846_props[] = {
+	PROPERTY_ENTRY_REF_ARRAY("gpios", nokia770_cbus_gpio_refs),
+	{ }
 };
 
 static struct platform_device nokia770_cbus_device = {
@@ -253,7 +282,8 @@ static void __init nokia770_cbus_init(void)
 	nokia770_i2c_board_info_2[1].irq = gpio_to_irq(tahvo_irq_gpio);
 	i2c_register_board_info(2, nokia770_i2c_board_info_2,
 				ARRAY_SIZE(nokia770_i2c_board_info_2));
-	gpiod_add_lookup_table(&nokia770_cbus_gpio_table);
+	device_create_managed_software_node(&nokia770_cbus_device.dev,
+					    nokia770_cbus_props, NULL);
 	platform_device_register(&nokia770_cbus_device);
 }
 #else /* CONFIG_I2C_CBUS_GPIO */
@@ -273,8 +303,8 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
+	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
-	nokia770_spi_board_info[1].irq = gpio_to_irq(15);
 	spi_register_board_info(nokia770_spi_board_info,
 				ARRAY_SIZE(nokia770_spi_board_info));
 	omap_serial_init();
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 4325bdc2b9ff..28e376e06fdc 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -506,10 +506,18 @@ static struct ads7846_platform_data spitz_ads7846_info = {
 	.x_plate_ohms		= 419,
 	.y_plate_ohms		= 486,
 	.pressure_max		= 1024,
-	.gpio_pendown		= SPITZ_GPIO_TP_INT,
 	.wait_for_sync		= spitz_ads7846_wait_for_hsync,
 };
 
+static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
+	.dev_id = "spi2.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_TP_INT,
+			    "pendown", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static void spitz_bl_kick_battery(void)
 {
 	void (*kick_batt)(void);
@@ -594,6 +602,7 @@ static void __init spitz_spi_init(void)
 	else
 		gpiod_add_lookup_table(&spitz_lcdcon_gpio_table);
 
+	gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
 	gpiod_add_lookup_table(&spitz_spi_gpio_table);
 	pxa2xx_set_spi_info(2, &spitz_spi_info);
 	spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 2c52ee27b4f2..79d66faa8482 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -381,13 +381,21 @@ static struct platform_device db1100_mmc1_dev = {
 static struct ads7846_platform_data db1100_touch_pd = {
 	.model		= 7846,
 	.vref_mv	= 3300,
-	.gpio_pendown	= 21,
 };
 
 static struct spi_gpio_platform_data db1100_spictl_pd = {
 	.num_chipselect = 1,
 };
 
+static struct gpiod_lookup_table db1100_touch_gpio_table = {
+	.dev_id = "spi0.0",
+	.table = {
+		GPIO_LOOKUP("alchemy-gpio2", 21,
+			    "pendown", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static struct spi_board_info db1100_spi_info[] __initdata = {
 	[0] = {
 		.modalias	 = "ads7846",
@@ -474,6 +482,7 @@ int __init db1000_dev_setup(void)
 		pfc |= (1 << 0);	/* SSI0 pins as GPIOs */
 		alchemy_wrsys(pfc, AU1000_SYS_PINFUNC);
 
+		gpiod_add_lookup_table(&db1100_touch_gpio_table);
 		spi_register_board_info(db1100_spi_info,
 					ARRAY_SIZE(db1100_spi_info));
 
diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index bb1058b1e7fd..40eb27f1b23f 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -24,11 +24,8 @@
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/of_device.h>
+#include <linux/property.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
 #include <linux/regulator/consumer.h>
@@ -140,7 +137,7 @@ struct ads7846 {
 	int			(*filter)(void *data, int data_idx, int *val);
 	void			*filter_data;
 	int			(*get_pendown_state)(void);
-	int			gpio_pendown;
+	struct gpio_desc	*gpio_pendown;
 
 	void			(*wait_for_sync)(void);
 };
@@ -223,7 +220,7 @@ static int get_pendown_state(struct ads7846 *ts)
 	if (ts->get_pendown_state)
 		return ts->get_pendown_state();
 
-	return !gpio_get_value(ts->gpio_pendown);
+	return gpiod_get_value(ts->gpio_pendown);
 }
 
 static void ads7846_report_pen_up(struct ads7846 *ts)
@@ -989,8 +986,6 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 				 struct ads7846 *ts,
 				 const struct ads7846_platform_data *pdata)
 {
-	int err;
-
 	/*
 	 * REVISIT when the irq can be triggered active-low, or if for some
 	 * reason the touchscreen isn't hooked up, we don't need to access
@@ -999,25 +994,15 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 
 	if (pdata->get_pendown_state) {
 		ts->get_pendown_state = pdata->get_pendown_state;
-	} else if (gpio_is_valid(pdata->gpio_pendown)) {
-
-		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
-					    GPIOF_IN, "ads7846_pendown");
-		if (err) {
-			dev_err(&spi->dev,
-				"failed to request/setup pendown GPIO%d: %d\n",
-				pdata->gpio_pendown, err);
-			return err;
+	} else {
+		ts->gpio_pendown = gpiod_get(&spi->dev, "pendown", GPIOD_IN);
+		if (IS_ERR(ts->gpio_pendown)) {
+			dev_err(&spi->dev, "failed to request pendown GPIO\n");
+			return PTR_ERR(ts->gpio_pendown);
 		}
-
-		ts->gpio_pendown = pdata->gpio_pendown;
-
 		if (pdata->gpio_pendown_debounce)
-			gpiod_set_debounce(gpio_to_desc(ts->gpio_pendown),
+			gpiod_set_debounce(ts->gpio_pendown,
 					   pdata->gpio_pendown_debounce);
-	} else {
-		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
-		return -EINVAL;
 	}
 
 	return 0;
@@ -1119,7 +1104,6 @@ static int ads7846_setup_spi_msg(struct ads7846 *ts,
 	return 0;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id ads7846_dt_ids[] = {
 	{ .compatible = "ti,tsc2046",	.data = (void *) 7846 },
 	{ .compatible = "ti,ads7843",	.data = (void *) 7843 },
@@ -1130,20 +1114,14 @@ static const struct of_device_id ads7846_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, ads7846_dt_ids);
 
-static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
+static const struct ads7846_platform_data *ads7846_get_props(struct device *dev)
 {
 	struct ads7846_platform_data *pdata;
-	struct device_node *node = dev->of_node;
-	const struct of_device_id *match;
+	const struct platform_device_id *pdev_id;
 	u32 value;
 
-	if (!node) {
-		dev_err(dev, "Device does not have associated DT data\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	match = of_match_device(ads7846_dt_ids, dev);
-	if (!match) {
+	pdev_id = device_get_match_data(dev);
+	if (!pdev_id) {
 		dev_err(dev, "Unknown device model\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -1152,60 +1130,51 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	pdata->model = (unsigned long)match->data;
+	pdata->model = (unsigned long)pdev_id->driver_data;
 
-	of_property_read_u16(node, "ti,vref-delay-usecs",
-			     &pdata->vref_delay_usecs);
-	of_property_read_u16(node, "ti,vref-mv", &pdata->vref_mv);
-	pdata->keep_vref_on = of_property_read_bool(node, "ti,keep-vref-on");
+	device_property_read_u16(dev, "ti,vref-delay-usecs",
+				 &pdata->vref_delay_usecs);
+	device_property_read_u16(dev, "ti,vref-mv", &pdata->vref_mv);
+	pdata->keep_vref_on = device_property_read_bool(dev, "ti,keep-vref-on");
 
-	pdata->swap_xy = of_property_read_bool(node, "ti,swap-xy");
+	pdata->swap_xy = device_property_read_bool(dev, "ti,swap-xy");
 
-	of_property_read_u16(node, "ti,settle-delay-usec",
-			     &pdata->settle_delay_usecs);
-	of_property_read_u16(node, "ti,penirq-recheck-delay-usecs",
-			     &pdata->penirq_recheck_delay_usecs);
+	device_property_read_u16(dev, "ti,settle-delay-usec",
+				 &pdata->settle_delay_usecs);
+	device_property_read_u16(dev, "ti,penirq-recheck-delay-usecs",
+				 &pdata->penirq_recheck_delay_usecs);
 
-	of_property_read_u16(node, "ti,x-plate-ohms", &pdata->x_plate_ohms);
-	of_property_read_u16(node, "ti,y-plate-ohms", &pdata->y_plate_ohms);
+	device_property_read_u16(dev, "ti,x-plate-ohms", &pdata->x_plate_ohms);
+	device_property_read_u16(dev, "ti,y-plate-ohms", &pdata->y_plate_ohms);
 
-	of_property_read_u16(node, "ti,x-min", &pdata->x_min);
-	of_property_read_u16(node, "ti,y-min", &pdata->y_min);
-	of_property_read_u16(node, "ti,x-max", &pdata->x_max);
-	of_property_read_u16(node, "ti,y-max", &pdata->y_max);
+	device_property_read_u16(dev, "ti,x-min", &pdata->x_min);
+	device_property_read_u16(dev, "ti,y-min", &pdata->y_min);
+	device_property_read_u16(dev, "ti,x-max", &pdata->x_max);
+	device_property_read_u16(dev, "ti,y-max", &pdata->y_max);
 
 	/*
 	 * touchscreen-max-pressure gets parsed during
 	 * touchscreen_parse_properties()
 	 */
-	of_property_read_u16(node, "ti,pressure-min", &pdata->pressure_min);
-	if (!of_property_read_u32(node, "touchscreen-min-pressure", &value))
+	device_property_read_u16(dev, "ti,pressure-min", &pdata->pressure_min);
+	if (!device_property_read_u32(dev, "touchscreen-min-pressure", &value))
 		pdata->pressure_min = (u16) value;
-	of_property_read_u16(node, "ti,pressure-max", &pdata->pressure_max);
+	device_property_read_u16(dev, "ti,pressure-max", &pdata->pressure_max);
 
-	of_property_read_u16(node, "ti,debounce-max", &pdata->debounce_max);
-	if (!of_property_read_u32(node, "touchscreen-average-samples", &value))
+	device_property_read_u16(dev, "ti,debounce-max", &pdata->debounce_max);
+	if (!device_property_read_u32(dev, "touchscreen-average-samples", &value))
 		pdata->debounce_max = (u16) value;
-	of_property_read_u16(node, "ti,debounce-tol", &pdata->debounce_tol);
-	of_property_read_u16(node, "ti,debounce-rep", &pdata->debounce_rep);
+	device_property_read_u16(dev, "ti,debounce-tol", &pdata->debounce_tol);
+	device_property_read_u16(dev, "ti,debounce-rep", &pdata->debounce_rep);
 
-	of_property_read_u32(node, "ti,pendown-gpio-debounce",
+	device_property_read_u32(dev, "ti,pendown-gpio-debounce",
 			     &pdata->gpio_pendown_debounce);
 
-	pdata->wakeup = of_property_read_bool(node, "wakeup-source") ||
-			of_property_read_bool(node, "linux,wakeup");
-
-	pdata->gpio_pendown = of_get_named_gpio(dev->of_node, "pendown-gpio", 0);
+	pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
+			device_property_read_bool(dev, "linux,wakeup");
 
 	return pdata;
 }
-#else
-static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
-{
-	dev_err(dev, "no platform data defined\n");
-	return ERR_PTR(-EINVAL);
-}
-#endif
 
 static void ads7846_regulator_disable(void *regulator)
 {
@@ -1269,7 +1238,7 @@ static int ads7846_probe(struct spi_device *spi)
 
 	pdata = dev_get_platdata(dev);
 	if (!pdata) {
-		pdata = ads7846_probe_dt(dev);
+		pdata = ads7846_get_props(dev);
 		if (IS_ERR(pdata))
 			return PTR_ERR(pdata);
 	}
@@ -1426,7 +1395,7 @@ static struct spi_driver ads7846_driver = {
 	.driver = {
 		.name	= "ads7846",
 		.pm	= pm_sleep_ptr(&ads7846_pm),
-		.of_match_table = of_match_ptr(ads7846_dt_ids),
+		.of_match_table = ads7846_dt_ids,
 	},
 	.probe		= ads7846_probe,
 	.remove		= ads7846_remove,
diff --git a/drivers/video/fbdev/omap/lcd_mipid.c b/drivers/video/fbdev/omap/lcd_mipid.c
index 03cff39d392d..e4a7f0b824ff 100644
--- a/drivers/video/fbdev/omap/lcd_mipid.c
+++ b/drivers/video/fbdev/omap/lcd_mipid.c
@@ -7,6 +7,7 @@
  */
 #include <linux/device.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/spi/spi.h>
@@ -41,6 +42,7 @@ struct mipid_device {
 						   when we can issue the
 						   next sleep in/out command */
 	unsigned long	hw_guard_wait;		/* max guard time in jiffies */
+	struct gpio_desc	*reset;
 
 	struct omapfb_device	*fbdev;
 	struct spi_device	*spi;
@@ -556,6 +558,12 @@ static int mipid_spi_probe(struct spi_device *spi)
 		return -ENOMEM;
 	}
 
+	/* This will de-assert RESET if active */
+	md->reset = gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(md->reset))
+		return dev_err_probe(&spi->dev, PTR_ERR(md->reset),
+				     "no reset GPIO line\n");
+
 	spi->mode = SPI_MODE_0;
 	md->spi = spi;
 	dev_set_drvdata(&spi->dev, md);
@@ -574,6 +582,8 @@ static void mipid_spi_remove(struct spi_device *spi)
 {
 	struct mipid_device *md = dev_get_drvdata(&spi->dev);
 
+	/* Asserts RESET */
+	gpiod_set_value(md->reset, 1);
 	mipid_disable(&md->panel);
 	kfree(md);
 }
diff --git a/include/linux/platform_data/lcd-mipid.h b/include/linux/platform_data/lcd-mipid.h
index 63f05eb23827..4927cfc5158c 100644
--- a/include/linux/platform_data/lcd-mipid.h
+++ b/include/linux/platform_data/lcd-mipid.h
@@ -15,10 +15,8 @@ enum mipid_test_result {
 #ifdef __KERNEL__
 
 struct mipid_platform_data {
-	int	nreset_gpio;
 	int	data_lines;
 
-	void	(*shutdown)(struct mipid_platform_data *pdata);
 	void	(*set_bklight_level)(struct mipid_platform_data *pdata,
 				     int level);
 	int	(*get_bklight_level)(struct mipid_platform_data *pdata);
diff --git a/include/linux/spi/ads7846.h b/include/linux/spi/ads7846.h
index d424c1aadf38..a04c1c34c344 100644
--- a/include/linux/spi/ads7846.h
+++ b/include/linux/spi/ads7846.h
@@ -35,8 +35,6 @@ struct ads7846_platform_data {
 	u16	debounce_tol;		/* tolerance used for filtering */
 	u16	debounce_rep;		/* additional consecutive good readings
 					 * required after the first two */
-	int	gpio_pendown;		/* the GPIO used to decide the pendown
-					 * state if get_pendown_state == NULL */
 	int	gpio_pendown_debounce;	/* platform specific debounce time for
 					 * the gpio_pendown */
 	int	(*get_pendown_state)(void);

-- 
2.34.1

