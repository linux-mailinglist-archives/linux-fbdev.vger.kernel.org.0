Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8593CCAC6
	for <lists+linux-fbdev@lfdr.de>; Sun, 18 Jul 2021 23:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhGRVR0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 18 Jul 2021 17:17:26 -0400
Received: from phobos.denx.de ([85.214.62.61]:37914 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229585AbhGRVRZ (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 18 Jul 2021 17:17:25 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 955B68033E;
        Sun, 18 Jul 2021 23:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1626642866;
        bh=DpL/aZwfGE8i32NM528iche5Yn/SJH+28jhVNUngo+4=;
        h=From:To:Cc:Subject:Date:From;
        b=o1fvQV4lSaRFMuf7HvFJMi96Mzm5yxrk9yBX0havV6LgAvlfEnNwKltb50VOxySSA
         78fpl7HpRa0ZFLNJ6LbHC1sU9HD3Sfb4NqkFAelRlGBKPFbvudRr7vXqaiAy2RHIEZ
         +XgGuw2gTrhAdgx4QBuaNSOra+gVgzJ5RTIj6sPurnEVFVu+C+EbHuUeQOzBVGBOrn
         AmWV6/avNi2nIUo6PuWiDrvcnEBMbe0QTD2C/1mlPCb92rVqWY/+h8CrElcuazpv28
         CnbQwA9omZvQKr+nzaYsIZ8b4JTXkPhJI0D0jrf9FaFOsPfF+o3KbwJ1pLLwIh6yOh
         cu5moKVO5+f3Q==
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-fbdev@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org
Subject: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight control GPIO is input
Date:   Sun, 18 Jul 2021 23:14:15 +0200
Message-Id: <20210718211415.143709-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

If the backlight enable GPIO is configured as input, the driver currently
unconditionally forces the GPIO to output-enable. This can cause backlight
flicker on boot e.g. in case the GPIO should not be enabled before the PWM
is configured and is correctly pulled low by external resistor.

Fix this by extending the current check to differentiate between backlight
GPIO enable set as input and set as direction unknown. In case of input,
read the GPIO value to determine the pull resistor placement, set the GPIO
as output, and drive that exact value it was pulled to. In case of unknown
direction, retain previous behavior, that is set the GPIO as output-enable.

Fixes: 3698d7e7d221 ("backlight: pwm_bl: Avoid backlight flicker when probed from DT")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thierry Reding <treding@nvidia.com>
Cc: linux-pwm@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
NOTE: I think this whole auto-detection scheme should just be replaced by a
      DT prop, because it is very fragile.
---
 drivers/video/backlight/pwm_bl.c | 35 +++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index e48fded3e414..7ec992b722eb 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -445,7 +445,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct pwm_bl_data *pb;
 	struct pwm_state state;
-	unsigned int i;
+	unsigned int i, dir, val;
 	int ret;
 
 	if (!data) {
@@ -487,16 +487,31 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * If the GPIO is not known to be already configured as output, that
-	 * is, if gpiod_get_direction returns either 1 or -EINVAL, change the
-	 * direction to output and set the GPIO as active.
-	 * Do not force the GPIO to active when it was already output as it
-	 * could cause backlight flickering or we would enable the backlight too
-	 * early. Leave the decision of the initial backlight state for later.
+	 * If the GPIO is not known to be already configured as output, then:
+	 * - if the GPIO direction is input, read its current value to find out
+	 *   whether the pin is pulled high or low (it is backlight control, so
+	 *   it cannot be floating), change the direction to output and set the
+	 *   GPIO such that it drives this strapped value.
+	 *   Do not force the GPIO to state which is different than that to
+	 *   which the GPIO was pulled to, this could cause backlight flicker
+	 *   on boot e.g. in case the PWM is not ready yet.
+	 * - if the GPIO direction is unknown, tahat is, if gpiod_get_direction
+	 *   returns -EINVAL, change the direction to output and set the GPIO
+	 *   as active.
+	 *   Do not force the GPIO to active when it was already output as it
+	 *   could cause backlight flickering or we would enable the backlight
+	 *   too early. Leave the decision of the initial backlight state for
+	 *   later.
 	 */
-	if (pb->enable_gpio &&
-	    gpiod_get_direction(pb->enable_gpio) != 0)
-		gpiod_direction_output(pb->enable_gpio, 1);
+	if (pb->enable_gpio) {
+		dir = gpiod_get_direction(pb->enable_gpio);
+		if (dir != 0) {
+			val = 1;
+			if (dir == 1)
+				val = gpiod_get_value_cansleep(pb->enable_gpio);
+			gpiod_direction_output(pb->enable_gpio, val);
+		}
+	}
 
 	pb->power_supply = devm_regulator_get(&pdev->dev, "power");
 	if (IS_ERR(pb->power_supply)) {
-- 
2.30.2

