Return-Path: <linux-fbdev+bounces-1000-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF384E7E1
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Feb 2024 19:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECB51C241AC
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Feb 2024 18:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B123D2031E;
	Thu,  8 Feb 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvyKteZ6"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5A1DA59;
	Thu,  8 Feb 2024 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707417802; cv=none; b=oeMwcI57ltRprTCH71r3A5NzD8h0OIyiEHI24+M+ECJmu7Wm9BWjgpmkDsooU+7QeVyN/nkBqeZ/AQDzdXg59HYL7D4BiBcQVxD4oU7U8xDokhYfHwYbXMlb5FnTyhmYkWjSD/TMQVIfMHR7QnvlrAORb7zUfEcAWmwjWnRx7zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707417802; c=relaxed/simple;
	bh=8InsWry7BortGoJkrl/sU2aGiKY8qEehwzBkYvlwt+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3g9Y6ZmeY+eX3yBv+HKi1cSH8p2U1KcsCO+JW6pZUdsFXNr5rLC3qOWy9YeE9XpHe2pnz6j73etzG7WJT5V7jWnO8AhY4X7O/fAojTQuNyDYt5BA3qFC+xm/s0WALUQP5TGz50nrOpbVqSuPeqUk56DAFR8K+QuL60ZnIIACYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvyKteZ6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707417801; x=1738953801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8InsWry7BortGoJkrl/sU2aGiKY8qEehwzBkYvlwt+s=;
  b=ZvyKteZ627JMqSZCd3nLUhjOrJYrPMfDNpNTDfEtjdc8fC/OpXJpcmz8
   M0fGXQLXQerStzf0ZZl7tIzopjZwhJ//OA5clsoO/3H/4+5l6Hzabqi3x
   BspzGY0dPD7PeQxsqS1TRH9P2+G/vwyxTAXz5jDxkMYnJ0txxVhbD1uQR
   DCzB82r5uL0bULAtipHLZUNQIcl2CRh4nW5B/X00StS3NoB18oB9ZdpNJ
   kSKlOVx+zxDADQXea2K13rAGysZXYoMV4OFX7PnvmfTGy3doxB2TUI/HZ
   GK6LHjjlEDDJuBdt+6C+IjjnOU8jgrDZ+lOf1W+g5aLo3s/crNsWuO/8m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1184681"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1184681"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 10:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934213720"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="934213720"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2024 10:43:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 31CD686; Thu,  8 Feb 2024 20:43:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
	Flavio Suligoi <f.suligoi@asem.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 1/3] backlight: mp3309c: Make use of device properties
Date: Thu,  8 Feb 2024 20:42:26 +0200
Message-ID: <20240208184313.2224579-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
References: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Add mod_devicetable.h include.

Tested-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/mp3309c.c | 44 +++++++++++++------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index b0d9aef6942b..397f35dafc5e 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -15,6 +15,8 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
 
@@ -199,18 +201,15 @@ static const struct backlight_ops mp3309c_bl_ops = {
 	.update_status = mp3309c_bl_update_status,
 };
 
-static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
-				 struct mp3309c_platform_data *pdata)
+static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
+				struct mp3309c_platform_data *pdata)
 {
-	struct device_node *node = chip->dev->of_node;
-	struct property *prop_pwms;
-	struct property *prop_levels = NULL;
-	int length = 0;
 	int ret, i;
 	unsigned int num_levels, tmp_value;
+	struct device *dev = chip->dev;
 
-	if (!node) {
-		dev_err(chip->dev, "failed to get DT node\n");
+	if (!dev_fwnode(dev)) {
+		dev_err(dev, "failed to get firmware node\n");
 		return -ENODEV;
 	}
 
@@ -224,8 +223,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	 * found in the backlight node, the mode switches to PWM mode.
 	 */
 	pdata->dimming_mode = DIMMING_ANALOG_I2C;
-	prop_pwms = of_find_property(node, "pwms", &length);
-	if (prop_pwms) {
+	if (device_property_present(dev, "pwms")) {
 		chip->pwmd = devm_pwm_get(chip->dev, NULL);
 		if (IS_ERR(chip->pwmd))
 			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
@@ -257,11 +255,9 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 		/*
 		 * PWM control mode: check for brightness level in DT
 		 */
-		prop_levels = of_find_property(node, "brightness-levels",
-					       &length);
-		if (prop_levels) {
+		if (device_property_present(dev, "brightness-levels")) {
 			/* Read brightness levels from DT */
-			num_levels = length / sizeof(u32);
+			num_levels = device_property_count_u32(dev, "brightness-levels");
 			if (num_levels < 2)
 				return -EINVAL;
 		} else {
@@ -275,10 +271,9 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 				     sizeof(*pdata->levels), GFP_KERNEL);
 	if (!pdata->levels)
 		return -ENOMEM;
-	if (prop_levels) {
-		ret = of_property_read_u32_array(node, "brightness-levels",
-						 pdata->levels,
-						 num_levels);
+	if (device_property_present(dev, "brightness-levels")) {
+		ret = device_property_read_u32_array(dev, "brightness-levels",
+						     pdata->levels, num_levels);
 		if (ret < 0)
 			return ret;
 	} else {
@@ -288,8 +283,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 
 	pdata->max_brightness = num_levels - 1;
 
-	ret = of_property_read_u32(node, "default-brightness",
-				   &pdata->default_brightness);
+	ret = device_property_read_u32(dev, "default-brightness", &pdata->default_brightness);
 	if (ret)
 		pdata->default_brightness = pdata->max_brightness;
 	if (pdata->default_brightness > pdata->max_brightness) {
@@ -310,8 +304,8 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	 * If missing, the default value for OVP is 35.5V
 	 */
 	pdata->over_voltage_protection = REG_I2C_1_OVP1;
-	if (!of_property_read_u32(node, "mps,overvoltage-protection-microvolt",
-				  &tmp_value)) {
+	ret = device_property_read_u32(dev, "mps,overvoltage-protection-microvolt", &tmp_value);
+	if (!ret) {
 		switch (tmp_value) {
 		case 13500000:
 			pdata->over_voltage_protection = 0x00;
@@ -328,9 +322,7 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 	}
 
 	/* Synchronous (default) and non-synchronous mode */
-	pdata->sync_mode = true;
-	if (of_property_read_bool(node, "mps,no-sync-mode"))
-		pdata->sync_mode = false;
+	pdata->sync_mode = !device_property_read_bool(dev, "mps,no-sync-mode");
 
 	return 0;
 }
@@ -366,7 +358,7 @@ static int mp3309c_probe(struct i2c_client *client)
 		if (!pdata)
 			return -ENOMEM;
 
-		ret = pm3309c_parse_dt_node(chip, pdata);
+		ret = mp3309c_parse_fwnode(chip, pdata);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0.rc1.1.gbec44491f096


