Return-Path: <linux-fbdev+bounces-3603-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D1A21BC9
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jan 2025 12:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88FC7163FA2
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jan 2025 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AFA1DE3A4;
	Wed, 29 Jan 2025 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hWNvhJ7W"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853DF1D90DB
	for <linux-fbdev@vger.kernel.org>; Wed, 29 Jan 2025 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148718; cv=none; b=fscaZ2cJSsc885og2dd1kdRSKtGr92kpDngmb9ZJzwk+a/TzvwKsAVFd86PNhe/zY+KhXAw+o1wrVUEAzJVeEHJ6Z9BNMWiW4QU9H5i0N0+W03iSUsDXCUC0k0kwE8hkdKFSt+9PYuyAa1gRxoHHEzJGlV5CtsXOSsdaPDZSnKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148718; c=relaxed/simple;
	bh=waFUc7Y98lVcelQdxEeSHTjUKlAPBIkUFiT/B2RzsUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ObZm2Tarzb3mHJcV7LdqSuTm7wWddxp1ydwfikt7SWrpjgQMG4C8TyKmqy7r97j2OxCLjmObt0TR157aJ0/ZTi2vtvnkK2ujcYPmHNpw0f1BeV7P9FSqY66j/dHoU54DPxnWEhaxuiwvV7e2GNepUQhrIQlxaq/REdvz3LQs35U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hWNvhJ7W; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3878500f8f.2
        for <linux-fbdev@vger.kernel.org>; Wed, 29 Jan 2025 03:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738148715; x=1738753515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joYblRHTZ8apOwpe6Vq3h7ChVrXqa2XFvM8jV4cZmtQ=;
        b=hWNvhJ7Wwm0y4WZjdosXn3Jmv+rz6z4noxChVoP1HEk3gw8Js0NGg3RtbsmhJ4pK/R
         NHaYH5sZaBZ2PaW/LbDAyYxkq71i9OQaTScUgZHA1ZWNUKPZOWTfsie850urmd2ygVpb
         MCBn92cTES43QLAml3xWzDsEaPvzaKyr48m3ZDbtTeWfYyF3WZFyRQt0UF+uIDWnr7gd
         BwIxt3CLQSgRyX53Xgvtb76IoZins+wnsjeTABR19JFljJPXhkE8vgpQMz3RcnWIwyMX
         NLXMNAyNgIPMgxh0N9VT6hw1/IOtAW15jVDQBUamAGzStYaFigR3L3BbYoUgfrROOCi8
         AqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148715; x=1738753515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joYblRHTZ8apOwpe6Vq3h7ChVrXqa2XFvM8jV4cZmtQ=;
        b=NdHHGjWHEBnFWNpXx4eMucKljDIFYbGwlNRvLYo9qLieSqMgT10I1Llx9kuNlFO+X6
         EB1m7by5UZqa+kp12IMvh3g8w7qckB60Mk9I8/iVkr+7Hzcl86RA4Vrjmn8iB8sJmkC7
         XttIFtwI7r0Tg9C87xbI5xCGT7qBcRazNZtyI7VWcWho1gm1gPHvOS2gqZ0j/qbUUUZU
         NVnAphouFeETnja6lu44uXfOqXgxcp30Nls3M2MtSvSGHcCpQZzBwnpMisA1uWJu/bPT
         bmFNfgVLwLOsb7JxCB3e2rQ/BuZnB78p/TZAepK0Y9Wc54uNyz36WxKIT4XioN1rNXq1
         V7Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXlRUsevG7rBchUBe+S8wvi4sxwINoH7ydmUHthzIewcB/FPi90J/HPzVCK0MCRfCkJO+Xw5SL7BXB6dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFa714WzlkmAc3vBJ5G1mPKB24+KHpVgSu6+ZvEeDjFI0hLsrZ
	/cdz0a1D5AFli4IV9SZJFn94+oILAfDQrkE+I2Zf8Z2KWodE8quLuxUvTAj0co8=
X-Gm-Gg: ASbGnctglok2DsmhmncwHzQOiO14sixqoQFohs+G8pO3XfoPqYOpi6/4uwaaxD1WBdg
	vA6X79ioIw7/h/T5F05owiKRa10y12Urm06xINHZgGNmwEAhcSPX3Mfcr9H+6svZhvADHP1audI
	OCKCatC7XO2gKwoMhYuoPW90NAWk3VQJ6tELih7gzPDHEqLLWx6/GvIi6cxvnH6MtR/Ixi4VrGT
	WCt/z71Y5fJgXbqBLKHw+Ar4Wb5pkhInVw7YaEH+owzw8J7E+68FbICK9ZAKbMA1PW+F01y93SW
	pLzdDQouyKAAn6PHtKtukm4wn74yItYh9o+ZJGmAObWTv+pr05YGGEbfyNGzJ+QEG4z/zqE=
X-Google-Smtp-Source: AGHT+IHiMbOiYeOXFJU+/sYQ6d/SHusLAP//Q35lqgWeMJj2FLezKvdhAFo4grov+EgNrSzdFbLeRA==
X-Received: by 2002:a5d:47c9:0:b0:38b:da31:3e3c with SMTP id ffacd0b85a97d-38c5194c567mr1967009f8f.20.1738148714791;
        Wed, 29 Jan 2025 03:05:14 -0800 (PST)
Received: from [127.0.1.1] (host-95-245-235-245.retail.telecomitalia.it. [95.245.235.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d7a7sm17107364f8f.32.2025.01.29.03.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:05:14 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 29 Jan 2025 12:03:08 +0100
Subject: [PATCH v3 07/10] iio: adc: adi-axi-adc: add support for AD7606
 register writing
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-wip-bl-ad7606_add_backend_sw_mode-v3-7-c3aec77c0ab7@baylibre.com>
References: <20250129-wip-bl-ad7606_add_backend_sw_mode-v3-0-c3aec77c0ab7@baylibre.com>
In-Reply-To: <20250129-wip-bl-ad7606_add_backend_sw_mode-v3-0-c3aec77c0ab7@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Ardelean <aardelean@baylibre.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guillaume Stols <gstols@baylibre.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.1

From: Guillaume Stols <gstols@baylibre.com>

Since we must access the bus parallel bus using a custom procedure,
let's add a specialized compatible, and define specialized callbacks for
writing the registers using the parallel interface.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
Co-developed-by: Angelo Dureghello <adureghello@baylibre.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/adi-axi-adc.c | 100 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index 0923565cf5bb..aaeb445a8a3e 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -27,6 +27,7 @@
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 
+#include "ad7606_bus_iface.h"
 /*
  * Register definitions:
  *   https://wiki.analog.com/resources/fpga/docs/axi_adc_ip#register_map
@@ -73,6 +74,12 @@
 #define ADI_AXI_ADC_REG_DELAY(l)		(0x0800 + (l) * 0x4)
 #define   AXI_ADC_DELAY_CTRL_MASK		GENMASK(4, 0)
 
+#define ADI_AXI_REG_CONFIG_WR			0x0080
+#define ADI_AXI_REG_CONFIG_RD			0x0084
+#define ADI_AXI_REG_CONFIG_CTRL			0x008c
+#define   ADI_AXI_REG_CONFIG_CTRL_READ		0x03
+#define   ADI_AXI_REG_CONFIG_CTRL_WRITE		0x01
+
 #define ADI_AXI_ADC_MAX_IO_NUM_LANES		15
 
 #define ADI_AXI_REG_CHAN_CTRL_DEFAULTS		\
@@ -80,6 +87,10 @@
 	 ADI_AXI_REG_CHAN_CTRL_FMT_EN |		\
 	 ADI_AXI_REG_CHAN_CTRL_ENABLE)
 
+#define ADI_AXI_REG_READ_BIT			0x8000
+#define ADI_AXI_REG_ADDRESS_MASK		0xff00
+#define ADI_AXI_REG_VALUE_MASK			0x00ff
+
 struct axi_adc_info {
 	unsigned int version;
 	const struct iio_backend_info *backend_info;
@@ -313,6 +324,81 @@ static struct iio_buffer *axi_adc_request_buffer(struct iio_backend *back,
 	return iio_dmaengine_buffer_setup(st->dev, indio_dev, dma_name);
 }
 
+static int axi_adc_raw_write(struct iio_backend *back, void *buf, unsigned int len)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+	u32 data;
+
+	data = *(u32 *)(buf);
+
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_WR, data);
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL,
+		     ADI_AXI_REG_CONFIG_CTRL_WRITE);
+	usleep_range(50, 100);
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL, 0x00);
+	usleep_range(50, 100);
+
+	return 0;
+}
+
+static int axi_adc_raw_read(struct iio_backend *back, void *buf, unsigned int len)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+	u32 *bdata = buf;
+
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL,
+		     ADI_AXI_REG_CONFIG_CTRL_READ);
+	usleep_range(50, 100);
+	regmap_read(st->regmap, ADI_AXI_REG_CONFIG_RD, bdata);
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL, 0x00);
+	usleep_range(50, 100);
+
+	return 0;
+}
+
+static int ad7606_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+	u32 buf;
+
+	guard(mutex)(&st->lock);
+
+	/*
+	 * The address is written on the highest weight byte, and the MSB set
+	 * at 1 indicates a read operation.
+	 */
+	buf = FIELD_PREP(ADI_AXI_REG_ADDRESS_MASK, reg) | ADI_AXI_REG_READ_BIT;
+	axi_adc_raw_write(back, &buf, sizeof(buf));
+	axi_adc_raw_read(back, val, 4);
+
+	/* Write 0x0 on the bus to get back to ADC mode */
+	buf = 0;
+	axi_adc_raw_write(back, &buf, sizeof(buf));
+	return 0;
+}
+
+static int ad7606_bus_reg_write(struct iio_backend *back, u32 reg, u32 val)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+	u32 buf;
+
+	guard(mutex)(&st->lock);
+
+	/* Write any register to switch to register mode */
+	buf = 0xaf00;
+	axi_adc_raw_write(back, &buf, sizeof(buf));
+
+	buf = FIELD_PREP(ADI_AXI_REG_ADDRESS_MASK, reg) |
+	      FIELD_PREP(ADI_AXI_REG_VALUE_MASK, val);
+	axi_adc_raw_write(back, &buf, sizeof(buf));
+
+	/* Write 0x0 on the bus to get back to ADC mode */
+	buf = 0;
+	axi_adc_raw_write(back, &buf, sizeof(buf));
+
+	return 0;
+}
+
 static void axi_adc_free_buffer(struct iio_backend *back,
 				struct iio_buffer *buffer)
 {
@@ -484,9 +570,23 @@ static const struct axi_adc_info adc_generic = {
 	.backend_info = &adi_axi_adc_generic,
 };
 
+static const struct ad7606_platform_data ad7606_pdata = {
+	.bus_reg_read = ad7606_bus_reg_read,
+	.bus_reg_write = ad7606_bus_reg_write,
+};
+
+static const struct axi_adc_info adc_ad7606 = {
+	.version = ADI_AXI_PCORE_VER(10, 0, 'a'),
+	.backend_info = &adi_axi_adc_generic,
+	.bus_controller = true,
+	.pdata = &ad7606_pdata,
+	.pdata_sz = sizeof(ad7606_pdata),
+};
+
 /* Match table for of_platform binding */
 static const struct of_device_id adi_axi_adc_of_match[] = {
 	{ .compatible = "adi,axi-adc-10.0.a", .data = &adc_generic },
+	{ .compatible = "adi,axi-ad7606x", .data = &adc_ad7606 },
 	{ /* end of list */ }
 };
 MODULE_DEVICE_TABLE(of, adi_axi_adc_of_match);

-- 
2.47.0


