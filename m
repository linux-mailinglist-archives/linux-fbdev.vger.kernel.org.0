Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D5E70190
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 15:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbfGVNpD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 09:45:03 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35843 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728181AbfGVNor (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 09:44:47 -0400
Received: by mail-wm1-f68.google.com with SMTP id g67so31291310wme.1
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v+0I6vbY15lEsTixfHYiuJqBDxUSA6zo24rwD/acPM4=;
        b=EQhnMvCjceO+42ztMoC6eIqwRxISE6eAcMrCgnRzbGBq83QMwrJdY1/MZ3xRYD0ZuJ
         Y/xDwZLuhpsU7NzIAZCAqkdyQaNvt5bdd5ixr4ngF7ZxFi1q/lr8VHXfkOcT3ZVUv1Ke
         WYXqgO9UHwcIX8W4+c/Yf1XrpSMb4X7e1v6X9UxbA8KtQ4UkoQl25tayu1P7OmBLn8Kv
         EkkPFvz9g5LYd6btfnGzgeov11SdmzWYDhPLILdpR9qHzVZ5/u337fYTFqc0V8ob0d7d
         sdTJ2rZePPoL4sDo0TD9Y67b5krkyEbDXJ/ABWUCel3HC+GF9nUaP9Zo63bgN0RJpueV
         uO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v+0I6vbY15lEsTixfHYiuJqBDxUSA6zo24rwD/acPM4=;
        b=X7JTGWp1cvw40TW6y+l9u694e6phLm0PYv4lEuA6y7LQ1xx0V4dyR1EMx1f8696/Sj
         4BnxmnOhcPPekC85cHbh191lBQL6SLvQ3PnIOpGEqSGREci3tkwTQhlx5frWV/BicJKQ
         F5OKOLfgdaxmF0G+Db4lyRdNPNxoYpCPMkTVlOWwtvbeL3in2O8BzakCmdVcu3yCQIAK
         3DpUNNUJRrGrq7rEpTn1SOKmCRyjutMa6Oe5riMKggGlWE2BMoc3Fn0eIq2IXehDX1g/
         gNqudQKTQOL52Bd/sBazTvCqS6mHSot0YeVnm07BWNBRe8125XWl7F7mA08utjbS8CqF
         6icQ==
X-Gm-Message-State: APjAAAVs1yD7LjZ+0ZUlG3Zh5zxay2ol9MI2+xxef1ymzhsm2F9PM8DN
        oHEvOzrUpq6cCYG4+n4jwjo=
X-Google-Smtp-Source: APXvYqwYlx8u5TTEfCISlF/Qln7STGIKyAeHKRpX5eV1qVrcYya1B/aja40DodsaTygTp4FqQgBnDA==
X-Received: by 2002:a05:600c:2503:: with SMTP id d3mr65848572wma.41.1563803085660;
        Mon, 22 Jul 2019 06:44:45 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id p6sm40652484wrq.97.2019.07.22.06.44.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 06:44:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 6/9] fbdev: da8xx: remove panel_power_ctrl() callback from platform data
Date:   Mon, 22 Jul 2019 15:44:20 +0200
Message-Id: <20190722134423.26555-7-brgl@bgdev.pl>
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

There are no more users of panel_power_ctrl(). Remove it from the
driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/da8xx-fb.c | 25 +++++--------------------
 include/video/da8xx-fb.h       |  1 -
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 02dfe9e32eed..19ed9889c8f8 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -165,7 +165,6 @@ struct da8xx_fb_par {
 	struct notifier_block	freq_transition;
 #endif
 	unsigned int		lcdc_clk_rate;
-	void (*panel_power_ctrl)(int);
 	struct regulator	*lcd_supply;
 	u32 pseudo_palette[16];
 	struct fb_videomode	mode;
@@ -1076,9 +1075,7 @@ static int fb_remove(struct platform_device *dev)
 #ifdef CONFIG_CPU_FREQ
 		lcd_da8xx_cpufreq_deregister(par);
 #endif
-		if (par->panel_power_ctrl) {
-			par->panel_power_ctrl(0);
-		} else if (par->lcd_supply) {
+		if (par->lcd_supply) {
 			ret = regulator_disable(par->lcd_supply);
 			if (ret)
 				return ret;
@@ -1187,9 +1184,7 @@ static int cfb_blank(int blank, struct fb_info *info)
 	case FB_BLANK_UNBLANK:
 		lcd_enable_raster();
 
-		if (par->panel_power_ctrl) {
-			par->panel_power_ctrl(1);
-		} else if (par->lcd_supply) {
+		if (par->lcd_supply) {
 			ret = regulator_enable(par->lcd_supply);
 			if (ret)
 				return ret;
@@ -1199,9 +1194,7 @@ static int cfb_blank(int blank, struct fb_info *info)
 	case FB_BLANK_VSYNC_SUSPEND:
 	case FB_BLANK_HSYNC_SUSPEND:
 	case FB_BLANK_POWERDOWN:
-		if (par->panel_power_ctrl) {
-			par->panel_power_ctrl(0);
-		} else if (par->lcd_supply) {
+		if (par->lcd_supply) {
 			ret = regulator_disable(par->lcd_supply);
 			if (ret)
 				return ret;
@@ -1413,10 +1406,6 @@ static int fb_probe(struct platform_device *device)
 	par->dev = &device->dev;
 	par->lcdc_clk = tmp_lcdc_clk;
 	par->lcdc_clk_rate = clk_get_rate(par->lcdc_clk);
-	if (fb_pdata->panel_power_ctrl) {
-		par->panel_power_ctrl = fb_pdata->panel_power_ctrl;
-		par->panel_power_ctrl(1);
-	}
 
 	par->lcd_supply = devm_regulator_get_optional(&device->dev, "lcd");
 	if (IS_ERR(par->lcd_supply)) {
@@ -1638,9 +1627,7 @@ static int fb_suspend(struct device *dev)
 	int ret;
 
 	console_lock();
-	if (par->panel_power_ctrl) {
-		par->panel_power_ctrl(0);
-	} else if (par->lcd_supply) {
+	if (par->lcd_supply) {
 		ret = regulator_disable(par->lcd_supply);
 		if (ret)
 			return ret;
@@ -1666,9 +1653,7 @@ static int fb_resume(struct device *dev)
 	if (par->blank == FB_BLANK_UNBLANK) {
 		lcd_enable_raster();
 
-		if (par->panel_power_ctrl) {
-			par->panel_power_ctrl(1);
-		} else if (par->lcd_supply) {
+		if (par->lcd_supply) {
 			ret = regulator_enable(par->lcd_supply);
 			if (ret)
 				return ret;
diff --git a/include/video/da8xx-fb.h b/include/video/da8xx-fb.h
index efed3c3383d6..1d19ae62b844 100644
--- a/include/video/da8xx-fb.h
+++ b/include/video/da8xx-fb.h
@@ -32,7 +32,6 @@ struct da8xx_lcdc_platform_data {
 	const char manu_name[10];
 	void *controller_data;
 	const char type[25];
-	void (*panel_power_ctrl)(int);
 };
 
 struct lcd_ctrl_config {
-- 
2.21.0

