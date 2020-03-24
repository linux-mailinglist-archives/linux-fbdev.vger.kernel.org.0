Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8E7E19172C
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Mar 2020 18:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCXRFg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 24 Mar 2020 13:05:36 -0400
Received: from mga02.intel.com ([134.134.136.20]:21606 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727295AbgCXRFg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 24 Mar 2020 13:05:36 -0400
IronPort-SDR: 45A3N9rNAvbWDSoc05FhwbGdbcwGSzjdRPTNrRrQc7bYeCX8quIYXUaCdnFEETBw6NtzejGqHI
 OzjTvnm9Ne7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 10:05:35 -0700
IronPort-SDR: RKGsBswksdHt7HFGNuI+iVdAchD7DYRhS1Pe9ExiiC6/82b4EyD2cosT1BfMkBCvOd8iBdM6+F
 7nNJAuNgwXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,301,1580803200"; 
   d="scan'208";a="446302980"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2020 10:05:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 51ED011D; Tue, 24 Mar 2020 19:05:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, xllacyx@gmail.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/5] video: ssd1307fb: Convert driver to use ->probe_new()
Date:   Tue, 24 Mar 2020 19:05:28 +0200
Message-Id: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Use the ->probe_new() callback.

The driver does not use const struct i2c_device_id * argument,
so convert it to utilise the simplified I²C driver registration.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbdev/ssd1307fb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 142535267fec..397eae246c2c 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -586,8 +586,7 @@ static const struct of_device_id ssd1307fb_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ssd1307fb_of_match);
 
-static int ssd1307fb_probe(struct i2c_client *client,
-			   const struct i2c_device_id *id)
+static int ssd1307fb_probe(struct i2c_client *client)
 {
 	struct backlight_device *bl;
 	char bl_name[12];
@@ -599,11 +598,6 @@ static int ssd1307fb_probe(struct i2c_client *client,
 	void *vmem;
 	int ret;
 
-	if (!node) {
-		dev_err(&client->dev, "No device tree data found!\n");
-		return -EINVAL;
-	}
-
 	info = framebuffer_alloc(sizeof(struct ssd1307fb_par), &client->dev);
 	if (!info)
 		return -ENOMEM;
@@ -808,7 +802,7 @@ static const struct i2c_device_id ssd1307fb_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, ssd1307fb_i2c_id);
 
 static struct i2c_driver ssd1307fb_driver = {
-	.probe = ssd1307fb_probe,
+	.probe_new = ssd1307fb_probe,
 	.remove = ssd1307fb_remove,
 	.id_table = ssd1307fb_i2c_id,
 	.driver = {
-- 
2.25.1

