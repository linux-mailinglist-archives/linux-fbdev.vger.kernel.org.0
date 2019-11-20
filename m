Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73BF103711
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Nov 2019 10:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbfKTJ5V (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Nov 2019 04:57:21 -0500
Received: from mga07.intel.com ([134.134.136.100]:30210 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728563AbfKTJ5V (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Nov 2019 04:57:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 01:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; 
   d="scan'208";a="204685531"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2019 01:57:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9602F250; Wed, 20 Nov 2019 11:57:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        linux-fbdev@vger.kernel.org,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        devel@driverdev.osuosl.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/5] fbtft: Drop useless #ifdef CONFIG_OF and dead code
Date:   Wed, 20 Nov 2019 11:57:14 +0200
Message-Id: <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

First of all there is no need to guard GPIO request by CONFIG_OF.
It works for everybody independently on resource provider. While here,
rename the function to reflect the above.

Moreover, since we have a global dependency to OF, the rest of
conditional compilation is no-op, i.e. it's always be true.

Due to above drop useless #ifdef CONFIG_OF and therefore dead code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fbtft-core.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 2122c4407bdb..ff8cb6670ea1 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -70,7 +70,6 @@ void fbtft_dbg_hex(const struct device *dev, int groupsize,
 }
 EXPORT_SYMBOL(fbtft_dbg_hex);
 
-#ifdef CONFIG_OF
 static int fbtft_request_one_gpio(struct fbtft_par *par,
 				  const char *name, int index,
 				  struct gpio_desc **gpiop)
@@ -92,14 +91,11 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
 	return ret;
 }
 
-static int fbtft_request_gpios_dt(struct fbtft_par *par)
+static int fbtft_request_gpios(struct fbtft_par *par)
 {
 	int i;
 	int ret;
 
-	if (!par->info->device->of_node)
-		return -EINVAL;
-
 	ret = fbtft_request_one_gpio(par, "reset", 0, &par->gpio.reset);
 	if (ret)
 		return ret;
@@ -135,7 +131,6 @@ static int fbtft_request_gpios_dt(struct fbtft_par *par)
 
 	return 0;
 }
-#endif
 
 #ifdef CONFIG_FB_BACKLIGHT
 static int fbtft_backlight_update_status(struct backlight_device *bd)
@@ -898,7 +893,6 @@ int fbtft_unregister_framebuffer(struct fb_info *fb_info)
 }
 EXPORT_SYMBOL(fbtft_unregister_framebuffer);
 
-#ifdef CONFIG_OF
 /**
  * fbtft_init_display_dt() - Device Tree init_display() function
  * @par: Driver data
@@ -977,7 +971,6 @@ static int fbtft_init_display_dt(struct fbtft_par *par)
 
 	return 0;
 }
-#endif
 
 /**
  * fbtft_init_display() - Generic init_display() function
@@ -1138,7 +1131,6 @@ static int fbtft_verify_gpios(struct fbtft_par *par)
 	return 0;
 }
 
-#ifdef CONFIG_OF
 /* returns 0 if the property is not present */
 static u32 fbtft_of_value(struct device_node *node, const char *propname)
 {
@@ -1184,17 +1176,10 @@ static struct fbtft_platform_data *fbtft_probe_dt(struct device *dev)
 		pdata->display.backlight = 1;
 	if (of_find_property(node, "init", NULL))
 		pdata->display.fbtftops.init_display = fbtft_init_display_dt;
-	pdata->display.fbtftops.request_gpios = fbtft_request_gpios_dt;
+	pdata->display.fbtftops.request_gpios = fbtft_request_gpios;
 
 	return pdata;
 }
-#else
-static struct fbtft_platform_data *fbtft_probe_dt(struct device *dev)
-{
-	dev_err(dev, "Missing platform data\n");
-	return ERR_PTR(-EINVAL);
-}
-#endif
 
 /**
  * fbtft_probe_common() - Generic device probe() helper function
-- 
2.24.0

