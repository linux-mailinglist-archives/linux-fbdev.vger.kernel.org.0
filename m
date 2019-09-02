Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4044FA5645
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 14:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730660AbfIBMfT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 08:35:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52350 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730893AbfIBMe7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 08:34:59 -0400
Received: by mail-wm1-f65.google.com with SMTP id t17so14412820wmi.2
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHnB1L+P4+1aGMlVqMp08Ixue8e2E9v91GNi38QqZ9c=;
        b=RiF6eugg6V5iUB4obVg0sR7cypt5WU9YOMFriMux45aF+xW0zjazRTUXDi8WQsm1NS
         cprxfuxAqEy1Vi9GNJuDxtyOJDs3NxNE7C9s+QOaAzCiVDn2YZrr63DziJcnmI8NAv6z
         CuhKqFsWHUkId5jp1hhvWrNPeh89aSuhuLHbvxngPoxOuZPuhkBFz3kpHI3Jg0qgWfoc
         u8WqJ+8E8Y7kDB7zjnn4AFUOKg32D33j+AOOEfYjKVQeir7zocUMw1Wf9W8dQZVBlkyG
         zfDL4DzrWaWUq8JzI6ZajlZ06ZiDjw88IY5cycMsHkilxMazzMWK6wmmV/gSarzR6D2b
         kETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHnB1L+P4+1aGMlVqMp08Ixue8e2E9v91GNi38QqZ9c=;
        b=nQRq8iVoMDY33jxYzIXAry8prZvw1/cJCQ/thm06QzITaoB30/SQ4HDQGB5qILoDa3
         Qno6UjbvMidJo6B76+pNgctPBfhYXLs+QLw3qGX6NdDt3U2wyDDw+xNe0YEyOJ0ehLXH
         3kcQygMrvE98XKKdPZS4DJB+zlIhpTuQUDHu81WPFTPS7KHbHOdYgAfPdT7inohWjYSQ
         B1v1h7j8gEFEEsPukwdQ97LMDBSYuep2AchXy7vGbafBzIqri5pTQW/TM/rGypXa+g7g
         g/UlZb2lfQ1sd8ws9NLQ1nsxfNVPulNLinBF7qSjx/c3QIrGrchUYexN6B/Eofbi9hsL
         6V2Q==
X-Gm-Message-State: APjAAAWUKMSGJ1OmkHIRsCiMsUQwumcZVqyaHLzEtRxiUVAdNustKd/l
        6WvqGtBQstjZZopWwYOHHzYo7g==
X-Google-Smtp-Source: APXvYqwFfCqx6lY10v5xazk7iXImJ1ceSZ7J4x9MKHeaOck5dr4/AvcHY1Tlp222xnKOcnKqL+InVA==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr34854600wmc.126.1567427697250;
        Mon, 02 Sep 2019 05:34:57 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:34:56 -0700 (PDT)
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
Subject: [RESEND PATCH v3 4/7] backlight: gpio: remove unused fields from platform data
Date:   Mon,  2 Sep 2019 14:34:41 +0200
Message-Id: <20190902123444.19924-5-brgl@bgdev.pl>
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

Remove the platform data fields that nobody uses.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/platform_data/gpio_backlight.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/platform_data/gpio_backlight.h b/include/linux/platform_data/gpio_backlight.h
index 34179d600360..1a8b5b1946fe 100644
--- a/include/linux/platform_data/gpio_backlight.h
+++ b/include/linux/platform_data/gpio_backlight.h
@@ -9,9 +9,6 @@ struct device;
 
 struct gpio_backlight_platform_data {
 	struct device *fbdev;
-	int gpio;
-	int def_value;
-	const char *name;
 };
 
 #endif
-- 
2.21.0

