Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241914E8AD1
	for <lists+linux-fbdev@lfdr.de>; Mon, 28 Mar 2022 00:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbiC0Wnr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 27 Mar 2022 18:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237128AbiC0WnX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 27 Mar 2022 18:43:23 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E914EF78
        for <linux-fbdev@vger.kernel.org>; Sun, 27 Mar 2022 15:41:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u3so17927546wrg.3
        for <linux-fbdev@vger.kernel.org>; Sun, 27 Mar 2022 15:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C5OKPSwne38Lmo2ZnNZmi/R9IWOJkkuMX/01H8aE91s=;
        b=rZBvMVSAsuM3LQ6mHob8uxRThGwrGzjo9k/U6N0Wr0A2IBSO8n27G3jMqPi0gsOE8V
         g4v41g2qQnsX7OUNcTpCLW2eQqcTAo6yHDaPHl1Fj/VqT/UxnKc+xWeN9U/r7h9F2rN+
         56v/uaT7XzyzhRraPjOHCNq1w51NXk5cJJIhiyJP3UUyTETLjdEn2M0fGOWktQ2aIGzZ
         m6iawusbzRT8CoPVhtdz753k7ISQ47RsthpGAanJh3GTnKyAhK0Vsv2QbUGR/mvK0c64
         nzwXIDg4FmwkekXNxP8ghS/g8dy2IV2VVPZx3PXAMUY4MugMD9f2e4BuQfuMPTs5ScLZ
         oQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C5OKPSwne38Lmo2ZnNZmi/R9IWOJkkuMX/01H8aE91s=;
        b=HEXL2RTaRXupiV3k15AQhH+QdOFAEH6FsTVkRLgFIYBVnqVgnY0wL8T5DGkS9bJb86
         EOeCnhVxAeu8xHC8sXyNOchmhM41+4Hu6jV1LgLusghj/ju4JC4lVsIj3WV8Vh4OuO+N
         wBa3DkKnTmEFFIgecwvhIJwAwb/OEXn9O2g1J4TnteyJZJglWvzdyP/8Ye+TEbxG45Ag
         ar4mjQdKX0UXnJN81OqaPMnW7cp7HO39vonkcMC58F4Xjt/+WnCObR+JoSenms/2KDfU
         c72cgIy78EbOhejOEc8eRz5IBfMsm2SsZ8uqequfRfPl/NJup8eM/CO8G1586kNFpk+0
         DZ0A==
X-Gm-Message-State: AOAM531LROSUTWnr5/AbVvMLAt6BFqpYDXXXYHUb+/1WEWdSHiZc3mXx
        XVhWc/JJhXlbfrKfxzwfaYAdVA==
X-Google-Smtp-Source: ABdhPJxqUGJ7WjU5u1CI1OMweDb0BqIWsaWitOQBhFMphVVdP6uHuMDIR2OfGMN3VQC5l/EmrC6LnQ==
X-Received: by 2002:a5d:6510:0:b0:204:a6f:1226 with SMTP id x16-20020a5d6510000000b002040a6f1226mr19341096wru.59.1648420887250;
        Sun, 27 Mar 2022 15:41:27 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net. [2a02:8440:6341:357e:3074:96af:9642:2])
        by smtp.gmail.com with ESMTPSA id v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 15:41:26 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
To:     airlied@linux.ie, angelogioacchino.delregno@collabora.com,
        chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org,
        ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de,
        jitao.shi@mediatek.com, kishon@ti.com, krzk+dt@kernel.org,
        maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
        mripard@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
        tzimmermann@suse.de, vkoul@kernel.org
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, markyacoub@google.com,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v9 17/22] phy: phy-mtk-dp: Add driver for DP phy
Date:   Mon, 28 Mar 2022 00:39:22 +0200
Message-Id: <20220327223927.20848-18-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

This is a new driver that supports the integrated DisplayPort phy for
mediatek SoCs, especially the mt8195. The phy is integrated into the
DisplayPort controller and will be created by the mtk-dp driver. This
driver expects a struct regmap to be able to work on the same registers
as the DisplayPort controller. It sets the device data to be the struct
phy so that the DisplayPort controller can easily work with it.

The driver does not have any devicetree bindings because the datasheet
does not list the controller and the phy as distinct units.

The interaction with the controller can be covered by the configure
callback of the phy framework and its displayport parameters.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 MAINTAINERS                       |   1 +
 drivers/phy/mediatek/Kconfig      |   8 ++
 drivers/phy/mediatek/Makefile     |   1 +
 drivers/phy/mediatek/phy-mtk-dp.c | 201 ++++++++++++++++++++++++++++++
 4 files changed, 211 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc47b2dbdc9..bfca96469d80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6604,6 +6604,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
 F:	drivers/gpu/drm/mediatek/
+F:	drivers/phy/mediatek/phy-mtk-dp.c
 F:	drivers/phy/mediatek/phy-mtk-hdmi*
 F:	drivers/phy/mediatek/phy-mtk-mipi*
 
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 55f8e6c048ab..f7ec86059049 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
 	select GENERIC_PHY
 	help
 	  Support MIPI DSI for Mediatek SoCs.
+
+config PHY_MTK_DP
+	tristate "MediaTek DP-PHY Driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Support DisplayPort PHY for Mediatek SoCs.
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index ace660fbed3a..4ba1e0650434 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the phy drivers.
 #
 
+obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
 obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
new file mode 100644
index 000000000000..e5c5494f3636
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek DisplayPort PHY driver
+ *
+ * Copyright (c) 2021 BayLibre
+ * Author: Markus Schneider-Pargmann <msp@baylibre.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define PHY_OFFSET 0x1000
+
+#define MTK_DP_PHY_DIG_PLL_CTL_1		(PHY_OFFSET + 0x14)
+#define TPLL_SSC_EN					BIT(3)
+
+#define MTK_DP_PHY_DIG_BIT_RATE		(PHY_OFFSET + 0x3C)
+#define BIT_RATE_RBR				0
+#define BIT_RATE_HBR				1
+#define BIT_RATE_HBR2				2
+#define BIT_RATE_HBR3				3
+
+#define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
+#define DP_GLB_SW_RST_PHYD			BIT(0)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
+#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
+#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
+#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET + 0x438)
+#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
+#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	((BIT(2) | BIT(4)) << 8)
+#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
+#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	GENMASK(29, 29)
+#define DRIVING_PARAM_3_DEFAULT		(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
+
+#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	GENMASK(4, 3)
+#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	GENMASK(12, 9)
+#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	((BIT(2) | BIT(5)) << 16)
+#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	GENMASK(29, 29)
+#define DRIVING_PARAM_4_DEFAULT		(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	(BIT(3) | BIT(5))
+#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	GENMASK(13, 12)
+#define DRIVING_PARAM_5_DEFAULT		(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0
+#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	GENMASK(10, 10)
+#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	GENMASK(19, 19)
+#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	GENMASK(28, 28)
+#define DRIVING_PARAM_6_DEFAULT		(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0
+#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	GENMASK(10, 9)
+#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	GENMASK(19, 18)
+#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	0
+#define DRIVING_PARAM_7_DEFAULT		(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	GENMASK(3, 3)
+#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	0
+#define DRIVING_PARAM_8_DEFAULT		(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
+
+struct mtk_dp_phy {
+	struct regmap *regs;
+};
+
+static int mtk_dp_phy_init(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	u32 driving_params[] = {
+		DRIVING_PARAM_3_DEFAULT,
+		DRIVING_PARAM_4_DEFAULT,
+		DRIVING_PARAM_5_DEFAULT,
+		DRIVING_PARAM_6_DEFAULT,
+		DRIVING_PARAM_7_DEFAULT,
+		DRIVING_PARAM_8_DEFAULT
+	};
+
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+
+	return 0;
+}
+
+static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	if (opts->dp.set_rate) {
+		switch (opts->dp.link_rate) {
+		default:
+			dev_err(&phy->dev,
+				"Implementation error, unknown linkrate %x\n",
+				opts->dp.link_rate);
+			return -EINVAL;
+		case 1620:
+			val = BIT_RATE_RBR;
+			break;
+		case 2700:
+			val = BIT_RATE_HBR;
+			break;
+		case 5400:
+			val = BIT_RATE_HBR2;
+			break;
+		case 8100:
+			val = BIT_RATE_HBR3;
+			break;
+		}
+		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
+	}
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
+			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
+
+	return 0;
+}
+
+static int mtk_dp_phy_reset(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, 0);
+	usleep_range(50, 200);
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, 1);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_dp_phy_dev_ops = {
+	.init = mtk_dp_phy_init,
+	.configure = mtk_dp_phy_configure,
+	.reset = mtk_dp_phy_reset,
+	.owner = THIS_MODULE,
+};
+
+static int mtk_dp_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_dp_phy *dp_phy;
+	struct phy *phy;
+	struct regmap *regs;
+
+	regs = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,dp-syscon");
+
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
+	if (!dp_phy)
+		return -ENOMEM;
+
+	dp_phy->regs = regs;
+
+	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
+
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
+
+	phy_set_drvdata(phy, dp_phy);
+
+	return 0;
+}
+
+struct platform_driver mtk_dp_phy_driver = {
+	.probe = mtk_dp_phy_probe,
+	.driver = {
+		.name = "mediatek-dp-phy",
+	},
+};
+module_platform_driver(mtk_dp_phy_driver);
+
+MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
+MODULE_DESCRIPTION("MediaTek DP PHY Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

