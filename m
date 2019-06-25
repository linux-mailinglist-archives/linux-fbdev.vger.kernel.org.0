Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37000554A8
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 18:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729664AbfFYQe5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 12:34:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41774 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbfFYQe4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 12:34:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so18613600wrm.8
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jHnEFpHn7uzznoO3/dgHPquJFVDhGL7Sa3AB/IK/o8=;
        b=hn0sJGMrU38ycKfPEcke4oemjMf5nF19She6rrogMdb5v0F2pBQBNKFb+k/+2MJbvv
         x0AL7iJN38li9VNodfle2pG9gu9d2FJ3tvO7WCdfFllzJdndvifHLTLjRDM4aDml+Kuj
         ARXR5bllOgDLUQO3pl4c5PKCRuEuqrBRd/sgqgOD1M5Honf1Q9rxMnOT9Gtrbba1Pc6q
         WCixZR6JX0xgDU+5eMlm3aDNlNwAqfajTgyiKEnyZ2eYijvvzNfmrix4ZFYvnBzoboQW
         vWSvbCOsW9ZdQYXrDXj4UOEBCHTBJKcTLpDkXcvPZbiDAcrZsqeJshpkE3iV/v/oMDyN
         QHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jHnEFpHn7uzznoO3/dgHPquJFVDhGL7Sa3AB/IK/o8=;
        b=VlDgZ+dPG6sAOBGOYdhmbBUkXk1wOBadVVevPf3xirxQEvM0VV8CDpqcVjAadpgrhg
         pkgdh6G31FVS6CyptknpxjfaHvPEcnFLqwPQJbrlEs+gWDCRSNQmZMW4USi5MKQX+xWZ
         BRpBQv/uNS1VShctEPet5GgNNZfVN4ZEo+jIoTlvtREPaRAcpc7tczSHpN2Ki0RD/Woy
         OrX3ZhkXA3NNr0y8/1tbVPvy4vsWBB9FTAKc/4dBxEy5N/8QMPrIbNMDehQG57YtIFsc
         xk+sSm9zI0CcrQ6EQEHOTIcUfbqnH9hM7NUmnFCRb7QGMXEolo+j5jej3R6b6of/cvIc
         EiRw==
X-Gm-Message-State: APjAAAUIFSQr3qssFRUClojdS6wbtbelhbKnulYQkWRDMXbG4FXKC1MY
        JXO42IabXiDE9BAT/OJakEG5ig==
X-Google-Smtp-Source: APXvYqwy7zacb5a2dIAzBH+DNPJmE7Ud9HzGmZ8XgxvKZbiQHoYeDIvLxGo471H1Sy/xZiRyc+Eftg==
X-Received: by 2002:a5d:4fc8:: with SMTP id h8mr26465755wrw.124.1561480495518;
        Tue, 25 Jun 2019 09:34:55 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 09:34:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 03/12] backlight: gpio: pull the non-pdata device probing code into probe()
Date:   Tue, 25 Jun 2019 18:34:25 +0200
Message-Id: <20190625163434.13620-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's no good reason to have the generic probing code in a separate
routine. This function is short and is inlined by the compiler anyway.
Move it into probe under the pdata-specific part.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 39 ++++++++----------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 8adbc8d75097..89e10bccfd3c 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -54,30 +54,6 @@ static const struct backlight_ops gpio_backlight_ops = {
 	.check_fb	= gpio_backlight_check_fb,
 };
 
-static int gpio_backlight_probe_prop(struct platform_device *pdev,
-				     struct gpio_backlight *gbl)
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
 	struct device *dev = &pdev->dev;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
+	enum gpiod_flags flags;
 	int ret;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
@@ -116,9 +93,19 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		if (!gbl->gpiod)
 			return -EINVAL;
 	} else {
-		ret = gpio_backlight_probe_prop(pdev, gbl);
-		if (ret)
+		gbl->def_value = device_property_read_bool(dev, "default-on");
+		flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+		gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
+		if (IS_ERR(gbl->gpiod)) {
+			ret = PTR_ERR(gbl->gpiod);
+
+			if (ret != -EPROBE_DEFER) {
+				dev_err(dev,
+					"Error: The gpios parameter is missing or invalid.\n");
+			}
 			return ret;
+		}
 	}
 
 	memset(&props, 0, sizeof(props));
-- 
2.21.0

