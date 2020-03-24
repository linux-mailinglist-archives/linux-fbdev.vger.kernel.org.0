Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4699C19172D
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Mar 2020 18:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbgCXRFg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 24 Mar 2020 13:05:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:63105 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726962AbgCXRFg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 24 Mar 2020 13:05:36 -0400
IronPort-SDR: 40PxoHj0VBHF3dMrjspyTaI/OrwmJ76rCp6WXeOtLVLpENVtVs4wTRRAWjRPhcXuIBJV+2DV/m
 rgmCJZ3WaILg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 10:05:35 -0700
IronPort-SDR: eMH9CvK8/YoruOwWqa53+chBimw6Stn+61rXGhdH8XRlqkoo9HHrv0SdMsxqT3fHJVrLFsFcpv
 XBb2Cudqxf4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,301,1580803200"; 
   d="scan'208";a="281774597"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2020 10:05:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6E1F33BA; Tue, 24 Mar 2020 19:05:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, xllacyx@gmail.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/5] video: ssd1307fb: Convert to atomic PWM API
Date:   Tue, 24 Mar 2020 19:05:31 +0200
Message-Id: <20200324170532.44384-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Use the atomic API wherever appropriate and get rid of pwm_apply_args()
call (the reference period and polarity are now explicitly set when
calling pwm_apply_state()).

We also make use of the pwm_set_relative_duty_cycle() helper to ease
relative to absolute duty_cycle conversion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbdev/ssd1307fb.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 7a6a44a0b7a6..6e543396002a 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -79,7 +79,6 @@ struct ssd1307fb_par {
 	u32 prechargep1;
 	u32 prechargep2;
 	struct pwm_device *pwm;
-	u32 pwm_period;
 	struct gpio_desc *reset;
 	struct regulator *vbat_reg;
 	u32 vcomh;
@@ -297,9 +296,9 @@ static void ssd1307fb_deferred_io(struct fb_info *info,
 
 static int ssd1307fb_init(struct ssd1307fb_par *par)
 {
+	struct pwm_state pwmstate;
 	int ret;
 	u32 precharge, dclk, com_invdir, compins;
-	struct pwm_args pargs;
 
 	if (par->device_info->need_pwm) {
 		par->pwm = pwm_get(&par->client->dev, NULL);
@@ -308,21 +307,15 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 			return PTR_ERR(par->pwm);
 		}
 
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(par->pwm);
+		pwm_init_state(par->pwm, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
+		pwm_apply_state(par->pwm, &pwmstate);
 
-		pwm_get_args(par->pwm, &pargs);
-
-		par->pwm_period = pargs.period;
 		/* Enable the PWM */
-		pwm_config(par->pwm, par->pwm_period / 2, par->pwm_period);
 		pwm_enable(par->pwm);
 
 		dev_dbg(&par->client->dev, "Using PWM%d with a %dns period.\n",
-			par->pwm->pwm, par->pwm_period);
+			par->pwm->pwm, pwm_get_period(par->pwm));
 	}
 
 	/* Set initial contrast */
-- 
2.25.1

