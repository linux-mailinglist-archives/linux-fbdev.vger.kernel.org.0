Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5021F6F282C
	for <lists+linux-fbdev@lfdr.de>; Sun, 30 Apr 2023 11:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjD3JW0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 30 Apr 2023 05:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjD3JWY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 30 Apr 2023 05:22:24 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70ACD2724
        for <linux-fbdev@vger.kernel.org>; Sun, 30 Apr 2023 02:22:21 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2a8a600bd05so13913321fa.2
        for <linux-fbdev@vger.kernel.org>; Sun, 30 Apr 2023 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682846539; x=1685438539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=resUwvNM45Aa//du85Xtj/QtBikvo9TML09+VNhhfII=;
        b=BzX2p8675UAOyhd0xXO4JXSNQ+Q6oadPaWJVvl/IEJCFiILBUwMR89yx4dBkpskcnK
         4UHdU86GSoudLeZ32mTXeXnTPXUHB5UgTYt+nCB0c+Bv7p3Jn0xff3FUjr17Vsh+nV2o
         sFaz7IpV0zhgwojGVXTpsZXVLyHWmHevJiVSOpW1gK2G+1GNPaGH41qwoDIcHox49zST
         n85/llfjaBf9Oi36PgWG/Dii89VAnZwD3W2D3tBjjhXwgN3GQfyzfypXX4D+4KZBht1e
         XoGOFLG3pmmRkDZERwdIjuVI2ZxPhQShK8xAlQVGQcSJs3h8RB+J5RYJFrF1LMo0IaHe
         vVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682846539; x=1685438539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=resUwvNM45Aa//du85Xtj/QtBikvo9TML09+VNhhfII=;
        b=G//WDbM+k8/bBPp3y/1rd21Y4IzDdHPcyqUfRNNun9ZwEU1J/HSpTHPlKL7pMHrVwE
         InWfLw6aWA3aP8+oAPRobtnwjaLAqObCRodkCt/D7bo4J3hdwabce0FZ/naCuUSco5k2
         lU7/g4xdSHK1AsEuIo/H5hgWDxLyM2okQHaoe1CFfy6v9UtfV8CoBxzfm0KOoRMNF0Pp
         tTAjg6AMrkaGkTlcKjtlzXp0KHvRudeTp37o/pf1feHBmmVCV6c1WZHKk1SWQ6j7TPYn
         XYfYj9iNTeQPsqX2nJTnLAtAWthT27kiNA3W534mZmBydZ7ViobLXB1dOhanLUXpzao0
         87kQ==
X-Gm-Message-State: AC+VfDyd/2Dj3ONSDKHx8kfwpmn5Ok8MywzukeLWO7HDpofx8oaddyKJ
        iuWvFz+5A/GtpGI8jC54UrJIIw==
X-Google-Smtp-Source: ACHHUZ4QG2c2JTTIGuJ93BP3KPxdYfao18zB/+rtBeQwSC4Sc9C4SOsibQ37E2evsq6hHx2vciyoDw==
X-Received: by 2002:a2e:8e88:0:b0:2a8:d3bb:2d83 with SMTP id z8-20020a2e8e88000000b002a8d3bb2d83mr2960250ljk.42.1682846539211;
        Sun, 30 Apr 2023 02:22:19 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id o2-20020a05651238a200b004ec62d9a7f9sm4077327lft.62.2023.04.30.02.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 02:22:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Apr 2023 11:22:16 +0200
Subject: [PATCH 1/4] Input/ARM: ads7846: Get pendown IRQ from descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-nokia770-regression-v1-1-97704e36b094@linaro.org>
References: <20230430-nokia770-regression-v1-0-97704e36b094@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v1-0-97704e36b094@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The ADS7846 has some limited support for using GPIO descriptors,
let's convert it over completely and fix all users to provide
GPIOs in descriptor tables.

The Nokia 770 now has dynamic allocation of IRQ numbers, so this
needs to be fixed for it to work.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-nokia770.c | 12 +++++++++++-
 arch/arm/mach-pxa/spitz.c            | 11 ++++++++++-
 arch/mips/alchemy/devboards/db1000.c | 11 ++++++++++-
 drivers/input/touchscreen/ads7846.c  | 32 ++++++++------------------------
 include/linux/spi/ads7846.h          |  2 --
 5 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a501a473ffd6..eb7652670447 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -118,7 +118,16 @@ static struct ads7846_platform_data nokia770_ads7846_platform_data __initdata =
 	.debounce_max	= 10,
 	.debounce_tol	= 3,
 	.debounce_rep	= 1,
-	.gpio_pendown	= ADS7846_PENDOWN_GPIO,
+};
+
+static struct gpiod_lookup_table nokia770_ads7846_gpio_table = {
+	/* SPI bus 2, device with chip select 0 */
+	.dev_id = "spi2.0",
+	.table = {
+		GPIO_LOOKUP("gpio-0-15", ADS7846_PENDOWN_GPIO,
+			    "pendown", GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
 static struct spi_board_info nokia770_spi_board_info[] __initdata = {
@@ -274,6 +283,7 @@ static void __init omap_nokia770_init(void)
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
+	gpiod_add_lookup_table(&nokia770_ads7846_gpio_table);
 	nokia770_spi_board_info[1].irq = gpio_to_irq(15);
 	spi_register_board_info(nokia770_spi_board_info,
 				ARRAY_SIZE(nokia770_spi_board_info));
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 26f0ebc4d136..4d2a72804495 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -505,10 +505,18 @@ static struct ads7846_platform_data spitz_ads7846_info = {
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
+			    "pendown", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void spitz_bl_kick_battery(void)
 {
 	void (*kick_batt)(void);
@@ -593,6 +601,7 @@ static void __init spitz_spi_init(void)
 	else
 		gpiod_add_lookup_table(&spitz_lcdcon_gpio_table);
 
+	gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
 	gpiod_add_lookup_table(&spitz_spi_gpio_table);
 	pxa2xx_set_spi_info(2, &spitz_spi_info);
 	spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 2c52ee27b4f2..f37644859f89 100644
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
+			    "pendown", GPIO_ACTIVE_HIGH),
+		{ },
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
index bb1058b1e7fd..a3c623009247 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -25,10 +25,8 @@
 #include <linux/slab.h>
 #include <linux/pm.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
 #include <linux/regulator/consumer.h>
@@ -140,7 +138,7 @@ struct ads7846 {
 	int			(*filter)(void *data, int data_idx, int *val);
 	void			*filter_data;
 	int			(*get_pendown_state)(void);
-	int			gpio_pendown;
+	struct gpio_desc	*gpio_pendown;
 
 	void			(*wait_for_sync)(void);
 };
@@ -223,7 +221,7 @@ static int get_pendown_state(struct ads7846 *ts)
 	if (ts->get_pendown_state)
 		return ts->get_pendown_state();
 
-	return !gpio_get_value(ts->gpio_pendown);
+	return !gpiod_get_value(ts->gpio_pendown);
 }
 
 static void ads7846_report_pen_up(struct ads7846 *ts)
@@ -989,8 +987,6 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 				 struct ads7846 *ts,
 				 const struct ads7846_platform_data *pdata)
 {
-	int err;
-
 	/*
 	 * REVISIT when the irq can be triggered active-low, or if for some
 	 * reason the touchscreen isn't hooked up, we don't need to access
@@ -999,25 +995,15 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 
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
@@ -1195,8 +1181,6 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
 	pdata->wakeup = of_property_read_bool(node, "wakeup-source") ||
 			of_property_read_bool(node, "linux,wakeup");
 
-	pdata->gpio_pendown = of_get_named_gpio(dev->of_node, "pendown-gpio", 0);
-
 	return pdata;
 }
 #else
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

