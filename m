Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A618250741F
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Apr 2022 18:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343701AbiDSQoK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Apr 2022 12:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354991AbiDSQmz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Apr 2022 12:42:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853C4120BE;
        Tue, 19 Apr 2022 09:40:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19B276182B;
        Tue, 19 Apr 2022 16:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382D7C385A9;
        Tue, 19 Apr 2022 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650386410;
        bh=SGqxTkP4Yr9w+PMtM+j5E4EDpF9DIlOXkFJV7VuUn10=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J476G8whPsWPqoXfmTcW3H66Ko2zlz0uQsZ6TU0EUl86DuSdHIHaObWy3+2ayXbbE
         9tcrv8iJFW3XB6zGLTjBfOzqzBnUQfcNoxSRwygWz9qRjA/3hvnyrtoJPP+qGM0BUd
         QFasdm2hnuDiivmBAIAn3V2A2OWHkmQXMD181sPCzI4DKa3YRPRF2a0gu9e56K4g4D
         6XwLheiqMYZQMPv5KGN+mEayR89GlyjcX44pDKnThzPgmOflGge4QoBkmK2rL2dP0k
         AzKrkI/o/rO4a5tqIuH5ZjMi0ZlY/2g6UdQC2I5LWcSsp8w0TjU0C0UySK/EATZs+q
         yA8d0aCgP0Z5A==
From:   Arnd Bergmann <arnd@kernel.org>
To:     robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
Subject: [PATCH 10/48] ARM: pxa: pxa2xx-ac97-lib: use IRQ resource
Date:   Tue, 19 Apr 2022 18:37:32 +0200
Message-Id: <20220419163810.2118169-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The pxa2xx-ac97-lib code is the last driver to use mach/irqs.h
for PXA. Almost everything already passes the interrupt as
a resource, so use it from there.

The one exception is the mxm8x10 machine, which apparently has
a resource-less device. Replacing it with the correct one
enables the driver here as well.

Cc: alsa-devel@alsa-project.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mxm8x10.c |  8 ++------
 sound/arm/pxa2xx-ac97-lib.c | 10 +++++++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-pxa/mxm8x10.c b/arch/arm/mach-pxa/mxm8x10.c
index fde386f6cffe..35546b59c88e 100644
--- a/arch/arm/mach-pxa/mxm8x10.c
+++ b/arch/arm/mach-pxa/mxm8x10.c
@@ -26,6 +26,7 @@
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "pxa320.h"
 
 #include "mxm8x10.h"
@@ -356,14 +357,9 @@ void __init mxm_8x10_usb_host_init(void)
 	pxa_set_ohci_info(&mxm_8x10_ohci_platform_data);
 }
 
-/* AC97 Sound Support */
-static struct platform_device mxm_8x10_ac97_device = {
-	.name = "pxa2xx-ac97"
-};
-
 void __init mxm_8x10_ac97_init(void)
 {
-	platform_device_register(&mxm_8x10_ac97_device);
+	pxa_set_ac97_info(NULL);
 }
 
 /* NAND flash Support */
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 9b5c1f0f8998..8c79d224f03b 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -21,7 +21,6 @@
 
 #include <sound/pxa2xx-lib.h>
 
-#include <mach/irqs.h>
 #include <mach/regs-ac97.h>
 #include <linux/platform_data/asoc-pxa.h>
 
@@ -319,6 +318,7 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_resume);
 int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 {
 	int ret;
+	int irq;
 	pxa2xx_audio_ops_t *pdata = dev->dev.platform_data;
 
 	if (pdata) {
@@ -387,7 +387,11 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	if (ret)
 		goto err_clk2;
 
-	ret = request_irq(IRQ_AC97, pxa2xx_ac97_irq, 0, "AC97", NULL);
+	irq = platform_get_irq(dev, 0);
+	if (!irq)
+		goto err_irq;
+
+	ret = request_irq(irq, pxa2xx_ac97_irq, 0, "AC97", NULL);
 	if (ret < 0)
 		goto err_irq;
 
@@ -413,7 +417,7 @@ void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 	if (cpu_is_pxa27x())
 		gpio_free(reset_gpio);
 	GCR |= GCR_ACLINK_OFF;
-	free_irq(IRQ_AC97, NULL);
+	free_irq(platform_get_irq(dev, 0), NULL);
 	if (ac97conf_clk) {
 		clk_put(ac97conf_clk);
 		ac97conf_clk = NULL;
-- 
2.29.2

