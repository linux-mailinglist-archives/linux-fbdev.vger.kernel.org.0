Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4D7DFFA1
	for <lists+linux-fbdev@lfdr.de>; Tue, 22 Oct 2019 10:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731344AbfJVIhH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 22 Oct 2019 04:37:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38579 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388407AbfJVIgo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 22 Oct 2019 04:36:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id v9so5744358wrq.5
        for <linux-fbdev@vger.kernel.org>; Tue, 22 Oct 2019 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvQLRHJvRjudaJXCpLtV7CQx5y9VARSzzzMBbffwoBQ=;
        b=R0kpfQV0jZYq2r/gSdB59v/D7Ky/qC7QBaqd8jFL5iqpVaB7HbudHuRs3k/Du5yZrv
         RtLp9RXnK3Ac6JBmGc61233Jzc3czDf1nZkMp74sB5QkgfhDFSpXYx4SG6FF6KNOAcvK
         /xnwnzv9ysxeUNTqHWANmB+wu32P67SBprPLFSGNL0FSwskPlqDpo/ZF5YXHYp77tP89
         ruPFvimpaR67SUNYOCzZLwoadfWEfB1p5iS/pd3brQsJSi7qoQpOZFfXaEzQTRwn+V6Z
         JPHXS9Y72JOkuFLWYupTjAv/kuwlsgyMZ9/CdzY8lCwE8KVEsY8bW6MoCWUxYQsh6ztg
         9TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvQLRHJvRjudaJXCpLtV7CQx5y9VARSzzzMBbffwoBQ=;
        b=pPOEPWpaCeRV2H39EUfkQ8B0tlcMFq0b04PIjoi9VJFzZZ7QhDXABXEkS8M4u7ERPF
         AVw/a0si20nsEiXz8dIklKjJrFvXhfOPOfXKY8Ss+WyfwTajZrzLqQe+2ouhiV5Ug7Z6
         D2j+6kOhKZxqRMjutPIlCeXBBBU7DYZNrOXx5rkDI0caRp4oaaiWViWBqk9mhSBnbtZt
         rGphs2ZIbTCBk+AdnFqxwlbKrQjrJ1qc7OUpfttsoxY2oqZjPgvotlrBRI8dZejXQUsC
         xMAS7r5ohDYQgApetAFFtyhGaM5oH1u0zJypvyHnVNnzecVZVgNZY3/FV2b1/+0HxEz6
         3FHg==
X-Gm-Message-State: APjAAAVNg3UAgX7wGdC0boJ9YO8+Q2Mlm4zzD576Gps2rC/vw//zuSYS
        jHRJZw+oM/bS5vEtvHxgPoECdA==
X-Google-Smtp-Source: APXvYqyaselYLV/0dnxVgvDBqTCkwoVW8/nREL08BhLjGuMEQBFszR2zj3NmBAPYQD7CNxTVF2VrFw==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr2450846wrr.50.1571733401978;
        Tue, 22 Oct 2019 01:36:41 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:41 -0700 (PDT)
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
Subject: [PATCH v7 5/9] backlight: gpio: simplify the platform data handling
Date:   Tue, 22 Oct 2019 10:36:26 +0200
Message-Id: <20191022083630.28175-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
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
index 52f17c9ca1c3..ddc7d3b288b7 100644
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
@@ -61,28 +60,6 @@ static const struct backlight_ops gpio_backlight_ops = {
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
@@ -114,35 +91,18 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
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

