Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286D45548F
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 18:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbfFYQe5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 12:34:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44006 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbfFYQe4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 12:34:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so18609968wru.10
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8iezztZquUE7VOJu2VvhRUb2IfrZ8cIwgoI4gm0DrkM=;
        b=rgxXlRAaV6xZXnZFHal/gjCfi7ThDBTYi4zQlerr90dKuypsYo0mb+p33lydeL4eKn
         2Cg8TDpnk1TQyWRPgE7auXmAdnsrV7xq0CkHwBoS14Z8stdjg5sO1sgEu4CXM0obe8GT
         HtDtgDT/yuWJ/6FSenaU3s3kQIgEWAOjiCDWUhU8Pfhoj3WCpQG547MgKdHM7a0QE2ml
         oMYIbV67RK1VeetSwtj5yG0Sb0iifz24h/amsfYK1tn89rbBjiyJy6Dq7HfJ6k7U1O2X
         NjWCVLOG8O2PA2zG7LLOXV9LLX5jw93wHA6dgCylVM+dJAI+sj7QPNmJX6O7U4MR7nGO
         8GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8iezztZquUE7VOJu2VvhRUb2IfrZ8cIwgoI4gm0DrkM=;
        b=ptWERHL9kkdarVWvL3hKnPvr1x81boWC5pzCZpy+IUbQJKbkg8Y8pq3HHBoKQAu5bt
         N2npny8A7LiQpSZcak/kJxDCm5wlCISbXA7j6wbYcCtFmptvCxiJ2os98E2hsv2JQFvO
         H9u4ja6jcNY59Xww8ZcPrUI9Jjw4QpH44bzhzomsZr4NY4qEwZOXG6K9DCQ0ECPpAYzZ
         ZXDYM5Rv8Bd+y0Op9nXVekIwhE0vwSsqi0wV1tYzTvIYV3JuQd9YjNUHVclCpYW8Dx9g
         JEYvyETCIRcMIJOSjuS21GJmYE/JvG1FntC3mrnW/HrddtkReTtQKhkCBATJTjj6gom9
         KWHA==
X-Gm-Message-State: APjAAAWnzelSXFQdfzb2ZEu+3nNbe4ffJDj24HCRBNzVNf4WSl8gUpBJ
        PPHVkWqxP7TpTVEWMZW0COfZ5A==
X-Google-Smtp-Source: APXvYqzDDJRCAp4r9gihTWEjB9YUiMxhVdwQYB5zhog7hsqmsGPPt4gRXpZAivYIHwx1NdMTVydW+w==
X-Received: by 2002:adf:81c8:: with SMTP id 66mr110996508wra.261.1561480494146;
        Tue, 25 Jun 2019 09:34:54 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 09:34:53 -0700 (PDT)
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
Subject: [PATCH 02/12] backlight: gpio: use a helper variable for &pdev->dev
Date:   Tue, 25 Jun 2019 18:34:24 +0200
Message-Id: <20190625163434.13620-3-brgl@bgdev.pl>
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

Instead of dereferencing pdev each time, use a helper variable for
the associated device pointer.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 654c19d3a81d..8adbc8d75097 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -83,15 +83,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct gpio_backlight_platform_data *pdata =
 		dev_get_platdata(&pdev->dev);
 	struct backlight_properties props;
+	struct device *dev = &pdev->dev;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret;
 
-	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
+	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
 		return -ENOMEM;
 
-	gbl->dev = &pdev->dev;
+	gbl->dev = dev;
 
 	if (pdata) {
 		/*
@@ -108,7 +109,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		ret = devm_gpio_request_one(gbl->dev, pdata->gpio, flags,
 					    pdata ? pdata->name : "backlight");
 		if (ret < 0) {
-			dev_err(&pdev->dev, "unable to request GPIO\n");
+			dev_err(dev, "unable to request GPIO\n");
 			return ret;
 		}
 		gbl->gpiod = gpio_to_desc(pdata->gpio);
@@ -123,11 +124,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = 1;
-	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
-					&pdev->dev, gbl, &gpio_backlight_ops,
-					&props);
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
+					    &gpio_backlight_ops, &props);
 	if (IS_ERR(bl)) {
-		dev_err(&pdev->dev, "failed to register backlight\n");
+		dev_err(dev, "failed to register backlight\n");
 		return PTR_ERR(bl);
 	}
 
-- 
2.21.0

