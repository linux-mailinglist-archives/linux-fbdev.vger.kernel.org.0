Return-Path: <linux-fbdev+bounces-1002-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74084E7E4
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Feb 2024 19:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021A21F2C17F
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Feb 2024 18:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8D125639;
	Thu,  8 Feb 2024 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/EzkqIr"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613520332;
	Thu,  8 Feb 2024 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707417805; cv=none; b=g9IiI0IacAY2sL1qzEQqS9a00aGiasbvjIEg9ouMisKnIHNUEB2RcnXNUnLVW/Z6AMoQuUPMdgqLyMI8CJzO38oOoeL6pJ7GKiABJRRVpZz3ZXu9KQiXCjBA3vrciTTxQm49YcCHj6jyn0wDkX9jFc/BXgSzV5FEhPzHDOquY+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707417805; c=relaxed/simple;
	bh=ksPh+SGOZxTsk3yoazHWC1sh6u7Hvs7YFo8izy4mpuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QczULrkBKNqn15PPopK5Y2Xkc5To+ruPfxK6ogd5ZCmCg6zTY7sREapjyR59Swn82G+AQCyT81yV9KyHjeW5DaM2XqDEw8m9AjmrsQln3PsoC86x1BBEDHGNz51B4+F1yQrSjGDcOQPm9Z/hNKzEEPU4up0XsT278wPnV7PrhFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/EzkqIr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707417803; x=1738953803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksPh+SGOZxTsk3yoazHWC1sh6u7Hvs7YFo8izy4mpuk=;
  b=g/EzkqIru9HiymGReqJsyHEr7xmrvtAEtjoZvQiCXOKiLBnN45+9Bosr
   O1W0ucfF99Uk8OSE6LjPArfsyoQX3Cjy+B/QnL0MC950Y14Mf1yFPQzt2
   jJEJKHmZP0RxMAta50bZ9PkGyiFyZZbbIXQ2eepWg9StWPDZBgcnUAUMQ
   Pam4Dc10fHMqOB75XPt+BbUswrNgSVSTkGMBTFP2pofYBS957jfeyyG/Q
   AP+vGe8eb0+TQ1O1O5gp4bzgujUU/YR4lVmzgVA7LuzcIPMxUqjqouXU8
   qPR/jL314EJsD7iM58/o2SOh7H3eHzfLJZ17CQ7KVnn58Rbn9ekWQPkoZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1184689"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1184689"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 10:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934213722"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="934213722"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2024 10:43:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 46BB213C; Thu,  8 Feb 2024 20:43:16 +0200 (EET)
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
Subject: [PATCH v3 3/3] backlight: mp3309c: Utilise temporary variable for struct device
Date: Thu,  8 Feb 2024 20:42:28 +0200
Message-ID: <20240208184313.2224579-4-andriy.shevchenko@linux.intel.com>
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

We have a temporary variable to keep pointer to struct device.
Utilise it where it makes sense.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Tested-by: Flavio Suligoi <f.suligoi@asem.it>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/backlight/mp3309c.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 426e9f2356ad..708c053d492c 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -222,10 +222,9 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 	 */
 	pdata->dimming_mode = DIMMING_ANALOG_I2C;
 	if (device_property_present(dev, "pwms")) {
-		chip->pwmd = devm_pwm_get(chip->dev, NULL);
+		chip->pwmd = devm_pwm_get(dev, NULL);
 		if (IS_ERR(chip->pwmd))
-			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
-					     "error getting pwm data\n");
+			return dev_err_probe(dev, PTR_ERR(chip->pwmd), "error getting pwm data\n");
 		pdata->dimming_mode = DIMMING_PWM;
 		pwm_apply_args(chip->pwmd);
 	}
@@ -243,11 +242,9 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 		num_levels = ANALOG_I2C_NUM_LEVELS;
 
 		/* Enable GPIO used in I2C dimming mode only */
-		chip->enable_gpio = devm_gpiod_get(chip->dev, "enable",
-						   GPIOD_OUT_HIGH);
+		chip->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 		if (IS_ERR(chip->enable_gpio))
-			return dev_err_probe(chip->dev,
-					     PTR_ERR(chip->enable_gpio),
+			return dev_err_probe(dev, PTR_ERR(chip->enable_gpio),
 					     "error getting enable gpio\n");
 	} else {
 		/*
@@ -265,8 +262,7 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 	}
 
 	/* Fill brightness levels array */
-	pdata->levels = devm_kcalloc(chip->dev, num_levels,
-				     sizeof(*pdata->levels), GFP_KERNEL);
+	pdata->levels = devm_kcalloc(dev, num_levels, sizeof(*pdata->levels), GFP_KERNEL);
 	if (!pdata->levels)
 		return -ENOMEM;
 	if (device_property_present(dev, "brightness-levels")) {
@@ -336,21 +332,21 @@ static int mp3309c_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return dev_err_probe(dev, -EOPNOTSUPP, "failed to check i2c functionality\n");
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	chip->dev = &client->dev;
+	chip->dev = dev;
 
 	chip->regmap = devm_regmap_init_i2c(client, &mp3309c_regmap);
 	if (IS_ERR(chip->regmap))
-		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+		return dev_err_probe(dev, PTR_ERR(chip->regmap),
 				     "failed to allocate register map\n");
 
 	i2c_set_clientdata(client, chip);
 
 	if (!pdata) {
-		pdata = devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
+		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
@@ -367,11 +363,10 @@ static int mp3309c_probe(struct i2c_client *client)
 	props.type = BACKLIGHT_RAW;
 	props.power = FB_BLANK_UNBLANK;
 	props.fb_blank = FB_BLANK_UNBLANK;
-	chip->bl = devm_backlight_device_register(chip->dev, "mp3309c",
-						  chip->dev, chip,
+	chip->bl = devm_backlight_device_register(dev, "mp3309c", dev, chip,
 						  &mp3309c_bl_ops, &props);
 	if (IS_ERR(chip->bl))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->bl),
+		return dev_err_probe(dev, PTR_ERR(chip->bl),
 				     "error registering backlight device\n");
 
 	/* In PWM dimming mode, enable pwm device */
@@ -383,8 +378,7 @@ static int mp3309c_probe(struct i2c_client *client)
 		pwmstate.enabled = true;
 		ret = pwm_apply_might_sleep(chip->pwmd, &pwmstate);
 		if (ret)
-			return dev_err_probe(chip->dev, ret,
-					     "error setting pwm device\n");
+			return dev_err_probe(dev, ret, "error setting pwm device\n");
 	}
 
 	chip->pdata->status = FIRST_POWER_ON;
-- 
2.43.0.rc1.1.gbec44491f096


