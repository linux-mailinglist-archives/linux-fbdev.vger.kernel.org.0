Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DFE729F5
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jul 2019 10:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfGXIZS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jul 2019 04:25:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35100 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbfGXIZS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jul 2019 04:25:18 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so40742898wmg.0
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jul 2019 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bZYb/2BvCTI7DdfJeewjmu59+q6QA8Ct5o62NPSlXLQ=;
        b=eMMmroR7V1M+etXX4tYfPBtj+QEIIIUXtNJYKhwTIwvxfRUNRc3IZfzvWJXAvrNYWU
         advngdJeEYxOqTd3iZl5xGYkFNxm0CngMKJr18xOtSwvzlW1dOyGy1oMF0bxwqwpA37w
         977smMjcPWCsg44JwBkhdWtYAWEcH+IT+EP22quG88BckRt4EAY+nM9q2ekhzOHyZB5+
         wGgvDvDbX2/qq7WwZtSuhRJcSqByopwj1f7ukQWn41YQi/HWvI0u/IC1pTwK5CTvgKhC
         etBqD7P2AQBsWj+uSkD+VetwheS4bWknvZ6JCCK9BfFIxj4I6ij4mc8vc1cACyjhgPCn
         imvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bZYb/2BvCTI7DdfJeewjmu59+q6QA8Ct5o62NPSlXLQ=;
        b=Qz0FtJJW6EeynJ2DKQqnp/xlEzRlEIarpwu+rycR4tTCSLAbT+73tSEb2fic5WjTu3
         bvmpBJ1X/X2ab9jaA4/3ImqSE976rEDhd/vYgKolqZ/VTEBwhtpt16VigSU5ePIEag87
         T8hIY0FQs4NeAkMMUN/4HGZLJEBursMOEgrfKs0ts5ejZ/jVE0Xi4rLjoc5DCtBT6NWt
         LAViUq/2TSjw/CdB4nK1PwpGJaE8+h5zNRdDftON4mv+qGo8k7Y4tV/u9scCshlNYnGz
         nv3LUboaf3ps8APYQnNaP6XCqDfUn1z4JPCzzC+BTp/WeUgOzM5heG3VC/ZxQtXSLApd
         hCyg==
X-Gm-Message-State: APjAAAUqPSJQHIO38BMj1KCyJTGbO2PfJvdW40NLbuner2om1BDPh6vm
        vCheUDaQ1CmL59EO6sozGKQ=
X-Google-Smtp-Source: APXvYqxOORrgcEepfDSEgrObXsBtxM+8pGNSKgl7s1yaroVXpQpRAWrFwTKiJdvbP27wuH9VC4s4Vg==
X-Received: by 2002:a1c:f116:: with SMTP id p22mr71783247wmh.70.1563956715936;
        Wed, 24 Jul 2019 01:25:15 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:25:15 -0700 (PDT)
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
Subject: [PATCH v3 3/7] sh: ecovec24: don't set unused fields in platform data
Date:   Wed, 24 Jul 2019 10:25:04 +0200
Message-Id: <20190724082508.27617-4-brgl@bgdev.pl>
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

Platform data fields other than fbdev are no longer used by the
backlight driver. Remove them.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/sh/boards/mach-ecovec24/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 6926bb3865b9..64a5a1662b6d 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -386,9 +386,6 @@ static struct property_entry gpio_backlight_props[] = {
 
 static struct gpio_backlight_platform_data gpio_backlight_data = {
 	.fbdev = &lcdc_device.dev,
-	.gpio = GPIO_PTR1,
-	.def_value = 1,
-	.name = "backlight",
 };
 
 static const struct platform_device_info gpio_backlight_device_info = {
-- 
2.21.0

