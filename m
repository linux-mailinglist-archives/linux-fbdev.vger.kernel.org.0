Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4865A8CBF
	for <lists+linux-fbdev@lfdr.de>; Thu,  1 Sep 2022 06:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbiIAEmD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 1 Sep 2022 00:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbiIAEmB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 1 Sep 2022 00:42:01 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8437E1AA5;
        Wed, 31 Aug 2022 21:41:59 -0700 (PDT)
X-UUID: 704eaf6425204c1c86c58049272884bc-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+nDV+vR78OpdEySqlDcu971kberj+QzgCFZD7N3rv4g=;
        b=NF5R1gJGv2NMM5K1cuzm4lStOWZoHB5j5IJCv9GOo7Td7OgdRYWzIQRG7YZNwkBd956rfcHCu66jL8VMTo3qafTm/spL+gn57t9Ft+Bn40wpolJ2snGlLUCxdWIvm97X2BIeg7v47uDSSEAGsHlh8/nPrSloM1WVb3J3ziiGGwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ab5f5452-a611-4534-a8c7-68ba3acf6908,OB:0,L
        OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
        e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:09013c56-e800-47dc-8adf-0c936acf4f1b,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 704eaf6425204c1c86c58049272884bc-20220901
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 995666135; Thu, 01 Sep 2022 12:41:54 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 12:41:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 12:41:52 +0800
From:   Bo-Chen Chen <rex-bc.chen@mediatek.com>
To:     <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
        <daniel@ffwll.ch>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
        <airlied@linux.ie>
CC:     <msp@baylibre.com>, <granquet@baylibre.com>,
        <jitao.shi@mediatek.com>, <wenst@chromium.org>,
        <angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
        <liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-fbdev@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH v17 04/10] drm/mediatek: dp: Add multiple bridge types support
Date:   Thu, 1 Sep 2022 12:41:43 +0800
Message-ID: <20220901044149.16782-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_CSS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The bridge types of eDP and DP are different. We add device data to
this driver and add bridge_type to the device data to define them.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e2ec9b02b1aa..2696c1ac1a47 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -101,6 +101,7 @@ struct mtk_dp {
 	struct drm_device *drm_dev;
 	struct drm_dp_aux aux;
 
+	const struct mtk_dp_data *data;
 	struct mtk_dp_info info;
 	struct mtk_dp_train_info train_info;
 
@@ -109,6 +110,9 @@ struct mtk_dp {
 	struct regmap *regs;
 };
 
+struct mtk_dp_data {
+	int bridge_type;
+};
 static const struct mtk_dp_efuse_fmt mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
 	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
 		.idx = 3,
@@ -1871,6 +1875,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk_dp->dev = dev;
+	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
 
 	irq_num = platform_get_irq(pdev, 0);
 	if (irq_num < 0)
@@ -1925,7 +1930,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
 	drm_bridge_add(&mtk_dp->bridge);
 
@@ -1974,8 +1979,15 @@ static int mtk_dp_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
+static const struct mtk_dp_data mt8195_edp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct of_device_id mtk_dp_of_match[] = {
-	{ .compatible = "mediatek,mt8195-edp-tx" },
+	{
+		.compatible = "mediatek,mt8195-edp-tx",
+		.data = &mt8195_edp_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
-- 
2.18.0

