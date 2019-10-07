Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 617CCCDABD
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2019 05:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfJGDc2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 6 Oct 2019 23:32:28 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39823 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfJGDcL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 6 Oct 2019 23:32:11 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so6185431plp.6
        for <linux-fbdev@vger.kernel.org>; Sun, 06 Oct 2019 20:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
        b=y+TYcOkuUhELANoszr4a3gmhyWWSDY+vzJu611GB87ScAdJ/pXChF4r0b/+6blLSGl
         BUcsrkNzV5otX3RewLR8/ISN1NQj6hvS2qEGuRtZukxoSVQY5mMHJBf9orIetMkyogEe
         mziAl7VWTOgcKRKmfHh+xtHXVdOiyEJkpYvwM31fawB2JvgQdoelG3fpb4T18TIuWxo8
         e0cvbKmSdZUhbAv2AbFvrMM++vdtHF9jEsAcLrXuH1hNQiYLN26eOfdAlJjlvvu/PJzc
         spy3UaKYw41JS/hoOWHPUFQWEeR50Y+YGG6IYla/Scg+AlsPJGD/7g5fXT5QMOwBE7tC
         P6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
        b=ejSabJWIay0kS8iMMUwvhJHdoBTEDs+AvkfMZS9uW80kl3xXGJNStDe7qivzmXBvX+
         yaR6agLgNgXcTyHSL7hSQUQCSJjyuHTMsXfpdGf4U9ZvQXBjreiN/+TX0TR9GJbNaj3L
         UsYA47XNeKcQ5VcM6tbJcf9baqfvhrN/OGhRKA9pZii7S2ImwMrnWahB6uSV1YA1i7A6
         ZpIW/GVM0BJ+XaYYeyjd/EJhrxtIA9Vw9jIsBirqxXjFZPtK2mFuuREqX7OI5GWP+Zlx
         0uFG4m3K1gT3IoEpDjDVLPkgjgsb7st0dmGjQESXjoL6XG4zB6hBI0D9crRMfJcyQhAX
         Qekg==
X-Gm-Message-State: APjAAAVfaXUuqgPRTqCTw5GQJIiDS7QU+oZrpR0yZzL4T7n8gNhtJjEo
        OVjqxqs6rMWVABErpqQ4/dXMFw==
X-Google-Smtp-Source: APXvYqwui+TZsj1hrpt1A6WhBT4dxRajPwgWEBSZbF3dNiwstGf7Bc3pdFBi1PqMbkPT7HLUpEqGQA==
X-Received: by 2002:a17:902:d887:: with SMTP id b7mr26427545plz.297.1570419130968;
        Sun, 06 Oct 2019 20:32:10 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net. [96.95.220.76])
        by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:32:10 -0700 (PDT)
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
Subject: [PATCH v5 6/7] backlight: gpio: use a helper variable for &pdev->dev
Date:   Mon,  7 Oct 2019 05:31:59 +0200
Message-Id: <20191007033200.13443-7-brgl@bgdev.pl>
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

Instead of dereferencing pdev each time, use a helper variable for
the associated device pointer.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 20c5311c7ed2..6247687b6330 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -71,25 +71,25 @@ static int gpio_backlight_initial_power_state(struct gpio_backlight *gbl)
 
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
-	struct gpio_backlight_platform_data *pdata =
-		dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret;
 
-	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
+	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
 		return -ENOMEM;
 
-	gbl->dev = &pdev->dev;
+	gbl->dev = dev;
 
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
+	gbl->def_value = device_property_read_bool(dev, "default-on");
 
-	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
+	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
 	if (IS_ERR(gbl->gpiod)) {
 		ret = PTR_ERR(gbl->gpiod);
 		if (ret != -EPROBE_DEFER)
@@ -101,11 +101,11 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = 1;
-	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
-					&pdev->dev, gbl, &gpio_backlight_ops,
+	bl = devm_backlight_device_register(dev, dev_name(dev),
+					dev, gbl, &gpio_backlight_ops,
 					&props);
 	if (IS_ERR(bl)) {
-		dev_err(&pdev->dev, "failed to register backlight\n");
+		dev_err(dev, "failed to register backlight\n");
 		return PTR_ERR(bl);
 	}
 
-- 
2.23.0

