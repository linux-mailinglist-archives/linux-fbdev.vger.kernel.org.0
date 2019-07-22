Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79C7970308
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 17:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfGVPDg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 11:03:36 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35706 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbfGVPDY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 11:03:24 -0400
Received: by mail-wr1-f65.google.com with SMTP id y4so39814059wrm.2
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8zJTPUvP+hqISFeooYsrQz9ymOrtJOaEeguggmTOq/k=;
        b=PCiSprjXoELIP7AMmcbBALqlNtlT1CQZuIXj5Wrl6j/YOz0ypnf9wGGwfuxfWWG5AW
         5In16oK8Cx1DrA84pvaI6AR2rBGQGDW1+q2nWlhI8DTMOTUHCETVzyuju7HlwqTjBx8n
         ck0D9O44NO3Hl7hwl/6qoWy77e/Qpm0+F4beiorACJn+rBdn8e+NmNrANJoSkP6xvFdM
         ZqX+aBUsZ9BsCfcwzPPZEFM7IER//yZQ8jQiMMylWhKnn5mabG7/qjjinKzXTGRyIOaJ
         1HXR35ZJQIxFhr2CalNwGxfF6TgdjOVf9jWAv4SyK15IjCfB0JKvaaFHISVN5GfO159y
         LTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8zJTPUvP+hqISFeooYsrQz9ymOrtJOaEeguggmTOq/k=;
        b=UOYM4o/Wnl+gga87Jmr7968PhFxlw28u+xoC7fgNdEgC+E9Dz7NTHGiByV5+KqreTw
         xYf1L4BR8hjoPHmEDpJrIqLAEfD/XsxAXGNXXeIaqwoSwiY/e9LZcGo0hy1V3NVAvCTM
         w8+qNdEiKpEaW6AZtsCYwXb+cy7ifHhcATTMQT0FL/e6Vi3JtpnpREFWYlojxSFk6ymL
         kAOq6GTxq7APUWCoRfoFdTL+EjL/hQKiHn59brXjv78xxrfZ32DB7hdLbGVEHnSb2Zva
         EkmQ7QUUvIj2w1KO0JRNYs++QtMXd8ViUYgcyjbsa7247SH3LwGTGwYjX2HZ25npsVSj
         F+jg==
X-Gm-Message-State: APjAAAXp5KSerdpDGhipind7/3U8UoZbpor606V87PVKmU2R/PIHDPkH
        kZCUEr1TAiHot2YK2EHC3Ws=
X-Google-Smtp-Source: APXvYqzLinW8I3dvvR4AzrGIE+Sp+hY3qQ4I/jHq/HSqa9n6hwBNqZHXKmfOxK1dFVSKdkYe6bGf6g==
X-Received: by 2002:adf:a299:: with SMTP id s25mr67876484wra.74.1563807802560;
        Mon, 22 Jul 2019 08:03:22 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:03:22 -0700 (PDT)
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
Subject: [PATCH v2 6/7] backlight: gpio: remove def_value from struct gpio_backlight
Date:   Mon, 22 Jul 2019 17:03:01 +0200
Message-Id: <20190722150302.29526-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This field is unused outside of probe(). There's no need to store it.
We can make it into a local variable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/backlight/gpio_backlight.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 70882556f047..cd6a75bca9cc 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -21,7 +21,6 @@
 struct gpio_backlight {
 	struct device *fbdev;
 	struct gpio_desc *gpiod;
-	int def_value;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
@@ -61,7 +60,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	enum gpiod_flags flags;
-	int ret;
+	int ret, def_value;
 
 	gbl = devm_kzalloc(&pdev->dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -70,8 +69,8 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-	gbl->def_value = device_property_read_bool(&pdev->dev, "default-on");
-	flags = gbl->def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+	def_value = device_property_read_bool(&pdev->dev, "default-on");
+	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 
 	gbl->gpiod = devm_gpiod_get(&pdev->dev, NULL, flags);
 	if (IS_ERR(gbl->gpiod)) {
@@ -94,7 +93,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return PTR_ERR(bl);
 	}
 
-	bl->props.brightness = gbl->def_value;
+	bl->props.brightness = def_value;
 	backlight_update_status(bl);
 
 	platform_set_drvdata(pdev, bl);
-- 
2.21.0

