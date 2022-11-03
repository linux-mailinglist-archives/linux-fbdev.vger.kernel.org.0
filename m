Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13155618BF4
	for <lists+linux-fbdev@lfdr.de>; Thu,  3 Nov 2022 23:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbiKCWsN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 3 Nov 2022 18:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiKCWri (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 3 Nov 2022 18:47:38 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B4B2098B;
        Thu,  3 Nov 2022 15:47:37 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so6342002pjh.1;
        Thu, 03 Nov 2022 15:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1QS6c1ubJslyni/M0MzNlDBEaUKL9IFEtYjlcS9VxU=;
        b=ky/2ICJ4Vfu+5Fdz5JuABjS8rlBaLcKAxbzw0SZC2D34+Txmhf0KOVhJtwqgv/6XOk
         CnE6Ltk8PeZ1KMD6b6YFrBtaYzbwId1ccjnT0LniazU4vqUBZbaZ6VJPEGzbHq1FoQzs
         Gq4q7bfdcvyHIvlp/ZqTkoeRTT/6iCU/lDUmDB6Yrb+U1v9/2y579zIjGWOKdpNnbgZJ
         KNck/JrQ9af+Kdah+jsu66NeRnzyH25x28cbyP1y9nbv584UmrvrxVHcOtfxz97xr6PI
         Xm+DnuGvdUpjcImHNoQ5M+iuPcSNVzgdGFLoDGFffaOo56W9b/C3DGiIIyW+01iQK7nf
         AIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1QS6c1ubJslyni/M0MzNlDBEaUKL9IFEtYjlcS9VxU=;
        b=WOddxYQTAbDHT+HgPZJbzj7VuUXYC34A291/J0QcISogrrC5af0NcPGvbGdyjO4lX+
         M+I/bmFCOp6B+jL39DSSCAarXRdBBnp03WDRtU5Ghpuoq3x2MXY8FM/JHN0MmSmUG/lE
         1oF5Cg2jdwe7X7/vtnY61C/91F+Jc8k2hmusiNrgTT9EkUAwS3Ras98gTMBiS7CtiNMi
         rYLZkOKlHERQnhyEmww9kgyKoA45EgXSR6VvrHHhIYxTZIk4iJvtuKqj0inwy3ikW2K4
         wlGKYoYxjcEZmit4ZnlZ5zG0LdaQAHdU57QLfjEN4DrEUWfxK1TF60zDuAApodYNdMqs
         hyug==
X-Gm-Message-State: ACrzQf3Kr2V5kAV1heuegfnyBEfg3+CwxWQ2zdY/MOmG1FzzHsR8RxFk
        3U9SqwAxK4665cIhKcfeZz0=
X-Google-Smtp-Source: AMsMyM4b2fcM9qthGWolUVjBnQCmaTmPTMhorzMS6m1FwpyODUIn3xZawlZGlfODpJmUwdrdcxue4g==
X-Received: by 2002:a17:90a:19c8:b0:211:d22b:9f14 with SMTP id 8-20020a17090a19c800b00211d22b9f14mr203412pjj.68.1667515656617;
        Thu, 03 Nov 2022 15:47:36 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 15:47:35 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] omapfb: connector-analog-tv: remove support for platform data
Date:   Thu,  3 Nov 2022 15:46:52 -0700
Message-Id: <20221103-omapfb-gpiod-v1-9-c3d53ca7988f@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There are no users of connector_atv_platform_data in the mainline
kernel so support for it can be removed from the panel driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../omap2/omapfb/displays/connector-analog-tv.c    | 60 +++-------------------
 include/video/omap-panel-data.h                    | 34 ------------
 2 files changed, 8 insertions(+), 86 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
index a9fd732f8103..0daaf9f89bab 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
@@ -12,7 +12,6 @@
 #include <linux/of.h>
 
 #include <video/omapfb_dss.h>
-#include <video/omap-panel-data.h>
 
 struct panel_drv_data {
 	struct omap_dss_device dssdev;
@@ -178,53 +177,15 @@ static struct omap_dss_driver tvc_driver = {
 	.set_wss		= tvc_set_wss,
 };
 
-static int tvc_probe_pdata(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct connector_atv_platform_data *pdata;
-	struct omap_dss_device *in, *dssdev;
-
-	pdata = dev_get_platdata(&pdev->dev);
-
-	in = omap_dss_find_output(pdata->source);
-	if (in == NULL) {
-		dev_err(&pdev->dev, "Failed to find video source\n");
-		return -EPROBE_DEFER;
-	}
-
-	ddata->in = in;
-
-	ddata->invert_polarity = pdata->invert_polarity;
-
-	dssdev = &ddata->dssdev;
-	dssdev->name = pdata->name;
-
-	return 0;
-}
-
-static int tvc_probe_of(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-	struct omap_dss_device *in;
-
-	in = omapdss_of_find_source_for_first_ep(node);
-	if (IS_ERR(in)) {
-		dev_err(&pdev->dev, "failed to find video source\n");
-		return PTR_ERR(in);
-	}
-
-	ddata->in = in;
-
-	return 0;
-}
-
 static int tvc_probe(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata;
 	struct omap_dss_device *dssdev;
 	int r;
 
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
@@ -232,16 +193,11 @@ static int tvc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ddata);
 	ddata->dev = &pdev->dev;
 
-	if (dev_get_platdata(&pdev->dev)) {
-		r = tvc_probe_pdata(pdev);
-		if (r)
-			return r;
-	} else if (pdev->dev.of_node) {
-		r = tvc_probe_of(pdev);
-		if (r)
-			return r;
-	} else {
-		return -ENODEV;
+	ddata->in = omapdss_of_find_source_for_first_ep(pdev->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&pdev->dev, "failed to find video source\n");
+		return r;
 	}
 
 	ddata->timings = tvc_pal_timings;
diff --git a/include/video/omap-panel-data.h b/include/video/omap-panel-data.h
deleted file mode 100644
index 18172d7b97d0..000000000000
--- a/include/video/omap-panel-data.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Header containing platform_data structs for omap panels
- *
- * Copyright (C) 2013 Texas Instruments
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- *	   Archit Taneja <archit@ti.com>
- *
- * Copyright (C) 2011 Texas Instruments
- * Author: Mayuresh Janorkar <mayur@ti.com>
- *
- * Copyright (C) 2010 Canonical Ltd.
- * Author: Bryan Wu <bryan.wu@canonical.com>
- */
-
-#ifndef __OMAP_PANEL_DATA_H
-#define __OMAP_PANEL_DATA_H
-
-#include <video/display_timing.h>
-
-/**
- * connector_atv platform data
- * @name: name for this display entity
- * @source: name of the display entity used as a video source
- * @invert_polarity: invert signal polarity
- */
-struct connector_atv_platform_data {
-	const char *name;
-	const char *source;
-
-	bool invert_polarity;
-};
-
-#endif /* __OMAP_PANEL_DATA_H */

-- 
b4 0.11.0-dev-5166b
