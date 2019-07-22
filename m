Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3C387018B
	for <lists+linux-fbdev@lfdr.de>; Mon, 22 Jul 2019 15:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbfGVNou (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 22 Jul 2019 09:44:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37057 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730736AbfGVNot (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 22 Jul 2019 09:44:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so14418645wrr.4
        for <linux-fbdev@vger.kernel.org>; Mon, 22 Jul 2019 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dZNZSpaofSdzivT5ozjQLNdDnvzWvkLxf6Z+OYHBPIw=;
        b=MhJkVrilHvUFduWmegELGsRt7I/OQwOf1FOT3pw5wugJ7nLEtyl76vP+nEwYRmsNOG
         PYvtnBgquBU/LKh20yz0cR9e+iNJJLuPUAIo5lgXVvaKOZvZs7hKYSoEBpbOUlakY9vZ
         sq6xsMEX6FldnBJz1SXE798wmMgJcFhDL7ecdv3j/QqW6MTJyi3wykulnM351jrBSEEd
         NMsIv9ZJB+/KNvxr/Vz1GSJxkSzE1LjU2AkGCCN8cu82Uyle3KRHRQPp91w6PR6i6q99
         bG2BF2RgI00HTBrGMWPe4/ioIrBWaIkJVOgNrpsrQWuLICJMBfwIyLJCPe72El/dS3FR
         O37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dZNZSpaofSdzivT5ozjQLNdDnvzWvkLxf6Z+OYHBPIw=;
        b=jPj26xGpGAGmfgN8ZnOYHV61dJeIdcL8JSBGstUfj4k7Dae9tkvheX6p9oqBLWFDXf
         UKGs0lagh8FZi2u3NyCrYjmwqbPNw+J/xlrf65mpcCKSafFiiamxIW7UyQKMXIE2+hD4
         fxpN0LrmC30djykcnNEtSNHtbDI8RkKwF53ZVmTuqPkYkBlU38uIvJ2FhOnE4rSsMRjx
         FGKyOVqlsiAo/jFSz85Ejqt4vUMJ1uP3KnOMP5VJe8GKGsHmQU96bdi08HJu5iTxdyLB
         FNVZ1C0MC+vrCedoYB7hsWExrcnM8xdxs1hAGUtp4sE0uJZGxczgJmT/eHyboyUb6o/4
         c+BQ==
X-Gm-Message-State: APjAAAWDe3PA6zxgFMZWfgeQ54TCRXTg9nTf78nGKxJVyONzIKFFUl4P
        bZB8fNhJZbJcxv/TgwBl4vA=
X-Google-Smtp-Source: APXvYqx7ZF2KX08BrvxXBHPWpYJULmcDpJjOv+ofaB2WjURPPsnMfzA7/Oi1Okbc2rYIOo4Wwzbb5w==
X-Received: by 2002:a5d:680d:: with SMTP id w13mr76330087wru.141.1563803087790;
        Mon, 22 Jul 2019 06:44:47 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id p6sm40652484wrq.97.2019.07.22.06.44.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 06:44:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 8/9] fbdev: da8xx-fb: drop a redundant if
Date:   Mon, 22 Jul 2019 15:44:22 +0200
Message-Id: <20190722134423.26555-9-brgl@bgdev.pl>
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

The driver data is always set in probe. The remove() callback won't be
called if probe failed which is the only way for it to be NULL. Remove
the redundant if.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/da8xx-fb.c | 43 ++++++++++++++++------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index f2f66605e8fb..d14ea6f91371 100644
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

