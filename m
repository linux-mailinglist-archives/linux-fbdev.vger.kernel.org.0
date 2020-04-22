Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EE21B37F6
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 Apr 2020 08:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgDVGvg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 Apr 2020 02:51:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50394 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgDVGvg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 Apr 2020 02:51:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pTup049515;
        Wed, 22 Apr 2020 01:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587538289;
        bh=LskT7Fluz1afemuppgQ3E8smEknLw7ty0G3qU//E2DU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CSfSi1e2omadz6STW3mIOTHuOExZA8JRd3dTbM2FLxp/79zIY5MGvasnIRMrio6c9
         IMaJkb+nQAYGqgqjRaHkmXzYol/uPu8TfgtTu8IhavtSib0u5F48syiRUwpZU+o5Xx
         s8n8qgm4/scOLFiEOiOqOUTB0fvmcaFQc3fjccEA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pT5V001135;
        Wed, 22 Apr 2020 01:51:29 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Apr 2020 01:51:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Apr 2020 01:51:28 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pKUZ100224;
        Wed, 22 Apr 2020 01:51:26 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv3 3/4] backlight: led_bl: add led_access locking
Date:   Wed, 22 Apr 2020 09:51:13 +0300
Message-ID: <20200422065114.22164-4-tomi.valkeinen@ti.com>
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

led_bl does not lock 'led_access' when calling led_sysfs_disable and
led_sysfs_enable, causing the below WARN. Add the locking.

WARNING: CPU: 0 PID: 223 at drivers/leds/led-core.c:353 led_sysfs_disable+0x4c/0x5c

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/led_bl.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index c46ecdfe8b0a..63693c4f0883 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -216,8 +216,11 @@ static int led_bl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->bl_dev);
 	}
 
-	for (i = 0; i < priv->nb_leds; i++)
+	for (i = 0; i < priv->nb_leds; i++) {
+		mutex_lock(&priv->leds[i]->led_access);
 		led_sysfs_disable(priv->leds[i]);
+		mutex_unlock(&priv->leds[i]->led_access);
+	}
 
 	backlight_update_status(priv->bl_dev);
 
@@ -233,8 +236,11 @@ static int led_bl_remove(struct platform_device *pdev)
 	backlight_device_unregister(bl);
 
 	led_bl_power_off(priv);
-	for (i = 0; i < priv->nb_leds; i++)
+	for (i = 0; i < priv->nb_leds; i++) {
+		mutex_lock(&priv->leds[i]->led_access);
 		led_sysfs_enable(priv->leds[i]);
+		mutex_unlock(&priv->leds[i]->led_access);
+	}
 
 	return 0;
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

