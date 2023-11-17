Return-Path: <linux-fbdev+bounces-132-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB37EF243
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Nov 2023 13:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61748280FB3
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Nov 2023 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E246F30336;
	Fri, 17 Nov 2023 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Q+A3OP+t"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F673129;
	Fri, 17 Nov 2023 04:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1700222785; x=1731758785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fszPbkw4fM5mBhJywhrzutmU+sqqCNz7Ic0DQMjdpzE=;
  b=Q+A3OP+tr6v6sYCpMJH63fxBLqkNiNbvsSCHK9nWk9620NVrht45RK12
   rZcqCootwV3dm1eUdn1ZAC0Jkf4juJNliF8BGktnCH/z3wGV3kt1EA379
   +z7lXqm/FdzfJDGgIkPcSHEfm3Ij5V8buDsUNJR7Dnd687FnuOOeAxkWb
   Y5FuyongNFRp6UboMxKKPBI0lfDTJ1+dAUZc67pDw+BPMDbOwmzfplIWo
   x/OcTIibpEW8MIQWzTJeRAh6g38MGvvz+AUhQwqIbHImbSj5kPf+oHuS9
   YdHTa9MgAXAFEJNyQT2Pxs6x8qjJxGcBiNGk/VQKqLlO0FXvo37LAn6pH
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,206,1695679200"; 
   d="scan'208";a="34042468"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Nov 2023 13:06:23 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2768728007F;
	Fri, 17 Nov 2023 13:06:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-pwm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 1/1] backlight: pwm_bl: Use dev_err_probe
Date: Fri, 17 Nov 2023 13:06:25 +0100
Message-Id: <20231117120625.2398417-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_err_probe to simplify error paths. Also let dev_err_probe handle
the -EPROBE_DEFER case and add an entry to
/sys/kernel/debug/devices_deferred when deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fix alignment on continuation
* Small fixes to commit message

Changes in v2:
* Use dev_err_probe in more places in probe function (as suggested by Uwe)
* Adjusted commit message

 drivers/video/backlight/pwm_bl.c | 34 +++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 289bd9ce4d36d..5bc9c6c075710 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -461,10 +461,9 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 
 	if (!data) {
 		ret = pwm_backlight_parse_dt(&pdev->dev, &defdata);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to find platform data\n");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to find platform data\n");
 
 		data = &defdata;
 	}
@@ -493,24 +492,27 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	pb->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
 						  GPIOD_ASIS);
 	if (IS_ERR(pb->enable_gpio)) {
-		ret = PTR_ERR(pb->enable_gpio);
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(pb->enable_gpio),
+				    "failed to acquire enable GPIO\n");
 		goto err_alloc;
 	}
 
 	pb->power_supply = devm_regulator_get_optional(&pdev->dev, "power");
 	if (IS_ERR(pb->power_supply)) {
 		ret = PTR_ERR(pb->power_supply);
-		if (ret == -ENODEV)
+		if (ret == -ENODEV) {
 			pb->power_supply = NULL;
-		else
+		} else {
+			dev_err_probe(&pdev->dev, ret,
+				      "failed to acquire power regulator\n");
 			goto err_alloc;
+		}
 	}
 
 	pb->pwm = devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(pb->pwm)) {
-		ret = PTR_ERR(pb->pwm);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "unable to request PWM\n");
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(pb->pwm),
+				    "unable to request PWM\n");
 		goto err_alloc;
 	}
 
@@ -530,8 +532,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 
 	ret = pwm_apply_state(pb->pwm, &state);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
-			ret);
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to apply initial PWM state");
 		goto err_alloc;
 	}
 
@@ -568,8 +570,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		ret = pwm_backlight_brightness_default(&pdev->dev, data,
 						       state.period);
 		if (ret < 0) {
-			dev_err(&pdev->dev,
-				"failed to setup default brightness table\n");
+			dev_err_probe(&pdev->dev, ret,
+				      "failed to setup default brightness table\n");
 			goto err_alloc;
 		}
 
@@ -597,8 +599,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	bl = backlight_device_register(dev_name(&pdev->dev), &pdev->dev, pb,
 				       &pwm_backlight_ops, &props);
 	if (IS_ERR(bl)) {
-		dev_err(&pdev->dev, "failed to register backlight\n");
-		ret = PTR_ERR(bl);
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(bl),
+				    "failed to register backlight\n");
 		goto err_alloc;
 	}
 
-- 
2.34.1


