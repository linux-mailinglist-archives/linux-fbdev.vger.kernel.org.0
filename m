Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10CF3AE8FB
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Jun 2021 14:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhFUMYn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 21 Jun 2021 08:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhFUMYn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 21 Jun 2021 08:24:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628A8C061574
        for <linux-fbdev@vger.kernel.org>; Mon, 21 Jun 2021 05:22:28 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lvIwc-0005wc-Dl; Mon, 21 Jun 2021 14:22:26 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lvIwc-0005JD-3J; Mon, 21 Jun 2021 14:22:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     linux-fbdev@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH v3 1/2] backlight: lm3630a: fix return code of .update_status() callback
Date:   Mon, 21 Jun 2021 14:21:47 +0200
Message-Id: <20210621122148.116863-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
References: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=h+n80Xzqbq+ffITZR32lcPZ+dUBgLhq3+fhazbwNW+0=; m=iYucs/WPZi9XrWNbDHYxfJLugj2ogDwI1NsvY5koQ4U=; p=uXAvkFT/NEyztFELlgEcTJX+VE+3gUPbAIy77CnIUm0=; g=cc810279fd435ea5f58c506e1a0fedab27825999
X-Patch-Sig: m=pgp; i=uwe@kleine-koenig.org; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDQhBgACgkQwfwUeK3K7Am+cQf/b98 a5bDkXrQtW4c7MEL7cSUceZHQjZYMfXK79WXH7xSyAFR7ZWAyMd07M2F9lQId/hCvAyIeZJe8Hf2+ tot+dM1bN+jkV03XvTBeJMM4BtQ8HK+JXVCUD45Uo1vZCV+7fVVV3gd4SYvwsVreZ6l0j8Id1YqlR AgcL81Jc7t/Fwd+Z18jxrTi+GXYwyHeF/RYCihWIJrapHSufnVBOpI30zGiKVi/+Mx+pqr5X334vT TAl5cLFICxvR4HKWFxp2plczVQR/ahSJbd9rmP0DkPdG92QGAiOLAny478OCfgmYU6evJ64gWB8pt qXru2HyYXxgq8GSSZ3D35KqHh5LE/ig==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

According to <linux/backlight.h> .update_status() is supposed to
return 0 on success and a negative error code otherwise. Adapt
lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status() to
actually do it.

While touching that also add the error code to the failure message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/backlight/lm3630a_bl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index e88a2b0e5904..7140b0d98082 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -190,7 +190,7 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0) {
 		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
 				 bl->props.max_brightness);
-		return bl->props.brightness;
+		return 0;
 	}
 
 	/* disable sleep */
@@ -210,8 +210,8 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 	return 0;
 
 out_i2c_err:
-	dev_err(pchip->dev, "i2c failed to access\n");
-	return bl->props.brightness;
+	dev_err(pchip->dev, "i2c failed to access (%pe)\n", ERR_PTR(ret));
+	return ret;
 }
 
 static int lm3630a_bank_a_get_brightness(struct backlight_device *bl)
@@ -267,7 +267,7 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 	if ((pwm_ctrl & LM3630A_PWM_BANK_B) != 0) {
 		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
 				 bl->props.max_brightness);
-		return bl->props.brightness;
+		return 0;
 	}
 
 	/* disable sleep */
@@ -287,8 +287,8 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 	return 0;
 
 out_i2c_err:
-	dev_err(pchip->dev, "i2c failed to access REG_CTRL\n");
-	return bl->props.brightness;
+	dev_err(pchip->dev, "i2c failed to access (%pe)\n", ERR_PTR(ret));
+	return ret;
 }
 
 static int lm3630a_bank_b_get_brightness(struct backlight_device *bl)
-- 
2.30.2

