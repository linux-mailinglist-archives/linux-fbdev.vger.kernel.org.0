Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8468769FC5
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jul 2019 02:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731009AbfGPAZH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 15 Jul 2019 20:25:07 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:48375 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732317AbfGPAZH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 15 Jul 2019 20:25:07 -0400
Received: (qmail 9912 invoked by uid 5089); 16 Jul 2019 00:25:04 -0000
Received: by simscan 1.2.0 ppid: 9861, pid: 9862, t: 0.0496s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 16 Jul 2019 00:25:04 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id E9AA7200A395F; Tue, 16 Jul 2019 08:24:59 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     gregkh@linuxfoundation.org, bhanusreemahesh@gmail.com,
        leobras.c@gmail.com, nsaenzjulienne@suse.de,
        nishadkamdar@gmail.com, preid@electromag.com.au,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH v2 1/2] Staging: fbtft: Fix probing of gpio descriptor
Date:   Tue, 16 Jul 2019 08:24:36 +0800
Message-Id: <1563236677-5045-2-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563236677-5045-1-git-send-email-preid@electromag.com.au>
References: <1563236677-5045-1-git-send-email-preid@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Conversion to use gpio descriptors broke all gpio lookups as
devm_gpiod_get_index was converted to use dev->driver->name for
the gpio name lookup. Fix this by using the name param. In
addition gpiod_get post-fixes the -gpios to the name so that
shouldn't be included in the call. However this then breaks the
of_find_property call to see if the gpio entry exists as all
fbtft treats all gpios as optional. So use devm_gpiod_get_index_optional
instead which achieves the same thing and is simpler.

Nishad confirmed the changes where only ever compile tested.

Fixes: c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor interface")
Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Jan Sebastian Götte <linux@jaseg.net>
Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/staging/fbtft/fbtft-core.c | 39 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9b07bad..44b8074 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -76,21 +76,18 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
 				  struct gpio_desc **gpiop)
 {
 	struct device *dev = par->info->device;
-	struct device_node *node = dev->of_node;
 	int ret = 0;
 
-	if (of_find_property(node, name, NULL)) {
-		*gpiop = devm_gpiod_get_index(dev, dev->driver->name, index,
-					      GPIOD_OUT_HIGH);
-		if (IS_ERR(*gpiop)) {
-			ret = PTR_ERR(*gpiop);
-			dev_err(dev,
-				"Failed to request %s GPIO:%d\n", name, ret);
-			return ret;
-		}
-		fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
-			      __func__, name);
+	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
+					       GPIOD_OUT_HIGH);
+	if (IS_ERR(*gpiop)) {
+		ret = PTR_ERR(*gpiop);
+		dev_err(dev,
+			"Failed to request %s GPIO: %d\n", name, ret);
+		return ret;
 	}
+	fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
+		      __func__, name);
 
 	return ret;
 }
@@ -103,34 +100,34 @@ static int fbtft_request_gpios_dt(struct fbtft_par *par)
 	if (!par->info->device->of_node)
 		return -EINVAL;
 
-	ret = fbtft_request_one_gpio(par, "reset-gpios", 0, &par->gpio.reset);
+	ret = fbtft_request_one_gpio(par, "reset", 0, &par->gpio.reset);
 	if (ret)
 		return ret;
-	ret = fbtft_request_one_gpio(par, "dc-gpios", 0, &par->gpio.dc);
+	ret = fbtft_request_one_gpio(par, "dc", 0, &par->gpio.dc);
 	if (ret)
 		return ret;
-	ret = fbtft_request_one_gpio(par, "rd-gpios", 0, &par->gpio.rd);
+	ret = fbtft_request_one_gpio(par, "rd", 0, &par->gpio.rd);
 	if (ret)
 		return ret;
-	ret = fbtft_request_one_gpio(par, "wr-gpios", 0, &par->gpio.wr);
+	ret = fbtft_request_one_gpio(par, "wr", 0, &par->gpio.wr);
 	if (ret)
 		return ret;
-	ret = fbtft_request_one_gpio(par, "cs-gpios", 0, &par->gpio.cs);
+	ret = fbtft_request_one_gpio(par, "cs", 0, &par->gpio.cs);
 	if (ret)
 		return ret;
-	ret = fbtft_request_one_gpio(par, "latch-gpios", 0, &par->gpio.latch);
+	ret = fbtft_request_one_gpio(par, "latch", 0, &par->gpio.latch);
 	if (ret)
 		return ret;
 	for (i = 0; i < 16; i++) {
-		ret = fbtft_request_one_gpio(par, "db-gpios", i,
+		ret = fbtft_request_one_gpio(par, "db", i,
 					     &par->gpio.db[i]);
 		if (ret)
 			return ret;
-		ret = fbtft_request_one_gpio(par, "led-gpios", i,
+		ret = fbtft_request_one_gpio(par, "led", i,
 					     &par->gpio.led[i]);
 		if (ret)
 			return ret;
-		ret = fbtft_request_one_gpio(par, "aux-gpios", i,
+		ret = fbtft_request_one_gpio(par, "aux", i,
 					     &par->gpio.aux[i]);
 		if (ret)
 			return ret;
-- 
1.8.3.1

