Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0AD55074E7
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Apr 2022 18:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355233AbiDSQsl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Apr 2022 12:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354892AbiDSQpy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Apr 2022 12:45:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDB23A5D6;
        Tue, 19 Apr 2022 09:43:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E04826187A;
        Tue, 19 Apr 2022 16:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03625C385A7;
        Tue, 19 Apr 2022 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650386590;
        bh=WEWND/5nN7JVYVsbs3tEqP+TiJtxEvfNmON5NFDr+Wk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uHGRodE/EXFdM5gCt1FI3C9AngGezCvw/LOdpW6FmOvThrp8Nzbk1OoCIgyZAnm4P
         DV5ooWF+W6FHjQGEJZ8S2bpy0eBIWTMD7QY0jkXk8TtWxIv5xS+tI4gG/Z7OiSqgQb
         75ZH7V/j5MWfmRA58vS4sk78r9kN9Y3wE+gjDnMBUfklqn2gJiyhmALPPpUESHnDZa
         kDcxpEil9qeMCFqZJP3I8lSJYj+AxO3e0UYrmycY42VGAI9lAHBkYeFjrFE3ryVbLi
         Q56ChwU9KjlooXzQ3qp7gKQ6ovYlXwYOxpFEz4bGRzaq1mEizTbhBsg2hJRhmro6Sq
         bbav6vLtqM/Bg==
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
Subject: [PATCH 33/48] ASoC: pxa: i2s: use normal MMIO accessors
Date:   Tue, 19 Apr 2022 18:37:55 +0200
Message-Id: <20220419163810.2118169-34-arnd@kernel.org>
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

To avoid dereferencing hardwired constant pointers from a global header
file, change the driver to use devm_platform_ioremap_resource for getting
an __iomem pointer, and then using readl/writel on that.

Each pointer dereference gets changed by a search&replace, which leads
to a few overlong lines, but seems less risky than trying to clean up
the code at the same time.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/pxa/pxa2xx-i2s.c | 110 +++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 48 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 5164c60ba89f..746e6ec9198b 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -21,7 +21,6 @@
 #include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
-#include <mach/pxa-regs.h>
 #include <linux/platform_data/asoc-pxa.h>
 
 #include "pxa2xx-i2s.h"
@@ -29,13 +28,13 @@
 /*
  * I2S Controller Register and Bit Definitions
  */
-#define SACR0		__REG(0x40400000)  /* Global Control Register */
-#define SACR1		__REG(0x40400004)  /* Serial Audio I 2 S/MSB-Justified Control Register */
-#define SASR0		__REG(0x4040000C)  /* Serial Audio I 2 S/MSB-Justified Interface and FIFO Status Register */
-#define SAIMR		__REG(0x40400014)  /* Serial Audio Interrupt Mask Register */
-#define SAICR		__REG(0x40400018)  /* Serial Audio Interrupt Clear Register */
-#define SADIV		__REG(0x40400060)  /* Audio Clock Divider Register. */
-#define SADR		__REG(0x40400080)  /* Serial Audio Data Register (TX and RX FIFO access Register). */
+#define SACR0		(0x0000)	/* Global Control Register */
+#define SACR1		(0x0004)	/* Serial Audio I 2 S/MSB-Justified Control Register */
+#define SASR0		(0x000C)	/* Serial Audio I 2 S/MSB-Justified Interface and FIFO Status Register */
+#define SAIMR		(0x0014)	/* Serial Audio Interrupt Mask Register */
+#define SAICR		(0x0018)	/* Serial Audio Interrupt Clear Register */
+#define SADIV		(0x0060)	/* Audio Clock Divider Register. */
+#define SADR		(0x0080)	/* Serial Audio Data Register (TX and RX FIFO access Register). */
 
 #define SACR0_RFTH(x)	((x) << 12)	/* Rx FIFO Interrupt or DMA Trigger Threshold */
 #define SACR0_TFTH(x)	((x) << 8)	/* Tx FIFO Interrupt or DMA Trigger Threshold */
@@ -77,16 +76,15 @@ struct pxa_i2s_port {
 static struct pxa_i2s_port pxa_i2s;
 static struct clk *clk_i2s;
 static int clk_ena = 0;
+static void __iomem *i2s_reg_base;
 
 static struct snd_dmaengine_dai_dma_data pxa2xx_i2s_pcm_stereo_out = {
-	.addr		= __PREG(SADR),
 	.addr_width	= DMA_SLAVE_BUSWIDTH_4_BYTES,
 	.chan_name	= "tx",
 	.maxburst	= 32,
 };
 
 static struct snd_dmaengine_dai_dma_data pxa2xx_i2s_pcm_stereo_in = {
-	.addr		= __PREG(SADR),
 	.addr_width	= DMA_SLAVE_BUSWIDTH_4_BYTES,
 	.chan_name	= "rx",
 	.maxburst	= 32,
@@ -102,7 +100,7 @@ static int pxa2xx_i2s_startup(struct snd_pcm_substream *substream,
 		return PTR_ERR(clk_i2s);
 
 	if (!snd_soc_dai_active(cpu_dai))
-		SACR0 = 0;
+		writel(0, i2s_reg_base + SACR0);
 
 	return 0;
 }
@@ -114,7 +112,7 @@ static int pxa_i2s_wait(void)
 
 	/* flush the Rx FIFO */
 	for (i = 0; i < 16; i++)
-		SADR;
+		readl(i2s_reg_base + SADR);
 	return 0;
 }
 
@@ -174,39 +172,39 @@ static int pxa2xx_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* is port used by another stream */
 	if (!(SACR0 & SACR0_ENB)) {
-		SACR0 = 0;
+		writel(0, i2s_reg_base + SACR0);
 		if (pxa_i2s.master)
-			SACR0 |= SACR0_BCKD;
+			writel(readl(i2s_reg_base + SACR0) | (SACR0_BCKD), i2s_reg_base + SACR0);
 
-		SACR0 |= SACR0_RFTH(14) | SACR0_TFTH(1);
-		SACR1 |= pxa_i2s.fmt;
+		writel(readl(i2s_reg_base + SACR0) | (SACR0_RFTH(14) | SACR0_TFTH(1)), i2s_reg_base + SACR0);
+		writel(readl(i2s_reg_base + SACR1) | (pxa_i2s.fmt), i2s_reg_base + SACR1);
 	}
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		SAIMR |= SAIMR_TFS;
+		writel(readl(i2s_reg_base + SAIMR) | (SAIMR_TFS), i2s_reg_base + SAIMR);
 	else
-		SAIMR |= SAIMR_RFS;
+		writel(readl(i2s_reg_base + SAIMR) | (SAIMR_RFS), i2s_reg_base + SAIMR);
 
 	switch (params_rate(params)) {
 	case 8000:
-		SADIV = 0x48;
+		writel(0x48, i2s_reg_base + SADIV);
 		break;
 	case 11025:
-		SADIV = 0x34;
+		writel(0x34, i2s_reg_base + SADIV);
 		break;
 	case 16000:
-		SADIV = 0x24;
+		writel(0x24, i2s_reg_base + SADIV);
 		break;
 	case 22050:
-		SADIV = 0x1a;
+		writel(0x1a, i2s_reg_base + SADIV);
 		break;
 	case 44100:
-		SADIV = 0xd;
+		writel(0xd, i2s_reg_base + SADIV);
 		break;
 	case 48000:
-		SADIV = 0xc;
+		writel(0xc, i2s_reg_base + SADIV);
 		break;
 	case 96000: /* not in manual and possibly slightly inaccurate */
-		SADIV = 0x6;
+		writel(0x6, i2s_reg_base + SADIV);
 		break;
 	}
 
@@ -221,10 +219,10 @@ static int pxa2xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			SACR1 &= ~SACR1_DRPL;
+			writel(readl(i2s_reg_base + SACR1) & (~SACR1_DRPL), i2s_reg_base + SACR1);
 		else
-			SACR1 &= ~SACR1_DREC;
-		SACR0 |= SACR0_ENB;
+			writel(readl(i2s_reg_base + SACR1) & (~SACR1_DREC), i2s_reg_base + SACR1);
+		writel(readl(i2s_reg_base + SACR0) | (SACR0_ENB), i2s_reg_base + SACR0);
 		break;
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -243,15 +241,15 @@ static void pxa2xx_i2s_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		SACR1 |= SACR1_DRPL;
-		SAIMR &= ~SAIMR_TFS;
+		writel(readl(i2s_reg_base + SACR1) | (SACR1_DRPL), i2s_reg_base + SACR1);
+		writel(readl(i2s_reg_base + SAIMR) & (~SAIMR_TFS), i2s_reg_base + SAIMR);
 	} else {
-		SACR1 |= SACR1_DREC;
-		SAIMR &= ~SAIMR_RFS;
+		writel(readl(i2s_reg_base + SACR1) | (SACR1_DREC), i2s_reg_base + SACR1);
+		writel(readl(i2s_reg_base + SAIMR) & (~SAIMR_RFS), i2s_reg_base + SAIMR);
 	}
 
-	if ((SACR1 & (SACR1_DREC | SACR1_DRPL)) == (SACR1_DREC | SACR1_DRPL)) {
-		SACR0 &= ~SACR0_ENB;
+	if ((readl(i2s_reg_base + SACR1) & (SACR1_DREC | SACR1_DRPL)) == (SACR1_DREC | SACR1_DRPL)) {
+		writel(readl(i2s_reg_base + SACR0) & (~SACR0_ENB), i2s_reg_base + SACR0);
 		pxa_i2s_wait();
 		if (clk_ena) {
 			clk_disable_unprepare(clk_i2s);
@@ -264,13 +262,13 @@ static void pxa2xx_i2s_shutdown(struct snd_pcm_substream *substream,
 static int pxa2xx_soc_pcm_suspend(struct snd_soc_component *component)
 {
 	/* store registers */
-	pxa_i2s.sacr0 = SACR0;
-	pxa_i2s.sacr1 = SACR1;
-	pxa_i2s.saimr = SAIMR;
-	pxa_i2s.sadiv = SADIV;
+	pxa_i2s.sacr0 = readl(i2s_reg_base + SACR0);
+	pxa_i2s.sacr1 = readl(i2s_reg_base + SACR1);
+	pxa_i2s.saimr = readl(i2s_reg_base + SAIMR);
+	pxa_i2s.sadiv = readl(i2s_reg_base + SADIV);
 
 	/* deactivate link */
-	SACR0 &= ~SACR0_ENB;
+	writel(readl(i2s_reg_base + SACR0) & (~SACR0_ENB), i2s_reg_base + SACR0);
 	pxa_i2s_wait();
 	return 0;
 }
@@ -279,12 +277,12 @@ static int pxa2xx_soc_pcm_resume(struct snd_soc_component *component)
 {
 	pxa_i2s_wait();
 
-	SACR0 = pxa_i2s.sacr0 & ~SACR0_ENB;
-	SACR1 = pxa_i2s.sacr1;
-	SAIMR = pxa_i2s.saimr;
-	SADIV = pxa_i2s.sadiv;
+	writel(pxa_i2s.sacr0 & ~SACR0_ENB, i2s_reg_base + SACR0);
+	writel(pxa_i2s.sacr1, i2s_reg_base + SACR1);
+	writel(pxa_i2s.saimr, i2s_reg_base + SAIMR);
+	writel(pxa_i2s.sadiv, i2s_reg_base + SADIV);
 
-	SACR0 = pxa_i2s.sacr0;
+	writel(pxa_i2s.sacr0, i2s_reg_base + SACR0);
 
 	return 0;
 }
@@ -306,12 +304,12 @@ static int pxa2xx_i2s_probe(struct snd_soc_dai *dai)
 	 * the SACR0[RST] bit must also be set and cleared to reset all
 	 * I2S controller registers.
 	 */
-	SACR0 = SACR0_RST;
-	SACR0 = 0;
+	writel(SACR0_RST, i2s_reg_base + SACR0);
+	writel(0, i2s_reg_base + SACR0);
 	/* Make sure RPL and REC are disabled */
-	SACR1 = SACR1_DRPL | SACR1_DREC;
+	writel(SACR1_DRPL | SACR1_DREC, i2s_reg_base + SACR1);
 	/* Along with FIFO servicing */
-	SAIMR &= ~(SAIMR_RFS | SAIMR_TFS);
+	writel(readl(i2s_reg_base + SAIMR) & (~(SAIMR_RFS | SAIMR_TFS)), i2s_reg_base + SAIMR);
 
 	snd_soc_dai_init_dma_data(dai, &pxa2xx_i2s_pcm_stereo_out,
 		&pxa2xx_i2s_pcm_stereo_in);
@@ -371,6 +369,22 @@ static const struct snd_soc_component_driver pxa_i2s_component = {
 
 static int pxa2xx_i2s_drv_probe(struct platform_device *pdev)
 {
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		dev_err(&pdev->dev, "missing MMIO resource\n");
+		return -ENXIO;
+	}
+
+	i2s_reg_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(i2s_reg_base)) {
+		dev_err(&pdev->dev, "ioremap failed\n");
+		return PTR_ERR(i2s_reg_base);
+	}
+
+	pxa2xx_i2s_pcm_stereo_out.addr = res->start + SADR;
+	pxa2xx_i2s_pcm_stereo_in.addr = res->start + SADR;
+
 	return devm_snd_soc_register_component(&pdev->dev, &pxa_i2s_component,
 					       &pxa_i2s_dai, 1);
 }
-- 
2.29.2

