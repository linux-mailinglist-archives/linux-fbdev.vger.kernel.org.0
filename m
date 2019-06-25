Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C65895549A
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Jun 2019 18:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbfFYQfS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Jun 2019 12:35:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36558 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731514AbfFYQfH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Jun 2019 12:35:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so17428935wrs.3
        for <linux-fbdev@vger.kernel.org>; Tue, 25 Jun 2019 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bAOkVHO1BfkTnSJLTBWlqsTsKKDk8gdZ6nODPU4c1tE=;
        b=i50TzhxoE0EVWRZb7FuSgJwILA4rx2iPG77Mv3xcrrEJhVN4B/h7MPBBWVugqYxWp2
         z/toOghI0xFLzo4j20BFkcTCK+t9oS1ur5Zxjuv68/EUxdI7HLW8oC2Nj9IGNwbxlkcf
         ppV6VXclq/A8Z0b+pcsB0R3xp2T8dBZGYEgPFrzfJRHQCawfFi+1EpUaRPuEwp5oe/TE
         cjUFukQoM00ogBXYvTqt763tfq4G+xwbOAaEuus8bhR4jpNdbtNk1PP3kxzDeiAC6IY4
         zhd+wjbHvP1qPE3kwpdpje4Jp/GVei4mLQW7Kg6+P3xNN65ClIzjaWSbuQstQ63Hv5H+
         570A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bAOkVHO1BfkTnSJLTBWlqsTsKKDk8gdZ6nODPU4c1tE=;
        b=LIeKzJNmcxse1iFAN22BQqGxsi6c7xd2w1e0otzMeGbVpOqGZ1S7etdQr7sib/DxeD
         X8U4woWLqMIX0CyKFuq+oCLNoj+510qwvFUqZznxBEmHyhcfyFUbAUvwJe0TjkSc6ovb
         cPtlBswFMVeZXdOQuqxS64JL0w5Xc9eFjPQoVKOMAUTO5YVJBU6cQ50ncdr3j/YY2Ja5
         mDW4lvW+8dy5wk7C1xyaYOL7lzBFZcuOlrDPxefsCCKSxaAe4TRvMS1NAXvkdUu6WiWw
         7KU4M87RXglyUOdxAsbAFsZPshj3kN3VzLkuyuJhwDgEOnB8IYuBvY0XguGq+gKKS3AO
         yxEw==
X-Gm-Message-State: APjAAAVF0PIabp3A5JxQV3HLmWM8WF+ab2B43Gxwm6nudrohHlpdVOFP
        ukO57UtRou0cjRJNlS5Toj9Qww==
X-Google-Smtp-Source: APXvYqytytlRfo6YGBjwFJZaCuSVzWH7Bv4+NP+iZBeBXrfYOEHyoR/Ueaj3FUGfeHDYPIHfHNmD2A==
X-Received: by 2002:adf:e691:: with SMTP id r17mr62365819wrm.67.1561480505225;
        Tue, 25 Jun 2019 09:35:05 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.35.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 09:35:04 -0700 (PDT)
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
Subject: [PATCH 11/12] fbdev: da8xx-fb: drop a redundant if
Date:   Tue, 25 Jun 2019 18:34:33 +0200
Message-Id: <20190625163434.13620-12-brgl@bgdev.pl>
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

The driver data is always set in probe. The remove() callback won't be
called if probe failed which is the only way for it to be NULL. Remove
the redundant if.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/video/fbdev/da8xx-fb.c | 43 ++++++++++++++++------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 4dda194d6b8f..6b11a8108108 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1067,37 +1067,34 @@ static void lcd_da8xx_cpufreq_deregister(struct da8xx_fb_par *par)
 static int fb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = dev_get_drvdata(&dev->dev);
+	struct da8xx_fb_par *par = info->par;
 	int ret;
 
-	if (info) {
-		struct da8xx_fb_par *par = info->par;
-
 #ifdef CONFIG_CPU_FREQ
-		lcd_da8xx_cpufreq_deregister(par);
+	lcd_da8xx_cpufreq_deregister(par);
 #endif
-		if (par->lcd_supply) {
-			ret = regulator_disable(par->lcd_supply);
-			if (ret)
-				return ret;
-		}
+	if (par->lcd_supply) {
+		ret = regulator_disable(par->lcd_supply);
+		if (ret)
+			return ret;
+	}
 
-		lcd_disable_raster(DA8XX_FRAME_WAIT);
-		lcdc_write(0, LCD_RASTER_CTRL_REG);
+	lcd_disable_raster(DA8XX_FRAME_WAIT);
+	lcdc_write(0, LCD_RASTER_CTRL_REG);
 
-		/* disable DMA  */
-		lcdc_write(0, LCD_DMA_CTRL_REG);
+	/* disable DMA  */
+	lcdc_write(0, LCD_DMA_CTRL_REG);
 
-		unregister_framebuffer(info);
-		fb_dealloc_cmap(&info->cmap);
-		dma_free_coherent(par->dev, PALETTE_SIZE, par->v_palette_base,
-				  par->p_palette_base);
-		dma_free_coherent(par->dev, par->vram_size, par->vram_virt,
-				  par->vram_phys);
-		pm_runtime_put_sync(&dev->dev);
-		pm_runtime_disable(&dev->dev);
-		framebuffer_release(info);
+	unregister_framebuffer(info);
+	fb_dealloc_cmap(&info->cmap);
+	dma_free_coherent(par->dev, PALETTE_SIZE, par->v_palette_base,
+			  par->p_palette_base);
+	dma_free_coherent(par->dev, par->vram_size, par->vram_virt,
+			  par->vram_phys);
+	pm_runtime_put_sync(&dev->dev);
+	pm_runtime_disable(&dev->dev);
+	framebuffer_release(info);
 
-	}
 	return 0;
 }
 
-- 
2.21.0

