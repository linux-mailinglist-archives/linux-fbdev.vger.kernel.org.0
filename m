Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51AA9C3501
	for <lists+linux-fbdev@lfdr.de>; Tue,  1 Oct 2019 15:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbfJAM7a (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 1 Oct 2019 08:59:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56111 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731525AbfJAM7a (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 1 Oct 2019 08:59:30 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so3249537wma.5
        for <linux-fbdev@vger.kernel.org>; Tue, 01 Oct 2019 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nGttCXCUTufQ00gCZ8QmnQ1I5lZpZkhALPcK59Skk0o=;
        b=CR4mylBDvabRsnJyFLvfQuwlbTsLZHGhqJDX0HPm0mhoLZVxQ42o7FtsNXVg2Pmsgx
         RirqoDxIhL4tDPxtnaxCQkKxSMqhBVk3NvyuL8OAJr3xo4NE7wYRKAzDzTceS3TF0TtA
         PWxgYaKrs+Y9dqNAx1N5AyWCtRYMT6ZjdCV76BJDjKGH3zLgLK11oi1IZtSHNb+ma8Js
         52GxsUdgcHz7xxMTbwUgS5GYHBIIVBe6a9iYERBh/cs1ESl55nYD354w2399AkGbggAg
         fPcfm7bjCeSQVb4WFALBXk7TPK9jKgEaPc3lQw4dw6UwMtPfiTY3p9EZ2G9OSXUjTKyc
         WYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nGttCXCUTufQ00gCZ8QmnQ1I5lZpZkhALPcK59Skk0o=;
        b=nIbOk0u0VONVvv9iFjHyHibjCOONyBCa0os/0iWe5YiyijVSJKr5YecxZlyvBXsht4
         ZGCJ3LOigY2QD/PG7o898QpIrejU0G/MofX1R1CisaKVSBlWfFURLkdU0pX/jUli+wyX
         Qyku0/dJlOz0vTGfLc5HxNaGzA670n6eau9Ggw+y3wrPLE3k8SoXesaYVb7j09fP7ufu
         /rdDrboD9oHkdu+3VkAyslTsacs8neqySWViZHaxrOBworbFWEe5yc7zwOOe/BnszMBm
         fU7sqmZ8EAx8igXBq5eCleyeuVVN4jDntjZkR2rQOTI/wYokVSuAHeaydXGLgkF83d9m
         muVQ==
X-Gm-Message-State: APjAAAUCeBCZ1VhJF6T98+o/dwN6oBYQir/ekI0bNfVPMXq7Jg+MIgeI
        /DbMAE4IrMR2jGNWl3zO4mojFw==
X-Google-Smtp-Source: APXvYqxR+llEJjcoi/dh5DVxC10vO0JHcmRwgdjQ8CYrRqFv39W4KCq2x6vDAxkeNNTIhgb4BNbykg==
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr3846704wml.14.1569934768770;
        Tue, 01 Oct 2019 05:59:28 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 05:59:28 -0700 (PDT)
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
Subject: [PATCH v4 3/7] backlight: gpio: simplify the platform data handling
Date:   Tue,  1 Oct 2019 14:58:33 +0200
Message-Id: <20191001125837.4472-4-brgl@bgdev.pl>
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

