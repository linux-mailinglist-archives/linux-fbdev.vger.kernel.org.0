Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB322DD3A0
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Dec 2020 16:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgLQPCZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Dec 2020 10:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729038AbgLQPCJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Dec 2020 10:02:09 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2AAC0611CD;
        Thu, 17 Dec 2020 07:01:14 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id 11so19184719pfu.4;
        Thu, 17 Dec 2020 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+rkU+wTPks8mGex7CneP0KoGMUtaXEvQW+a/FZWhgH0=;
        b=NomBT5bJplK8om/UkF3SUxdTgRXV2dWxPp0wFbflZHjY+4ewKKX9LPqn6tR8A2H6pC
         IZl2lqeOAcwjuf5+sy1nEHHXiqFQkeA+GVc5cPs9IW14C4dXrtM0NFc2Wiqvm/Nx4oW5
         sCjOkVtCWyhyVGI1ljxRM/mpnGGoNE+xEGMC7zp0gSymGJkKGidBBAB369c4n0KKIAQU
         4nv6IAcXUChYAHQoBVDYwZj6f1yXCJun41dDIISnOU6lFa06UMwa7y2+NDtdcSucKxEf
         VTTqtXsqd08UKTUcG29UUCuTcsi3P22a5P/B2AalP1lzhJMe9wQlD6hjNMkd7EOr9vkR
         ngiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+rkU+wTPks8mGex7CneP0KoGMUtaXEvQW+a/FZWhgH0=;
        b=QgNVZqUOgKJL1aUpJfbHgBghigtS3+vKY9lxxsrN/o4dTwC2renO4P1Da3k628uRlm
         cXnKeFj1sDV+3L877Wq5qkZEuSuuGB/dgwOyd5AoJ6Jau0NfW9Gb9rYBAu2bHNm8W4S+
         9WYfsMsnN3uUBfcniZSjeOQOHPptA/NC4qu4DrKNR4298m+0sknFQylz8KWwjaMmwwgm
         Urk/NkisH74p7ZeqR33v45ZQ4gg/LNU3DE+J5KZSybzPki8MYb83XzZf1k1A7TgWqu/9
         j3WNsDM4/PNyOFmJBXT1IXdL0j735bJrLPtt866DzGvexr9e57DTocArUirWJNq0uX8z
         /wag==
X-Gm-Message-State: AOAM530Ntoq9Ge6R5UhchmFw0+Qx5Grtd6nGueFKbR/v7Wg55TLK3spe
        MA/ZxLXw6VJCa+uA1VLAZ6o=
X-Google-Smtp-Source: ABdhPJzjsmuY9Mybp+PcPxwixLrv9uwglmwk2qnNUYI4vTCLWwQ5GffE8QQ01lEJYMiVWnQs/C7AcA==
X-Received: by 2002:a62:764a:0:b029:19d:9fa8:5bc6 with SMTP id r71-20020a62764a0000b029019d9fa85bc6mr8558552pfc.76.1608217273317;
        Thu, 17 Dec 2020 07:01:13 -0800 (PST)
Received: from localhost.localdomain (1-171-2-187.dynamic-ip.hinet.net. [1.171.2.187])
        by smtp.gmail.com with ESMTPSA id o140sm6189074pfd.26.2020.12.17.07.01.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 07:01:12 -0800 (PST)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH v5 5/6] backlight: rt4831: Adds support for Richtek RT4831 backlight
Date:   Thu, 17 Dec 2020 23:00:43 +0800
Message-Id: <1608217244-314-5-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608217244-314-1-git-send-email-u0084500@gmail.com>
References: <1608217244-314-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Adds support for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/video/backlight/Kconfig            |   8 ++
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/rt4831-backlight.c | 219 +++++++++++++++++++++++++++++
 3 files changed, 228 insertions(+)
 create mode 100644 drivers/video/backlight/rt4831-backlight.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d83c87b..666bdb0 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -289,6 +289,14 @@ config BACKLIGHT_QCOM_WLED
 	  If you have the Qualcomm PMIC, say Y to enable a driver for the
 	  WLED block. Currently it supports PM8941 and PMI8998.
 
+config BACKLIGHT_RT4831
+	tristate "Richtek RT4831 Backlight Driver"
+	depends on MFD_RT4831
+	help
+	  This enables support for Richtek RT4831 Backlight driver.
+	  It's commont used to drive the display WLED. There're four channels
+	  inisde, and each channel can provide up to 30mA current.
+
 config BACKLIGHT_SAHARA
 	tristate "Tabletkiosk Sahara Touch-iT Backlight Driver"
 	depends on X86
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 685f3f1..cae2c83 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
 obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
 obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
 obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
+obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
 obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
 obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
 obj-$(CONFIG_BACKLIGHT_TOSA)		+= tosa_bl.o
diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
new file mode 100644
index 00000000..816c4d6
--- /dev/null
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <dt-bindings/leds/rt4831-backlight.h>
+#include <linux/backlight.h>
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define RT4831_REG_BLCFG	0x02
+#define RT4831_REG_BLDIML	0x04
+#define RT4831_REG_ENABLE	0x08
+
+#define BL_MAX_BRIGHTNESS	2048
+
+#define RT4831_BLOVP_MASK	GENMASK(7, 5)
+#define RT4831_BLOVP_SHIFT	5
+#define RT4831_BLPWMEN_MASK	BIT(0)
+#define RT4831_BLEN_MASK	BIT(4)
+#define RT4831_BLCH_MASK	GENMASK(3, 0)
+#define RT4831_BLDIML_MASK	GENMASK(2, 0)
+#define RT4831_BLDIMH_MASK	GENMASK(10, 3)
+#define RT4831_BLDIMH_SHIFT	3
+
+struct rt4831_priv {
+	struct regmap *regmap;
+	struct mutex lock;
+	struct backlight_device *bl;
+};
+
+static int rt4831_bl_update_status(struct backlight_device *bl_dev)
+{
+	struct rt4831_priv *priv = bl_get_data(bl_dev);
+	int brightness = backlight_get_brightness(bl_dev);
+	unsigned int enable = brightness ? RT4831_BLEN_MASK : 0;
+	u8 v[2];
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	if (brightness) {
+		v[0] = (brightness - 1) & RT4831_BLDIML_MASK;
+		v[1] = ((brightness - 1) & RT4831_BLDIMH_MASK) >> RT4831_BLDIMH_SHIFT;
+
+		ret = regmap_raw_write(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
+		if (ret)
+			goto unlock;
+	}
+
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLEN_MASK, enable);
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int rt4831_bl_get_brightness(struct backlight_device *bl_dev)
+{
+	struct rt4831_priv *priv = bl_get_data(bl_dev);
+	unsigned int val;
+	u8 v[2];
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_read(priv->regmap, RT4831_REG_ENABLE, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & RT4831_BLEN_MASK)) {
+		ret = 0;
+		goto unlock;
+	}
+
+	ret = regmap_raw_read(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
+	if (ret)
+		goto unlock;
+
+	ret = (v[1] << RT4831_BLDIMH_SHIFT) + (v[0] & RT4831_BLDIML_MASK) + 1;
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static const struct backlight_ops rt4831_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = rt4831_bl_update_status,
+	.get_brightness = rt4831_bl_get_brightness,
+};
+
+static int rt4831_init_device_properties(struct rt4831_priv *priv, struct device *dev,
+					  struct backlight_properties *bl_props)
+{
+	u8 propval;
+	u32 brightness;
+	unsigned int val = 0;
+	int ret;
+
+	/* common properties */
+	ret = device_property_read_u32(dev, "max-brightness", &brightness);
+	if (ret) {
+		dev_warn(dev, "max-brightness DT property missing, use HW max as default\n");
+		brightness = BL_MAX_BRIGHTNESS;
+	}
+
+	bl_props->max_brightness = min_t(u32, brightness, BL_MAX_BRIGHTNESS);
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret) {
+		dev_warn(dev, "default-brightness DT property missing, use max limit as default\n");
+		brightness = bl_props->max_brightness;
+	}
+
+	bl_props->brightness = min_t(u32, brightness, bl_props->max_brightness);
+
+	/* vendor properties */
+	if (device_property_read_bool(dev, "richtek,pwm-enable"))
+		val = RT4831_BLPWMEN_MASK;
+
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLPWMEN_MASK, val);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u8(dev, "richtek,bled-ovp-sel", &propval);
+	if (ret) {
+		dev_warn(dev, "richtek,bled-ovp-sel DT property missing, use default 21V\n");
+		propval = RT4831_BLOVPLVL_21V;
+	}
+
+	propval = min_t(u8, propval, RT4831_BLOVPLVL_29V);
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLOVP_MASK,
+				 propval << RT4831_BLOVP_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
+	if (ret) {
+		dev_err(dev, "richtek,channel-use DT property missing\n");
+		return ret;
+	}
+
+	if (!(propval & RT4831_BLCH_MASK)) {
+		dev_err(dev, "No channel specified\n");
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLCH_MASK, propval);
+}
+
+static int rt4831_bl_probe(struct platform_device *pdev)
+{
+	struct rt4831_priv *priv;
+	struct backlight_properties bl_props = { .type = BACKLIGHT_RAW, };
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (IS_ERR(priv->regmap)) {
+		dev_err(&pdev->dev, "Failed to init regmap\n");
+		return PTR_ERR(priv->regmap);
+	}
+
+	ret = rt4831_init_device_properties(priv, &pdev->dev, &bl_props);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init device properties\n");
+		return ret;
+	}
+
+	priv->bl = devm_backlight_device_register(&pdev->dev, pdev->name, &pdev->dev, priv,
+						  &rt4831_bl_ops, &bl_props);
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
+static int rt4831_bl_remove(struct platform_device *pdev)
+{
+	struct rt4831_priv *priv = platform_get_drvdata(pdev);
+	struct backlight_device *bl_dev = priv->bl;
+
+	bl_dev->props.brightness = 0;
+	backlight_update_status(priv->bl);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
+	{ .compatible = "richtek,rt4831-backlight", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt4831_bl_of_match);
+
+static struct platform_driver rt4831_bl_driver = {
+	.driver = {
+		.name = "rt4831-backlight",
+		.of_match_table = rt4831_bl_of_match,
+	},
+	.probe = rt4831_bl_probe,
+	.remove = rt4831_bl_remove,
+};
+module_platform_driver(rt4831_bl_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

