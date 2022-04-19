Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34B6506E12
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Apr 2022 15:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352866AbiDSNpY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Apr 2022 09:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352663AbiDSNpI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Apr 2022 09:45:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D63C387A5;
        Tue, 19 Apr 2022 06:41:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 40DD4B81980;
        Tue, 19 Apr 2022 13:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD10C385A5;
        Tue, 19 Apr 2022 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650375683;
        bh=Lqql5jJ2TjMR0BVNQRp5+3ddwljyuhELVCm/kXj+7ik=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JIoRCZ5P7nywKXcKjFEeDGGEvckH/ddxelOi4sgLLOtXOcDjoGje3+bE947Tyfmia
         404OQdFoYPFkbzMHBsltzemOp8kG1cXvkIXl73jYoerRI3ggoObRe7dclw+jMSy9H8
         F+o3O5viIo54fVXJj2D8nfZNTbQ86aaDw5H9fg3Kd6DLTGBA7lJG4+V5LTJULF9e+r
         tvfzzSP4zoEJRSSCciMSDW0M3yqyLWUuAL26tBfmvTvd3LCp7oXzclqlFOfsHHkqez
         QdbmAWEIjwpUIeKE0k/ZBNkPe/Zdvsshi18aHuPRwsuSu3oIE5fxAI7S7/ls1bYkDQ
         VWwgVS/Bp5Amw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        Kevin Hilman <khilman@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Mark Brown <broonie@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 30/41] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
Date:   Tue, 19 Apr 2022 15:37:12 +0200
Message-Id: <20220419133723.1394715-31-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
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

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

In preparation for conversion of OMAP1 clocks to common clock framework,
identify arch/arm/mach-omap1 local users of those clocks and update them
to call clk_prepare_enable/clk_disable_unprepare() instead of just
clk_enable/disable(), as required by CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/mcbsp.c    | 8 ++++----
 arch/arm/mach-omap1/ocpi.c     | 4 ++--
 arch/arm/mach-omap1/serial.c   | 6 +++---
 arch/arm/mach-omap1/timer32k.c | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-omap1/mcbsp.c b/arch/arm/mach-omap1/mcbsp.c
index b7bc7e4b426c..05c25c432449 100644
--- a/arch/arm/mach-omap1/mcbsp.c
+++ b/arch/arm/mach-omap1/mcbsp.c
@@ -43,8 +43,8 @@ static void omap1_mcbsp_request(unsigned int id)
 			api_clk = clk_get(NULL, "api_ck");
 			dsp_clk = clk_get(NULL, "dsp_ck");
 			if (!IS_ERR(api_clk) && !IS_ERR(dsp_clk)) {
-				clk_enable(api_clk);
-				clk_enable(dsp_clk);
+				clk_prepare_enable(api_clk);
+				clk_prepare_enable(dsp_clk);
 
 				/*
 				 * DSP external peripheral reset
@@ -62,11 +62,11 @@ static void omap1_mcbsp_free(unsigned int id)
 	if (id == 0 || id == 2) {
 		if (--dsp_use == 0) {
 			if (!IS_ERR(api_clk)) {
-				clk_disable(api_clk);
+				clk_disable_unprepare(api_clk);
 				clk_put(api_clk);
 			}
 			if (!IS_ERR(dsp_clk)) {
-				clk_disable(dsp_clk);
+				clk_disable_unprepare(dsp_clk);
 				clk_put(dsp_clk);
 			}
 		}
diff --git a/arch/arm/mach-omap1/ocpi.c b/arch/arm/mach-omap1/ocpi.c
index c4a33ace4a8b..d48f726571a4 100644
--- a/arch/arm/mach-omap1/ocpi.c
+++ b/arch/arm/mach-omap1/ocpi.c
@@ -73,7 +73,7 @@ static int __init omap_ocpi_init(void)
 	if (IS_ERR(ocpi_ck))
 		return PTR_ERR(ocpi_ck);
 
-	clk_enable(ocpi_ck);
+	clk_prepare_enable(ocpi_ck);
 	ocpi_enable();
 	pr_info("OMAP OCPI interconnect driver loaded\n");
 
@@ -87,7 +87,7 @@ static void __exit omap_ocpi_exit(void)
 	if (!cpu_is_omap16xx())
 		return;
 
-	clk_disable(ocpi_ck);
+	clk_disable_unprepare(ocpi_ck);
 	clk_put(ocpi_ck);
 }
 
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index d6d1843337a5..299ae1106187 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -142,7 +142,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart1_ck))
 				printk("Could not get uart1_ck\n");
 			else {
-				clk_enable(uart1_ck);
+				clk_prepare_enable(uart1_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart1_ck, 12000000);
 			}
@@ -152,7 +152,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart2_ck))
 				printk("Could not get uart2_ck\n");
 			else {
-				clk_enable(uart2_ck);
+				clk_prepare_enable(uart2_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart2_ck, 12000000);
 				else
@@ -164,7 +164,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart3_ck))
 				printk("Could not get uart3_ck\n");
 			else {
-				clk_enable(uart3_ck);
+				clk_prepare_enable(uart3_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart3_ck, 12000000);
 			}
diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
index 23952a85ac79..560cd16568a7 100644
--- a/arch/arm/mach-omap1/timer32k.c
+++ b/arch/arm/mach-omap1/timer32k.c
@@ -270,7 +270,7 @@ int __init omap_32k_timer_init(void)
 
 		sync32k_ick = clk_get(NULL, "omap_32ksync_ick");
 		if (!IS_ERR(sync32k_ick))
-			clk_enable(sync32k_ick);
+			clk_prepare_enable(sync32k_ick);
 
 		ret = omap_init_clocksource_32k(base);
 	}
-- 
2.29.2

