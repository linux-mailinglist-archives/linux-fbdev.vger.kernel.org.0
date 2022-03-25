Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFFD4E7A07
	for <lists+linux-fbdev@lfdr.de>; Fri, 25 Mar 2022 18:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiCYRTs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 25 Mar 2022 13:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377382AbiCYRTa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 25 Mar 2022 13:19:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903F0ECC62
        for <linux-fbdev@vger.kernel.org>; Fri, 25 Mar 2022 10:17:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r7so10640883wrc.0
        for <linux-fbdev@vger.kernel.org>; Fri, 25 Mar 2022 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+2J73LOuWbWcemSAZjUl4sSAKtMqGO4YAvYLQzrZlU=;
        b=6mQIlmOLDdfFl06bVDNJL4jkgT5Pifeg06GKXYSLJt9XTyK0oDRagi0sdMmJm5lP3y
         LHc7x5xyRqMHpAyxdqoXmCgBjjRYMNPig0UhqItbZWDv0hpbIYCUpJtvd/emNaq0DO0V
         d4nHKxRk7bVa6/z5sLNasuIhvwVGBYXv0K1cQcNBawazJw2yWOyv5zIdpyB1nXHZwBpK
         j+oKk89Wz8D53+r75WLm09Sp2wartFw5T9aapcs40u8OAUpYHfcxGURdwXh2K7TrJ56v
         +OiJPv+/nGARuuofLocJEn2P8K9YqOhrMeyHzl4+gugC22hbMQlP/+ZP8PjzF9NMqCMT
         DbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+2J73LOuWbWcemSAZjUl4sSAKtMqGO4YAvYLQzrZlU=;
        b=nZ787UNuOvTr/7d8vqHeWtoNEj4fQCc9hzCotK7hpaYJO/JHSx6XJNzBm1Rpc57OCr
         tz2ZkNAj7PkmtqSeeNRF9LrmLC/rZZBi2r66Eko6L0XyZx9ABlGPFMX5KupUq+XvCpkj
         xYkCr2zIdMMetgKbZ/oaO8QWINFytdsp8iYZdp+6VByRUl0cYihWIreHmXEQsD4oK6NU
         sbjEoZ9/CUtsw1Qt6fH0ePoW4GTScTM9KAjWdpii6P3orKQcYAmvGvmUTTll/5xNDqD1
         XfHUavG+jg4Y2TuTERqs64eSu1c7CD8G3Y41rSyBZdC69MLuWEwVIqoCPhOji2BvRbXt
         bNgA==
X-Gm-Message-State: AOAM531aOWh5W1GEPmVw9eCoLwFMGG606ll3+ms2Kydo8hJ4+NlQ7jSA
        FmjE2Oqy29Vncz3lB4deUTJ8kg==
X-Google-Smtp-Source: ABdhPJyVRn/4huKKw6y+EuOivtvJN55w2DTGfCsIXhFN27KhyJ9q5fpwb1MbnhcIyxinFhO8DC2wVQ==
X-Received: by 2002:a05:6000:1a85:b0:205:a234:d0a5 with SMTP id f5-20020a0560001a8500b00205a234d0a5mr4759856wry.126.1648228626249;
        Fri, 25 Mar 2022 10:17:06 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6240:cc41:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 10:17:05 -0700 (PDT)
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
        linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org,
        markyacoub@google.com
Subject: [PATCH 11/22] drm/mediatek: dpi: move hvsize_mask to SoC config
Date:   Fri, 25 Mar 2022 18:15:00 +0100
Message-Id: <20220325171511.23493-12-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add flexibility by moving the hvsize mask to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bf098f36a466..6eeda222a973 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -129,6 +129,8 @@ struct mtk_dpi_conf {
 	bool swap_input_support;
 	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift) */
 	u32 dimension_mask;
+	/* HSIZE and VSIZE mask (no shift) */
+	u32 hvsize_mask;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -243,8 +245,10 @@ static void mtk_dpi_config_interface(struct mtk_dpi *dpi, bool inter)
 
 static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 {
-	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
-	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
+	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
+		     dpi->conf->hvsize_mask << HSIZE);
+	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
+		     dpi->conf->hvsize_mask << VSIZE);
 }
 
 static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
@@ -816,6 +820,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -841,6 +847,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +860,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

