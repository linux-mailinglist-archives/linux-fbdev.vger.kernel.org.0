Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11218A5649
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 14:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbfIBMf3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 08:35:29 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55180 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730428AbfIBMe4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 08:34:56 -0400
Received: by mail-wm1-f68.google.com with SMTP id k2so12966089wmj.4
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BL5f9WSqt28IVM1CG9ys+RYTknuQ0t6Rc6b4s1XAIZ8=;
        b=rmo8A0Zr2T09cfLgGzsV0Bv0DY26U1tZoxBktgQg61gBBmcsgf7oBMC/JOqQUap7Vr
         Uxva4NKecBHq/4m6i7sdpbgu9CI/K679poVQjtDoeCzgT5Xwq3/1QcXUFf45+7bqRLq0
         5CWLZLS4Vo1G3nUG1Xy9F9n9c4fynoLJZ/gE2KF3ZzwPFqw+sqwr/oBrrmloN/rnvkYi
         FkiGssbjvpCHYHWKU7uc2oxFkuZoOnZSh0Z6GOzJDmo8qYyOOEE2egU0TFImJ0P2qM7o
         eJaMEOjRkIzClQMCPKD/6LrBRaq8w4DAG5pvwgy+nuK+le1fggH+IeILoFvaKyujzQwV
         Md3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BL5f9WSqt28IVM1CG9ys+RYTknuQ0t6Rc6b4s1XAIZ8=;
        b=kUukURzwk+GdPVDDMcEQWo8MlXNZFfWASYdSnqJvZV4hLUQXYhq8Wkr+EIxualTNjk
         PAOYsN4Lz1yscVU8FfB+bhXErHr55UcYOqOWp8f33LwPkKndqTQYJIXk0sb26RPixL0C
         rbnwCQcbRw1tJsaAjxgWxXHJamdfW4AH0MsKwTRtq1oKA+0UjZPEbLyk17u/b4yVK/2f
         ueJ+9K+EIepP0tz4a/Pc+yZdsGuYhLaVhP9jKFq6uWmcwKn/T6MDQYmw1lsVsmc4icGT
         oEEuapGrN/wy036am9Er7HRp8FNYOpMU42CU6pek3YTeF51LWvjXFSrluWO31qCgfxzR
         RGNA==
X-Gm-Message-State: APjAAAWacSQ37lddrEFPqOSwPcmDxVVHaCtReX4sdrsay1Ze2KLMsFkR
        dnGoni+h9IxMACQAUdEB5EU1BQ==
X-Google-Smtp-Source: APXvYqw1vz/mtFNdoDGOV50/DImERrrRBV3tvDbaoTe+05TZiaB3djOsEA+nb+UY0M6oucgCg7AZUQ==
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr19669113wmr.30.1567427695064;
        Mon, 02 Sep 2019 05:34:55 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:34:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 2/7] backlight: gpio: simplify the platform data handling
Date:   Mon,  2 Sep 2019 14:34:39 +0200
Message-Id: <20190902123444.19924-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
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
 drivers/video/backlight/gpio_backlight.c | 64 +++++-------------------
 1 file changed, 13 insertions(+), 51 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index e84f3087e29f..01262186fa1e 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -55,30 +55,6 @@ static const struct backlight_ops gpio_backlight_ops = {
 	.check_fb	= gpio_backlight_check_fb,
 };
 
-static int gpio_backlight_probe_dt(struct platform_device *pdev,
-				   struct gpio_backlight *gbl)
-{
-	struct device *dev = &pdev->dev;
-	enum gpiod_flags flags;
-	int ret;
-
-	gbl->def_value = device_property_read_bool(dev, "default-on");
-	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
-
-	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
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
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct gpio_backlight_platform_data *pdata =
@@ -86,6 +62,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
+	enum gpiod_flags flags;
 	int ret;
 
 	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
@@ -94,35 +71,20 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
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
+
+	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
+	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
+	if (IS_ERR(gbl->gpiod)) {
+		ret = PTR_ERR(gbl->gpiod);
+		if (ret != -EPROBE_DEFER) {
+			dev_err(&pdev->dev,
+				"Error: The gpios parameter is missing or invalid.\n");
 		}
-		gbl->gpiod = gpio_to_desc(pdata->gpio);
-		if (!gbl->gpiod)
-			return -EINVAL;
-	} else {
-		dev_err(&pdev->dev,
-			"failed to find platform data or device tree node.\n");
-		return -ENODEV;
+		return ret;
 	}
 
 	memset(&props, 0, sizeof(props));
-- 
2.21.0

