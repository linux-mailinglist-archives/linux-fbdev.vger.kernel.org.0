Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7ECB49AD2
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2019 09:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfFRHl4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jun 2019 03:41:56 -0400
Received: from mail-wm1-f99.google.com ([209.85.128.99]:54724 "EHLO
        mail-wm1-f99.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfFRHl4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jun 2019 03:41:56 -0400
Received: by mail-wm1-f99.google.com with SMTP id g135so2020668wme.4
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2019 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okoko.fi; s=okoko;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uaCCOwT6FdYmvMhllu/QeWwGRVseqHgvjzdBnHOd69M=;
        b=Pfg9Ih+86S3Xtc3Q3MbPoD1yKZf5q9ftjSxkHMFON5uo0EZlqN43AwurFcKUty7P9w
         oKJWvmQbND30gnRuRugdhgCYJVX/nNysALrdP7FDYbwlnWxdlrXHQFhWpS0P1sFwUorl
         LQkN+f3DEabIIVpNYWzasblfkpToaGaIedkas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uaCCOwT6FdYmvMhllu/QeWwGRVseqHgvjzdBnHOd69M=;
        b=T/flb3bQ64sRt3+jtfv85Neah56RvIAQxVKV2kf16FGWSQVBOwgpogfmBqL0zTI1jS
         BYv+cxv05LRdRSkJhJdtgV5xu/Zo1No1/u89o8iZ6ruML2eG/0uJXjR80rWyVWQQhCeV
         VL/RJ+gTJ7FcDBOB2RtNfE6oYotch86i7z7r/FuWNob8ID3xGd8q2lrUYHAVzOecnPGX
         Ee5CNflB5WyL0Ot11ni9Xpb4CzPa31rFiBK/3eIHTLJ4yKoPny1mx69k997pyXBgiEvu
         jCuohwNoB5BzPUO2kFUe1HbAlSkwBSQ0XabibbUVogwFX6sU8Ov699S4Q7//Wc1vK/u4
         V36g==
X-Gm-Message-State: APjAAAXz0gyRnm2bGYG0v3/79www56vnRZRZ1FhBuRNhxEdZt7SBP7sS
        L/morVrrWeZpvdKPoQZuwwFu4ayUS7OqMnzVBed3fITLskuPaw==
X-Google-Smtp-Source: APXvYqwVYysIgOjHK+Kva6RmxGWI0gn5iUhuZshGHTaWhSUakRHcy5t1o7CtKGKWq2sYfpNRq6WDuIHsIVt2
X-Received: by 2002:a1c:448b:: with SMTP id r133mr2204309wma.114.1560843713987;
        Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
        by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
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
Subject: [PATCH 4/6] video: ssd1307fb: Handle width and height that are not multiple of 8
Date:   Tue, 18 Jun 2019 10:41:09 +0300
Message-Id: <20190618074111.9309-5-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Some displays have dimensions that are not multiple of eight, for example
height of 36, but the driver divided the dimensions by 8. Defining display
to the next multiple of 8 is not good as then the display registers get
configured to dimensions that do not match. This contradicts intructions
by some display manufacturers.

Use DIV_ROUND_UP to multiple of 8 when needed so correct values can be
used.

The ssd1307fb_update_display bit reordering receives a simplification in
the process.

Signed-off-by: Marko Kohtala <marko.kohtala@okoko.fi>
---
 drivers/video/fbdev/ssd1307fb.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 86f2b79f3ed5..4f4a1b99d17d 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -151,10 +151,11 @@ static void ssd1307fb_update_display(struct ssd1307fb_par *par)
 {
 	struct ssd1307fb_array *array;
 	u8 *vmem = par->info->screen_buffer;
+	unsigned int line_length = par->info->fix.line_length;
+	unsigned int pages = DIV_ROUND_UP(par->height, 8);
 	int i, j, k;
 
-	array = ssd1307fb_alloc_array(par->width * par->height / 8,
-				      SSD1307FB_DATA);
+	array = ssd1307fb_alloc_array(par->width * pages, SSD1307FB_DATA);
 	if (!array)
 		return;
 
@@ -187,22 +188,24 @@ static void ssd1307fb_update_display(struct ssd1307fb_par *par)
 	 *  (5) A4 B4 C4 D4 E4 F4 G4 H4
 	 */
 
-	for (i = 0; i < (par->height / 8); i++) {
+	for (i = 0; i < pages; i++) {
 		for (j = 0; j < par->width; j++) {
+			int m = 8;
 			u32 array_idx = i * par->width + j;
 			array->data[array_idx] = 0;
-			for (k = 0; k < 8; k++) {
-				u32 page_length = par->width * i;
-				u32 index = page_length + (par->width * k + j) / 8;
-				u8 byte = *(vmem + index);
-				u8 bit = byte & (1 << (j % 8));
-				bit = bit >> (j % 8);
+			/* Last page may be partial */
+			if (i + 1 == pages && par->height % 8)
+				m = par->height % 8;
+			for (k = 0; k < m; k++) {
+				u8 byte = vmem[(8 * i + k) * line_length +
+					       j / 8];
+				u8 bit = (byte >> (j % 8)) & 1;
 				array->data[array_idx] |= bit << k;
 			}
 		}
 	}
 
-	ssd1307fb_write_array(par->client, array, par->width * par->height / 8);
+	ssd1307fb_write_array(par->client, array, par->width * pages);
 	kfree(array);
 }
 
@@ -438,7 +441,8 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 		return ret;
 
 	ret = ssd1307fb_write_cmd(par->client,
-				  par->page_offset + (par->height / 8) - 1);
+				  par->page_offset +
+				  DIV_ROUND_UP(par->height, 8) - 1);
 	if (ret < 0)
 		return ret;
 
@@ -618,7 +622,7 @@ static int ssd1307fb_probe(struct i2c_client *client,
 	par->dclk_div = par->device_info->default_dclk_div;
 	par->dclk_frq = par->device_info->default_dclk_frq;
 
-	vmem_size = par->width * par->height / 8;
+	vmem_size = DIV_ROUND_UP(par->width, 8) * par->height;
 
 	vmem = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 					get_order(vmem_size));
@@ -641,7 +645,7 @@ static int ssd1307fb_probe(struct i2c_client *client,
 
 	info->fbops = &ssd1307fb_ops;
 	info->fix = ssd1307fb_fix;
-	info->fix.line_length = par->width / 8;
+	info->fix.line_length = DIV_ROUND_UP(par->width, 8);
 	info->fbdefio = ssd1307fb_defio;
 
 	info->var = ssd1307fb_var;
-- 
2.17.1

