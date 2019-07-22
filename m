Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD4970192
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 15:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbfGVNpJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 09:45:09 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39002 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730690AbfGVNoo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 09:44:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id u25so25036559wmc.4
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cl5zg39Cl4/S2kfGv0jRvRdfNEoBv9uo7wZVLIOvXqk=;
        b=y+M/5CbcGEIcdNqV/egICb8FrMGtXtBlVWgihxudOjk7jXnywoD0EJ7gf1ju1xOY5z
         BZ/InXQHyjacAMLVMndKUElyjiV/6aC5yi5/fAMI2Ol1F9LCRflw6BCKS5NiyKOXbQhW
         qPdSpM8wzu6+VaUwrYZD/0FLn9SkrGgAJRvXQ+I4Fr94EOGmKZn2xWqF5UiMHuouyDGk
         P2/CV86gu8IkCxYLgkutWOZuAwWlHvwIgF1UcIhVvLQD4FySvHqClk7D4IMQohdyK9Hk
         5sSuBJ7k8eplpR26QtX+rE+c3SugRg55Ru+rAvcY7e06KJ7mTpLn4Z+gWgw67ELmM52D
         2j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cl5zg39Cl4/S2kfGv0jRvRdfNEoBv9uo7wZVLIOvXqk=;
        b=pClHTh1+K5pyFjs26W4+BIIMYc/N4XhrnsXk+ualmALc5ZhGY/SO3BzWVEzjOOJ5xg
         cENJoleGzEwszbMtTGQJTEvhGMirgDztmOke03Wh9zWHuehbBl2aBBysaTm+SQuTqjpn
         NNp/40NO7YgACksnUcmwJjPCwvWW4Hz8ZhII1Mo9zRoxXjZLWtoWbtzd7qzuBkikqqKf
         WmMugrVpENk4pemEMog9AjQT58JTLcgHNH5yb7QECrYp1c4rUqgfVfmtW/VvgnqTpOfg
         pctu4A0/VBCNN0vhTc4KaS3TXlRzh+gqHoyc8HNq8OSQGfr5PAB3nDkBqdkFEBZ6x78j
         WpCQ==
X-Gm-Message-State: APjAAAX/5F+z7RaPTXy43ts3/r+9Krjc4+hyx9A3H5nzdTgQg2qIKst8
        w1Of80lVDToMMjsH9MwKE/I=
X-Google-Smtp-Source: APXvYqzuRR4VH4AgMsKrgc/zg95SeYIfM1iEAfQMM+gfLXFvSgu0o01EWinF+4CxRTgRk8PZ9l+AjQ==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr62608436wmi.77.1563803083203;
        Mon, 22 Jul 2019 06:44:43 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id p6sm40652484wrq.97.2019.07.22.06.44.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 06:44:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/9] fbdev: da8xx: add support for a regulator
Date:   Mon, 22 Jul 2019 15:44:18 +0200
Message-Id: <20190722134423.26555-5-brgl@bgdev.pl>
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

We want to remove the hacky platform data callback for power control.
Add a regulator to the driver data and enable/disable it next to
the current panel_power_ctrl() calls. We will use it in subsequent
patch on da850-evm.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/da8xx-fb.c | 54 ++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index b1cf248f3291..02dfe9e32eed 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -19,6 +19,7 @@
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
 #include <linux/console.h>
+#include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
@@ -165,6 +166,7 @@ struct da8xx_fb_par {
 #endif
 	unsigned int		lcdc_clk_rate;
 	void (*panel_power_ctrl)(int);
+	struct regulator	*lcd_supply;
 	u32 pseudo_palette[16];
 	struct fb_videomode	mode;
 	struct lcd_ctrl_config	cfg;
@@ -1066,6 +1068,7 @@ static void lcd_da8xx_cpufreq_deregister(struct da8xx_fb_par *par)
 static int fb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = dev_get_drvdata(&dev->dev);
+	int ret;
 
 	if (info) {
 		struct da8xx_fb_par *par = info->par;
@@ -1073,8 +1076,13 @@ static int fb_remove(struct platform_device *dev)
 #ifdef CONFIG_CPU_FREQ
 		lcd_da8xx_cpufreq_deregister(par);
 #endif
-		if (par->panel_power_ctrl)
+		if (par->panel_power_ctrl) {
 			par->panel_power_ctrl(0);
+		} else if (par->lcd_supply) {
+			ret = regulator_disable(par->lcd_supply);
+			if (ret)
+				return ret;
+		}
 
 		lcd_disable_raster(DA8XX_FRAME_WAIT);
 		lcdc_write(0, LCD_RASTER_CTRL_REG);
@@ -1179,15 +1187,25 @@ static int cfb_blank(int blank, struct fb_info *info)
 	case FB_BLANK_UNBLANK:
 		lcd_enable_raster();
 
-		if (par->panel_power_ctrl)
+		if (par->panel_power_ctrl) {
 			par->panel_power_ctrl(1);
+		} else if (par->lcd_supply) {
+			ret = regulator_enable(par->lcd_supply);
+			if (ret)
+				return ret;
+		}
 		break;
 	case FB_BLANK_NORMAL:
 	case FB_BLANK_VSYNC_SUSPEND:
 	case FB_BLANK_HSYNC_SUSPEND:
 	case FB_BLANK_POWERDOWN:
-		if (par->panel_power_ctrl)
+		if (par->panel_power_ctrl) {
 			par->panel_power_ctrl(0);
+		} else if (par->lcd_supply) {
+			ret = regulator_disable(par->lcd_supply);
+			if (ret)
+				return ret;
+		}
 
 		lcd_disable_raster(DA8XX_FRAME_WAIT);
 		break;
@@ -1400,6 +1418,20 @@ static int fb_probe(struct platform_device *device)
 		par->panel_power_ctrl(1);
 	}
 
+	par->lcd_supply = devm_regulator_get_optional(&device->dev, "lcd");
+	if (IS_ERR(par->lcd_supply)) {
+		if (PTR_ERR(par->lcd_supply) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
+			goto err_pm_runtime_disable;
+		}
+
+		par->lcd_supply = NULL;
+	} else {
+		ret = regulator_enable(par->lcd_supply);
+		if (ret)
+			goto err_pm_runtime_disable;
+	}
+
 	fb_videomode_to_var(&da8xx_fb_var, lcdc_info);
 	par->cfg = *lcd_cfg;
 
@@ -1603,10 +1635,16 @@ static int fb_suspend(struct device *dev)
 {
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct da8xx_fb_par *par = info->par;
+	int ret;
 
 	console_lock();
-	if (par->panel_power_ctrl)
+	if (par->panel_power_ctrl) {
 		par->panel_power_ctrl(0);
+	} else if (par->lcd_supply) {
+		ret = regulator_disable(par->lcd_supply);
+		if (ret)
+			return ret;
+	}
 
 	fb_set_suspend(info, 1);
 	lcd_disable_raster(DA8XX_FRAME_WAIT);
@@ -1620,6 +1658,7 @@ static int fb_resume(struct device *dev)
 {
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct da8xx_fb_par *par = info->par;
+	int ret;
 
 	console_lock();
 	pm_runtime_get_sync(dev);
@@ -1627,8 +1666,13 @@ static int fb_resume(struct device *dev)
 	if (par->blank == FB_BLANK_UNBLANK) {
 		lcd_enable_raster();
 
-		if (par->panel_power_ctrl)
+		if (par->panel_power_ctrl) {
 			par->panel_power_ctrl(1);
+		} else if (par->lcd_supply) {
+			ret = regulator_enable(par->lcd_supply);
+			if (ret)
+				return ret;
+		}
 	}
 
 	fb_set_suspend(info, 0);
-- 
2.21.0

