Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36AC61ADC41
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 13:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbgDQLdm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 07:33:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40370 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730267AbgDQLdm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 07:33:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HBXbTw115883;
        Fri, 17 Apr 2020 06:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587123217;
        bh=acexv/ij+LUZ7KP4IsiUoRtnOadixUMPUr0qN2NJyS4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NHdtG/g8IoBV5MqrwJIQFMt83DljRXXozAfJJZZQYW9CVUV8obSu/qEk8wwcKy/Bc
         u6orfgiduQCXp8J7yC9XxAqx/A2oFxh6DRpnrxj5shcF1x3zkYSNNOprJMGmFhnzD2
         ib9+CtMFnbm0dTo0dJkA4vEmg1/B/18Ye+cl0hOk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HBXbPh120489
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Apr 2020 06:33:37 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 06:33:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 06:33:36 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HBXSSm012787;
        Fri, 17 Apr 2020 06:33:34 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 4/5] backlight: led_bl: fix led -> backlight brightness mapping
Date:   Fri, 17 Apr 2020 14:33:11 +0300
Message-ID: <20200417113312.24340-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417113312.24340-1-tomi.valkeinen@ti.com>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
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
 drivers/video/backlight/led_bl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 63693c4f0883..021b5edd895c 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -159,10 +159,11 @@ static int led_bl_parse_levels(struct device *dev,
 		 */
 		db = priv->default_brightness;
 		for (i = 0 ; i < num_levels; i++) {
-			if ((i && db > levels[i - 1]) && db <= levels[i])
+			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
 				break;
 		}
-		priv->default_brightness = i;
+
+		priv->default_brightness = i < num_levels ? i : 0;
 		priv->max_brightness = num_levels - 1;
 		priv->levels = levels;
 	} else if (num_levels >= 0) {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

