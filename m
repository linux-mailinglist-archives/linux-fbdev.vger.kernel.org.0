Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378991B2699
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Apr 2020 14:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgDUMqo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Apr 2020 08:46:44 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40320 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgDUMqo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Apr 2020 08:46:44 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkaAh126589;
        Tue, 21 Apr 2020 07:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587473196;
        bh=upP5WA4qSGdUri1Qc9y0c7ggU/AdA1J+HO5qhLQGGMg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RUiI6y80LnmMPzgMdhaeDxqWAo/eHs5OiuzVV5y4Zi76lQzgPCL6+DPyo9neq60hu
         8VJk4XSwUJD1L8qYjhqX9wWM4HTeBkgb8OSoB5sKsimVyOhK2lc4gAW1izB504O+eD
         KQGVp+s42wF8iFKmzGmp1/7HSXXwDgt5idwD2WCw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03LCka3r027509
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Apr 2020 07:46:36 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 07:46:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 07:46:36 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkVx4037462;
        Tue, 21 Apr 2020 07:46:34 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 1/4] backlight: led_bl: fix cosmetic issues
Date:   Tue, 21 Apr 2020 15:46:26 +0300
Message-ID: <20200421124629.20977-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421124629.20977-1-tomi.valkeinen@ti.com>
References: <20200421124629.20977-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix issues reported by checkpatch. No functional changes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/led_bl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 3f66549997c8..d4e1ce684366 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -126,7 +126,7 @@ static int led_bl_get_leds(struct device *dev,
 }
 
 static int led_bl_parse_levels(struct device *dev,
-			   struct led_bl_data *priv)
+			       struct led_bl_data *priv)
 {
 	struct device_node *node = dev->of_node;
 	int num_levels;
@@ -148,8 +148,8 @@ static int led_bl_parse_levels(struct device *dev,
 			return -ENOMEM;
 
 		ret = of_property_read_u32_array(node, "brightness-levels",
-						levels,
-						num_levels);
+						 levels,
+						 num_levels);
 		if (ret < 0)
 			return ret;
 
@@ -159,14 +159,15 @@ static int led_bl_parse_levels(struct device *dev,
 		 */
 		db = priv->default_brightness;
 		for (i = 0 ; i < num_levels; i++) {
-			if ((i && db > levels[i-1]) && db <= levels[i])
+			if ((i && db > levels[i - 1]) && db <= levels[i])
 				break;
 		}
 		priv->default_brightness = i;
 		priv->max_brightness = num_levels - 1;
 		priv->levels = levels;
-	} else if (num_levels >= 0)
+	} else if (num_levels >= 0) {
 		dev_warn(dev, "Not enough levels defined\n");
+	}
 
 	ret = of_property_read_u32(node, "default-brightness-level", &value);
 	if (!ret && value <= priv->max_brightness)
@@ -208,7 +209,8 @@ static int led_bl_probe(struct platform_device *pdev)
 	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
 		      FB_BLANK_UNBLANK;
 	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
-			&pdev->dev, priv, &led_bl_ops, &props);
+						 &pdev->dev, priv, &led_bl_ops,
+						 &props);
 	if (IS_ERR(priv->bl_dev)) {
 		dev_err(&pdev->dev, "Failed to register backlight\n");
 		return PTR_ERR(priv->bl_dev);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

