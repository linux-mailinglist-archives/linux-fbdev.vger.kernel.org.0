Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999B31B37F4
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 Apr 2020 08:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgDVGvg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 Apr 2020 02:51:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42140 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgDVGvg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 Apr 2020 02:51:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pUn3130148;
        Wed, 22 Apr 2020 01:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587538290;
        bh=34pGNEIVX9mec7aDUBogd/7S0j9oPZJtVWJoDUjyq8A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZPEj913Q6Ix4Ym9VAqlA0JUjWsjP9eO+UGbwskzLebtgjxVyb6o26O9Ka9+V3hfYz
         sTw6FPVvB9mViKXjFFnLZxY6SBoWhnwNDAGiF8PwJNpNHvUtGSVQT8utE0+NDa1bw0
         n+/fiF2lrdSW8WGF87PigzxcaVVRXZbUOi82j6zI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03M6pUAd099586
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Apr 2020 01:51:30 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Apr 2020 01:51:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Apr 2020 01:51:30 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pKUa100224;
        Wed, 22 Apr 2020 01:51:28 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv3 4/4] backlight: led_bl: fix led -> backlight brightness mapping
Date:   Wed, 22 Apr 2020 09:51:14 +0300
Message-ID: <20200422065114.22164-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422065114.22164-1-tomi.valkeinen@ti.com>
References: <20200422065114.22164-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The code that maps the LED default brightness to backlight levels has
two issues: 1) if the default brightness is the first backlight level
(usually 0), the code fails to find it, and 2) when the code fails to
find a backlight level, it ends up using max_brightness + 1 as the
default brightness.

Fix these two issues.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/video/backlight/led_bl.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 63693c4f0883..699424b111ec 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -139,7 +139,6 @@ static int led_bl_parse_levels(struct device *dev,
 	num_levels = of_property_count_u32_elems(node, "brightness-levels");
 	if (num_levels > 1) {
 		int i;
-		unsigned int db;
 		u32 *levels;
 
 		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
@@ -153,15 +152,11 @@ static int led_bl_parse_levels(struct device *dev,
 		if (ret < 0)
 			return ret;
 
-		/*
-		 * Try to map actual LED brightness to backlight brightness
-		 * level
-		 */
-		db = priv->default_brightness;
-		for (i = 0 ; i < num_levels; i++) {
-			if ((i && db > levels[i - 1]) && db <= levels[i])
+		/* Map LED brightness to backlight brightness level */
+		for (i = 0; i < num_levels - 1; i++)
+			if (levels[i] >= priv->default_brightness)
 				break;
-		}
+
 		priv->default_brightness = i;
 		priv->max_brightness = num_levels - 1;
 		priv->levels = levels;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

