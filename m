Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C637AA5644
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 14:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbfIBMfS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 08:35:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39217 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731752AbfIBMfA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 08:35:00 -0400
Received: by mail-wr1-f68.google.com with SMTP id t16so13860595wra.6
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kgBvf4zqwAQJv/GXaUjvZU5ag1nyWnXo4YV3WG7Ae5o=;
        b=C6XzL5/waF9VCI8FKaC3DLJDZnEZWUCzbxeOgeeuNAvrmhTI3rHWakI5JfRxD1Cl3D
         JWafVk5sffNt/4RsCDXmKm724kCINFyKh57SDumOBlip733qO2wJrJYiREH0jg4o/gJM
         r28wVehv8yZFrfSpmUgHfNKd4llcfdb0GqTRxAEhj4kGlNCsKQfMjiDUTC1NtmC3RI2x
         lCzki+zzTTjTRH1KiGH5neRH0P+zQ3Xl7G9DfpVpBhrLjgZ/ns8Rs9cduq/Wem+2Bs3R
         EVEYNsM5VS1hmUaHZhnKV0trc0ESqu1KbxLtg/QQapY2oQ2OtqRhQddTU4kLvTc2IbtC
         TX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kgBvf4zqwAQJv/GXaUjvZU5ag1nyWnXo4YV3WG7Ae5o=;
        b=qTckCUwlTbyklxkTnb1cttCyMfvaj7r107ScOU2Z1HSLAxSXlllZgkpHtbXXwSk+CJ
         wHpKQrogKK7u7SG3b4YcKbiqO3lr4EKElcueDBBtlhbAgFIfvsoZd9h2jm9J1yEtrE2X
         brFAhkpveeH4Z9blXo6DRSzRnIlb7N3Yzy0+tUSGItcRtKKzNy6legnze+qJWLQHjsHV
         NQqcDp2gk/hNTiol29aevtKmREhc5c4UmVrl0o9T4kpOfVwdC7KoE5Bi/PDX8L/GF110
         QIq55A95KPFUkR8d+/pgWOcPIiFIxpmU6yyFU+rtJpR5m+Ez/iVUATaNpMvKgJNzfPsm
         ytAg==
X-Gm-Message-State: APjAAAU89A6N4EImq5YzTH7dZ6I7f7C520/w4nVB628kFeBlVfnPuZjg
        yWy3IU60AK+hvQFNTMUuQvRbuQ==
X-Google-Smtp-Source: APXvYqxTkcUgrlnixPmCpMUNG4mBIrhYfybJ1WjXE4s7spBPEtnz5QL08Sn51rgvc6+rNUL371Bx6w==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr32496736wrn.62.1567427698362;
        Mon, 02 Sep 2019 05:34:58 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:34:57 -0700 (PDT)
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
Subject: [RESEND PATCH v3 5/7] backlight: gpio: remove dev from struct gpio_backlight
Date:   Mon,  2 Sep 2019 14:34:42 +0200
Message-Id: <20190902123444.19924-6-brgl@bgdev.pl>
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

This field is unused. Remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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

