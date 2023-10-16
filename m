Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 031247CA693
	for <lists+linux-fbdev@lfdr.de>; Mon, 16 Oct 2023 13:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbjJPLUA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 16 Oct 2023 07:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjJPLUA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 16 Oct 2023 07:20:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287F2C5
        for <linux-fbdev@vger.kernel.org>; Mon, 16 Oct 2023 04:19:58 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4060b623e64so27110025e9.0
        for <linux-fbdev@vger.kernel.org>; Mon, 16 Oct 2023 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697455196; x=1698059996; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
        b=bsEAkxWY0dzw4kb9IARJlAMASvaxvEHrkDR1Cv7mzOkiEEKWZjplB5nQUpTsjP5tLo
         D8wTUqty9LpDUOXUNPX3iT4cZ2uMT0Lq4LDSM5Ll4e79Cg7eGCLQPNCgtdglsyxFqAAk
         Qn2Sdx+IIJBF8LsBEk5ltng9JGnt8XAiYLqa16SUOTSaYwX/4tf95RNM1USnuaz7CeUw
         ENfWZOH11Uu6S9nGST6hoCE82Pc29C3QdlalUd9s2YbHzhIn9IAO2qUY9eBQL+wdSi7C
         GjykIu4ItNhuHfnRPiC7qm4cX9oWlJ/g0igZHj10JaGnUQ3a+2E5EzZbEFjwQkWfbNeQ
         Mu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697455196; x=1698059996;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
        b=F5GHIAyJKRdAHfpgPbLWxpIiy7Vve8Q07kjiNzyeqA/3SCh6La/RD2Xj9TryFlaD/u
         Pe9cpNEaFAzM2hL5A/fekLDPfAn62YUZ6bNbODcRlHX8PZg4Ahj328NqRzdMknUDgmMR
         LaAm//AaGN/4vMwT7VLOJqiCDkLCsUUXzMV8jdWFYFNVlawyXP17s/2SHF+dcsn0DEyq
         XeeZ/ZnXZGZIg/beO7HB9DzVTZlgmoSN2Iks/SYChupBwF98rAAh/l+ljEdS0xADhfju
         tmQjBVQlixQhiAuTcUkgM6CO5YRgIDyTw42hge06Jx5yRGQpvROHl/rV3DquhGsm5Jyo
         q7sg==
X-Gm-Message-State: AOJu0Yw2QIgnmaosBq6pguIaXJdmlum1lJ5B0Htiaw3pafB9MUMNmE2w
        Qr7Ls9PwWWUaoBcj/NfbvxUW3w==
X-Google-Smtp-Source: AGHT+IEwsg3DmJum5HD3wiLEYwzwIlJS3Ala8HDGksmUXDObbnciWs0r3lFHIdZY4gQew0/dSIC84g==
X-Received: by 2002:a05:600c:1552:b0:407:7def:382c with SMTP id f18-20020a05600c155200b004077def382cmr4012116wmg.13.1697455196603;
        Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b004075d5664basm6983560wmq.8.2023.10.16.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Date:   Mon, 16 Oct 2023 14:19:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Yang Yang <yang.yang29@zte.com>,
        Xu Panda <xu.panda@zte.com.cn>,
        Lucy Mielke <mielkesteven@icloud.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev: omapfb: fix some error codes
Message-ID: <843b063c-ee4a-4e17-add6-75e2cc82c2f4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Return negative -ENXIO instead of positive ENXIO.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
No fixes tag because the caller doesn't check for errors.

 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index f28cb90947a3..42c96f1cfc93 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1645,13 +1645,13 @@ static int omapfb_do_probe(struct platform_device *pdev,
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
 	if (fbdev->int_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
 	if (fbdev->ext_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
-- 
2.39.2

