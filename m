Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969A2305868
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Jan 2021 11:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235985AbhA0K3n (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Jan 2021 05:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235916AbhA0K1Z (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Jan 2021 05:27:25 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BDEC061573;
        Wed, 27 Jan 2021 02:26:42 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id j21so787591pls.7;
        Wed, 27 Jan 2021 02:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=w9LuJNkG7zPJO9mZjCx84PLG1KhVhIg79RQ/3qsvzls=;
        b=SgatvX03bpqjeH7enSluDxUFDfag6mEZ/mWUGr6TTFFq+J9N/61FggMzOoAsbIBXaZ
         SATsw9TgZDXY+o/sZzz5UVtBiKpGcYGebDJ6LLxXmwzYBgCcXnoaujjFX6CinHBnnEc2
         1oMwcsSuv/FvcEsPet5hUuwSluN7sELy9sYjwsaFi3hJg6WxYHyyB5MghngIR7EP5xin
         zVXdf6zotG8+W2wogWHqCQiMOsTwUHxDGi1DcJ5c2jY3TTKTwp4QILg2cO4V+2U3ptLc
         8m1W4IQMo8KsU0EeFJFmFHHGvZBpRxiv2wdbtCTAIklWmn+/Av+z7gVVYapsXHRHXgnE
         uRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w9LuJNkG7zPJO9mZjCx84PLG1KhVhIg79RQ/3qsvzls=;
        b=YRiUTZRaaGrC6dsi25oonDbAyi9L249sHyH8nVCoFZcyAh7Iye8LP0D0Gkn3CfJKk/
         kdy9cJONIR4Boz25Lg6nARSNcPsX5F1Agunj88BtopXTgxG+0ZKXCUrEKuf9XqhNEU1k
         uPXcv+fxNQ8x9fFtqVVSQFU8FiA3bM72i3Js4qnkZA8CavzXfwRF1BsMbiIAp2b4PqU2
         9ODZfZttDMesbYT2q2E5+hBOBXDKDw2vjBIP20N5h/gxauRrp7dEYtDGtuusC/kFQMp4
         hkuuBlKI+nYIkeg5y3mWr53ietEHKKpEjD7DDRARvBs6NU+6FMm7P51/wMtah5jqyAZB
         wFGA==
X-Gm-Message-State: AOAM531GDcijkiHDeNUBJGavnWzUdZTDPExp09MEx8J5nD6lPatUoZk3
        ZXISYvyZV5xu++mtg+XFXvE=
X-Google-Smtp-Source: ABdhPJzD7wd+0V/xOmD/6UG24+xvbxpEx5XyFuutoF0z3/ZLbujhFaEUb+adlZQx2/8VhZkDTq6qsw==
X-Received: by 2002:a17:90b:358d:: with SMTP id mm13mr5039590pjb.146.1611743201948;
        Wed, 27 Jan 2021 02:26:41 -0800 (PST)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id t129sm2039860pfc.16.2021.01.27.02.26.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 02:26:41 -0800 (PST)
From:   Carlis <zhangxuezhi3@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     colin.king@canonical.com, oliver.graute@kococonnector.com,
        zhangxuezhi1@yulong.com, mh12gx2825@gmail.com, sbrivio@redhat.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8] fbtft: add tearing signal detect
Date:   Wed, 27 Jan 2021 18:26:46 +0800
Message-Id: <1611743206-136112-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: zhangxuezhi <zhangxuezhi1@yulong.com>

For st7789v ic,add tearing signal detect to avoid screen tearing

Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
---
v8: delete a log line
---
 drivers/staging/fbtft/fb_st7789v.c | 132 ++++++++++++++++++++++++++++++++++++-
 drivers/staging/fbtft/fbtft.h      |   1 +
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3a280cc..de7460c 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -9,9 +9,12 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
 #include <linux/module.h>
 #include <video/mipi_display.h>
-
+#include <linux/gpio/consumer.h>
 #include "fbtft.h"
 
 #define DRVNAME "fb_st7789v"
@@ -66,6 +69,32 @@ enum st7789v_command {
 #define MADCTL_MX BIT(6) /* bitmask for column address order */
 #define MADCTL_MY BIT(7) /* bitmask for page address order */
 
+#define SPI_PANEL_TE_TIMEOUT	400
+static struct mutex te_mutex;/*mutex for tearing line*/
+static struct completion spi_panel_te;
+
+static irqreturn_t spi_panel_te_handler(int irq, void *data)
+{
+	complete(&spi_panel_te);
+	return IRQ_HANDLED;
+}
+
+static void set_spi_panel_te_irq_status(struct fbtft_par *par, bool enable)
+{
+	static int te_irq_count;
+
+	mutex_lock(&te_mutex);
+
+	if (enable) {
+		if (++te_irq_count == 1)
+			enable_irq(gpiod_to_irq(par->gpio.te));
+	} else {
+		if (--te_irq_count == 0)
+			disable_irq(gpiod_to_irq(par->gpio.te));
+	}
+	mutex_unlock(&te_mutex);
+}
+
 /**
  * init_display() - initialize the display controller
  *
@@ -82,6 +111,33 @@ enum st7789v_command {
  */
 static int init_display(struct fbtft_par *par)
 {
+	int rc;
+	struct device *dev = par->info->device;
+
+	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
+	if (IS_ERR(par->gpio.te)) {
+		rc = PTR_ERR(par->gpio.te);
+		pr_err("Failed to request te gpio: %d\n", rc);
+		return rc;
+	}
+	if (par->gpio.te) {
+		init_completion(&spi_panel_te);
+		mutex_init(&te_mutex);
+		rc = devm_request_irq(dev,
+				      gpiod_to_irq(par->gpio.te),
+				     spi_panel_te_handler, IRQF_TRIGGER_RISING,
+				     "TE_GPIO", par);
+		if (rc) {
+			pr_err("TE request_irq failed.\n");
+			devm_gpiod_put(dev, par->gpio.te);
+			return rc;
+		}
+
+		disable_irq_nosync(gpiod_to_irq(par->gpio.te));
+	} else {
+		pr_info("%s:%d, TE gpio not specified\n",
+			__func__, __LINE__);
+	}
 	/* turn off sleep mode */
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	mdelay(120);
@@ -137,6 +193,9 @@ static int init_display(struct fbtft_par *par)
 	 */
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
+    /*Tearing Effect Line On*/
+	if (par->gpio.te)
+		write_reg(par, 0x35, 0x00);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	if (HSD20_IPS)
@@ -145,6 +204,76 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
 
+/*****************************************************************************
+ *
+ *   int (*write_vmem)(struct fbtft_par *par);
+ *
+ *****************************************************************************/
+
+/* 16 bit pixel over 8-bit databus */
+static int st7789v_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
+{
+	u16 *vmem16;
+	__be16 *txbuf16 = par->txbuf.buf;
+	size_t remain;
+	size_t to_copy;
+	size_t tx_array_size;
+	int i;
+	int ret = 0;
+	size_t startbyte_size = 0;
+
+	fbtft_par_dbg(DEBUG_WRITE_VMEM, par, "st7789v ---%s(offset=%zu, len=%zu)\n",
+		      __func__, offset, len);
+
+	remain = len / 2;
+	vmem16 = (u16 *)(par->info->screen_buffer + offset);
+
+	if (par->gpio.dc)
+		gpiod_set_value(par->gpio.dc, 1);
+
+	/* non buffered write */
+	if (!par->txbuf.buf)
+		return par->fbtftops.write(par, vmem16, len);
+
+	/* buffered write */
+	tx_array_size = par->txbuf.len / 2;
+
+	if (par->startbyte) {
+		txbuf16 = par->txbuf.buf + 1;
+		tx_array_size -= 2;
+		*(u8 *)(par->txbuf.buf) = par->startbyte | 0x2;
+		startbyte_size = 1;
+	}
+
+	while (remain) {
+		to_copy = min(tx_array_size, remain);
+		dev_dbg(par->info->device, "    to_copy=%zu, remain=%zu\n",
+			to_copy, remain - to_copy);
+
+		for (i = 0; i < to_copy; i++)
+			txbuf16[i] = cpu_to_be16(vmem16[i]);
+
+		vmem16 = vmem16 + to_copy;
+		if (par->gpio.te) {
+			set_spi_panel_te_irq_status(par, true);
+			reinit_completion(&spi_panel_te);
+			ret = wait_for_completion_timeout(&spi_panel_te,
+							  msecs_to_jiffies(SPI_PANEL_TE_TIMEOUT));
+			if (ret == 0)
+				pr_err("wait panel TE time out\n");
+		}
+		ret = par->fbtftops.write(par, par->txbuf.buf,
+					 startbyte_size + to_copy * 2);
+		if (par->gpio.te)
+			set_spi_panel_te_irq_status(par, false);
+		if (ret < 0)
+			return ret;
+		remain -= to_copy;
+	}
+
+	return ret;
+}
+
 /**
  * set_var() - apply LCD properties like rotation and BGR mode
  *
@@ -259,6 +388,7 @@ static int blank(struct fbtft_par *par, bool on)
 	.gamma = HSD20_IPS_GAMMA,
 	.fbtftops = {
 		.init_display = init_display,
+		.write_vmem = st7789v_write_vmem16_bus8,
 		.set_var = set_var,
 		.set_gamma = set_gamma,
 		.blank = blank,
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 76f8c09..93bac05 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -212,6 +212,7 @@ struct fbtft_par {
 		struct gpio_desc *wr;
 		struct gpio_desc *latch;
 		struct gpio_desc *cs;
+		struct gpio_desc *te;
 		struct gpio_desc *db[16];
 		struct gpio_desc *led[16];
 		struct gpio_desc *aux[16];
-- 
1.9.1

