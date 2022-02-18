Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87B4F4BBB5E
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Feb 2022 15:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbiBRO5Z (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Feb 2022 09:57:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236572AbiBRO4x (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Feb 2022 09:56:53 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9680B2B3194
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Feb 2022 06:56:22 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d27so15049969wrb.5
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Feb 2022 06:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=90lBj+uvWW6J+7Bhe1asD0wMcJbCNndSndMWto6+sjw=;
        b=XCTWGHlVeYj1NHNSyLYY4w0WnpflUMMYUJs+ess0tZVzbocvNTlCQ32s2o4ObZQDRW
         P9lK9H/8fBoZHEjWDufRSJ1SsI+Jwr9zO1Ab63LWNxkvl2jhoq/DGKchky7BseFFRARF
         LyYojephNA2plGL6u1WNgFcztI4Zy3fhwQzbyrj1kKcqm5LfLRYIpmoO6a5Yb0d4nAc/
         515MHQEC6IF2aADAxmOC2/g7/goAvZA6GwkBv4WG0pGTgINFjhXO/tyS5P2tYDuXDmmQ
         XlN4Ni6JYJ2UNwlPzA4tAAx8OiewWSjTLOtHopCdrZNvJSLBzd5T0R0FRqnjnljonZM7
         wPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=90lBj+uvWW6J+7Bhe1asD0wMcJbCNndSndMWto6+sjw=;
        b=wrReNv23py+A8PGKE92oYaF9MVN5k5hsEA84zLgAElSuhzSlfk+PKYQvVu9CJ5ty8a
         Dhj0fnDREwvh0tSYZ/GLjqdwLVuexnPqZ4neQGIcVxNHNmWbkamjeHl+1/sy23ito5Hj
         dUM8ofnezBYhIARa8S01XQziETo67Ksw8lBWcIahqVrxKfzNSivDMNpOTmQjLQMKZij6
         VPIbhT50SwfFEj4z0TEZjysWjksHp88cwyjGniv9ui8B/yXeg/SuTfPdO5UZnW+kDONM
         V0QB3+j4Yc3BCfACX2bjlMCyjuCjmYk/Z4idyQNoXXtLx+s8lRmggS+ZXb7feXmtf6AQ
         h9+A==
X-Gm-Message-State: AOAM5320j09aI+i5tBrfJV0dWZZVuJZ5FxNRnhGD200TWRkqRiJVnEtL
        4Nq84MxsRkrnoFM9+d8SABkV4w==
X-Google-Smtp-Source: ABdhPJxdT+Md4Etk8DpDZL2AZLj2CChbsYlZ101cupA/36VJ0hpWjcFNACS2lJ1DlsOujik8l4G8dg==
X-Received: by 2002:a5d:6a8a:0:b0:1e3:310c:8b1e with SMTP id s10-20020a5d6a8a000000b001e3310c8b1emr6285623wru.717.1645196181080;
        Fri, 18 Feb 2022 06:56:21 -0800 (PST)
Received: from localhost.localdomain (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net. [2a02:8440:6241:3b28:3074:96af:9642:2])
        by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:56:20 -0800 (PST)
From:   Guillaume Ranquet <granquet@baylibre.com>
To:     chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, matthias.bgg@gmail.com,
        chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org,
        deller@gmx.de, ck.hu@mediatek.com, jitao.shi@mediatek.com,
        angelogioacchino.delregno@collabora.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v8 11/19] drm/mediatek: dpi: move the yuv422_en_bit to board config
Date:   Fri, 18 Feb 2022 15:54:29 +0100
Message-Id: <20220218145437.18563-12-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add flexibility by moving the yuv422 en bit to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index ec221e24e0fee..fcf88dcd8b89d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -132,6 +132,7 @@ struct mtk_dpi_conf {
 	// Mask used for HSIZE and VSIZE (no shift)
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
+	u32 yuv422_en_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -356,7 +357,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->yuv422_en_bit : 0,
+		     dpi->conf->yuv422_en_bit);
 }
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
@@ -824,6 +826,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -839,6 +842,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +857,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -867,6 +872,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

