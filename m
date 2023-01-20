Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0811675404
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Jan 2023 13:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjATMAf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Jan 2023 07:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjATMAf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Jan 2023 07:00:35 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A44A25B3
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Jan 2023 04:00:32 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pIq4F-0001AR-D5; Fri, 20 Jan 2023 13:00:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pIq4E-007MQ5-9W; Fri, 20 Jan 2023 13:00:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pIq4D-00ENfx-Cb; Fri, 20 Jan 2023 13:00:21 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-pwm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 1/2] backlight: pwm_bl: Configure pwm only once per backlight toggle
Date:   Fri, 20 Jan 2023 13:00:17 +0100
Message-Id: <20230120120018.161103-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120120018.161103-1-u.kleine-koenig@pengutronix.de>
References: <20230120120018.161103-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3343; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+BVocXrYIPqTplwj1dZf8iEkQFikYnStNmJVE+cBQL0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjyoJG4god9do+OevxGD943dFau/yjurQQdCfXbpwK qmMPvDiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY8qCRgAKCRDB/BR4rcrsCZkUB/ 99ighYC3yIpoxoYt5fwppJiIQc4uf8Yvn10n3PZpP5Hdy9fYJztxZr6N5k+LtJ3yg1Rj+c4uZfpasZ M8zb5GiPK9VBIZySIxxY/1XStJtdmgBDBrvc7c2gRF5X39w/0XD6WEvx9UhXTGHFMMk6Bx66tmsH2k J2NPDW4Oq6bfeP7zvqLZUyKnVME4cVPTiVm59MusRgpw1SpLJy+euCY0xjh46fxq9qALMu9qqA3xnc 72olzS8MNrYdXTKVNKct/BZIxMRfG/4qWs/s1imev6srvNSMwVDtAKpZ45QYMP3Kyy842ZDLsBQwwf t9skbgildHRivbgLGnzmRt4JIuHyhh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When the function pwm_backlight_update_status() was called with
brightness > 0, pwm_get_state() was called twice (once directly and once
in compute_duty_cycle). Also pwm_apply_state() was called twice (once in
pwm_backlight_power_on() and once directly).

Optimize this to do both calls only once.

Note that with this affects the order of regulator and PWM setup. It's
not expected to have a relevant effect on hardware. The rationale for
this is that the regulator (and the GPIO) are reasonable to switch in
pwm_backlight_power_on()/pwm_backlight_power_off() but the PWM has
nothing to do with power. (The post_pwm_on_delay and pwm_off_delay are
still there though.)

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/backlight/pwm_bl.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index d0b22158cd70..0509fecd5715 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -40,10 +40,8 @@ struct pwm_bl_data {
 
 static void pwm_backlight_power_on(struct pwm_bl_data *pb)
 {
-	struct pwm_state state;
 	int err;
 
-	pwm_get_state(pb->pwm, &state);
 	if (pb->enabled)
 		return;
 
@@ -51,9 +49,6 @@ static void pwm_backlight_power_on(struct pwm_bl_data *pb)
 	if (err < 0)
 		dev_err(pb->dev, "failed to enable power supply\n");
 
-	state.enabled = true;
-	pwm_apply_state(pb->pwm, &state);
-
 	if (pb->post_pwm_on_delay)
 		msleep(pb->post_pwm_on_delay);
 
@@ -65,9 +60,6 @@ static void pwm_backlight_power_on(struct pwm_bl_data *pb)
 
 static void pwm_backlight_power_off(struct pwm_bl_data *pb)
 {
-	struct pwm_state state;
-
-	pwm_get_state(pb->pwm, &state);
 	if (!pb->enabled)
 		return;
 
@@ -77,28 +69,21 @@ static void pwm_backlight_power_off(struct pwm_bl_data *pb)
 	if (pb->pwm_off_delay)
 		msleep(pb->pwm_off_delay);
 
-	state.enabled = false;
-	state.duty_cycle = 0;
-	pwm_apply_state(pb->pwm, &state);
-
 	regulator_disable(pb->power_supply);
 	pb->enabled = false;
 }
 
-static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
+static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness, struct pwm_state *state)
 {
 	unsigned int lth = pb->lth_brightness;
-	struct pwm_state state;
 	u64 duty_cycle;
 
-	pwm_get_state(pb->pwm, &state);
-
 	if (pb->levels)
 		duty_cycle = pb->levels[brightness];
 	else
 		duty_cycle = brightness;
 
-	duty_cycle *= state.period - lth;
+	duty_cycle *= state->period - lth;
 	do_div(duty_cycle, pb->scale);
 
 	return duty_cycle + lth;
@@ -115,11 +100,18 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
 
 	if (brightness > 0) {
 		pwm_get_state(pb->pwm, &state);
-		state.duty_cycle = compute_duty_cycle(pb, brightness);
+		state.duty_cycle = compute_duty_cycle(pb, brightness, &state);
+		state.enabled = true;
 		pwm_apply_state(pb->pwm, &state);
+
 		pwm_backlight_power_on(pb);
 	} else {
 		pwm_backlight_power_off(pb);
+
+		pwm_get_state(pb->pwm, &state);
+		state.enabled = false;
+		state.duty_cycle = 0;
+		pwm_apply_state(pb->pwm, &state);
 	}
 
 	if (pb->notify_after)
-- 
2.39.0

