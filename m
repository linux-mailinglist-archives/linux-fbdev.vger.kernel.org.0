Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A111A729F7
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jul 2019 10:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfGXIZU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jul 2019 04:25:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38631 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfGXIZU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jul 2019 04:25:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id g17so45942456wrr.5
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MWh9VGd2JwifXWatter5gVNCFGQvFvQYl1wPUfmq6BA=;
        b=Ru8/V2KuUXMTU8q4g8iglT+1D551XJ1jRu1e/mkMhxZ41/k+vNUX9+CBHpMMATMLcL
         qA7G90MOkXL0es1XDru84jIee/hoFp5YxCFwfo0CgWKkTkJSlHOqCEr1iMF31PkLvpAm
         vxWfi3/v9hnpL85NJbcn84NuLHK8ZwfNr8R1aicwnOSGGBohMr4+VtbWERpElGqBQvj4
         J7dN+52l7aCDWASYucxYNDxixUcCvgVIwkPoWyDWNVcMPfl8K9m6vSmglYR+bwChB6TE
         SabhVALFMspdy8q97T4skJ5NHKGlkr5mA0aqOWlMKI4cH00E1sSr0uZYF75qmVgmJd/s
         Tr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MWh9VGd2JwifXWatter5gVNCFGQvFvQYl1wPUfmq6BA=;
        b=n3kOl0YKqAXXEH7+amcG/dHWY+otFdpOqjNc8LRj0i93hJcfjK4E4WnNISgo/EvDTK
         QhbYAwg/cEndyOb6reOtz5gXDemM2XLpN+iLYURZBA1u8sZGUQjMSWc2I9gXn12irWc0
         +zzMkQSNPBAcKeNI36QgvLlPNrUIvpwLXd3ciRoUsmnaz5w2KcM2uc9Tq9p7mjrVTbKV
         MJ7HXRhH4pcoXU22W/ucYIeFp+Cl2CN82K4WPgseXMdvELbQogfTfBvpySIzFdhxpvdb
         fq/P/whdYeG6rglg4lRAHUbLaeqrII4Ph14E3YQ2a3VjmSg9kYgccszpV7q93LjEVrnC
         gWhg==
X-Gm-Message-State: APjAAAVlBa62sDiEV0sLfIFfyf+d1tpKLn+J81228HZ5Dbzbl5pz4OvO
        X1/BrfL6bHh05uEtyykKgMQ=
X-Google-Smtp-Source: APXvYqzovu25Xh93eS5i9WI728LZP4TFmEiOkc764Y7T62dKsCFZMLaetBHEt9+L/8KfHBSTKqd9ZA==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr29586503wrv.40.1563956718056;
        Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
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
Subject: [PATCH v3 5/7] backlight: gpio: remove dev from struct gpio_backlight
Date:   Wed, 24 Jul 2019 10:25:06 +0200
Message-Id: <20190724082508.27617-6-brgl@bgdev.pl>
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

This field is unused. Remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 01262186fa1e..70882556f047 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -19,9 +19,7 @@
 #include <linux/slab.h>
 
 struct gpio_backlight {
-	struct device *dev;
 	struct device *fbdev;
-
 	struct gpio_desc *gpiod;
 	int def_value;
 };
@@ -69,8 +67,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	if (gbl == NULL)
 		return -ENOMEM;
 
-	gbl->dev = &pdev->dev;
-
 	if (pdata)
 		gbl->fbdev = pdata->fbdev;
 
-- 
2.21.0

