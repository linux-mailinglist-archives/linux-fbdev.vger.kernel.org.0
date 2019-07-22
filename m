Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 703E97018A
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 15:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbfGVNos (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 09:44:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55852 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730723AbfGVNos (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 09:44:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id a15so35231809wmj.5
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D4loNub9lZdf1BYbpDmPVljkc5Kvved+HB+y+7xouaI=;
        b=oH8iUy0oCnaW2Mj2oJVlsoemIUP8GHJDmj4c0Hhq1B7mUftxPx8dg/swAXck0y7vVj
         Mho02HKkJP6iU/GOP71E8UtNkq3htYFze5MLOpgnEfIZulqm56DRXeb0yfpW0Ih/mA0y
         mA20gdd2iFt1rhmUHR5ogbyAGbfismVQWV+0YvUHKq1Ph3dvkjlljMELrAqpr0pFQq6y
         /pOvdpePXRbqz5XSN8fVri9t/pbpajVy6F0yvwaEN2IsyLVtRxecIsdnK5vKZHPrLCST
         EkfiZmroKigK9Qqc/f4QQoSkUMi98Z336uS79OAMdWTiaS+50eHOcnu7JmL4MJ8OCYkm
         y6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D4loNub9lZdf1BYbpDmPVljkc5Kvved+HB+y+7xouaI=;
        b=n+5MHMXyItP0UN+iJF+/XEHWcjEMXnHyGQW/lkqE0+ELbFO7CDcTuNYyZfKhamNsUz
         aYACVZ+Xj/SLpYa8cEYdjHDOLs7L2U8dTi2MVg6txKGxLhC22wAEdWDRfV2AZ8E0GCeB
         XzQRY7HYYvCo0FEMUZu6HHqEVb1S3P7hNYMebLodaveHT6j9c2gSkSvunuD3slZbPk1t
         CEanrtCgZeQK91aAipl8yRZumhLS8MKwoT9UuruzICsR7IF5+WAUJQ88y4hUGKKRmPd0
         7EE5JSKutJaw5GX57JW23tm4sDvdF05wBb4t4kDmSCY0oaLx8CMEMwLzvyg9ribALw9I
         bdFQ==
X-Gm-Message-State: APjAAAU113viEhoj6O/s3dpO/xWjl0cI3tkkRKR1nyfT+pG80Y9XXwSy
        o9+3iL4F+G4CMc5StJj50iY=
X-Google-Smtp-Source: APXvYqxy+WVOLlDEGPN7MS1uXI0lN7nEos9pc3ewXzM+Z/h/Dxcsr3WmJetxjWHaQPwMOxDUXEh+Pw==
X-Received: by 2002:a1c:f918:: with SMTP id x24mr61496788wmh.132.1563803086629;
        Mon, 22 Jul 2019 06:44:46 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id p6sm40652484wrq.97.2019.07.22.06.44.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 06:44:46 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 7/9] fbdev: da8xx-fb: use devm_platform_ioremap_resource()
Date:   Mon, 22 Jul 2019 15:44:21 +0200
Message-Id: <20190722134423.26555-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722134423.26555-1-brgl@bgdev.pl>
References: <20190722134423.26555-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Shrink the code a bit by using the new helper wrapping the calls to
platform_get_resource() and devm_ioremap_resource() together.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/da8xx-fb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 19ed9889c8f8..f2f66605e8fb 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1339,7 +1339,6 @@ static int fb_probe(struct platform_device *device)
 {
 	struct da8xx_lcdc_platform_data *fb_pdata =
 						dev_get_platdata(&device->dev);
-	struct resource *lcdc_regs;
 	struct lcd_ctrl_config *lcd_cfg;
 	struct fb_videomode *lcdc_info;
 	struct fb_info *da8xx_fb_info;
@@ -1357,8 +1356,7 @@ static int fb_probe(struct platform_device *device)
 	if (lcdc_info == NULL)
 		return -ENODEV;
 
-	lcdc_regs = platform_get_resource(device, IORESOURCE_MEM, 0);
-	da8xx_fb_reg_base = devm_ioremap_resource(&device->dev, lcdc_regs);
+	da8xx_fb_reg_base = devm_platform_ioremap_resource(device, 0);
 	if (IS_ERR(da8xx_fb_reg_base))
 		return PTR_ERR(da8xx_fb_reg_base);
 
-- 
2.21.0

