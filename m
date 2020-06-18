Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C49A1FE151
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jun 2020 03:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731626AbgFRBxu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 17 Jun 2020 21:53:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731613AbgFRB0M (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 17 Jun 2020 21:26:12 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A44320897;
        Thu, 18 Jun 2020 01:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443571;
        bh=D7QnYO+pvZnv4CSj2j8if+GlEBWTIfsf+981WJSK4Ig=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z7ExQTKOtQmavAEZBw1a636Fir93PWMXSMrA55MDUxXYBbZBDTpA7S5YI/HVng4ru
         hTn2FNGUGKyx3uHc6KnvuU5kd7LThXvQXyf4MOs7aGpKiElhzKMMnALr7sDxV0DkbD
         LgG0X3CSiSQlLwpuclESE2ZmoUoD/Y8F93DrI94I=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 008/108] backlight: lp855x: Ensure regulators are disabled on probe failure
Date:   Wed, 17 Jun 2020 21:24:20 -0400
Message-Id: <20200618012600.608744-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012600.608744-1-sashal@kernel.org>
References: <20200618012600.608744-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>

[ Upstream commit d8207c155a7c6015eb7f43739baa7dfb1fa638af ]

If probing the LP885x backlight fails after the regulators have been
enabled, then the following warning is seen when releasing the
regulators ...

 WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
 Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
 CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
 Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)

 ...

 Call trace:
  _regulator_put.part.28+0x158/0x160
  regulator_put+0x34/0x50
  devm_regulator_release+0x10/0x18
  release_nodes+0x12c/0x230
  devres_release_all+0x34/0x50
  really_probe+0x1c0/0x370
  driver_probe_device+0x58/0x100
  device_driver_attach+0x6c/0x78
  __driver_attach+0xb0/0xf0
  bus_for_each_dev+0x68/0xc8
  driver_attach+0x20/0x28
  bus_add_driver+0x160/0x1f0
  driver_register+0x60/0x110
  i2c_register_driver+0x40/0x80
  lp855x_driver_init+0x20/0x1000 [lp855x_bl]
  do_one_initcall+0x58/0x1a0
  do_init_module+0x54/0x1d0
  load_module+0x1d80/0x21c8
  __do_sys_finit_module+0xe8/0x100
  __arm64_sys_finit_module+0x18/0x20
  el0_svc_common.constprop.3+0xb0/0x168
  do_el0_svc+0x20/0x98
  el0_sync_handler+0xf4/0x1b0
  el0_sync+0x140/0x180

Fix this by ensuring that the regulators are disabled, if enabled, on
probe failure.

Finally, ensure that the vddio regulator is disabled in the driver
remove handler.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/backlight/lp855x_bl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 939f057836e1..4cdc7a3f6dc5 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -460,7 +460,7 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 		ret = regulator_enable(lp->enable);
 		if (ret < 0) {
 			dev_err(lp->dev, "failed to enable vddio: %d\n", ret);
-			return ret;
+			goto disable_supply;
 		}
 
 		/*
@@ -475,24 +475,34 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	ret = lp855x_configure(lp);
 	if (ret) {
 		dev_err(lp->dev, "device config err: %d", ret);
-		return ret;
+		goto disable_vddio;
 	}
 
 	ret = lp855x_backlight_register(lp);
 	if (ret) {
 		dev_err(lp->dev,
 			"failed to register backlight. err: %d\n", ret);
-		return ret;
+		goto disable_vddio;
 	}
 
 	ret = sysfs_create_group(&lp->dev->kobj, &lp855x_attr_group);
 	if (ret) {
 		dev_err(lp->dev, "failed to register sysfs. err: %d\n", ret);
-		return ret;
+		goto disable_vddio;
 	}
 
 	backlight_update_status(lp->bl);
+
 	return 0;
+
+disable_vddio:
+	if (lp->enable)
+		regulator_disable(lp->enable);
+disable_supply:
+	if (lp->supply)
+		regulator_disable(lp->supply);
+
+	return ret;
 }
 
 static int lp855x_remove(struct i2c_client *cl)
@@ -501,6 +511,8 @@ static int lp855x_remove(struct i2c_client *cl)
 
 	lp->bl->props.brightness = 0;
 	backlight_update_status(lp->bl);
+	if (lp->enable)
+		regulator_disable(lp->enable);
 	if (lp->supply)
 		regulator_disable(lp->supply);
 	sysfs_remove_group(&lp->dev->kobj, &lp855x_attr_group);
-- 
2.25.1

