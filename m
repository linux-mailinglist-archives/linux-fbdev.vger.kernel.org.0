Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2785D538F02
	for <lists+linux-fbdev@lfdr.de>; Tue, 31 May 2022 12:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343541AbiEaKax (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 31 May 2022 06:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343543AbiEaKaq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 31 May 2022 06:30:46 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486249C2CB;
        Tue, 31 May 2022 03:30:33 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso2173468pjl.3;
        Tue, 31 May 2022 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gSHJ8cU7Tk4Hdo/isRqfWUjlGNskb5R2AVQxrPbbCvI=;
        b=SAX5OgGshyh0S7Q0P1G5oGCltp30E0lVS7VMHwVSGtJzobus0r+DSq4HZ9dVlccA//
         L7FsL/3Cc/4VWO1fCCTnIRfxF9dICs905OFUIaS8polL5LqvFba4ii/xGg5A3euqE/Gq
         hqwWt5bT8r53Ff+88JekCF8hEVqQz1OgUeKgug2ZTSS6z60EkuT3MgEBIhfMwptDimft
         m4KcPqMyGtnWFp1V1hFwZGTEHb0zBUzVFVKHmXVfjw0rT3dtM8EjbCEoeF7OaEyWl9uU
         bj8y9S3JytkJe6N7OsX3ScPNoaGUFC1mnMmYbbtgAa7FApCvVo6PwK0fou3Ruyx1w2eR
         zeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gSHJ8cU7Tk4Hdo/isRqfWUjlGNskb5R2AVQxrPbbCvI=;
        b=QQNkx7JCM4Q4UE4ah7KI11HkcNfjag2EGKFtWi2YQ0mVp9I2wyVOwCWfPtrZ4rjTYg
         xVZU8TkzuhkeRMzxOWevQUZeq1bE4ajEK1e4MdTWeovPiZYgzYNfHCN4V7H21Wdj3BRp
         UtCCQ4Jx4ntnkqilMUgo8K0O6E6NjYFGOcvr+6J4wz5/CaOO77LLROD1UAu1cuhHE3hO
         syeoYKSIV7nDrr43mycD5v9BPesI81R1HERMLU5Kye/niUQYZlLg3eU/W1miFRwiimma
         BtrYNmW2C4VqXv9EnRUjBtzIVAdVzt8ONYfoY+TMcXZlsdq15cGUJa1OVR5BYLrpL0WK
         iwyA==
X-Gm-Message-State: AOAM533iMdeuUhFXq1lG+WpyaEJGyUmbHGvCamLIQLlzdypQl9BLP4P2
        fUTr4iqZ//UKe24fvobnClg=
X-Google-Smtp-Source: ABdhPJxeJjnsS/OG2s2o/PBurv6FPum5YkGzaAOy+mj8Ht/7zT6NftWz5GABkl7zQzsb3ERmo9fwcA==
X-Received: by 2002:a17:90a:a085:b0:1e0:97ee:c263 with SMTP id r5-20020a17090aa08500b001e097eec263mr27994149pjp.110.1653993032769;
        Tue, 31 May 2022 03:30:32 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id c1-20020a63d501000000b003c14af50631sm10216519pgg.73.2022.05.31.03.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:30:32 -0700 (PDT)
From:   ChiaEn Wu <peterwu.pub@gmail.com>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de
Cc:     cy_huang@richtek.com, alice_chen@richtek.com,
        chiaen_wu@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 08/14] video: backlight: mt6370: Add Mediatek MT6370 support
Date:   Tue, 31 May 2022 18:28:03 +0800
Message-Id: <20220531102809.11976-9-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531102809.11976-1-peterwu.pub@gmail.com>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add Mediatek MT6370 Backlight support.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 drivers/video/backlight/Kconfig            |   8 +
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/mt6370-backlight.c | 338 +++++++++++++++++++++
 3 files changed, 347 insertions(+)
 create mode 100644 drivers/video/backlight/mt6370-backlight.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a003e02e13ce..d9868fbe7488 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -268,6 +268,14 @@ config BACKLIGHT_MAX8925
 	  If you have a LCD backlight connected to the WLED output of MAX8925
 	  WLED output, say Y here to enable this driver.
 
+config BACKLIGHT_MT6370
+	tristate "Mediatek MT6370 Backlight Driver"
+	depends on MFD_MT6370
+	help
+	  Say Y here to enable MT6370 Backlight support.
+	  It's commonly used to drive the display WLED. There're 4 channels
+	  inisde, and each channel can provide up to 30mA current.
+
 config BACKLIGHT_APPLE
 	tristate "Apple Backlight Driver"
 	depends on X86 && ACPI
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index cae2c83422ae..e815f3f1deff 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
+obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
 obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
new file mode 100644
index 000000000000..f8a8d33203ed
--- /dev/null
+++ b/drivers/video/backlight/mt6370-backlight.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define MT6370_REG_DEV_INFO		0x100
+#define MT6370_REG_BL_EN		0x1A0
+#define MT6370_REG_BL_BSTCTRL		0x1A1
+#define MT6370_REG_BL_PWM		0x1A2
+#define MT6370_REG_BL_DIM2		0x1A4
+
+#define MT6370_VENID_MASK		GENMASK(7, 4)
+#define MT6370_BL_EXT_EN_MASK		BIT(7)
+#define MT6370_BL_EN_MASK		BIT(6)
+#define MT6370_BL_CONFIG_MASK		BIT(0)
+#define MT6370_BL_CH_MASK		GENMASK(5, 2)
+#define MT6370_BL_DIM2_MASK		GENMASK(2, 0)
+#define MT6370_BL_DUMMY_6372_MASK	GENMASK(2, 0)
+#define MT6370_BL_DIM2_6372_SHIFT	3
+#define MT6370_BL_PWM_EN_MASK		BIT(7)
+#define MT6370_BL_PWM_HYS_EN_MASK	BIT(2)
+#define MT6370_BL_PWM_HYS_SEL_MASK	GENMASK(1, 0)
+#define MT6370_BL_OVP_EN_MASK		BIT(7)
+#define MT6370_BL_OVP_SEL_MASK		GENMASK(6, 5)
+#define MT6370_BL_OC_EN_MASK		BIT(3)
+#define MT6370_BL_OC_SEL_MASK		GENMASK(2, 1)
+
+#define MT6370_BL_MAX_BRIGHTNESS	2048
+
+enum {
+	MT6370_VID_COMMON = 0,
+	MT6370_VID_6372,
+	MT6370_VID_MAX,
+};
+
+enum mt6370_prop_type {
+	MT6370_PARSE_TYPE_BOOL = 0,
+	MT6370_PARSE_TYPE_U8,
+	MT6370_PARSE_TYPE_MAX,
+};
+
+struct mt6370_priv {
+	int vid_type;
+	struct backlight_device *bl;
+	struct device *dev;
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+};
+
+static int mt6370_bl_update_status(struct backlight_device *bl_dev)
+{
+	struct mt6370_priv *priv = bl_get_data(bl_dev);
+	int brightness = backlight_get_brightness(bl_dev);
+	unsigned int enable_val;
+	u8 brightness_val[2];
+	int ret;
+
+	if (brightness) {
+		brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
+		brightness_val[1] = (brightness - 1)
+					>> fls(MT6370_BL_DIM2_MASK);
+
+		if (priv->vid_type == MT6370_VID_6372) {
+			brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
+			brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
+		}
+
+		ret = regmap_raw_write(priv->regmap, MT6370_REG_BL_DIM2,
+				       brightness_val, sizeof(brightness_val));
+		if (ret)
+			return ret;
+	}
+
+	if (priv->enable_gpio)
+		gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);
+
+	enable_val = brightness ? MT6370_BL_EN_MASK : 0;
+	return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN,
+				  MT6370_BL_EN_MASK, enable_val);
+}
+
+static int mt6370_bl_get_brightness(struct backlight_device *bl_dev)
+{
+	struct mt6370_priv *priv = bl_get_data(bl_dev);
+	unsigned int enable;
+	u8 brightness_val[2];
+	int brightness, ret;
+
+	ret = regmap_read(priv->regmap, MT6370_REG_BL_EN, &enable);
+	if (ret)
+		return ret;
+
+	if (!(enable & MT6370_BL_EN_MASK))
+		return 0;
+
+	ret = regmap_raw_read(priv->regmap, MT6370_REG_BL_DIM2,
+			      brightness_val, sizeof(brightness_val));
+	if (ret)
+		return ret;
+
+	if (priv->vid_type == MT6370_VID_6372)
+		brightness_val[0] >>= MT6370_BL_DIM2_6372_SHIFT;
+
+	brightness = brightness_val[1] << fls(MT6370_BL_DIM2_MASK);
+	brightness += (brightness_val[0] & MT6370_BL_DIM2_MASK);
+
+	return brightness + 1;
+}
+
+static const struct backlight_ops mt6370_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = mt6370_bl_update_status,
+	.get_brightness = mt6370_bl_get_brightness,
+};
+
+#define MT6370_DT_PROP_DECL(_name, _type, _reg, _mask, _max, _inv)	\
+{									\
+	.name = "mediatek,bled-" #_name,				\
+	.type = MT6370_PARSE_TYPE_##_type,				\
+	.reg = _reg,							\
+	.mask = _mask,							\
+	.max_val = _max,						\
+	.invert = _inv,							\
+}
+
+static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
+					    struct backlight_properties *props)
+{
+	struct device *dev = priv->dev;
+	u8 prop_val;
+	u32 brightness;
+	unsigned int mask, val;
+	static const struct {
+		char *name;
+		enum mt6370_prop_type type;
+		unsigned int reg;
+		unsigned int mask;
+		u8 max_val;
+		bool invert;
+	} vendor_opt_props[] = {
+		MT6370_DT_PROP_DECL(pwm-enable, BOOL, MT6370_REG_BL_PWM,
+				    MT6370_BL_PWM_EN_MASK, 1, false),
+		MT6370_DT_PROP_DECL(pwm-hys-enable, BOOL, MT6370_REG_BL_PWM,
+				    MT6370_BL_PWM_HYS_EN_MASK, 1, false),
+		MT6370_DT_PROP_DECL(pwm-hys-sel, U8, MT6370_REG_BL_PWM,
+				    MT6370_BL_PWM_HYS_SEL_MASK, 3, false),
+		MT6370_DT_PROP_DECL(ovp-level-sel, U8, MT6370_REG_BL_BSTCTRL,
+				    MT6370_BL_OVP_SEL_MASK, 3, false),
+		MT6370_DT_PROP_DECL(ovp-shutdown, BOOL, MT6370_REG_BL_BSTCTRL,
+				    MT6370_BL_OVP_EN_MASK, 1, true),
+		MT6370_DT_PROP_DECL(ocp-level-sel, U8, MT6370_REG_BL_BSTCTRL,
+				    MT6370_BL_OC_SEL_MASK, 3, false),
+		MT6370_DT_PROP_DECL(ocp-shutdown, BOOL, MT6370_REG_BL_BSTCTRL,
+				    MT6370_BL_OC_EN_MASK, 1, true),
+	}, *prop_now;
+	int i, ret;
+
+	/* vendor optional properties */
+	for (i = 0; i < ARRAY_SIZE(vendor_opt_props); i++) {
+		prop_now = vendor_opt_props + i;
+
+		switch (prop_now->type) {
+		case MT6370_PARSE_TYPE_BOOL:
+			if (device_property_read_bool(dev, prop_now->name))
+				val = 1;
+			else
+				val = 0;
+			break;
+		case MT6370_PARSE_TYPE_U8:
+			ret = device_property_read_u8(dev, prop_now->name,
+						      &prop_val);
+			/* Property not exist, keep value in default */
+			if (ret)
+				continue;
+
+			val = min_t(u8, prop_val, prop_now->max_val);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (prop_now->invert)
+			val = prop_now->max_val - val;
+
+		val <<= ffs(prop_now->mask) - 1;
+
+		ret = regmap_update_bits(priv->regmap, prop_now->reg,
+					 prop_now->mask, val);
+		if (ret)
+			return ret;
+	}
+
+	/* common properties */
+	ret = device_property_read_u32(dev, "max-brightness", &brightness);
+	if (ret)
+		brightness = MT6370_BL_MAX_BRIGHTNESS;
+
+	props->max_brightness = min_t(u32, brightness,
+				      MT6370_BL_MAX_BRIGHTNESS);
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = props->max_brightness;
+
+	props->brightness = min_t(u32, brightness, props->max_brightness);
+
+
+	ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
+				      &prop_val);
+	if (ret) {
+		dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
+		return ret;
+	}
+
+	if (!prop_val) {
+		dev_err(dev, "No channel specified\n");
+		return -EINVAL;
+	}
+
+	mask = MT6370_BL_EXT_EN_MASK | MT6370_BL_CH_MASK;
+	val = prop_val << (ffs(MT6370_BL_CH_MASK) - 1);
+
+	if (priv->enable_gpio)
+		val |= MT6370_BL_EXT_EN_MASK;
+
+	return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN, mask, val);
+}
+
+static int mt6370_check_vendor_info(struct mt6370_priv *priv)
+{
+	unsigned int dev_info, vid;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &dev_info);
+	if (ret)
+		return ret;
+
+	vid = FIELD_GET(MT6370_VENID_MASK, dev_info);
+	if (vid == 0x9 || vid == 0xb)
+		priv->vid_type = MT6370_VID_6372;
+	else
+		priv->vid_type = MT6370_VID_COMMON;
+
+	return 0;
+}
+
+static int mt6370_bl_probe(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv;
+	struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.scale = BACKLIGHT_SCALE_LINEAR,
+	};
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap) {
+		dev_err(&pdev->dev, "Failed to get regmap\n");
+		return -ENODEV;
+	}
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to check vendor info (%d)\n", ret);
+		return ret;
+	}
+
+	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->enable_gpio)) {
+		dev_err(&pdev->dev, "Failed to get 'enable' gpio\n");
+		return PTR_ERR(priv->enable_gpio);
+	}
+
+	ret = mt6370_init_backlight_properties(priv, &props);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init backlight properties\n");
+		return ret;
+	}
+
+	priv->bl = devm_backlight_device_register(&pdev->dev, pdev->name,
+						  &pdev->dev, priv,
+						  &mt6370_bl_ops, &props);
+	if (IS_ERR(priv->bl)) {
+		dev_err(&pdev->dev, "Failed to register backlight\n");
+		return PTR_ERR(priv->bl);
+	}
+
+	backlight_update_status(priv->bl);
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static int mt6370_bl_remove(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv = platform_get_drvdata(pdev);
+	struct backlight_device *bl_dev = priv->bl;
+
+	bl_dev->props.brightness = 0;
+	backlight_update_status(priv->bl);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused mt6370_bl_of_match[] = {
+	{ .compatible = "mediatek,mt6370-backlight", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_bl_of_match);
+
+static struct platform_driver mt6370_bl_driver = {
+	.driver = {
+		.name = "mt6370-backlight",
+		.of_match_table = mt6370_bl_of_match,
+	},
+	.probe = mt6370_bl_probe,
+	.remove = mt6370_bl_remove,
+};
+module_platform_driver(mt6370_bl_driver);
+
+MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
+MODULE_DESCRIPTION("Mediatek MT6370 Backlight Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

