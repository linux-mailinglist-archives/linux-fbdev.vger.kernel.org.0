Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7B9554A6
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 18:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfFYQe4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 12:34:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34816 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbfFYQez (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 12:34:55 -0400
Received: by mail-wr1-f65.google.com with SMTP id f15so8742922wrp.2
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ZSWbqFAdYMHZSBHSRb1jfufvzOhyuDcLok5vmyDpAk=;
        b=SJOSCbrBbZkjOqrPgnuNAn3R5vfXS6muglF3i2rYm4u0+9MfY8ZtiyCWhaoSYkXO8w
         eOFkyeVW0jcrhK2bzRVm7OVFfxNNRuPXIaA1Pc5QIbfMItUzavJ+NDMN8n9e0L9FS8p6
         tq7TTeGdzaX0136DmFa1LftA7xw+cPs//R7BxHfmQaa/vNwriSWQhE6HYmKQuFbGDxDq
         Bg5erLaGp0cgJlgeiEOIPYKLnoR9icCMSctMhsB1HZzmQqp3udL5+Sn4pNOcL9yKERsx
         Z5y5KpcxAJ9+MaE4zx8TVcaHvHGAnMEpPRGOC89hkmJe4zcmW8hColHnvm5z1nJEKHx+
         Lt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ZSWbqFAdYMHZSBHSRb1jfufvzOhyuDcLok5vmyDpAk=;
        b=iW4s9Uxa/Vh9qFIxan3VMwsXaaT5c7tzmceyH7NpS0e+q3o4FM7h7jgnc5NUWPV6G1
         QZ7QUyqeWbqs6uXMewk1A03S4cI8MZuz25MDOUE92DCYFYtkZoR7tRwz3TwggH74qOmK
         oVNSFFnFm4yRV6KhdPsUbeGQOEbUPC/HmYka0XDWyIgS+Ml6yacXdQ/dFLNWnquAY0rc
         HsM30EaVfnVqtz9MmBOyhWQCoVlronioedQBppc4tbTUxae6+hn8F2xTRrN/gFhdGcQC
         3QALSxQLi3PYnxmjV7lLXqYAAKjamtD41UC3WftZWnV2K+y+ZtVZaCPA3gk9OZvRaovX
         Qu8w==
X-Gm-Message-State: APjAAAWaz5W1uQrfa3z+FAs9ZGKB2DZKwQuPUD6whQf3HdTmgs0ahRqY
        0ImCS5vLOOernWsoFbkpwip0cA==
X-Google-Smtp-Source: APXvYqxBEmrDBznAn14GIGVfoHIVRb3pDwaOfikmLmN/GvkdUV1EAMzyMBq7WLZPIpw1AC69xAAo+Q==
X-Received: by 2002:a05:6000:114b:: with SMTP id d11mr47787109wrx.167.1561480492966;
        Tue, 25 Jun 2019 09:34:52 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 09:34:52 -0700 (PDT)
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
Subject: [PATCH 01/12] backlight: gpio: allow to probe non-pdata devices from board files
Date:   Tue, 25 Jun 2019 18:34:23 +0200
Message-Id: <20190625163434.13620-2-brgl@bgdev.pl>
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

Currently we can only probe devices that either use device tree or pass
platform data to probe(). Rename gpio_backlight_probe_dt() to
gpio_backlight_probe_prop() and use generic device properties instead
of OF specific helpers. Reverse the logic checking the presence of
platform data in probe(). This way we can probe devices() registered
from machine code that neither have a DT node nor use platform data.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index b9300f3e1ee6..654c19d3a81d 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -54,15 +54,14 @@ static const struct backlight_ops gpio_backlight_ops = {
 	.check_fb	= gpio_backlight_check_fb,
 };
 
-static int gpio_backlight_probe_dt(struct platform_device *pdev,
-				   struct gpio_backlight *gbl)
+static int gpio_backlight_probe_prop(struct platform_device *pdev,
+				     struct gpio_backlight *gbl)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	enum gpiod_flags flags;
 	int ret;
 
-	gbl->def_value = of_property_read_bool(np, "default-on");
+	gbl->def_value = device_property_read_bool(dev, "default-on");
 	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 
 	gbl->gpiod = devm_gpiod_get(dev, NULL, flags);
@@ -86,26 +85,15 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	if (!pdata && !np) {
-		dev_err(&pdev->dev,
-			"failed to find platform data or device tree node.\n");
-		return -ENODEV;
-	}
-
 	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
 		return -ENOMEM;
 
 	gbl->dev = &pdev->dev;
 
-	if (np) {
-		ret = gpio_backlight_probe_dt(pdev, gbl);
-		if (ret)
-			return ret;
-	} else {
+	if (pdata) {
 		/*
 		 * Legacy platform data GPIO retrieveal. Do not expand
 		 * the use of this code path, currently only used by one
@@ -126,6 +114,10 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		gbl->gpiod = gpio_to_desc(pdata->gpio);
 		if (!gbl->gpiod)
 			return -EINVAL;
+	} else {
+		ret = gpio_backlight_probe_prop(pdev, gbl);
+		if (ret)
+			return ret;
 	}
 
 	memset(&props, 0, sizeof(props));
-- 
2.21.0

