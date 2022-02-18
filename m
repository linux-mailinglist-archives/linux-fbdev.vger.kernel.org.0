Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3CB4BBB5D
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Feb 2022 15:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236686AbiBRO5b (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Feb 2022 09:57:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236586AbiBRO47 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Feb 2022 09:56:59 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D734EBAEB
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Feb 2022 06:56:24 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id i14so15000834wrc.10
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Feb 2022 06:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4n+TZK7KbEUWOxLwDOr/TfxysKvgpkHmktiIGYd/K7I=;
        b=AYIJhoYSI/uBVyX7bKr0EN1LMOI9DxVA+XSltqNaOrt2mARRYDaY5J64JbYiCTP7IZ
         VKDnRnXSySg9ti8q2Gdd3ZT0Wyy7ynM+UAAvTdKD8U0Tlw/rdFU0Ax+Bl31KHyQvR6J+
         ApEGo756/YXVILQcaJjKh6mpjgrnE6hH2BcxMa0PSZfAbZ1ii4qMye2ff32XGm+aMqWW
         I4JiP+ajubHk33IS1IZ3S8JjYTWhjCMn2KKcc8E9C8JUJwyz2G0tABN5GfQXUKJTkUEx
         lSLU6qH/VrjTJXGL8HJZcnUdu8gPP2xdjRyeQv76DPON8zKmYDxfu3kR4iYgimxYtDmD
         9uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4n+TZK7KbEUWOxLwDOr/TfxysKvgpkHmktiIGYd/K7I=;
        b=U3U/pEzFyeH7WWOV1JHfDmmUNZ9NfV8AIfSMs7O2m0aj7A26+AjQUPb+I1TjkaObVK
         ZoMMV8ma/jG8XoACP/6D3lPK0kVxZzU3643Np7jV19P8OA3SWA2jIWrgMZsVjUFYKmjE
         IKjDe8ViT7noGttQiaWuRi81IjAQZpe8IhSlr9io5gj0qgRkOmnDb8Cy+XWfhDlO8bXX
         WvB7zqH9WSDRkB0o+/nVJ2Se7JvRWMsKNWHTVlBMi69XTIQAlNZefJomQmaQonT7mPla
         fG2VpPKfmj3cujHkSbEx6Jr0EymRFH9soMWC+LrEToa5+a6ZRhDZrj3mrY0uNXbZHRPk
         O4Og==
X-Gm-Message-State: AOAM530b7bgBCjhRIpgiO0iK3m/Hj51QcQ3fWv7uRQ/5OMKH0+U3nKkG
        OYexiJOX/xk6Ky5JtrJDlwxb7A==
X-Google-Smtp-Source: ABdhPJxA3E5twbEB2QJP6JHl07PRCaBz7TlkWHIbHPK96lIV8OG5te3hJNfKAZY7HiAKl5ltEPTi9Q==
X-Received: by 2002:a05:6000:1a8c:b0:1e8:88ae:f908 with SMTP id f12-20020a0560001a8c00b001e888aef908mr6354423wry.532.1645196183454;
        Fri, 18 Feb 2022 06:56:23 -0800 (PST)
Received: from localhost.localdomain (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net. [2a02:8440:6241:3b28:3074:96af:9642:2])
        by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:56:23 -0800 (PST)
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
Subject: [PATCH v8 12/19] drm/mediatek: dpi: move the csc_enable bit to board config
Date:   Fri, 18 Feb 2022 15:54:30 +0100
Message-Id: <20220218145437.18563-13-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
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

Add flexibility by moving the csc_enable bit to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index fcf88dcd8b89d..be99399faf1bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -133,6 +133,7 @@ struct mtk_dpi_conf {
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
+	u32 csc_enable_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -363,7 +364,8 @@ static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit : 0,
+		     dpi->conf->csc_enable_bit);
 }
 
 static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
@@ -827,6 +829,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -843,6 +846,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -858,6 +862,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -873,6 +878,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

