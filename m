Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22A31B269A
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Apr 2020 14:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDUMqp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Apr 2020 08:46:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48998 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728524AbgDUMqp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Apr 2020 08:46:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkdSU046177;
        Tue, 21 Apr 2020 07:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587473199;
        bh=Zs6KQC1iefAXl+flTN8k21B4sb8ZHsnZ/WFHZcR7wUc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hF5pomCaogXHxL8R2Y7gcNsTeEKclztR/iL6c0mW5tTDDZCLuTkxfOCaGP/ShT0SX
         ORw/sgW87+OiU21ehpiuFi/qb+xngb7ULimwH9TWUibhtHcy1jd+3vvGQwOKyR943A
         MhxrE5SwvSuQ+uCWLqW5hL4VAY1fj70xvjnjvVpw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03LCkdWl082418
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Apr 2020 07:46:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 07:46:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 07:46:37 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkVx5037462;
        Tue, 21 Apr 2020 07:46:36 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 2/4] backlight: led_bl: drop useless NULL initialization
Date:   Tue, 21 Apr 2020 15:46:27 +0300
Message-ID: <20200421124629.20977-3-tomi.valkeinen@ti.com>
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

There's no need to set 'levels' to NULL.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/led_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index d4e1ce684366..c46ecdfe8b0a 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -140,7 +140,7 @@ static int led_bl_parse_levels(struct device *dev,
 	if (num_levels > 1) {
 		int i;
 		unsigned int db;
-		u32 *levels = NULL;
+		u32 *levels;
 
 		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
 				      GFP_KERNEL);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

