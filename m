Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF8E729F2
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jul 2019 10:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfGXIZV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jul 2019 04:25:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55227 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfGXIZU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jul 2019 04:25:20 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so40907927wme.4
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ARbd1V2PTR/7B70DXuDpAAyS9eCMhAVKqqbb1qk0e7w=;
        b=wyVGQpD+T3uiZkn3LiRgv0LYR+71l0MHfD4iNRDIwOQSK1f0Vsijy1ZdZwYSok7pGz
         z6LQ/p4UKx3DYKA1xd/DhH3xxwduColASNq35D+f1bZwGtV1216ArwUnZkLSVo0OtHQT
         v37sruntHU3mWDOLAWr7Rdt/I5/oCDYSICOp/dVFtoGCsJBP+j6iLKLMDQWiklPMQGRj
         /MD5+fKLNv8D2Y26FgKUwdHv/cC7IUtLWGtnucaCJ8jkJKrcEF5Z4bcCeTM3atrAeCXh
         qHm6EZZVaObTXL7NmmkRvgeBJ7fNCV1kZMYsReZIJ7ScJgSUHLEuRxbDDoy2a9VXOHJm
         N2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ARbd1V2PTR/7B70DXuDpAAyS9eCMhAVKqqbb1qk0e7w=;
        b=TzNxr26EnjUPxHMW60QVy9L+W1dsQz1wXCDRXBkQdHY+SXva7L2YIw+vO1uBIjTrKx
         SKcRycr0MmwNo+nprRGs0gEckGLRG5yj76SDxEld4WTVeyqzlhCwyS2G3cT4xG2Gem87
         wBO5+c/iJ4nDsBfoufkG35O/a2lMCiZJjIp8mQp1lIRLOBpF3MvCliBZPeH8hfQEN31i
         UV8NsMf/YZ6NA2S9Xeb+7cZkrItlspD7djWhLoVTUQI3aj3Ju0wUn/mmNe1Z/arhgCLS
         bJoiws87AeFNvMg8OtobF47TMvpJpDoNIcN37GWata7wpMvF0M9/4ti65mkqZWiWyV4p
         loNg==
X-Gm-Message-State: APjAAAXkOnYf3IjXcXMmL6T3PsaPrfTQmsFTret/WW84Ffi/nulGr5Q9
        puuTINP0f6GSWp+yql7IwDo=
X-Google-Smtp-Source: APXvYqzkgEv3bgw2h6q7V26EkyUVPqeJGTwwUSYmcdpXaPZAm+K0dgiQU1XSSJC6xbDuOYYXG2bWGg==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr71172006wmb.66.1563956719095;
        Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
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
Subject: [PATCH v3 6/7] backlight: gpio: remove def_value from struct gpio_backlight
Date:   Wed, 24 Jul 2019 10:25:07 +0200
Message-Id: <20190724082508.27617-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

