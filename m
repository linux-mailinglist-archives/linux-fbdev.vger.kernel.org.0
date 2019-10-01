Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2672CC350E
	for <lists+linux-fbdev@lfdr.de>; Tue,  1 Oct 2019 15:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388238AbfJAM7n (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 1 Oct 2019 08:59:43 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33986 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388192AbfJAM7f (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 1 Oct 2019 08:59:35 -0400
Received: by mail-wm1-f67.google.com with SMTP id y135so2479492wmc.1
        for <linux-fbdev@vger.kernel.org>; Tue, 01 Oct 2019 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AptOB7aQMzupkvqKi0d1i4i7uXh0E5N7gRvX5FWeAOU=;
        b=Mj8KL/3yO/+8pQR6hKmMxjehp8UsaQmJXB+50w4JFC0Jbpw/bv2KHHtQqu6BYcbZ0s
         GnstolGS0HMZooKY2nCYemYIsdaW8nlkyXolNB7aBZ2wQgg3+tC6mtqu6pxs7bjcCWXy
         7cPPNplvd38z+flfRXABRtkSJsSPiN7w4B2Z5mXYR4SNSpvQjEYEP05z6/up9NkcTA3h
         r36ddCNTZVeEErft7TF+UYk0jwcNEJCYfaFm1PMfMF+x+dFlzVYdG6Dlz00VIYzPoksO
         1NiE+Kx8avaQAi9fzsQecRgxXfikJ7hT2QJFzwEMqauBQWPwUJyenh0Ni5myYPeN0+5a
         veOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AptOB7aQMzupkvqKi0d1i4i7uXh0E5N7gRvX5FWeAOU=;
        b=HTI6xZKL/bP86eHf06Xov5lrYyZhEHY3HY/d0g0itPkMBevk0yyhgP9pvEUU4GgSql
         iPRQfFDtC7+wusTufcbPI6+GhAPNopFpxZt0LJdaVAi+LmbbEeYNsPYleM9CAq9KLdQr
         d3drt89e9EVTesVNOko5akd1SUnJJKQ/jakRZMZHRQgomi2JC5UZaLl77lPNHVpjg2O7
         yVGhxX/+Z/A2ChRyOXVIn2SUBsbSbwG2oAb0rIOwG+qISeMcbR/DsN+QC+6ki9f834I3
         +CZpbVG52MbSdTu7wAI2pxGMi2K2kIMPzqWaT8ObWWrmsDvNj2+vsyjDCVBoVuUs3xOX
         KKKA==
X-Gm-Message-State: APjAAAUPyA9tl7Y14byrrfrxoOuEB0ljQ/tmdcnC/bxd2rrevIEg8+Qv
        XpGNq5SZyIumgG3Azz/m/53sog==
X-Google-Smtp-Source: APXvYqx3q+9sUGs6+xirhCygiJCG0L1MJfnhI1dmSdWZ8G1s1CHPmFRdObGuXQg/gt02Yp/yvI/WGg==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr3594356wmc.141.1569934773015;
        Tue, 01 Oct 2019 05:59:33 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 05:59:32 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 7/7] backlight: gpio: pull gpio_backlight_initial_power_state() into probe
Date:   Tue,  1 Oct 2019 14:58:37 +0200
Message-Id: <20191001125837.4472-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The probe function in the gpio-backlight driver is quite short. If we
pull gpio_backlight_initial_power_state() into probe we can drop two
more fields from struct gpio_backlight and shrink the driver code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 36 ++++++++----------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 6247687b6330..37ec184f0c5c 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -17,11 +17,8 @@
 #include <linux/slab.h>
 
 struct gpio_backlight {
-	struct device *dev;
 	struct device *fbdev;
-
 	struct gpio_desc *gpiod;
-	int def_value;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
@@ -53,41 +50,24 @@ static const struct backlight_ops gpio_backlight_ops = {
 	.check_fb	= gpio_backlight_check_fb,
 };
 
-static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
-{
-	struct device_node *node = gbl->dev->of_node;
-
-	/* Not booted with device tree or no phandle link to the node */
-	if (!node || !node->phandle)
-		return gbl->def_value ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-
-	/* if the enable GPIO is disabled, do not enable the backlight */
-	if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		return FB_BLANK_POWERDOWN;
-
-	return FB_BLANK_UNBLANK;
-}
-
-
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
+	struct device_node *of_node = dev->of_node;
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
-	int ret;
+	int ret, def_value;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
 		return -ENOMEM;
 
-	gbl->dev = dev;
-
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-	gbl->def_value = device_property_read_bool(dev, "default-on");
+	def_value = device_property_read_bool(dev, "default-on");
 
 	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
 	if (IS_ERR(gbl->gpiod)) {
@@ -109,7 +89,15 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return PTR_ERR(bl);
 	}
 
-	bl->props.power = gpio_backlight_initial_power_state(gbl);
+	/* Not booted with device tree or no phandle link to the node */
+	if (!of_node || !of_node->phandle)
+		bl->props.power = def_value ? FB_BLANK_UNBLANK
+					    : FB_BLANK_POWERDOWN;
+	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
+		bl->props.power = FB_BLANK_POWERDOWN;
+	else
+		bl->props.power = FB_BLANK_UNBLANK;
+
 	bl->props.brightness = 1;
 
 	backlight_update_status(bl);
-- 
2.23.0

