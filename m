Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B70CDABB
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2019 05:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfJGDcJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 6 Oct 2019 23:32:09 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44832 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbfJGDcJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 6 Oct 2019 23:32:09 -0400
Received: by mail-pg1-f196.google.com with SMTP id i14so7299047pgt.11
        for <linux-fbdev@vger.kernel.org>; Sun, 06 Oct 2019 20:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nGttCXCUTufQ00gCZ8QmnQ1I5lZpZkhALPcK59Skk0o=;
        b=QaDNsl3lPwrys6+c19cQUZfN0xEVA2hqhmRXa+jPGCf/gwFHbGVgNlFNFZLRqm4hnC
         oqAvQl6hnUUr6+BTy5Q7rxw5MxVik5BNrTgF/4EFIOC+3QpNGOgammIc3qALq9oXw1Vc
         P0vcG8uL3K5yRSciO/VHo0q/sa4MJIvXWsyYNAMV+kfB4aoB9T6LGYYA5I/mPkAQ/+h3
         TdglHQdO7nLnEwp6nVMd0wbNwb0vmW7KlgL7gzsugljN1hSSqvG4kw3cJEzS/4GqRnG9
         4YatOb+M1flLT7qU31ciQFAinvCoH5QW6JLWmcZnjf8Ou78XdpP0AsUWmmkbD13Iv5Tk
         g8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nGttCXCUTufQ00gCZ8QmnQ1I5lZpZkhALPcK59Skk0o=;
        b=AX3iIte11jBwBg2KANQMdZc6U6iFt59rS0T0w80EJbVNhZg7VdATgyNXr1y6aOsiZu
         gkN6/7hKtNixohIt78nOljh+iXS6JNau/4xRhxazse8XwRutHjU7qWNbtk6Cpo9S/8F7
         07C1qx6EJMRjP5gMc8rGiB9tXLnFOlPm0horLnWA5obvhuAF+0RlLzt7kkFJ4cWHb8vb
         g1hW79zKcUejcfTidvDihWoBMSPjA6oeSl3pDXoiEnt1g2k71JmD0llDQ6XLTzE5Ub0t
         QGF6dXiamswzvZ1kFfu6x3c6/Iklp1bTKu7pNqntA0pyP+6YLyx2J8DBdhSrEiYMCIC1
         n8EQ==
X-Gm-Message-State: APjAAAU85nOk1lwV2tOBFCp7MvhDwGGMq+Ue2uqtXLSWfIb19S0ow3FT
        y/3DWtbqz/SK+ljSlDKUtsoWog==
X-Google-Smtp-Source: APXvYqx76nXvhspQY2IMt3FPcRnICCEPJ2Mzepztm3g6/xdrNMu+Cnj8pAQbJAyORrvFBRAd3/uLNw==
X-Received: by 2002:a17:90a:8001:: with SMTP id b1mr32016772pjn.56.1570419127187;
        Sun, 06 Oct 2019 20:32:07 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:06 -0700 (PDT)
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
Subject: [PATCH v5 3/7] backlight: gpio: simplify the platform data handling
Date:   Mon,  7 Oct 2019 05:31:56 +0200
Message-Id: <20191007033200.13443-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Now that the last user of platform data (sh ecovec24) defines a proper
GPIO lookup and sets the 'default-on' device property, we can drop the
platform_data-specific GPIO handling and unify a big chunk of code.

The only field used from the platform data is now the fbdev pointer.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 62 +++++-------------------
 1 file changed, 11 insertions(+), 51 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 7e1990199fae..20c5311c7ed2 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -6,7 +6,6 @@
 #include <linux/backlight.h>
 #include <linux/err.h>
 #include <linux/fb.h>
-#include <linux/gpio.h> /* Only for legacy support */
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -54,28 +53,6 @@ static const struct backlight_ops gpio_backlight_ops = {
 	.check_fb	= gpio_backlight_check_fb,
 };
 
-static int gpio_backlight_probe_dt(struct platform_device *pdev,
-				   struct gpio_backlight *gbl)
-{
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	gbl->def_value = device_property_read_bool(dev, "default-on");
-
-	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod)) {
-		ret = PTR_ERR(gbl->gpiod);
-
-		if (ret != -EPROBE_DEFER) {
-			dev_err(dev,
-				"Error: The gpios parameter is missing or invalid.\n");
-		}
-		return ret;
-	}
-
-	return 0;
-}
-
 static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
 {
 	struct device_node *node = gbl->dev->of_node;
@@ -107,35 +84,18 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
 	gbl->dev = &pdev->dev;
 
-	if (pdev->dev.fwnode) {
-		ret = gpio_backlight_probe_dt(pdev, gbl);
-		if (ret)
-			return ret;
-	} else if (pdata) {
-		/*
-		 * Legacy platform data GPIO retrieveal. Do not expand
-		 * the use of this code path, currently only used by one
-		 * SH board.
-		 */
-		unsigned long flags = GPIOF_DIR_OUT;
-
+	if (pdata)
 		gbl->fbdev = pdata->fbdev;
-		gbl->def_value = pdata->def_value;
-		flags |= gbl->def_value ? GPIOF_INIT_HIGH : GPIOF_INIT_LOW;
-
-		ret = devm_gpio_request_one(gbl->dev, pdata->gpio, flags,
-					    pdata ? pdata->name : "backlight");
-		if (ret < 0) {
-			dev_err(&pdev->dev, "unable to request GPIO\n");
-			return ret;
-		}
-		gbl->gpiod = gpio_to_desc(pdata->gpio);
-		if (!gbl->gpiod)
-			return -EINVAL;
-	} else {
-		dev_err(&pdev->dev,
-			"failed to find platform data or device tree node.\n");
-		return -ENODEV;
+
+	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
+
+	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
+	if (IS_ERR(gbl->gpiod)) {
+		ret = PTR_ERR(gbl->gpiod);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Error: The gpios parameter is missing or invalid.\n");
+		return ret;
 	}
 
 	memset(&props, 0, sizeof(props));
-- 
2.23.0

