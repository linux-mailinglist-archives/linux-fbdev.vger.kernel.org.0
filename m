Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4A0FA5634
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 14:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731717AbfIBMe4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 08:34:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45060 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731710AbfIBMe4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 08:34:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id q12so13812377wrj.12
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5S/jk4kN1cW3dXt1c4GIbV2CwRkei66gd1V6gGISEA=;
        b=HKn491ajfZEYRSluCvhIrCHY7+9bRctMymF6AhDpuHdPHdRZUKOHaHZKIecyzjhiW/
         b1nAk+OBKgJldctBzlfm5v7WwX3UfptpC9zkiZgWztRCW2WMmxLCwXuW5F+xldmX9C9h
         lQx4iSLhLL6v2EUEg1hXv7Z/MvzrgN4omtwQjW09fsttzpGAAo+m28FH4LrGheRS2PwX
         05VT34aZbkq1PV99nsYvuHFvaybdnwIpntv8H4Gi3i2XHEAXN9xr48gNL0pFf2Br+qDi
         WTFQPjefarIobm1KH/oPcVXCQrnlBQZ8b6DGHkAfO103tPJ3Xm08LIKUkqwclaay7pyN
         +4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5S/jk4kN1cW3dXt1c4GIbV2CwRkei66gd1V6gGISEA=;
        b=bri1wbpWuncxx1TCZrR55oSur52Gh3NDax8EXDkC5e5hewkeOu/WdiQ2Qv8AAlqp0A
         5TD9y+bnck+Qo4LIv8/m3VXyWeq089MXJ/9d9bhVPzoo98glt6Epr0/VoItAeZBMcQ2N
         DGg/nz6wXMo98vGgzAQJG5QPih82djGx5uftAN8xK8m+MitI4Q8s2TH/OVJmZItMPh/o
         JGoTFm3Bwx5ELhzroLJKF7N6z1RXMVDq29kQAb4027WJI4O6ACsvULao89si2x9lZgvQ
         8h5mPqqN36UE91bCTlNIZylI5UnPfJfyM/t9D7onOnDjj+7gjrOYCn9M3wXYY2iz/Vi3
         ItSA==
X-Gm-Message-State: APjAAAUBbNIdAVkxriDBkPF/dPdG+HkN+aCq06mNw06vhtjoxokYtnOU
        u8pDBCnAIYRewgCdGno4e5V0rQ==
X-Google-Smtp-Source: APXvYqxTC0BM9tDm/ou/+6NHgIhl0sMhYD6xMWKqzgKkh8bJTTRx1y01GLTonCc+zkavzqLiw2nDkQ==
X-Received: by 2002:adf:f705:: with SMTP id r5mr35411010wrp.342.1567427693786;
        Mon, 02 Sep 2019 05:34:53 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:34:53 -0700 (PDT)
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
Subject: [RESEND PATCH v3 1/7] sh: ecovec24: add additional properties to the backlight device
Date:   Mon,  2 Sep 2019 14:34:38 +0200
Message-Id: <20190902123444.19924-2-brgl@bgdev.pl>
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

Add a GPIO lookup entry and a device property for GPIO backlight to the
board file. Tie them to the platform device which is now registered using
platform_device_register_full() because of the properties. These changes
are inactive now but will be used once the gpio backlight driver is
modified.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/sh/boards/mach-ecovec24/setup.c | 30 +++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index f402aa741bf3..6926bb3865b9 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -371,6 +371,19 @@ static struct platform_device lcdc_device = {
 	},
 };
 
+static struct gpiod_lookup_table gpio_backlight_lookup = {
+	.dev_id		= "gpio-backlight.0",
+	.table = {
+		GPIO_LOOKUP("sh7724_pfc", GPIO_PTR1, NULL, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct property_entry gpio_backlight_props[] = {
+	PROPERTY_ENTRY_BOOL("default-on"),
+	{ }
+};
+
 static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.fbdev = &lcdc_device.dev,
 	.gpio = GPIO_PTR1,
@@ -378,13 +391,15 @@ static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.name = "backlight",
 };
 
-static struct platform_device gpio_backlight_device = {
+static const struct platform_device_info gpio_backlight_device_info = {
 	.name = "gpio-backlight",
-	.dev = {
-		.platform_data = &gpio_backlight_data,
-	},
+	.data = &gpio_backlight_data,
+	.size_data = sizeof(gpio_backlight_data),
+	.properties = gpio_backlight_props,
 };
 
+static struct platform_device *gpio_backlight_device;
+
 /* CEU0 */
 static struct ceu_platform_data ceu0_pdata = {
 	.num_subdevs			= 2,
@@ -1006,7 +1021,6 @@ static struct platform_device *ecovec_devices[] __initdata = {
 	&usb1_common_device,
 	&usbhs_device,
 	&lcdc_device,
-	&gpio_backlight_device,
 	&keysc_device,
 	&cn12_power,
 #if defined(CONFIG_MMC_SDHI) || defined(CONFIG_MMC_SDHI_MODULE)
@@ -1464,6 +1478,12 @@ static int __init arch_setup(void)
 #endif
 #endif
 
+	gpiod_add_lookup_table(&gpio_backlight_lookup);
+	gpio_backlight_device = platform_device_register_full(
+					&gpio_backlight_device_info);
+	if (IS_ERR(gpio_backlight_device))
+		return PTR_ERR(gpio_backlight_device);
+
 	return platform_add_devices(ecovec_devices,
 				    ARRAY_SIZE(ecovec_devices));
 }
-- 
2.21.0

