Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04739DFFA0
	for <lists+linux-fbdev@lfdr.de>; Tue, 22 Oct 2019 10:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731321AbfJVIhG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 22 Oct 2019 04:37:06 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40171 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388416AbfJVIgo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 22 Oct 2019 04:36:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id o28so16995304wro.7
        for <linux-fbdev@vger.kernel.org>; Tue, 22 Oct 2019 01:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
        b=Tyg8K1E7cMRcer3+lkdqXntnVHJHzQPSYcVjamEEFJC1NLQo2ieybp5MQTeXGwl/Uq
         zhr5KPDI5yz9T/b+emE6PSD9KM/UxQNivFwNLeZOg9zsR2gWQOGvC3tffOlSpVBYh7+t
         cWHjmw/HsPmptGNShMH32AAfH4DkvXiRmOdkUDl8ACoFpAPMWcP2x/kv3TYfrAp4U8Kx
         KXSyo2AOrh1/P94ayGaqAHg/3pHgCo3vlEyxTYmTl6Wl7eyOknXg+aVyW5O24T42gp1/
         L2bVu0PeNJm20e/mIbgIRf5RozmLSZGRyVMDo/yks8vys0xy714h7zCMq2WEo25H/ef+
         E4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
        b=W9PQxYJB5cZIrpAcVJ0EH1t2gjBMqlIVnEyUThSaVrglN46ELW3JFKc1ChbUHA4yFo
         BV23JXO47Qa6eVBuVOzLz0U0xesKWKsI8dn34yPyKQEU7ec7bu0Ezzibo3RMdtdvarVo
         zuPOyMjdYwjTZgcnU2mAqfIKAWm/22b5k1RrvOoXl+QrQ6aXxVo1OUL9u2kiPp02+vRZ
         VteUkQqMNaIQZx0z339+TB/5l+PaCI6qZh1Jb6cdBGCvkZj+w0LxCAe5vU2EHJw8+Y8+
         d90uG5nlSrH6dfZ+n38kpDa67kQUIBM6TNvbxS4iyJRgcHUxm9v/nfRH0e1nZhJHkynY
         btwA==
X-Gm-Message-State: APjAAAX5PSmubDtr7LdpiLb/zjt2/SvalsTdo+RzzFanJy+lQsx9+/US
        jHb7V7c943ski55QErate4KOGg==
X-Google-Smtp-Source: APXvYqwWQlSbpw30v85cKgMt5omU5YH11fs8JlUz5yLbRA7yJFDrCsz1qIfQZi8zu1xwIlHvVCtOTg==
X-Received: by 2002:adf:f306:: with SMTP id i6mr2237564wro.209.1571733400949;
        Tue, 22 Oct 2019 01:36:40 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:36:40 -0700 (PDT)
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
Subject: [PATCH v7 4/9] sh: ecovec24: add additional properties to the backlight device
Date:   Tue, 22 Oct 2019 10:36:25 +0200
Message-Id: <20191022083630.28175-5-brgl@bgdev.pl>
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
index acaa97459531..aaa8ea62636f 100644
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
@@ -1462,6 +1476,12 @@ static int __init arch_setup(void)
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
2.23.0

