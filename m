Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2E549AD8
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2019 09:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbfFRHmC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jun 2019 03:42:02 -0400
Received: from mail-wr1-f100.google.com ([209.85.221.100]:35349 "EHLO
        mail-wr1-f100.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728989AbfFRHl5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jun 2019 03:41:57 -0400
Received: by mail-wr1-f100.google.com with SMTP id m3so12768040wrv.2
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2019 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okoko.fi; s=okoko;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rNkk0KsbO3YcUF9ymJ/Izy+/IeIKEUGythTLywp5Ihs=;
        b=NpcJqVJ7oMwCHKq+K8XtNKFwzz/R4irs1neyzPkukpQlNYfqk2jXuCPYslO9Vbtia1
         JGSC72YgcwPtuvPeMMLK/JyeNzFLssUmOFSR9ZTaoKXz9yFfgrgNtYgjoz6jfBI1Ol90
         3NZeKgHz4geTHcmiwj/VFOnOfmm6DpVODx9eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rNkk0KsbO3YcUF9ymJ/Izy+/IeIKEUGythTLywp5Ihs=;
        b=UW6DnAzQMlj6bWL1U8cvd3DHgjXntL41XE2CL6eq/5Y/9iiDpwl2VWH6guxZIAQ39V
         3UUDFJceWKaMGkOpkoAwkT3lokiYf9fxOh4ANTrJqCgzeZ4rZ3ME6BK9RQcPkq0kclmK
         MOKIG8/SH/r1JNVBbnVZsbtOHz/6sHKEfv0/MOfEdd1rxA+8BGkdxLQmAeih7CHjNpL+
         xGHWSqwnb0ZiOs/Z+86db3GwkeEZguk7WnVQrF1HsU6WvhufVvbetO45erBgRbT8fWm3
         +B0zP4XjcgWgxfHrwxWuo1XAH99o6+V5BIB5whNNQRP5pU+TpzKyOadEvc9vsiyZCEpr
         pUgQ==
X-Gm-Message-State: APjAAAW/ScFJC8aD1ERSbi+TCc8Zs3N853f9lGOaTYymufEsHVadL/zS
        8pEpWn95fVbgDS5UQddNSyxjVsN+4azEHtloOh3MNMJSJ/UoYA==
X-Google-Smtp-Source: APXvYqzAuwJZzHjJO+VMYRz/onGA03PFgeWDiSBswwI4SsuQTJYCfILB3zo1KrRCnyTMFgUxJOpzvnc+lfbZ
X-Received: by 2002:a5d:6449:: with SMTP id d9mr23754483wrw.192.1560843715707;
        Tue, 18 Jun 2019 00:41:55 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
        by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 00:41:55 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From:   Marko Kohtala <marko.kohtala@okoko.fi>
To:     linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
        Marko Kohtala <marko.kohtala@okoko.fi>
Subject: [PATCH 6/6] video: ssd1307fb: Add devicetree configuration of display setup
Date:   Tue, 18 Jun 2019 10:41:11 +0300
Message-Id: <20190618074111.9309-7-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Various displays have differences that only mean initializing the display
driver IC with different fixed register values. Defining these in
devicetree offers easier way to adapt the driver to new displays than
requiring a patch to the kernel.

This adds devicetree properties needed to make the initialization match
the example setup as offered by Densitron for their 128x36 display.

It also makes some old one bit parameter handling a little cleaner.

Signed-off-by: Marko Kohtala <marko.kohtala@okoko.fi>
---
 drivers/video/fbdev/ssd1307fb.c | 80 ++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 4f4a1b99d17d..fca1e91d03d9 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -29,6 +29,7 @@
 #define SSD1307FB_SET_COL_RANGE		0x21
 #define SSD1307FB_SET_PAGE_RANGE	0x22
 #define SSD1307FB_CONTRAST		0x81
+#define SSD1307FB_SET_LOOKUP_TABLE	0x91
 #define	SSD1307FB_CHARGE_PUMP		0x8d
 #define SSD1307FB_SEG_REMAP_ON		0xa1
 #define SSD1307FB_DISPLAY_OFF		0xae
@@ -37,6 +38,7 @@
 #define SSD1307FB_START_PAGE_ADDRESS	0xb0
 #define SSD1307FB_SET_DISPLAY_OFFSET	0xd3
 #define	SSD1307FB_SET_CLOCK_FREQ	0xd5
+#define	SSD1307FB_SET_AREA_COLOR_MODE	0xd8
 #define	SSD1307FB_SET_PRECHARGE_PERIOD	0xd9
 #define	SSD1307FB_SET_COM_PINS_CONFIG	0xda
 #define	SSD1307FB_SET_VCOMH		0xdb
@@ -59,10 +61,14 @@ struct ssd1307fb_deviceinfo {
 };
 
 struct ssd1307fb_par {
-	u32 com_invdir;
-	u32 com_lrremap;
+	unsigned area_color_enable : 1;
+	unsigned com_invdir : 1;
+	unsigned com_lrremap : 1;
+	unsigned com_seq : 1;
+	unsigned lookup_table_set : 1;
+	unsigned low_power : 1;
+	unsigned seg_remap : 1;
 	u32 com_offset;
-	u32 com_seq;
 	u32 contrast;
 	u32 dclk_div;
 	u32 dclk_frq;
@@ -70,6 +76,7 @@ struct ssd1307fb_par {
 	struct i2c_client *client;
 	u32 height;
 	struct fb_info *info;
+	u8 lookup_table[4];
 	u32 page_offset;
 	u32 prechargep1;
 	u32 prechargep2;
@@ -77,7 +84,6 @@ struct ssd1307fb_par {
 	u32 pwm_period;
 	struct gpio_desc *reset;
 	struct regulator *vbat_reg;
-	u32 seg_remap;
 	u32 vcomh;
 	u32 width;
 };
@@ -99,6 +105,9 @@ static const struct fb_fix_screeninfo ssd1307fb_fix = {
 
 static const struct fb_var_screeninfo ssd1307fb_var = {
 	.bits_per_pixel	= 1,
+	.red = { .length = 1 },
+	.green = { .length = 1 },
+	.blue = { .length = 1 },
 };
 
 static struct ssd1307fb_array *ssd1307fb_alloc_array(u32 len, u8 type)
@@ -335,7 +344,7 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 	}
 
 	/* Set COM direction */
-	com_invdir = 0xc0 | (par->com_invdir & 0x1) << 3;
+	com_invdir = 0xc0 | par->com_invdir << 3;
 	ret = ssd1307fb_write_cmd(par->client,  com_invdir);
 	if (ret < 0)
 		return ret;
@@ -368,6 +377,22 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 	if (ret < 0)
 		return ret;
 
+	/* Set Set Area Color Mode ON/OFF & Low Power Display Mode */
+	if (par->area_color_enable || par->low_power) {
+		u32 mode;
+
+		ret = ssd1307fb_write_cmd(par->client,
+					  SSD1307FB_SET_AREA_COLOR_MODE);
+		if (ret < 0)
+			return ret;
+
+		mode = (par->area_color_enable ? 0x30 : 0) |
+			(par->low_power ? 5 : 0);
+		ret = ssd1307fb_write_cmd(par->client, mode);
+		if (ret < 0)
+			return ret;
+	}
+
 	/* Set precharge period in number of ticks from the internal clock */
 	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_PRECHARGE_PERIOD);
 	if (ret < 0)
@@ -383,8 +408,7 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 	if (ret < 0)
 		return ret;
 
-	compins = 0x02 | !(par->com_seq & 0x1) << 4
-				   | (par->com_lrremap & 0x1) << 5;
+	compins = 0x02 | !par->com_seq << 4 | par->com_lrremap << 5;
 	ret = ssd1307fb_write_cmd(par->client, compins);
 	if (ret < 0)
 		return ret;
@@ -408,6 +432,28 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 	if (ret < 0)
 		return ret;
 
+	/* Set lookup table */
+	if (par->lookup_table_set) {
+		int i;
+
+		ret = ssd1307fb_write_cmd(par->client,
+					  SSD1307FB_SET_LOOKUP_TABLE);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < ARRAY_SIZE(par->lookup_table); ++i) {
+			u8 val = par->lookup_table[i];
+
+			if (val < 31 || val > 63)
+				dev_warn(&par->client->dev,
+					"lookup table index %d value out of range 31 <= %d <= 63\n",
+					i, val);
+			ret = ssd1307fb_write_cmd(par->client, val);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	/* Switch to horizontal addressing mode */
 	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_ADDRESS_MODE);
 	if (ret < 0)
@@ -610,17 +656,26 @@ static int ssd1307fb_probe(struct i2c_client *client,
 	if (of_property_read_u32(node, "solomon,prechargep2", &par->prechargep2))
 		par->prechargep2 = 2;
 
+	if (!of_property_read_u8_array(node, "solomon,lookup-table",
+		par->lookup_table, ARRAY_SIZE(par->lookup_table)))
+		par->lookup_table_set = 1;
+
 	par->seg_remap = !of_property_read_bool(node, "solomon,segment-no-remap");
 	par->com_seq = of_property_read_bool(node, "solomon,com-seq");
 	par->com_lrremap = of_property_read_bool(node, "solomon,com-lrremap");
 	par->com_invdir = of_property_read_bool(node, "solomon,com-invdir");
+	par->area_color_enable =
+		of_property_read_bool(node, "solomon,area-color-enable");
+	par->low_power = of_property_read_bool(node, "solomon,low-power");
 
 	par->contrast = 127;
 	par->vcomh = par->device_info->default_vcomh;
 
 	/* Setup display timing */
-	par->dclk_div = par->device_info->default_dclk_div;
-	par->dclk_frq = par->device_info->default_dclk_frq;
+	if (of_property_read_u32(node, "solomon,dclk-div", &par->dclk_div))
+		par->dclk_div = par->device_info->default_dclk_div;
+	if (of_property_read_u32(node, "solomon,dclk-frq", &par->dclk_frq))
+		par->dclk_frq = par->device_info->default_dclk_frq;
 
 	vmem_size = DIV_ROUND_UP(par->width, 8) * par->height;
 
@@ -654,13 +709,6 @@ static int ssd1307fb_probe(struct i2c_client *client,
 	info->var.yres = par->height;
 	info->var.yres_virtual = par->height;
 
-	info->var.red.length = 1;
-	info->var.red.offset = 0;
-	info->var.green.length = 1;
-	info->var.green.offset = 0;
-	info->var.blue.length = 1;
-	info->var.blue.offset = 0;
-
 	info->screen_buffer = vmem;
 	info->fix.smem_start = __pa(vmem);
 	info->fix.smem_len = vmem_size;
-- 
2.17.1

