Return-Path: <linux-fbdev+bounces-3408-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6729E8CCC
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Dec 2024 09:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF396281C5C
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Dec 2024 07:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622ED215167;
	Mon,  9 Dec 2024 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VflvOBeO"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F0621507B;
	Mon,  9 Dec 2024 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731180; cv=none; b=PyJXkbZQx2BWFx4v66dy9Teuf3NIQBJ8WoUGTXRg04/V6iP2Qe8uTHf+yvz225z4H9Kr7Yf1lLKpARtNCeHGIOELE1E326EptFt1bEoeuEnrwyh5bu6yR+2dry2sv2TKMynPoH1RsPc9hv2LqCDJphp+9Ek7VH7G0TvregwB1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731180; c=relaxed/simple;
	bh=xY9UpwT5rLbUxjzyTqjkkRTlc/K5r2yDX7uXcLZcR8U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7gVQ2tmZxRZz+4qUvRELRaOseqwGdNmX/283to3fOitDU28SpAFa8sIgUnMsg1r3N4U7uLs36amza9j7w6px399KBDp+62nGfd00dVBUxKLxCP/7jsn3/7DnXqJUGvFUcG2gvlCnH2A7eerPjYOQgH8jIqvGcsNOPLh1w1NlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VflvOBeO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21649a7bcdcso6415405ad.1;
        Sun, 08 Dec 2024 23:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731178; x=1734335978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQREW8pkvf9d8FBI+//lDw3xZKcfVT8Bj/1BVrjl3sc=;
        b=VflvOBeOGb4L7teiU7FW9FzXIbb9MBbtcrSqgs4i1GWkGl10Jj2OFGXaA/xoW/03Wv
         Tbz5fmS2HOcAe1aLH6Fnhq2x801tHFvDjgPkReBOy/S4NhgcNZOz57WWDGVcqpta8joh
         LQDHNrG+pF4JwcarnxyBgeR9b0qozla3WwVC26vUvLfdBNWK8RZwrYDcKjNlfYq+wYMl
         Jg/RwViCzlHoSdcZtQnQ3qIzz9igoq08yj+0BqtEqLMUpxi5aj8g1wihjyIhQRfVveRw
         AdFCOPCCynzPrzjWtxFBAoV3o/VKYu12aVlLcnO97wexYPfhqNAyM26jH9l/3y2mOZRQ
         Z+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731178; x=1734335978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQREW8pkvf9d8FBI+//lDw3xZKcfVT8Bj/1BVrjl3sc=;
        b=tNi57FZM+kA2AM1zu7bfZUyoojqDS4BmCTR8sEwCvRmi86Vr8S35nrEsyVbaQ1o+Me
         VCI1c8kA367SANifg5TMOmt5B76fhCmqfNMD02mIOhQetC1yG+AjCMSJ7HLNVSj9Hf6F
         53vCPAUzx8xiwiCmnW0uL6zBANBodEMtEhUqjUhUigcDrgjkTMG8ADGhdgtf2y49d5TW
         tFlEJ5LDO7EMbgPoSAX763lJyLWOWdV8zUpZArS1mgRzdHWhDRM/1WnTFTeqbQZj89vz
         dCSIyZHs14PVsvMsr0oMcvKssWruXUCasAm3HN0CFluYtu4Lzb2O2wnRjjIxO8GIu0hG
         Nxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVcQp+Ud1XiTiEJJqmBMIFr0NYU2qLm8p+ChxuHS9Lf4IvI2D3NdawlAEjUD0pB3XXDQvuYOOqKY9Mqtjlf@vger.kernel.org, AJvYcCWZiiZ1+vPtvFnVRd6j8r34mzUKybTUfNGiWmSoRKrmF1J5lNpzcX6PK2OceUMuWqUi4xvZwZ8qCixdiw==@vger.kernel.org, AJvYcCWqjpZ28UENQx+CqqkAZI42blNiN5bCUWVcLdmvUj/fHPWPSmSg5C39E0H/p/A5kt69NPLo1PHfgeFKqWY=@vger.kernel.org, AJvYcCX90GJ9XOPXOqsZwO6T18+pYCK+D8jJCySH3tNdVkus41fF1ogMgkAYFJ9U0VQqpF53PcBUSzzyHPAQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzREa5J+092h+qQps7I9HfaMUdJbiEKNLBZ4NPm92UuH10bSkH/
	yUomN1sFOPqa/USy4uya0BEH87qxUTijHIRhH7cUphGa7gLOmF/t
X-Gm-Gg: ASbGncuyRqQCV68WDjIoov/JJRr5OTh5/5swDlxJ2qhaOzZ/0ki1LTKaeEkuiTHj4BF
	7Il9T6/3Nu4PM4a6tjDBmbkD3le1WVP90bnWC5J7nvKoZ/aiILNpZF49Zu+qu0i+QbWh1lGgz6B
	CTD10Sjxf/k8WF27N9VHqFeHLrj9d45U8B0ABOG1EkHdYBNO1qEeGfKa6VgwOgKjTalpvmIsLs4
	XIDye/Tf3L6iwIQSYzEPyc0MTWF4m/E6ZTqHr+jS7CoVfnUIA/s7vsoYr07JUpw6w==
X-Google-Smtp-Source: AGHT+IEJ6aeTSfdHSwUg/1x4m3Ob8o0V0LmoiLC6iCHD0eKmgDPprihMoSkpmUMGcXKVy/JGiuvYmQ==
X-Received: by 2002:a17:902:ec87:b0:215:8dd3:536a with SMTP id d9443c01a7336-21614d2efdcmr161736885ad.4.1733731177985;
        Sun, 08 Dec 2024 23:59:37 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:37 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Mon,  9 Dec 2024 15:58:34 +0800
Message-ID: <20241209075908.140014-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for backlight controllers attached via Apple DWI 2-wire
interface, which is found on some Apple iPhones, iPads and iPod touches
with a LCD display.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig  |  12 +++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/dwi_bl.c | 126 +++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/video/backlight/dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..e64cc3d51ac5 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
 	  To compile this driver as a module, choose M here: the module will
 	  be called ep93xx_bl.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+          Say Y to enable the backlight driver for backlight controllers
+          attached via the Apple DWI 2-wire interface which is found in some
+          Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dwi_bl.
+
 config BACKLIGHT_IPAQ_MICRO
 	tristate "iPAQ microcontroller backlight driver"
 	depends on MFD_IPAQ_MICRO
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..0a569d7f0210 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
 obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
new file mode 100644
index 000000000000..501c36bed8f3
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DWI_BL_CTL			0x0
+#define DWI_BL_CTL_SEND1		BIT(0)
+#define DWI_BL_CTL_SEND2		BIT(4)
+#define DWI_BL_CTL_SEND3		BIT(5)
+#define DWI_BL_CTL_LE_DATA		BIT(6)
+/* Only used on Apple A9 and later */
+#define DWI_BL_CTL_SEND4		BIT(12)
+
+#define DWI_BL_CMD			0x4
+#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
+#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
+#define DWI_BL_CMD_DATA			GENMASK(10, 0)
+
+#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
+					 DWI_BL_CTL_SEND2 | \
+					 DWI_BL_CTL_SEND3 | \
+					 DWI_BL_CTL_LE_DATA | \
+					 DWI_BL_CTL_SEND4)
+
+#define DWI_BL_MAX_BRIGHTNESS		2047
+
+struct apple_dwi_bl {
+	void __iomem *base;
+};
+
+static int dwi_bl_update_status(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	int brightness = backlight_get_brightness(bl);
+
+	u32 cmd = 0;
+
+	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
+	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
+
+	writel(cmd, dwi_bl->base + DWI_BL_CMD);
+	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
+
+	return 0;
+}
+
+static int dwi_bl_get_brightness(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
+
+	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
+}
+
+static const struct backlight_ops dwi_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = dwi_bl_get_brightness,
+	.update_status	= dwi_bl_update_status
+};
+
+static int dwi_bl_probe(struct platform_device *dev)
+{
+	struct apple_dwi_bl *dwi_bl;
+	struct backlight_device *bl;
+	struct backlight_properties props;
+	struct resource *res;
+
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+
+	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	platform_set_drvdata(dev, dwi_bl);
+
+	bl->props.brightness = dwi_bl_get_brightness(bl);
+
+	return 0;
+}
+
+static const struct of_device_id dwi_bl_of_match[] = {
+	{ .compatible = "apple,dwi-bl" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dwi_bl_of_match);
+
+static struct platform_driver dwi_bl_driver = {
+	.driver		= {
+		.name	= "dwi-bl",
+		.of_match_table = dwi_bl_of_match
+	},
+	.probe		= dwi_bl_probe,
+};
+
+module_platform_driver(dwi_bl_driver);
+
+MODULE_DESCRIPTION("Apple DWI Backlight Driver");
+MODULE_AUTHOR("Nick Chan <towinchenmi@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.47.1


