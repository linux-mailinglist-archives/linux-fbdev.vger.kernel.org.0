Return-Path: <linux-fbdev+bounces-18-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872A7E8A43
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Nov 2023 11:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB084280FC0
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Nov 2023 10:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FF112B9A;
	Sat, 11 Nov 2023 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Y575gT7H"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025B12B87
	for <linux-fbdev@vger.kernel.org>; Sat, 11 Nov 2023 10:42:44 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57593ABA
	for <linux-fbdev@vger.kernel.org>; Sat, 11 Nov 2023 02:42:41 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d267605ceeso453802666b.2
        for <linux-fbdev@vger.kernel.org>; Sat, 11 Nov 2023 02:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1699699360; x=1700304160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD7GxvQQhDBqOuYxhMX/0KhWBgo/RCUVCo38r5g0tkk=;
        b=Y575gT7HFEXke/YB+OIEhVJI7jyteWAT1A7Uik+NpE7R8SDT3Q6BkCwm5WmiLsQhHe
         r5CPDyCsoRyjh+8k9EiPso766VeQM9s0g9iYzYNWIrohXPxC9B/Joh8Yp4P5ByOm5cjA
         Tr29ksGoH9W75Nc8kVUZmAIsxm7lSnByN8zd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699699360; x=1700304160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GD7GxvQQhDBqOuYxhMX/0KhWBgo/RCUVCo38r5g0tkk=;
        b=hUFfscB6Y22aiF3rOBMmuYMHOVAu6Nl23Ad46D7PUE2qbMqRBo6w9nAmzjKsbv+/Sv
         LJvwT1GfCi8GxTgBlnknYZkv8atYHr5Mj4zO0A3Y2T9e797C7pNkmsEUMHgJ1No1zDe1
         ln8nHSijwcQ0zZ3L0bAlEHFrl3+epiPnUIQMSTku6DGV7JGmmlOxkgyBr89WTZ00a++T
         fex0zTVmp+IuEV/K7oAXowN7Q9tcxp4Tgsm41wefv1fGEp35hjTT5bOjKBu/eCMHadQK
         UpfnaijmWFLJJm27s2EhGylS2+51+dJ7FCUN4s0I+6TIDPYtMWYuzNBaLQf6trHfzkgu
         ytFg==
X-Gm-Message-State: AOJu0YyDNP28EZxCmuGreZiQy86fY95sWJiqaaF6RiQ5KDvb89/fbCLg
	LR5K0BJVRFDQZMz5095wAvlNHQ==
X-Google-Smtp-Source: AGHT+IGHYHkviAvOpw70AvcnN4XN/6h6tersHWol4TbdSjxhfGLuFb7jUm6WceFPTOSJEgB1kWk4KA==
X-Received: by 2002:a17:906:7f94:b0:9c4:67f:3ef5 with SMTP id f20-20020a1709067f9400b009c4067f3ef5mr1052700ejr.50.1699699359971;
        Sat, 11 Nov 2023 02:42:39 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
        by smtp.gmail.com with ESMTPSA id ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 02:42:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Helge Deller <deller@gmx.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 03/10] fbdev: imxfb: use BIT, FIELD_{GET,PREP} and GENMASK macros
Date: Sat, 11 Nov 2023 11:41:52 +0100
Message-ID: <20231111104225.136512-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
References: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace opencoded masking and shifting, with BIT(), GENMASK(),
FIELD_GET() and FIELD_PREP() macros.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 113 +++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 54 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 6af5f09d9c85..b7ef43a7930a 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -34,6 +34,7 @@
 #include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/bitfield.h>
 
 #include <linux/regulator/consumer.h>
 
@@ -58,48 +59,49 @@ struct imx_fb_videomode {
 #define LCDC_SSA	0x00
 
 #define LCDC_SIZE	0x04
-#define SIZE_XMAX(x)	((((x) >> 4) & 0x3f) << 20)
+#define SIZE_XMAX_MASK	GENMASK(25, 20)
 
-#define YMAX_MASK_IMX1	0x1ff
-#define YMAX_MASK_IMX21	0x3ff
+#define YMAX_MASK_IMX1	GENMASK(8, 0)
+#define YMAX_MASK_IMX21	GENMASK(9, 0)
 
 #define LCDC_VPW	0x08
-#define VPW_VPW(x)	((x) & 0x3ff)
+#define VPW_VPW_MASK	GENMASK(9, 0)
 
 #define LCDC_CPOS	0x0C
-#define CPOS_CC1	(1<<31)
-#define CPOS_CC0	(1<<30)
-#define CPOS_OP		(1<<28)
-#define CPOS_CXP(x)	(((x) & 3ff) << 16)
+#define CPOS_CC1	BIT(31)
+#define CPOS_CC0	BIT(30)
+#define CPOS_OP		BIT(28)
+#define CPOS_CXP_MASK	GENMASK(25, 16)
 
 #define LCDC_LCWHB	0x10
-#define LCWHB_BK_EN	(1<<31)
-#define LCWHB_CW(w)	(((w) & 0x1f) << 24)
-#define LCWHB_CH(h)	(((h) & 0x1f) << 16)
-#define LCWHB_BD(x)	((x) & 0xff)
+#define LCWHB_BK_EN	BIT(31)
+#define LCWHB_CW_MASK	GENMASK(28, 24)
+#define LCWHB_CH_MASK	GENMASK(20, 16)
+#define LCWHB_BD_MASK	GENMASK(7, 0)
 
 #define LCDC_LCHCC	0x14
 
 #define LCDC_PCR	0x18
-#define PCR_TFT		(1 << 31)
-#define PCR_COLOR	(1 << 30)
-#define PCR_BPIX_8	(3 << 25)
-#define PCR_BPIX_12	(4 << 25)
-#define PCR_BPIX_16	(5 << 25)
-#define PCR_BPIX_18	(6 << 25)
+#define PCR_TFT		BIT(31)
+#define PCR_COLOR	BIT(30)
+#define PCR_BPIX_MASK	GENMASK(27, 25)
+#define PCR_BPIX_8	3
+#define PCR_BPIX_12	4
+#define PCR_BPIX_16	5
+#define PCR_BPIX_18	6
 
 #define LCDC_HCR	0x1C
-#define HCR_H_WIDTH(x)	(((x) & 0x3f) << 26)
-#define HCR_H_WAIT_1(x)	(((x) & 0xff) << 8)
-#define HCR_H_WAIT_2(x)	((x) & 0xff)
+#define HCR_H_WIDTH_MASK	GENMASK(31, 26)
+#define HCR_H_WAIT_1_MASK	GENMASK(15, 8)
+#define HCR_H_WAIT_2_MASK	GENMASK(7, 0)
 
 #define LCDC_VCR	0x20
-#define VCR_V_WIDTH(x)	(((x) & 0x3f) << 26)
-#define VCR_V_WAIT_1(x)	(((x) & 0xff) << 8)
-#define VCR_V_WAIT_2(x)	((x) & 0xff)
+#define VCR_V_WIDTH_MASK	GENMASK(31, 26)
+#define VCR_V_WAIT_1_MASK	GENMASK(15, 8)
+#define VCR_V_WAIT_2_MASK	GENMASK(7, 0)
 
 #define LCDC_POS	0x24
-#define POS_POS(x)	((x) & 1f)
+#define POS_POS_MASK	GENMASK(4, 0)
 
 #define LCDC_LSCR1	0x28
 /* bit fields in imxfb.h */
@@ -112,24 +114,24 @@ struct imx_fb_videomode {
 
 #define LCDC_RMCR	0x34
 
-#define RMCR_LCDC_EN_MX1	(1<<1)
+#define RMCR_LCDC_EN_MX1	BIT(1)
 
-#define RMCR_SELF_REF	(1<<0)
+#define RMCR_SELF_REF	BIT(0)
 
 #define LCDC_LCDICR	0x38
-#define LCDICR_INT_SYN	(1<<2)
-#define LCDICR_INT_CON	(1)
+#define LCDICR_INT_SYN	BIT(2)
+#define LCDICR_INT_CON	BIT(0)
 
 #define LCDC_LCDISR	0x40
-#define LCDISR_UDR_ERR	(1<<3)
-#define LCDISR_ERR_RES	(1<<2)
-#define LCDISR_EOF	(1<<1)
-#define LCDISR_BOF	(1<<0)
+#define LCDISR_UDR_ERR	BIT(3)
+#define LCDISR_ERR_RES	BIT(2)
+#define LCDISR_EOF	BIT(1)
+#define LCDISR_BOF	BIT(0)
 
 #define IMXFB_LSCR1_DEFAULT 0x00120300
 
 #define LCDC_LAUSCR	0x80
-#define LAUSCR_AUS_MODE	(1<<31)
+#define LAUSCR_AUS_MODE	BIT(31)
 
 /* Used fb-mode. Can be set on kernel command line, therefore file-static. */
 static const char *fb_mode;
@@ -420,15 +422,15 @@ static int imxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 
 	switch (var->bits_per_pixel) {
 	case 32:
-		pcr |= PCR_BPIX_18;
+		pcr |= FIELD_PREP(PCR_BPIX_MASK, PCR_BPIX_18);
 		rgb = &def_rgb_18;
 		break;
 	case 16:
 	default:
 		if (is_imx1_fb(fbi))
-			pcr |= PCR_BPIX_12;
+			pcr |= FIELD_PREP(PCR_BPIX_MASK, PCR_BPIX_12);
 		else
-			pcr |= PCR_BPIX_16;
+			pcr |= FIELD_PREP(PCR_BPIX_MASK, PCR_BPIX_16);
 
 		if (imxfb_mode->pcr & PCR_TFT)
 			rgb = &def_rgb_16_tft;
@@ -436,7 +438,7 @@ static int imxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 			rgb = &def_rgb_16_stn;
 		break;
 	case 8:
-		pcr |= PCR_BPIX_8;
+		pcr |= FIELD_PREP(PCR_BPIX_MASK, PCR_BPIX_8);
 		rgb = &def_rgb_8;
 		break;
 	}
@@ -520,7 +522,7 @@ static int imxfb_enable_controller(struct imxfb_info *fbi)
 	writel(fbi->map_dma, fbi->regs + LCDC_SSA);
 
 	/* panning offset 0 (0 pixel offset)        */
-	writel(0x00000000, fbi->regs + LCDC_POS);
+	writel(FIELD_PREP(POS_POS_MASK, 0), fbi->regs + LCDC_POS);
 
 	/* disable hardware cursor */
 	writel(readl(fbi->regs + LCDC_CPOS) & ~(CPOS_CC0 | CPOS_CC1),
@@ -654,21 +656,24 @@ static int imxfb_activate_var(struct fb_var_screeninfo *var, struct fb_info *inf
 #endif
 
 	/* physical screen start address	    */
-	writel(VPW_VPW(var->xres * var->bits_per_pixel / 8 / 4),
-		fbi->regs + LCDC_VPW);
-
-	writel(HCR_H_WIDTH(var->hsync_len - 1) |
-		HCR_H_WAIT_1(var->right_margin - 1) |
-		HCR_H_WAIT_2(var->left_margin - left_margin_low),
-		fbi->regs + LCDC_HCR);
-
-	writel(VCR_V_WIDTH(var->vsync_len) |
-		VCR_V_WAIT_1(var->lower_margin) |
-		VCR_V_WAIT_2(var->upper_margin),
-		fbi->regs + LCDC_VCR);
-
-	writel(SIZE_XMAX(var->xres) | (var->yres & ymax_mask),
-			fbi->regs + LCDC_SIZE);
+	writel(FIELD_PREP(VPW_VPW_MASK,
+			  var->xres * var->bits_per_pixel / 8 / 4),
+	       fbi->regs + LCDC_VPW);
+
+	writel(FIELD_PREP(HCR_H_WIDTH_MASK, var->hsync_len - 1) |
+	       FIELD_PREP(HCR_H_WAIT_1_MASK, var->right_margin - 1) |
+	       FIELD_PREP(HCR_H_WAIT_2_MASK,
+			  var->left_margin - left_margin_low),
+	       fbi->regs + LCDC_HCR);
+
+	writel(FIELD_PREP(VCR_V_WIDTH_MASK, var->vsync_len) |
+	       FIELD_PREP(VCR_V_WAIT_1_MASK, var->lower_margin) |
+	       FIELD_PREP(VCR_V_WAIT_2_MASK, var->upper_margin),
+	       fbi->regs + LCDC_VCR);
+
+	writel(FIELD_PREP(SIZE_XMAX_MASK, var->xres >> 4) |
+	       (var->yres & ymax_mask),
+	       fbi->regs + LCDC_SIZE);
 
 	writel(fbi->pcr, fbi->regs + LCDC_PCR);
 	if (fbi->pwmr)
-- 
2.42.0


