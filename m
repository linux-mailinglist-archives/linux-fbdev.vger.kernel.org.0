Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56F8507455
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Apr 2022 18:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355191AbiDSQs2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Apr 2022 12:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355069AbiDSQnv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Apr 2022 12:43:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CC223BF4;
        Tue, 19 Apr 2022 09:41:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E6505B81BBE;
        Tue, 19 Apr 2022 16:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D13C385AB;
        Tue, 19 Apr 2022 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650386465;
        bh=U6UXkGiba+IWPQ84YTVH8JdmB9ez+oeADVDoBoSMAeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dx+/8hWSqP54Qj1bLqmbcjy7EOlZLK7fehRxrCDudwV6M9Fy7SO9kbeCNChaDPtyq
         nsffbT6io+sZXH1/7PSZ5lArW4jYfo9IEA5PA3ZHDbrheUIW4wgeNtLX6XxzXMp7NU
         dcGLlN+W9BezzkCXSsS0Z38Bztbsq5Tl/AIm+XmzC4ZeRrzAQBlu7Gz95MmYpNBKUO
         +zYF0K/ue6uCvMR2BqEUgUOzd4ohj0vXKRplH8aesj7MKBVuUE0XKQbk8x9Ts6ZZtj
         bQk4zfxsOkvz3MM9GolbI20rGgZi2As8q/AuQe5U6ARsz3ojSijMOH4RPSyzfZLrvr
         P0YR74cjlR93A==
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
Subject: [PATCH 17/48] ARM: pxa: corgi: use gpio descriptors for audio
Date:   Tue, 19 Apr 2022 18:37:39 +0200
Message-Id: <20220419163810.2118169-18-arnd@kernel.org>
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

The audio driver should not use a hardwired gpio number
from the header. Change it to use a lookup table.

Acked-by: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/corgi.c                    | 22 ++++++++++-
 arch/arm/mach-pxa/{include/mach => }/corgi.h |  2 +-
 arch/arm/mach-pxa/corgi_pm.c                 |  2 +-
 sound/soc/pxa/corgi.c                        | 41 +++++++++++++-------
 4 files changed, 51 insertions(+), 16 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/corgi.h (98%)

diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
index f897762c8b58..c546356d0f02 100644
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@ -49,7 +49,7 @@
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "udc.h"
-#include <mach/corgi.h>
+#include "corgi.h"
 #include "sharpsl_pm.h"
 
 #include <asm/mach/sharpsl_param.h>
@@ -472,6 +472,25 @@ static struct platform_device corgiled_device = {
 	},
 };
 
+static struct gpiod_lookup_table corgi_audio_gpio_table = {
+	.dev_id = "corgi-audio",
+	.table = {
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_MUTE_L - CORGI_SCOOP_GPIO_BASE,
+			    "mute-l", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_MUTE_R - CORGI_SCOOP_GPIO_BASE,
+			    "mute-r", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_APM_ON - CORGI_SCOOP_GPIO_BASE,
+			    "apm-on", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_MIC_BIAS - CORGI_SCOOP_GPIO_BASE,
+			    "mic-bias", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 /*
  * Corgi Audio
  */
@@ -744,6 +763,7 @@ static void __init corgi_init(void)
 
  	pxa_set_udc_info(&udc_info);
 	gpiod_add_lookup_table(&corgi_mci_gpio_table);
+	gpiod_add_lookup_table(&corgi_audio_gpio_table);
 	pxa_set_mci_info(&corgi_mci_platform_data);
 	pxa_set_ficp_info(&corgi_ficp_platform_data);
 	pxa_set_i2c_info(NULL);
diff --git a/arch/arm/mach-pxa/include/mach/corgi.h b/arch/arm/mach-pxa/corgi.h
similarity index 98%
rename from arch/arm/mach-pxa/include/mach/corgi.h
rename to arch/arm/mach-pxa/corgi.h
index b565ca7b8cda..fe2fcf6532b9 100644
--- a/arch/arm/mach-pxa/include/mach/corgi.h
+++ b/arch/arm/mach-pxa/corgi.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_ARCH_CORGI_H
 #define __ASM_ARCH_CORGI_H  1
 
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
 
 /*
  * Corgi (Non Standard) GPIO Definitions
diff --git a/arch/arm/mach-pxa/corgi_pm.c b/arch/arm/mach-pxa/corgi_pm.c
index ff1ac9bf37cb..c6ddfc737644 100644
--- a/arch/arm/mach-pxa/corgi_pm.c
+++ b/arch/arm/mach-pxa/corgi_pm.c
@@ -20,7 +20,7 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/corgi.h>
+#include "corgi.h"
 #include <mach/pxa2xx-regs.h>
 #include "sharpsl_pm.h"
 
diff --git a/sound/soc/pxa/corgi.c b/sound/soc/pxa/corgi.c
index 8b83709431cb..4489d2c8b124 100644
--- a/sound/soc/pxa/corgi.c
+++ b/sound/soc/pxa/corgi.c
@@ -21,7 +21,6 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <mach/corgi.h>
 #include <linux/platform_data/asoc-pxa.h>
 
 #include "../codecs/wm8731.h"
@@ -41,6 +40,9 @@
 static int corgi_jack_func;
 static int corgi_spk_func;
 
+static struct gpio_desc *gpiod_mute_l, *gpiod_mute_r,
+			*gpiod_apm_on, *gpiod_mic_bias;
+
 static void corgi_ext_control(struct snd_soc_dapm_context *dapm)
 {
 	snd_soc_dapm_mutex_lock(dapm);
@@ -49,8 +51,8 @@ static void corgi_ext_control(struct snd_soc_dapm_context *dapm)
 	switch (corgi_jack_func) {
 	case CORGI_HP:
 		/* set = unmute headphone */
-		gpio_set_value(CORGI_GPIO_MUTE_L, 1);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 1);
+		gpiod_set_value(gpiod_mute_l, 1);
+		gpiod_set_value(gpiod_mute_r, 1);
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Headphone Jack");
@@ -58,24 +60,24 @@ static void corgi_ext_control(struct snd_soc_dapm_context *dapm)
 		break;
 	case CORGI_MIC:
 		/* reset = mute headphone */
-		gpio_set_value(CORGI_GPIO_MUTE_L, 0);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 0);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 0);
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headphone Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headset Jack");
 		break;
 	case CORGI_LINE:
-		gpio_set_value(CORGI_GPIO_MUTE_L, 0);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 0);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 0);
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headphone Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headset Jack");
 		break;
 	case CORGI_HEADSET:
-		gpio_set_value(CORGI_GPIO_MUTE_L, 0);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 1);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 1);
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headphone Jack");
@@ -108,8 +110,8 @@ static int corgi_startup(struct snd_pcm_substream *substream)
 static void corgi_shutdown(struct snd_pcm_substream *substream)
 {
 	/* set = unmute headphone */
-	gpio_set_value(CORGI_GPIO_MUTE_L, 1);
-	gpio_set_value(CORGI_GPIO_MUTE_R, 1);
+	gpiod_set_value(gpiod_mute_l, 1);
+	gpiod_set_value(gpiod_mute_r, 1);
 }
 
 static int corgi_hw_params(struct snd_pcm_substream *substream,
@@ -199,14 +201,14 @@ static int corgi_set_spk(struct snd_kcontrol *kcontrol,
 static int corgi_amp_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(CORGI_GPIO_APM_ON, SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_apm_on, SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
 static int corgi_mic_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(CORGI_GPIO_MIC_BIAS, SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_mic_bias, SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
@@ -293,6 +295,19 @@ static int corgi_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	gpiod_mute_l = devm_gpiod_get(&pdev->dev, "mute-l", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_mute_l))
+		return PTR_ERR(gpiod_mute_l);
+	gpiod_mute_r = devm_gpiod_get(&pdev->dev, "mute-r", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_mute_r))
+		return PTR_ERR(gpiod_mute_r);
+	gpiod_apm_on = devm_gpiod_get(&pdev->dev, "apm-on", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_apm_on))
+		return PTR_ERR(gpiod_apm_on);
+	gpiod_mic_bias = devm_gpiod_get(&pdev->dev, "mic-bias", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_mic_bias))
+		return PTR_ERR(gpiod_mic_bias);
+
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-- 
2.29.2

