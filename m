Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 460BA5549B
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 18:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731684AbfFYQfH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 12:35:07 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37422 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731439AbfFYQfG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 12:35:06 -0400
Received: by mail-wm1-f67.google.com with SMTP id f17so3645195wme.2
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xjvgqiqZzglCEryM8XBbJiMmioEThPc/Ew98mkOW+30=;
        b=dsz03gRN+B8sj18/khuc/IOGJ4ZAac3MpDKb3Zv/Bc9PoYBZsScWcIBR66+WT13q4A
         tN8EW3Vfjzl0srOYa1HtJEj4YWDxKeLJeFxcOpAU1yqzULbgKdw7lI1k9uJYS2TLwLfq
         nJu10QxZk+xzeoc8TdS7m0YAZ+oQffTcRYbFO9YXz55433gHQs5zlWTN1V3cyKJa1Q2A
         iPJuT54NssEe53FbS36r8nVdcdRnBqTyep+QMieQHsg6JfL23Iqv4l0ggpRn13oHMR0p
         AZG9QARW/pNBZ52Cg4cBykzft5A+BRios2hbeleUvawVzlsiZYnAcBm99WZBoCSgvzcU
         PqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjvgqiqZzglCEryM8XBbJiMmioEThPc/Ew98mkOW+30=;
        b=LCj5jqEUXxd5X3j7H4BvlS2ieCtUEbN/0K6QLYD6WOw8Oga1mDQrjhAK8gjY7hXgLX
         Xx9etNnUfjjM1f6OzgGHUUJ+JNNKciqoATfBO29AwF4DHwtkMxLNIGqYC7YSuAxhmn7y
         5xcCW9g8KPHWvycSX55GYYt3p67qtWvBpd0rvoVjVDOo18zZEWbKgqLrZBC/fyPIIbj2
         f+WHaC+82FF2KVvNw84zs7LtfIMDeufnf7eceeJQ5r3C94y29IUqIXSw+3lVDAjPdB4H
         wrpQwEgj6ey/Dg6Lw6kc2fXbkNwVwxgHloAYkk9hP02NBokcN+NLLL2QdBG3mHEWiZ8S
         rN7g==
X-Gm-Message-State: APjAAAVdjmFA+InyuJqBBVqwQp6uNO4QgZbsYvSdWlkNVt2s39fldsvp
        Bjtq3NXCFqSlRPU3N7B32iRpcQ==
X-Google-Smtp-Source: APXvYqz13wXYAnILJ9E9trPlEzD6Yeo7CCy/mNFNreUVqazy0miJn87+1vh+k2XQcsjx0bfSNxAnqA==
X-Received: by 2002:a1c:c74a:: with SMTP id x71mr20501151wmf.121.1561480504153;
        Tue, 25 Jun 2019 09:35:04 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.35.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 09:35:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 10/12] fbdev: da8xx-fb: use devm_platform_ioremap_resource()
Date:   Tue, 25 Jun 2019 18:34:32 +0200
Message-Id: <20190625163434.13620-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
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
---
 drivers/video/fbdev/da8xx-fb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 328de29c4933..4dda194d6b8f 100644
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

