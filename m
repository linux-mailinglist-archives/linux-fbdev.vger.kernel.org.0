Return-Path: <linux-fbdev+bounces-129-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C897EECA9
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Nov 2023 08:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44191F23A67
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Nov 2023 07:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD03D300;
	Fri, 17 Nov 2023 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="fVhRV/Fh"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7949A109;
	Thu, 16 Nov 2023 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1700206396; x=1731742396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+7xplb2EDRVudwSeGqzpqCtcj22RhVs/CX26mtXzjQk=;
  b=fVhRV/FhFnCOjkm4xaqwAmlfsEqV5UvAeU5kqcKLpInSkHCmz41G9VTI
   Se+9V4Cmx0WfKlpH3Uae18ZAoF5E3pF36rwavdijc5aJKl1pDiuCkiDqr
   8EajCvxS08hacAXMd0KPN3kMzVYbSkENyOIiHM96azns7/Usqqnufgwa5
   WEgGgxS27aaNSVup+SMOIzuSx0SBUGvLVpUebrelZRtGrArHB8X7KEkKf
   k0ibq5tFsBsW+nniFNEyzsipTbajGidtL/NopmIRBG5KZAuqgco7yyyfI
   MmSUEMh61dLlfwwN7GzKxgytwlGXNRYK0x6DwJQS0lRk2X7yEx9wgAS4R
   A==;
X-IronPort-AV: E=Sophos;i="6.04,206,1695679200"; 
   d="scan'208";a="34032746"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Nov 2023 08:33:14 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3C5EC28007F;
	Fri, 17 Nov 2023 08:33:14 +0100 (CET)
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
Subject: [PATCH v2 1/1] backlight: pwm_bl: Use dev_err_probe
Date: Fri, 17 Nov 2023 08:33:16 +0100
Message-Id: <20231117073316.2103162-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_err_probe to simplify error paths. Also Let dev_err_probe handle
the -EPROBE_DEFER case and also add an entry to
/sys/kernel/debug/devices_deferred when deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Use dev_err_probe in more places in probe function (as suggested by Uwe)
* Adjusted commit message

 drivers/video/backlight/pwm_bl.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 289bd9ce4d36d..e1b3fe04d3169 100644
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
 
@@ -568,7 +570,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		ret = pwm_backlight_brightness_default(&pdev->dev, data,
 						       state.period);
 		if (ret < 0) {
-			dev_err(&pdev->dev,
+			dev_err_probe(&pdev->dev, ret,
 				"failed to setup default brightness table\n");
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


