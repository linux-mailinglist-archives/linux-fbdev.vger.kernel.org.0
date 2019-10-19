Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A31DD769
	for <lists+linux-fbdev@lfdr.de>; Sat, 19 Oct 2019 10:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbfJSIgO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 19 Oct 2019 04:36:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43664 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbfJSIgO (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 19 Oct 2019 04:36:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so3298211wrr.10
        for <linux-fbdev@vger.kernel.org>; Sat, 19 Oct 2019 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
        b=BwfSeKvNQho1S2E0R2jApkJ/vho0BYWPz+4V23X7TOnHYSRx3lpOCWdHMbDRFkxEBY
         d17qES1EiwEJenWdMuh8jPg5mCZrt53cDRFr1wi4aQbOGodZoZjInfEvDZXE1XvGwekY
         1/6Y7IIWM6Ub5sX6wkkPbWZhx0ViiXmKPmf8I3A9keQoHm8nmBtNzKut+RPGquxny5Xx
         XQstSrDGl7h2Onpoi4YTSp0XNaFglAgp5x1e7ywXrAnZWfp5jh+RDh5VCfLaCxNDLGWk
         xiZXU3GLEsnOYQ18EI3ciR5deo3EiCnpeWXE5hO8DYE3+FhSTW5LU3DaapmmQYvki14c
         wXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
        b=EM51NR2CYWD2mcdzTU4mysbXoi1ekltRTxcmik+6A2SK1ZRt0jgJa7x8eQDgSQD+39
         ixN+UyyZtyx+WHPRlm/erj1FRAC/G4UVeyPziPcSBvbtf3UxDoziirHqRgoxSFnhCGqt
         VEF4nH3QJr75Xa74vV1aU4foB0kYC9U1SZk6YkiMHDA9THbXqM791D1dBpXGQDHvV7Bd
         GYRRB57RORUghBd/yIQs1B/qAQCvNohm/Kj3VZ87pvw85wpctnnJYwh+trABWuKTH8le
         uLcslo3zz80X+rAKNSEf/EjVxsUI790yy2Tt2/heFSSs+m9YA5XKw/bSPM9Data8gXSs
         L5sw==
X-Gm-Message-State: APjAAAXBdA8HXHpxHkqWBEhAYy7RgE2FpuOCeLg3Mnb+Pg05MfoZ/qf3
        UJd0AF230CiAmK37sd+RbPngnw==
X-Google-Smtp-Source: APXvYqxPlR4nFfXz0/v7vOrifsB6kSjQvy0Wc6RIcmJ4sgheny/orFuy+qohKi8LgVIRjVcx5C5DJg==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr758160wru.25.1571474170742;
        Sat, 19 Oct 2019 01:36:10 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2019 01:36:10 -0700 (PDT)
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
Subject: [PATCH v6 1/9] backlight: gpio: remove unneeded include
Date:   Sat, 19 Oct 2019 10:35:48 +0200
Message-Id: <20191019083556.19466-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We no longer use any symbols from of_gpio.h. Remove this include.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/gpio_backlight.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 18e053e4716c..7e1990199fae 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -12,7 +12,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_data/gpio_backlight.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
-- 
2.23.0

