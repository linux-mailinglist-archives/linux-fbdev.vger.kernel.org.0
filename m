Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334194E8AE4
	for <lists+linux-fbdev@lfdr.de>; Mon, 28 Mar 2022 00:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237151AbiC0Wno (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 27 Mar 2022 18:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237149AbiC0Wn3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 27 Mar 2022 18:43:29 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1674FC62
        for <linux-fbdev@vger.kernel.org>; Sun, 27 Mar 2022 15:41:31 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id h16so7395490wmd.0
        for <linux-fbdev@vger.kernel.org>; Sun, 27 Mar 2022 15:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YZph5ifPxL5uVmjYTfQo6EGmMKT+tqcL6/MBH2RFjf4=;
        b=FYL3MUZyWfXfmw7McJAYpUgBfnSLr/+glsnDllGUsLyX8Bc3k96gQzF3qJqF7/n/Oc
         h8t3Wk8MoomrpEir6S8IyIIM4bdAQQGN16UVrUKWHO+x66bRzXbazkjoGy+Qy+r8b8j0
         /KOAYeCFjfRmd5/Oid2+9R4crJxuKRhv+qr1z9ohN3POqqpD3shSEOKBZYte8+/E6+OA
         NmYvOG6hT61i1MkOfphOR4REQDd5GtL7yJeSF6OCqHkzgigHO+60n95TLM/BjjLN+uAF
         3TtFvGEzUoGROawW+8adUGvLJmUCP8QlUsVSkmApGrINwItJmNEUW76hwVCmgh6OIb8Z
         MHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZph5ifPxL5uVmjYTfQo6EGmMKT+tqcL6/MBH2RFjf4=;
        b=YaO+A3GBQeejbnCZ17/vC2zpXE9+qS8Rc5tBezdlnyZlcAaC2z1jOl1wbsL5zsLu7x
         5oc3jr/xcJQ6qU66ipnXGLROQM8DocXt/NAw9gSsCY5a5ntzp2jXqtHv14aWfEhNDeUf
         fErUtV1qS5/S4i3md/aTkVh8le7t27QZgnuxewgD56KgfgaJNrpcABQBzPQEF4Zqd6y5
         y+uEVTGrAdUKbRueJbg7Od6txA823xFMbudQVWhJYlDcpTNRSt4waSTJnqdgrChOVMA0
         KFPulGBtZfmTXTWapBoyk4Ey800wSIRoFxxllrhFKj78o9gAs1Ax6eX25bgUSjnMsTgA
         YxXA==
X-Gm-Message-State: AOAM5325nGTN4nCXi2mL3OdSZwc/F2n5kMBOdEE1XcPyHNWwLSOtMF0D
        rd2/68Dv0ZBtD6XFVMuKuUXd3A==
X-Google-Smtp-Source: ABdhPJwFgaFVB8A5AvKVJGjA0aolOBdRPt9bfKisJXAztKDujSSlp241WM3LfsALaOpf6VbP5sNpJQ==
X-Received: by 2002:a05:600c:190e:b0:38c:b1ea:f4ac with SMTP id j14-20020a05600c190e00b0038cb1eaf4acmr22183788wmq.70.1648420889357;
        Sun, 27 Mar 2022 15:41:29 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net. [2a02:8440:6341:357e:3074:96af:9642:2])
        by smtp.gmail.com with ESMTPSA id v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 15:41:28 -0700 (PDT)
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
        Markus Schneider-Pargmann <msp@baylibre.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort driver
Date:   Mon, 28 Mar 2022 00:39:23 +0200
Message-Id: <20220327223927.20848-19-granquet@baylibre.com>
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

This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.

It supports the mt8195, the embedded DisplayPort units. It offers
DisplayPort 1.4 with up to 4 lanes.

The driver shares its iomap range with the mtk-dp-phy driver using
the regmap/syscon facility.

This driver is based on an initial version by
Jason-JH.Lin <jason-jh.lin@mediatek.com>.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/mediatek/Kconfig       |    8 +
 drivers/gpu/drm/mediatek/Makefile      |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c      | 2221 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
 6 files changed, 2801 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 2976d21e9a34..03ffa9b896c3 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -28,3 +28,11 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
+
+config MTK_DPTX_SUPPORT
+	tristate "DRM DPTX Support for Mediatek SoCs"
+	depends on DRM_MEDIATEK
+	select PHY_MTK_DP
+	select DRM_DP_HELPER
+	help
+	  DRM/KMS Display Port driver for Mediatek SoCs.
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 29098d7c8307..d86a6406055e 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
+
+obj-$(CONFIG_MTK_DPTX_SUPPORT) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
new file mode 100644
index 000000000000..7cd8459cf719
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -0,0 +1,2221 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre
+ */
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/dp/drm_dp_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/hdmi-codec.h>
+#include <video/videomode.h>
+
+#include "mtk_dp_reg.h"
+
+#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
+#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
+
+//TODO: platform/device data or dts?
+#define MTK_DP_MAX_LANES 4
+#define MTK_DP_MAX_LINK_RATE MTK_DP_LINKRATE_HBR3
+
+#define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
+
+#define MTK_DP_TRAIN_RETRY_LIMIT 8
+#define MTK_DP_TRAIN_MAX_ITERATIONS 5
+
+#define MTK_DP_AUX_WRITE_READ_WAIT_TIME_US 20
+
+#define MTK_DP_DP_VERSION_11 0x11
+
+enum mtk_dp_state {
+	MTK_DP_STATE_INITIAL,
+	MTK_DP_STATE_IDLE,
+	MTK_DP_STATE_PREPARE,
+	MTK_DP_STATE_NORMAL,
+};
+
+enum mtk_dp_train_state {
+	MTK_DP_TRAIN_STATE_STARTUP = 0,
+	MTK_DP_TRAIN_STATE_CHECKCAP,
+	MTK_DP_TRAIN_STATE_CHECKEDID,
+	MTK_DP_TRAIN_STATE_TRAINING_PRE,
+	MTK_DP_TRAIN_STATE_TRAINING,
+	MTK_DP_TRAIN_STATE_NORMAL,
+	MTK_DP_TRAIN_STATE_DPIDLE,
+};
+
+struct mtk_dp_timings {
+	struct videomode vm;
+
+	u16 htotal;
+	u16 vtotal;
+	u8 frame_rate;
+	u32 pix_rate_khz;
+};
+
+struct mtk_dp_train_info {
+	bool tps3;
+	bool tps4;
+	bool sink_ssc;
+	bool cable_plugged_in;
+	bool cable_state_change;
+	bool cr_done;
+	bool eq_done;
+
+	/* link_rate is in multiple of 0.27Gbps */
+	int link_rate;
+	int lane_count;
+
+	u8  irq_status;
+	int check_cap_count;
+};
+
+/* Same values as used by the DP Spec for MISC0 bits 1 and 2 */
+enum mtk_dp_color_format {
+	MTK_DP_COLOR_FORMAT_RGB_444 = 0,
+	MTK_DP_COLOR_FORMAT_YUV_422 = 1,
+	MTK_DP_COLOR_FORMAT_YUV_444 = 2,
+	MTK_DP_COLOR_FORMAT_YUV_420 = 3,
+	MTK_DP_COLOR_FORMAT_YONLY = 4,
+	MTK_DP_COLOR_FORMAT_RAW = 5,
+	MTK_DP_COLOR_FORMAT_RESERVED = 6,
+	MTK_DP_COLOR_FORMAT_DEFAULT = MTK_DP_COLOR_FORMAT_RGB_444,
+	MTK_DP_COLOR_FORMAT_UNKNOWN = 15,
+};
+
+/* Multiple of 0.27Gbps */
+enum mtk_dp_linkrate {
+	MTK_DP_LINKRATE_RBR = 0x6,
+	MTK_DP_LINKRATE_HBR = 0xA,
+	MTK_DP_LINKRATE_HBR2 = 0x14,
+	MTK_DP_LINKRATE_HBR25 = 0x19,
+	MTK_DP_LINKRATE_HBR3 = 0x1E,
+};
+
+/* Same values as used for DP Spec MISC0 bits 5,6,7 */
+enum mtk_dp_color_depth {
+	MTK_DP_COLOR_DEPTH_6BIT = 0,
+	MTK_DP_COLOR_DEPTH_8BIT = 1,
+	MTK_DP_COLOR_DEPTH_10BIT = 2,
+	MTK_DP_COLOR_DEPTH_12BIT = 3,
+	MTK_DP_COLOR_DEPTH_16BIT = 4,
+	MTK_DP_COLOR_DEPTH_UNKNOWN = 5,
+};
+
+struct mtk_dp_info {
+	enum mtk_dp_color_depth depth;
+	enum mtk_dp_color_format format;
+	struct mtk_dp_timings timings;
+};
+
+struct dp_cal_data {
+	unsigned int glb_bias_trim;
+	unsigned int clktx_impse;
+
+	//TODO: see above with MTK_DP_MAX_LANES, make it SoC specific
+	unsigned int ln_tx_impsel_pmos[MTK_DP_MAX_LANES];
+	unsigned int ln_tx_impsel_nmos[MTK_DP_MAX_LANES];
+};
+
+struct mtk_dp {
+	struct device *dev;
+	struct phy *phy;
+	struct dp_cal_data cal_data;
+
+	struct drm_device *drm_dev;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_dp_aux aux;
+
+	/* Protects edid as it is used in both bridge ops and IRQ handler */
+	struct mutex edid_lock;
+	struct edid *edid;
+
+	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
+
+	struct mtk_dp_info info;
+	enum mtk_dp_state state;
+
+	struct mtk_dp_train_info train_info;
+	enum mtk_dp_train_state train_state;
+	unsigned int input_fmt;
+
+	struct regmap *regs;
+	struct clk *dp_tx_clk;
+
+	bool enabled;
+
+	bool has_fec;
+	/* Protects the mtk_dp struct */
+	struct mutex dp_lock;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
+	u8 connector_eld[MAX_ELD_BYTES];
+	struct drm_connector *conn;
+};
+
+static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
+{
+	return container_of(b, struct mtk_dp, bridge);
+}
+
+static u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
+{
+	u32 read_val;
+	int ret;
+
+	ret = regmap_read(mtk_dp->regs, offset, &read_val);
+	if (ret) {
+		dev_err(mtk_dp->dev, "Failed to read register 0x%x: %d\n",
+			offset, ret);
+		return 0;
+	}
+
+	return read_val;
+}
+
+static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
+{
+	int ret;
+
+	ret = regmap_write(mtk_dp->regs, offset, val);
+	if (ret)
+		dev_err(mtk_dp->dev,
+			"Failed to write register 0x%x with value 0x%x: %d\n",
+			offset, val, ret);
+	return ret;
+}
+
+static int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset, u32 val,
+			      u32 mask)
+{
+	int ret;
+
+	ret = regmap_update_bits(mtk_dp->regs, offset, mask, val);
+	if (ret)
+		dev_err(mtk_dp->dev,
+			"Failed to update register 0x%x with value 0x%x, mask 0x%x: %d\n",
+			offset, val, mask, ret);
+	return ret;
+}
+
+static int mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32 offset, u8 *buf,
+				   size_t length)
+{
+	int i;
+	int ret = 0;
+	int num_regs = (length + 1) / 2;
+
+	/* 2 bytes per register */
+	for (i = 0; i < num_regs; i++) {
+		u32 val = buf[i * 2] |
+			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 : 0);
+
+		ret = mtk_dp_write(mtk_dp, offset + i * 4, val);
+		if (ret)
+			goto out;
+	}
+
+out:
+	return ret;
+}
+
+static unsigned long mtk_dp_sip_atf_call(unsigned int cmd, unsigned int para)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32, cmd, para, 0, 0, 0, 0, 0,
+		      &res);
+
+	pr_debug("[DPTX]%s cmd 0x%x, p1 0x%x, ret 0x%lx-0x%lx", __func__, cmd,
+		 para, res.a0, res.a1);
+	return res.a1;
+}
+
+static int mtk_dp_msa_bypass_disable(struct mtk_dp *mtk_dp)
+{
+	const u16 bits_to_set =
+		BIT(HTOTAL_SEL_DP_ENC0_P0_SHIFT) |
+		BIT(VTOTAL_SEL_DP_ENC0_P0_SHIFT) |
+		BIT(HSTART_SEL_DP_ENC0_P0_SHIFT) |
+		BIT(VSTART_SEL_DP_ENC0_P0_SHIFT) |
+		BIT(HWIDTH_SEL_DP_ENC0_P0_SHIFT) |
+		BIT(VHEIGHT_SEL_DP_ENC0_P0_SHIFT) |
+		BIT(HSP_SEL_DP_ENC0_P0_SHIFT) | BIT(HSW_SEL_DP_ENC0_P0_SHIFT) |
+		BIT(VSP_SEL_DP_ENC0_P0_SHIFT) | BIT(VSW_SEL_DP_ENC0_P0_SHIFT);
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030, bits_to_set,
+			   bits_to_set);
+}
+
+#define MTK_UPD_BITS_OR_OUT(mtk_dp, offset, val, mask, ret, label) \
+	do {\
+		ret = mtk_dp_update_bits(mtk_dp, offset, val, mask); \
+		if (ret) \
+			goto label; \
+	} while (0)
+
+static int mtk_dp_set_msa(struct mtk_dp *mtk_dp)
+{
+	int ret;
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3010, timings->htotal,
+			    HTOTAL_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3018,
+			    timings->vm.hsync_len + timings->vm.hback_porch,
+			   HSTART_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3028,
+			    timings->vm.hsync_len << HSW_SW_DP_ENC0_P0_SHIFT,
+			   HSW_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3028, 0,
+			    HSP_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3020, timings->vm.hactive,
+			    HWIDTH_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3014, timings->vtotal,
+			    VTOTAL_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_301C,
+			    timings->vm.vsync_len + timings->vm.vback_porch,
+			   VSTART_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_302C,
+			    timings->vm.vsync_len << VSW_SW_DP_ENC0_P0_SHIFT,
+			   VSW_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_302C, 0,
+			    VSP_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3024, timings->vm.vactive,
+			    VHEIGHT_SW_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3064, timings->vm.hactive,
+			    HDE_NUM_LAST_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3154, timings->htotal,
+			    PGEN_HTOTAL_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3158,
+			    timings->vm.hfront_porch,
+			   PGEN_HSYNC_RISING_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_315C, timings->vm.hsync_len,
+			    PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3160,
+			    timings->vm.hback_porch + timings->vm.hsync_len,
+			   PGEN_HFDE_START_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3164, timings->vm.hactive,
+			    PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3168, timings->vtotal,
+			    PGEN_VTOTAL_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_316C,
+			    timings->vm.vfront_porch,
+			   PGEN_VSYNC_RISING_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3170, timings->vm.vsync_len,
+			    PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3174,
+			    timings->vm.vback_porch + timings->vm.vsync_len,
+			   PGEN_VFDE_START_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3178, timings->vm.vactive,
+			    PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
+				   enum mtk_dp_color_format color_format)
+{
+	u32 val;
+	int ret;
+
+	mtk_dp->info.format = color_format;
+
+	/* Update MISC0 */
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
+				 color_format << DP_TEST_COLOR_FORMAT_SHIFT,
+			   DP_TEST_COLOR_FORMAT_MASK);
+
+	if (ret)
+		return ret;
+
+	switch (color_format) {
+	case MTK_DP_COLOR_FORMAT_YUV_422:
+		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
+		break;
+	case MTK_DP_COLOR_FORMAT_YUV_420:
+		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
+		break;
+	case MTK_DP_COLOR_FORMAT_YONLY:
+	case MTK_DP_COLOR_FORMAT_RAW:
+	case MTK_DP_COLOR_FORMAT_RESERVED:
+	case MTK_DP_COLOR_FORMAT_UNKNOWN:
+		drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n",
+			 color_format);
+		fallthrough;
+	case MTK_DP_COLOR_FORMAT_RGB_444:
+	case MTK_DP_COLOR_FORMAT_YUV_444:
+		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
+		break;
+	}
+
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
+			   PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_set_color_depth(struct mtk_dp *mtk_dp,
+				  enum mtk_dp_color_depth color_depth)
+{
+	int ret;
+	u32 val;
+
+	mtk_dp->info.depth = color_depth;
+
+	/* Update MISC0 */
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
+				 color_depth << DP_TEST_BIT_DEPTH_SHIFT,
+			   DP_TEST_BIT_DEPTH_MASK);
+
+	if (ret)
+		return ret;
+
+	switch (color_depth) {
+	case MTK_DP_COLOR_DEPTH_6BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_8BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_10BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_12BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_16BIT:
+		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT;
+		break;
+	case MTK_DP_COLOR_DEPTH_UNKNOWN:
+		drm_warn(mtk_dp->drm_dev, "Unsupported color depth %d\n",
+			 color_depth);
+		return -EINVAL;
+	}
+
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
+			   VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_mn_overwrite_disable(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
+			   VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_set_sram_read_start(struct mtk_dp *mtk_dp, u32 val)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
+			   val << SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT,
+			   SRAM_START_READ_THRD_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_setup_encoder(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_303C,
+			    BIT(VIDEO_MN_GEN_EN_DP_ENC0_P0_SHIFT),
+			VIDEO_MN_GEN_EN_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3040,
+			    0x20 << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
+			SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3364,
+			    0x20 << SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT,
+			SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3300,
+			    2 << VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_SHIFT,
+			VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3364,
+			    4 << FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT,
+			FIFO_READ_START_POINT_DP_ENC1_P0_MASK, ret, out);
+	ret = mtk_dp_write(mtk_dp, MTK_DP_ENC1_P0_3368,
+			   1 << VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT |
+			1 << VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT |
+			BIT(SDP_DP13_EN_DP_ENC1_P0_SHIFT) |
+			1 << BS2BS_MODE_DP_ENC1_P0_SHIFT);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3038, 0,
+			    VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31B0,
+			    4 << PGEN_PATTERN_SEL_SHIFT, PGEN_PATTERN_SEL_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
+{
+	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
+		  HPD_DB_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
+		     BIT(AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT) |
+		     BIT(AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT) |
+		     BIT(AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT) |
+		     BIT(AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_SHIFT) |
+		     BIT(AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT) |
+		     BIT(AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT) |
+		     BIT(AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT));
+}
+
+static int mtk_dp_aux_set_cmd(struct mtk_dp *mtk_dp, u8 cmd, u32 addr)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3644, cmd,
+			    MCU_REQUEST_COMMAND_AUX_TX_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3648, addr,
+			    MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_364C, addr >> 16,
+			    MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_aux_cmd_complete(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3650,
+			   BIT(MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_SHIFT),
+			   MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_MASK |
+				   PHY_FIFO_RST_AUX_TX_P0_MASK |
+				   MCU_REQ_DATA_NUM_AUX_TX_P0_MASK);
+}
+
+static int mtk_dp_aux_request_ready(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3630,
+			   BIT(AUX_TX_REQUEST_READY_AUX_TX_P0_SHIFT),
+			   AUX_TX_REQUEST_READY_AUX_TX_P0_MASK);
+}
+
+static void mtk_dp_aux_fill_write_fifo(struct mtk_dp *mtk_dp, u8 *buf,
+				       size_t length)
+{
+	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_AUX_P0_3708, buf, length);
+}
+
+static int mtk_dp_aux_read_rx_fifo(struct mtk_dp *mtk_dp, u8 *buf,
+				   size_t length, int read_delay)
+{
+	int ret;
+	int read_pos;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3620, 0,
+			    AUX_RD_MODE_AUX_TX_P0_MASK, ret, out);
+
+	for (read_pos = 0; read_pos < length; read_pos++) {
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3620,
+				    BIT(AUX_RX_FIFO_R_PULSE_TX_P0_SHIFT),
+				   AUX_RX_FIFO_READ_PULSE_TX_P0_MASK, ret, out);
+		usleep_range(read_delay, read_delay * 2);
+		buf[read_pos] =
+			(u8)(mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3620) &
+			     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK >>
+				     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_SHIFT);
+	}
+
+out:
+	return ret;
+}
+
+static int mtk_dp_aux_set_length(struct mtk_dp *mtk_dp, size_t length)
+{
+	int ret;
+
+	if (length > 0) {
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3650,
+				    (length - 1)
+				    << MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT,
+				    MCU_REQ_DATA_NUM_AUX_TX_P0_MASK, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_362C, 0,
+				    AUX_NO_LENGTH_AUX_TX_P0_MASK |
+				    AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
+				    AUX_RESERVED_RW_0_AUX_TX_P0_MASK, ret, out);
+	} else {
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_362C,
+				    BIT(AUX_NO_LENGTH_AUX_TX_P0_SHIFT),
+				    AUX_NO_LENGTH_AUX_TX_P0_MASK |
+				    AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
+				    AUX_RESERVED_RW_0_AUX_TX_P0_MASK, ret, out);
+	}
+
+out:
+	return ret;
+}
+
+static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
+{
+	int wait_reply = MTK_DP_AUX_WAIT_REPLY_COUNT;
+
+	while (--wait_reply) {
+		u32 aux_irq_status;
+
+		if (is_read) {
+			u32 fifo_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3618);
+
+			if (fifo_status &
+			    (AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK |
+			     AUX_RX_FIFO_FULL_AUX_TX_P0_MASK)) {
+				return 0;
+			}
+		}
+
+		aux_irq_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3640);
+		if (aux_irq_status & AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK)
+			return 0;
+
+		if (aux_irq_status & AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK)
+			return -ETIMEDOUT;
+
+		usleep_range(100, 500);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
+				  u32 addr, u8 *buf, size_t length)
+{
+	int ret;
+	u32 reply_cmd;
+
+	if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
+			(cmd == DP_AUX_NATIVE_READ && !length)))
+		return -EINVAL;
+
+	if (!is_read) {
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3704,
+					 BIT(AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT),
+				   AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MASK);
+
+		if (ret)
+			return ret;
+	}
+
+	mtk_dp_aux_cmd_complete(mtk_dp);
+	mtk_dp_aux_irq_clear(mtk_dp);
+	usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
+		     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
+
+	mtk_dp_aux_set_cmd(mtk_dp, cmd, addr);
+	mtk_dp_aux_set_length(mtk_dp, length);
+
+	if (!is_read) {
+		if (length)
+			mtk_dp_aux_fill_write_fifo(mtk_dp, buf, length);
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3704,
+					 AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK,
+				   AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK);
+
+		if (ret)
+			return ret;
+	}
+
+	mtk_dp_aux_request_ready(mtk_dp);
+
+	ret = mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
+
+	reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
+		    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
+
+	if (ret || reply_cmd) {
+		u32 phy_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628) &
+				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
+		if (phy_status != AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
+			drm_err(mtk_dp->drm_dev,
+				"AUX Rx Aux hang, need SW reset\n");
+			return -EIO;
+		}
+
+		mtk_dp_aux_cmd_complete(mtk_dp);
+		mtk_dp_aux_irq_clear(mtk_dp);
+
+		usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
+			     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
+		return -ETIMEDOUT;
+	}
+
+	if (!length) {
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C, 0,
+					 AUX_NO_LENGTH_AUX_TX_P0_MASK |
+				   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
+				   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
+
+		if (ret)
+			return ret;
+
+	} else if (is_read) {
+		int read_delay;
+
+		if (cmd == (DP_AUX_I2C_READ | DP_AUX_I2C_MOT) ||
+		    cmd == DP_AUX_I2C_READ)
+			read_delay = 500;
+		else
+			read_delay = 100;
+
+		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length, read_delay);
+	}
+
+	mtk_dp_aux_cmd_complete(mtk_dp);
+	mtk_dp_aux_irq_clear(mtk_dp);
+	usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
+		     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
+
+	return 0;
+}
+
+static bool mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp, int lane_num,
+					  int swing_val, int preemphasis)
+{
+	int ret;
+
+	u32 lane_shift = lane_num * DP_TX1_VOLT_SWING_SHIFT;
+
+	if (lane_num < 0 || lane_num > 3)
+		return false;
+
+	dev_dbg(mtk_dp->dev,
+		"link training swing_val= 0x%x, preemphasis = 0x%x\n",
+		swing_val, preemphasis);
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_SWING_EMP,
+			    swing_val << (DP_TX0_VOLT_SWING_SHIFT + lane_shift),
+			   DP_TX0_VOLT_SWING_MASK << lane_shift, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_SWING_EMP,
+			    preemphasis << (DP_TX0_PRE_EMPH_SHIFT + lane_shift),
+			   DP_TX0_PRE_EMPH_MASK << lane_shift, ret, out);
+
+out:
+	return !ret;
+}
+
+static int mtk_dp_reset_swing_pre_emphasis(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP, 0,
+			   DP_TX0_VOLT_SWING_MASK | DP_TX1_VOLT_SWING_MASK |
+			   DP_TX2_VOLT_SWING_MASK |
+			   DP_TX3_VOLT_SWING_MASK |
+			   DP_TX0_PRE_EMPH_MASK | DP_TX1_PRE_EMPH_MASK |
+			   DP_TX2_PRE_EMPH_MASK | DP_TX3_PRE_EMPH_MASK);
+}
+
+static int mtk_dp_fec_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
+			   enable ? BIT(FEC_EN_DP_TRANS_P0_SHIFT) : 0,
+			   FEC_EN_DP_TRANS_P0_MASK);
+}
+
+static int mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	u32 val = 0;
+
+	if (!enable)
+		val = IRQ_MASK_DP_TRANS_P0_DISC_IRQ |
+		      IRQ_MASK_DP_TRANS_P0_CONN_IRQ |
+		      IRQ_MASK_DP_TRANS_P0_INT_IRQ;
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, val,
+			   IRQ_MASK_DP_TRANS_P0_MASK);
+}
+
+static int mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_342C,
+			    XTAL_FREQ_DP_TRANS_P0_DEFAULT,
+			   XTAL_FREQ_DP_TRANS_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3540,
+			    BIT(FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT),
+			   FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31EC,
+			    BIT(AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT),
+			   AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
+			    SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_IRQ_MASK, IRQ_MASK_AUX_TOP_IRQ,
+			    IRQ_MASK_AUX_TOP_IRQ, ret, out);
+
+out:
+	return ret;
+}
+
+static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
+{
+	// Debounce threshold
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   8 << HPD_DEB_THD_DP_TRANS_P0_SHIFT,
+			   HPD_DEB_THD_DP_TRANS_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
+			    HPD_INT_THD_DP_TRANS_P0_UPPER_1100US)
+				   << HPD_INT_THD_DP_TRANS_P0_SHIFT,
+			   HPD_INT_THD_DP_TRANS_P0_MASK);
+
+	// Connect threshold 1.5ms + 5 x 0.1ms = 2ms
+	// Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   (5 << HPD_DISC_THD_DP_TRANS_P0_SHIFT) |
+				   (5 << HPD_CONN_THD_DP_TRANS_P0_SHIFT),
+			   HPD_DISC_THD_DP_TRANS_P0_MASK |
+				   HPD_CONN_THD_DP_TRANS_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
+			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
+			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
+}
+
+static int mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	/* modify timeout threshold = 1595 [12 : 8] */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_360C, 0x1595,
+			    AUX_TIMEOUT_THR_AUX_TX_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3658, 0,
+			    AUX_TX_OV_EN_AUX_TX_P0_MASK, ret, out);
+	/* 25 for 26M */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3634,
+			    25 << AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT,
+			   AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK, ret, out);
+	/* 13 for 26M */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3614,
+			    13 << AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT,
+			   AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_37C8,
+			    BIT(MTK_ATOP_EN_AUX_TX_P0_SHIFT),
+			   MTK_ATOP_EN_AUX_TX_P0_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
+			    VBID_VIDEO_MUTE_DP_ENC0_P0_MASK, ret, out);
+	mtk_dp_set_color_format(mtk_dp, MTK_DP_COLOR_FORMAT_RGB_444);
+	mtk_dp_set_color_depth(mtk_dp, MTK_DP_COLOR_DEPTH_8BIT);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3368,
+			    1 << BS2BS_MODE_DP_ENC1_P0_SHIFT,
+			   BS2BS_MODE_DP_ENC1_P0_MASK, ret, out);
+
+	/* dp tx encoder reset all sw */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3004,
+			    BIT(DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SHIFT),
+			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK, ret, out);
+	usleep_range(1000, 5000);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
+			    DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_340C,
+			    BIT(DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_SHIFT),
+			   DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK, ret, out);
+	usleep_range(1000, 5000);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_340C, 0,
+			    DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_35F0,
+			    lanes == 0 ? 0 : BIT(3), BIT(3) | BIT(2), ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3000, lanes,
+			    LANE_NUM_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_34A4,
+			    lanes << LANE_NUM_DP_TRANS_P0_SHIFT,
+			   LANE_NUM_DP_TRANS_P0_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int link_rate_to_mb_per_s(struct mtk_dp *mtk_dp,
+				 enum mtk_dp_linkrate linkrate)
+{
+	switch (linkrate) {
+	default:
+		drm_err(mtk_dp->drm_dev,
+			"Implementation error, unknown linkrate %d\n",
+			linkrate);
+		fallthrough;
+	case MTK_DP_LINKRATE_RBR:
+		return 1620;
+	case MTK_DP_LINKRATE_HBR:
+		return 2700;
+	case MTK_DP_LINKRATE_HBR2:
+		return 5400;
+	case MTK_DP_LINKRATE_HBR3:
+		return 8100;
+	}
+}
+
+static u32 check_cal_data_valid(u32 min, u32 max, u32 val, u32 default_val)
+{
+	if (val < min || val > max)
+		return default_val;
+
+	return val;
+}
+
+static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
+{
+	struct dp_cal_data *cal_data = &mtk_dp->cal_data;
+	struct device *dev = mtk_dp->dev;
+	struct nvmem_cell *cell;
+	u32 *buf;
+	size_t len;
+
+	cell = nvmem_cell_get(dev, "dp_calibration_data");
+	if (IS_ERR(cell)) {
+		dev_err(dev,
+			"Error: Failed to get nvmem cell dp_calibration_data\n");
+		return PTR_ERR(cell);
+	}
+
+	buf = (u32 *)nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
+		dev_err(dev,
+			"Error: Failed to read nvmem_cell_read fail len %ld\n",
+			(len / sizeof(u32)));
+		return PTR_ERR(buf);
+	}
+
+	cal_data->glb_bias_trim =
+		check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
+	cal_data->clktx_impse =
+		check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_pmos[0] =
+		check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_nmos[0] =
+		check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_pmos[1] =
+		check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_nmos[1] =
+		check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_pmos[2] =
+		check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_nmos[2] =
+		check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_pmos[3] =
+		check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
+	cal_data->ln_tx_impsel_nmos[3] =
+		check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
+
+	kfree(buf);
+
+	return 0;
+}
+
+static int mtk_dp_set_cal_data(struct mtk_dp *mtk_dp)
+{
+	int ret;
+	struct dp_cal_data *cal_data = &mtk_dp->cal_data;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_GLB_DPAUX_TX,
+			    cal_data->clktx_impse << 20, RG_CKM_PT0_CKTX_IMPSEL, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_GLB_BIAS_GEN_00,
+			    cal_data->glb_bias_trim << 16,
+			   RG_XTP_GLB_BIAS_INTR_CTRL, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_0,
+			    cal_data->ln_tx_impsel_pmos[0] << 12,
+			   RG_XTP_LN0_TX_IMPSEL_PMOS, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_0,
+			    cal_data->ln_tx_impsel_nmos[0] << 16,
+			   RG_XTP_LN0_TX_IMPSEL_NMOS, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_1,
+			    cal_data->ln_tx_impsel_pmos[1] << 12,
+			   RG_XTP_LN1_TX_IMPSEL_PMOS, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_1,
+			    cal_data->ln_tx_impsel_nmos[1] << 16,
+			   RG_XTP_LN1_TX_IMPSEL_NMOS, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_2,
+			    cal_data->ln_tx_impsel_pmos[2] << 12,
+			   RG_XTP_LN2_TX_IMPSEL_PMOS, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_2,
+			    cal_data->ln_tx_impsel_nmos[2] << 16,
+			   RG_XTP_LN2_TX_IMPSEL_NMOS, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_3,
+			    cal_data->ln_tx_impsel_pmos[3] << 12,
+			   RG_XTP_LN3_TX_IMPSEL_PMOS, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_3,
+			    cal_data->ln_tx_impsel_nmos[3] << 16,
+			   RG_XTP_LN3_TX_IMPSEL_NMOS, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
+				enum mtk_dp_linkrate link_rate, int lane_count)
+{
+	int ret;
+	union phy_configure_opts phy_opts = {
+		.dp = {
+			.link_rate = link_rate_to_mb_per_s(mtk_dp, link_rate),
+			.set_rate = 1,
+			.lanes = lane_count,
+			.set_lanes = 1,
+			.ssc = mtk_dp->train_info.sink_ssc,
+		}
+		};
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
+			    DP_PWR_STATE_MASK, ret, out);
+
+	ret = phy_configure(mtk_dp->phy, &phy_opts);
+
+	if (ret)
+		goto out;
+
+	mtk_dp_set_cal_data(mtk_dp);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			    DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_set_idle_pattern(struct mtk_dp *mtk_dp, bool enable)
+{
+	const u32 val = POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK |
+			POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK |
+			POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK |
+			POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK;
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3580, enable ? val : 0, val);
+}
+
+//TODO: check return value in callee
+static int mtk_dp_train_set_pattern(struct mtk_dp *mtk_dp, int pattern)
+{
+	if (pattern < 0 || pattern > 4) {
+		drm_err(mtk_dp->drm_dev,
+			"Implementation error, no such pattern %d\n", pattern);
+		return -EINVAL;
+	}
+
+	if (pattern == 1) /* TPS1 */
+		mtk_dp_set_idle_pattern(mtk_dp, false);
+
+	return mtk_dp_update_bits(mtk_dp,
+			   MTK_DP_TRANS_P0_3400,
+			   pattern ? BIT(pattern - 1) << PATTERN1_EN_DP_TRANS_P0_SHIFT : 0,
+			   PATTERN1_EN_DP_TRANS_P0_MASK | PATTERN2_EN_DP_TRANS_P0_MASK |
+			   PATTERN3_EN_DP_TRANS_P0_MASK |
+			   PATTERN4_EN_DP_TRANS_P0_MASK);
+}
+
+static int mtk_dp_set_enhanced_frame_mode(struct mtk_dp *mtk_dp, bool enable)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
+			   enable ? BIT(ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT) : 0,
+			   ENHANCED_FRAME_EN_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_training_set_scramble(struct mtk_dp *mtk_dp, bool enable)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3404,
+			   enable ? DP_SCR_EN_DP_TRANS_P0_MASK : 0,
+			   DP_SCR_EN_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
+{
+	u32 val = BIT(VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT);
+
+	if (enable)
+		val |= BIT(VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
+			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
+			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
+
+	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+}
+
+static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, 0,
+			    SW_RST_B_PHYD, ret, out);
+	usleep_range(10, 200);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, SW_RST_B_PHYD,
+			    SW_RST_B_PHYD, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			    DP_PWR_STATE_BANDGAP_TPLL,
+			   DP_PWR_STATE_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_power_disable(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
+
+	if (ret)
+		goto out;
+
+	usleep_range(10, 200);
+	ret = mtk_dp_write(mtk_dp, MTK_DP_0034,
+			   DA_CKM_CKTX0_EN_FORCE_EN | DA_CKM_BIAS_LPF_EN_FORCE_VAL |
+		     DA_CKM_BIAS_EN_FORCE_VAL |
+		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
+		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
+
+	if (ret)
+		goto out;
+
+	/* Disable RX */
+	ret = mtk_dp_write(mtk_dp, MTK_DP_1040, 0);
+
+	if (ret)
+		goto out;
+
+	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
+			   0x550 | BIT(FUSE_SEL_SHIFT) | BIT(MEM_ISO_EN_SHIFT));
+
+out:
+	return ret;
+}
+
+static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
+{
+	mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR2;
+	mtk_dp->train_info.lane_count = MTK_DP_MAX_LANES;
+	mtk_dp->train_info.irq_status = 0;
+	mtk_dp->train_info.cable_plugged_in = false;
+	mtk_dp->train_info.cable_state_change = false;
+	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+	mtk_dp->state = MTK_DP_STATE_INITIAL;
+
+	mtk_dp->info.format = MTK_DP_COLOR_FORMAT_RGB_444;
+	mtk_dp->info.depth = MTK_DP_COLOR_DEPTH_8BIT;
+	memset(&mtk_dp->info.timings, 0, sizeof(struct mtk_dp_timings));
+	mtk_dp->info.timings.frame_rate = 60;
+
+	mtk_dp->has_fec = false;
+}
+
+static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
+{
+	u32 sram_read_start = MTK_DP_TBC_BUF_READ_START_ADDR;
+
+	if (mtk_dp->train_info.lane_count > 0) {
+		sram_read_start = min_t(u32,
+					MTK_DP_TBC_BUF_READ_START_ADDR,
+					mtk_dp->info.timings.vm.hactive /
+					(mtk_dp->train_info.lane_count * 4 * 2 * 2));
+		mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
+	}
+
+	mtk_dp_setup_encoder(mtk_dp);
+}
+
+static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
+{
+	int target_frame_rate = 60;
+	int target_pixel_clk;
+
+	if (mtk_dp->info.timings.frame_rate > 0) {
+		target_frame_rate = mtk_dp->info.timings.frame_rate;
+		target_pixel_clk = (int)mtk_dp->info.timings.htotal *
+				   (int)mtk_dp->info.timings.vtotal *
+				   target_frame_rate;
+	} else if (mtk_dp->info.timings.pix_rate_khz > 0) {
+		target_pixel_clk = mtk_dp->info.timings.pix_rate_khz * 1000;
+	} else {
+		target_pixel_clk = (int)mtk_dp->info.timings.htotal *
+				   (int)mtk_dp->info.timings.vtotal *
+				   target_frame_rate;
+	}
+
+	if (target_pixel_clk > 0)
+		mtk_dp->info.timings.pix_rate_khz = target_pixel_clk / 1000;
+}
+
+static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_msa_bypass_disable(mtk_dp);
+	mtk_dp_calculate_pixrate(mtk_dp);
+	mtk_dp_pg_disable(mtk_dp);
+	mtk_dp_setup_tu(mtk_dp);
+}
+
+static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
+					  u8 dpcd_adjust_req[2])
+{
+	int lane;
+
+	for (lane = 0; lane < lanes; ++lane) {
+		u8 val;
+		u8 swing;
+		u8 preemphasis;
+		int index = lane / 2;
+		int shift = lane % 2 ? DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT : 0;
+
+		swing = (dpcd_adjust_req[index] >> shift) &
+			DP_ADJUST_VOLTAGE_SWING_LANE0_MASK;
+		preemphasis = ((dpcd_adjust_req[index] >> shift) &
+			       DP_ADJUST_PRE_EMPHASIS_LANE0_MASK) >>
+			      DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT;
+		val = swing << DP_TRAIN_VOLTAGE_SWING_SHIFT |
+		      preemphasis << DP_TRAIN_PRE_EMPHASIS_SHIFT;
+
+		if (swing == DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
+			val |= DP_TRAIN_MAX_SWING_REACHED;
+		if (preemphasis == 3)
+			val |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
+
+		mtk_dp_set_swing_pre_emphasis(mtk_dp, lane, swing, preemphasis);
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_LANE0_SET + lane,
+				   val);
+	}
+
+	/* Wait for the signal to be stable enough */
+	usleep_range(2000, 5000);
+}
+
+static void mtk_dp_read_link_status(struct mtk_dp *mtk_dp,
+				    u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	drm_dp_dpcd_read(&mtk_dp->aux, DP_LANE0_1_STATUS, link_status,
+			 DP_LINK_STATUS_SIZE);
+}
+
+static int mtk_dp_train_flow(struct mtk_dp *mtk_dp, int target_link_rate,
+			     int target_lane_count)
+{
+	u8 link_status[DP_LINK_STATUS_SIZE] = {};
+	u8 lane_adjust[2] = {};
+	bool pass_tps1 = false;
+	bool pass_tps2_3 = false;
+	int train_retries;
+	int status_control;
+	int iteration_count;
+	u8 prev_lane_adjust;
+	u8 val;
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LINK_BW_SET, target_link_rate);
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
+			   target_lane_count | DP_LANE_COUNT_ENHANCED_FRAME_EN);
+
+	if (mtk_dp->train_info.sink_ssc)
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DOWNSPREAD_CTRL,
+				   DP_SPREAD_AMP_0_5);
+
+	train_retries = 0;
+	status_control = 0;
+	iteration_count = 1;
+	prev_lane_adjust = 0xFF;
+
+	mtk_dp_set_lanes(mtk_dp, target_lane_count / 2);
+	mtk_dp_phy_configure(mtk_dp, target_link_rate, target_lane_count);
+
+	dev_dbg(mtk_dp->dev,
+		"Link train target_link_rate = 0x%x, target_lane_count = 0x%x\n",
+		target_link_rate, target_lane_count);
+
+	do {
+		train_retries++;
+		if (!mtk_dp->train_info.cable_plugged_in ||
+		    ((mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) !=
+		     0x0)) {
+			return -ENODEV;
+		}
+
+		if (mtk_dp->train_state < MTK_DP_TRAIN_STATE_TRAINING)
+			return -EAGAIN;
+
+		if (!pass_tps1) {
+			mtk_dp_training_set_scramble(mtk_dp, false);
+
+			if (status_control == 0) {
+				status_control = 1;
+				mtk_dp_train_set_pattern(mtk_dp, 1);
+				val = DP_LINK_SCRAMBLING_DISABLE |
+				      DP_TRAINING_PATTERN_1;
+				drm_dp_dpcd_writeb(&mtk_dp->aux,
+						   DP_TRAINING_PATTERN_SET,
+						   DP_LINK_SCRAMBLING_DISABLE |
+						   DP_TRAINING_PATTERN_1);
+				drm_dp_dpcd_read(&mtk_dp->aux,
+						 DP_ADJUST_REQUEST_LANE0_1,
+						 lane_adjust,
+						 sizeof(lane_adjust));
+				iteration_count++;
+
+				mtk_dp_train_update_swing_pre(mtk_dp,
+							      target_lane_count, lane_adjust);
+			}
+
+			drm_dp_link_train_clock_recovery_delay(&mtk_dp->aux,
+							       mtk_dp->rx_cap);
+			mtk_dp_read_link_status(mtk_dp, link_status);
+
+			if (drm_dp_clock_recovery_ok(link_status,
+						     target_lane_count)) {
+				mtk_dp->train_info.cr_done = true;
+				pass_tps1 = true;
+				train_retries = 0;
+				iteration_count = 1;
+				dev_dbg(mtk_dp->dev, "Link train CR pass\n");
+			} else if (prev_lane_adjust == link_status[4]) {
+				iteration_count++;
+				if (prev_lane_adjust &
+				    DP_ADJUST_VOLTAGE_SWING_LANE0_MASK)
+					break;
+			} else {
+				prev_lane_adjust = link_status[4];
+			}
+			dev_dbg(mtk_dp->dev, "Link train CQ fail\n");
+		} else if (pass_tps1 && !pass_tps2_3) {
+			if (status_control == 1) {
+				status_control = 2;
+				if (mtk_dp->train_info.tps4) {
+					mtk_dp_train_set_pattern(mtk_dp, 4);
+					val = DP_TRAINING_PATTERN_4;
+				} else if (mtk_dp->train_info.tps3) {
+					mtk_dp_train_set_pattern(mtk_dp, 3);
+					val = DP_LINK_SCRAMBLING_DISABLE |
+					      DP_TRAINING_PATTERN_3;
+				} else {
+					mtk_dp_train_set_pattern(mtk_dp, 2);
+					val = DP_LINK_SCRAMBLING_DISABLE |
+					      DP_TRAINING_PATTERN_2;
+				}
+				drm_dp_dpcd_writeb(&mtk_dp->aux,
+						   DP_TRAINING_PATTERN_SET,
+						   val);
+
+				drm_dp_dpcd_read(&mtk_dp->aux,
+						 DP_ADJUST_REQUEST_LANE0_1,
+						 lane_adjust,
+						 sizeof(lane_adjust));
+
+				iteration_count++;
+				mtk_dp_train_update_swing_pre(mtk_dp,
+							      target_lane_count, lane_adjust);
+			}
+
+			drm_dp_link_train_channel_eq_delay(&mtk_dp->aux,
+							   mtk_dp->rx_cap);
+
+			mtk_dp_read_link_status(mtk_dp, link_status);
+
+			if (!drm_dp_clock_recovery_ok(link_status,
+						      target_lane_count)) {
+				mtk_dp->train_info.cr_done = false;
+				mtk_dp->train_info.eq_done = false;
+				dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
+				break;
+			}
+
+			if (drm_dp_channel_eq_ok(link_status,
+						 target_lane_count)) {
+				mtk_dp->train_info.eq_done = true;
+				pass_tps2_3 = true;
+				dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
+				break;
+			}
+
+			if (prev_lane_adjust == link_status[4])
+				iteration_count++;
+			else
+				prev_lane_adjust = link_status[4];
+		}
+
+		drm_dp_dpcd_read(&mtk_dp->aux, DP_ADJUST_REQUEST_LANE0_1,
+				 lane_adjust, sizeof(lane_adjust));
+		mtk_dp_train_update_swing_pre(mtk_dp, target_lane_count,
+					      lane_adjust);
+	} while (train_retries < MTK_DP_TRAIN_RETRY_LIMIT &&
+		 iteration_count < MTK_DP_TRAIN_MAX_ITERATIONS);
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_PATTERN_SET,
+			   DP_TRAINING_PATTERN_DISABLE);
+	mtk_dp_train_set_pattern(mtk_dp, 0);
+
+	if (!pass_tps2_3)
+		return -ETIMEDOUT;
+
+	mtk_dp->train_info.link_rate = target_link_rate;
+	mtk_dp->train_info.lane_count = target_lane_count;
+
+	mtk_dp_training_set_scramble(mtk_dp, true);
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
+			   target_lane_count |
+				   DP_LANE_COUNT_ENHANCED_FRAME_EN);
+	mtk_dp_set_enhanced_frame_mode(mtk_dp, true);
+
+	return 0;
+}
+
+static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
+{
+	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
+	u8 val;
+	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
+
+	if (!mtk_dp_plug_state(mtk_dp))
+		return false;
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+	usleep_range(2000, 5000);
+
+	drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
+
+	memcpy(mtk_dp->rx_cap, buf, min(sizeof(mtk_dp->rx_cap), sizeof(buf)));
+	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &= DP_TRAINING_AUX_RD_MASK;
+
+	train_info->link_rate =
+		min_t(int, MTK_DP_MAX_LINK_RATE, buf[DP_MAX_LINK_RATE]);
+	train_info->lane_count =
+		min_t(int, MTK_DP_MAX_LANES, drm_dp_max_lane_count(buf));
+
+	train_info->tps3 = drm_dp_tps3_supported(buf);
+	train_info->tps4 = drm_dp_tps4_supported(buf);
+
+	train_info->sink_ssc =
+		!!(buf[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
+
+	train_info->sink_ssc = false;
+
+	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
+	if (val & DP_MST_CAP) {
+		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
+		drm_dp_dpcd_readb(&mtk_dp->aux,
+				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0, &val);
+		if (val)
+			drm_dp_dpcd_writeb(&mtk_dp->aux,
+					   DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
+					   val);
+	}
+
+	return true;
+}
+
+static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
+{
+	phy_reset(mtk_dp->phy);
+	mtk_dp_reset_swing_pre_emphasis(mtk_dp);
+
+	usleep_range(2000, 5000);
+}
+
+static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
+{
+	int ret = 0;
+	int lane_count;
+	int link_rate;
+	int train_limit;
+	int max_link_rate;
+	int plug_wait;
+
+	for (plug_wait = 7; !mtk_dp_plug_state(mtk_dp) && plug_wait > 0;
+	     --plug_wait)
+		usleep_range(1000, 5000);
+	if (plug_wait == 0) {
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
+		return -ENODEV;
+	}
+
+	link_rate = mtk_dp->rx_cap[1];
+	lane_count = mtk_dp->rx_cap[2] & 0x1F;
+
+	mtk_dp->train_info.link_rate = min(MTK_DP_MAX_LINK_RATE, link_rate);
+	mtk_dp->train_info.lane_count = min(MTK_DP_MAX_LANES, lane_count);
+	link_rate = mtk_dp->train_info.link_rate;
+	lane_count = mtk_dp->train_info.lane_count;
+
+	switch (link_rate) {
+	case MTK_DP_LINKRATE_RBR:
+	case MTK_DP_LINKRATE_HBR:
+	case MTK_DP_LINKRATE_HBR2:
+	case MTK_DP_LINKRATE_HBR25:
+	case MTK_DP_LINKRATE_HBR3:
+		break;
+	default:
+		mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR3;
+		break;
+	};
+
+	max_link_rate = link_rate;
+	for (train_limit = 6; train_limit > 0; train_limit--) {
+		mtk_dp->train_info.cr_done = false;
+		mtk_dp->train_info.eq_done = false;
+
+		mtk_dp_train_change_mode(mtk_dp);
+		ret = mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
+		if (ret)
+			return ret;
+
+		if (!mtk_dp->train_info.cr_done) {
+			switch (link_rate) {
+			case MTK_DP_LINKRATE_RBR:
+				lane_count = lane_count / 2;
+				link_rate = max_link_rate;
+				if (lane_count == 0) {
+					mtk_dp->train_state =
+						MTK_DP_TRAIN_STATE_DPIDLE;
+					return -EIO;
+				}
+				break;
+			case MTK_DP_LINKRATE_HBR:
+				link_rate = MTK_DP_LINKRATE_RBR;
+				break;
+			case MTK_DP_LINKRATE_HBR2:
+				link_rate = MTK_DP_LINKRATE_HBR;
+				break;
+			case MTK_DP_LINKRATE_HBR3:
+				link_rate = MTK_DP_LINKRATE_HBR2;
+				break;
+			default:
+				return -EINVAL;
+			};
+		} else if (!mtk_dp->train_info.eq_done) {
+			if (lane_count == 0)
+				return -EIO;
+
+			lane_count /= 2;
+		} else {
+			break;
+		}
+	}
+
+	if (train_limit == 0)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
+{
+	int ret = 0;
+	int i = 50;
+
+	for (; ret && i; i--) {
+		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
+			continue;
+
+		switch (mtk_dp->train_state) {
+		case MTK_DP_TRAIN_STATE_STARTUP:
+			mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
+			break;
+
+		case MTK_DP_TRAIN_STATE_CHECKCAP:
+			if (mtk_dp_parse_capabilities(mtk_dp)) {
+				mtk_dp->train_info.check_cap_count = 0;
+				mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;
+			} else {
+				mtk_dp->train_info.check_cap_count++;
+
+				if (mtk_dp->train_info.check_cap_count >
+					MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT) {
+					mtk_dp->train_info.check_cap_count = 0;
+					mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
+					ret = -ETIMEDOUT;
+				}
+			}
+			break;
+
+		case MTK_DP_TRAIN_STATE_CHECKEDID:
+			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
+			break;
+
+		case MTK_DP_TRAIN_STATE_TRAINING_PRE:
+			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
+			break;
+
+		case MTK_DP_TRAIN_STATE_TRAINING:
+			ret = mtk_dp_train_start(mtk_dp);
+			if (!ret) {
+				mtk_dp_video_mute(mtk_dp, true);
+				mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;
+				mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
+			} else if (ret != -EAGAIN) {
+				mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
+			}
+
+			ret = 0;
+			break;
+
+		case MTK_DP_TRAIN_STATE_NORMAL:
+			break;
+		case MTK_DP_TRAIN_STATE_DPIDLE:
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (ret)
+		drm_err(mtk_dp->drm_dev, "Train handler failed %d\n", ret);
+
+	return ret;
+}
+
+static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	if (enable) {
+		mtk_dp_set_tx_out(mtk_dp);
+		mtk_dp_video_mute(mtk_dp, false);
+	} else {
+		mtk_dp_video_mute(mtk_dp, true);
+	}
+}
+
+static void mtk_dp_video_config(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_mn_overwrite_disable(mtk_dp);
+
+	mtk_dp_set_msa(mtk_dp);
+
+	mtk_dp_set_color_depth(mtk_dp, mtk_dp->info.depth);
+	mtk_dp_set_color_format(mtk_dp, mtk_dp->info.format);
+}
+
+static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
+{
+	switch (mtk_dp->state) {
+	case MTK_DP_STATE_INITIAL:
+		mtk_dp_video_mute(mtk_dp, true);
+		mtk_dp->state = MTK_DP_STATE_IDLE;
+		break;
+
+	case MTK_DP_STATE_IDLE:
+		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
+			mtk_dp->state = MTK_DP_STATE_PREPARE;
+		break;
+
+	case MTK_DP_STATE_PREPARE:
+		mtk_dp_video_config(mtk_dp);
+		mtk_dp_video_enable(mtk_dp, true);
+
+		mtk_dp->state = MTK_DP_STATE_NORMAL;
+		break;
+
+	case MTK_DP_STATE_NORMAL:
+		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
+			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp->state = MTK_DP_STATE_IDLE;
+		}
+		break;
+
+	default:
+		break;
+	}
+}
+
+static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_set_idle_pattern(mtk_dp, true);
+	mtk_dp_initialize_priv_data(mtk_dp);
+
+	mtk_dp_initialize_settings(mtk_dp);
+	mtk_dp_initialize_aux_settings(mtk_dp);
+	mtk_dp_initialize_digital_settings(mtk_dp);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
+			   BIT(RX_REPLY_COMPLETE_MODE_AUX_TX_P0_SHIFT),
+			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0_MASK);
+	mtk_dp_initialize_hpd_detect_settings(mtk_dp);
+
+	mtk_dp_digital_sw_reset(mtk_dp);
+}
+
+static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
+			   struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret = 0;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	mtk_dp->regs = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(mtk_dp->regs))
+		return PTR_ERR(mtk_dp->regs);
+
+	//TODO: optional clock?
+	mtk_dp->dp_tx_clk = devm_clk_get(dev, "faxi");
+	if (IS_ERR(mtk_dp->dp_tx_clk)) {
+		ret = PTR_ERR(mtk_dp->dp_tx_clk);
+		dev_info(dev, "Failed to get dptx clock: %d\n", ret);
+		mtk_dp->dp_tx_clk = NULL;
+	}
+
+	return 0;
+}
+
+static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
+{
+	return connector_status_connected;
+}
+
+static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
+				    struct drm_connector *connector)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	bool enabled = mtk_dp->enabled;
+	struct edid *new_edid = NULL;
+
+	if (!enabled)
+		drm_bridge_chain_pre_enable(bridge);
+
+	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+	usleep_range(2000, 5000);
+
+	if (mtk_dp_plug_state(mtk_dp))
+		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
+
+	if (!enabled)
+		drm_bridge_chain_post_disable(bridge);
+
+	mutex_lock(&mtk_dp->edid_lock);
+	kfree(mtk_dp->edid);
+	mtk_dp->edid = NULL;
+
+	if (!new_edid) {
+		mutex_unlock(&mtk_dp->edid_lock);
+		return NULL;
+	}
+
+	mtk_dp->edid = drm_edid_duplicate(new_edid);
+	mutex_unlock(&mtk_dp->edid_lock);
+
+	return new_edid;
+}
+
+static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
+				   struct drm_dp_aux_msg *msg)
+{
+	struct mtk_dp *mtk_dp;
+	bool is_read;
+	u8 request;
+	size_t accessed_bytes = 0;
+	int retry = 3, ret = 0;
+
+	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
+
+	if (!mtk_dp->train_info.cable_plugged_in ||
+	    mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) {
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
+		ret = -EAGAIN;
+		goto err;
+	}
+
+	switch (msg->request) {
+	case DP_AUX_I2C_MOT:
+	case DP_AUX_I2C_WRITE:
+	case DP_AUX_NATIVE_WRITE:
+	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
+	case DP_AUX_I2C_WRITE_STATUS_UPDATE | DP_AUX_I2C_MOT:
+		request = msg->request & ~DP_AUX_I2C_WRITE_STATUS_UPDATE;
+		is_read = false;
+		break;
+	case DP_AUX_I2C_READ:
+	case DP_AUX_NATIVE_READ:
+	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
+		request = msg->request;
+		is_read = true;
+		break;
+	default:
+		drm_err(mtk_aux->drm_dev, "invalid aux cmd = %d\n",
+			msg->request);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (msg->size == 0) {
+		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
+					     msg->address + accessed_bytes,
+					     msg->buffer + accessed_bytes, 0);
+	} else {
+		while (accessed_bytes < msg->size) {
+			size_t to_access =
+				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
+				      msg->size - accessed_bytes);
+			while (retry--) {
+				ret = mtk_dp_aux_do_transfer(mtk_dp,
+							     is_read, request,
+							     msg->address + accessed_bytes,
+							     msg->buffer + accessed_bytes,
+							     to_access);
+				if (ret == 0)
+					break;
+				usleep_range(50, 100);
+			}
+			if (!retry || ret) {
+				drm_info(mtk_dp->drm_dev,
+					 "Failed to do AUX transfer: %d\n",
+					 ret);
+				break;
+			}
+			accessed_bytes += to_access;
+		}
+	}
+err:
+	if (ret) {
+		msg->reply = DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPLY_NACK;
+		return ret;
+	}
+
+	msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
+	return msg->size;
+}
+
+static void mtk_dp_poweroff(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->dp_lock);
+
+	mtk_dp_hwirq_enable(mtk_dp, false);
+	mtk_dp_power_disable(mtk_dp);
+	phy_exit(mtk_dp->phy);
+	clk_disable_unprepare(mtk_dp->dp_tx_clk);
+
+	mutex_unlock(&mtk_dp->dp_lock);
+}
+
+static int mtk_dp_poweron(struct mtk_dp *mtk_dp)
+{
+	int ret = 0;
+
+	mutex_lock(&mtk_dp->dp_lock);
+
+	ret = clk_prepare_enable(mtk_dp->dp_tx_clk);
+	if (ret < 0) {
+		dev_err(mtk_dp->dev, "Fail to enable clock: %d\n", ret);
+		goto err;
+	}
+	ret = phy_init(mtk_dp->phy);
+	if (ret) {
+		dev_err(mtk_dp->dev, "Failed to initialize phy: %d\n", ret);
+		goto err_phy_init;
+	}
+	ret = mtk_dp_phy_configure(mtk_dp, MTK_DP_LINKRATE_RBR, 1);
+	if (ret) {
+		dev_err(mtk_dp->dev, "Failed to configure phy: %d\n", ret);
+		goto err_phy_config;
+	}
+
+	mtk_dp_init_port(mtk_dp);
+	mtk_dp_power_enable(mtk_dp);
+	mtk_dp_hwirq_enable(mtk_dp, true);
+
+err_phy_config:
+	phy_exit(mtk_dp->phy);
+err_phy_init:
+	clk_disable_unprepare(mtk_dp->dp_tx_clk);
+err:
+	mutex_unlock(&mtk_dp->dp_lock);
+	return ret;
+}
+
+static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	int ret;
+
+	ret = mtk_dp_poweron(mtk_dp);
+	if (ret)
+		return ret;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		dev_err(mtk_dp->dev, "Driver does not provide a connector!");
+		return -EINVAL;
+	}
+
+	if (mtk_dp->next_bridge) {
+		ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
+					&mtk_dp->bridge, flags);
+		if (ret) {
+			drm_warn(mtk_dp->drm_dev,
+				 "Failed to attach external bridge: %d\n", ret);
+			return ret;
+		}
+	}
+
+	mtk_dp->drm_dev = bridge->dev;
+
+	return 0;
+}
+
+static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+
+	mtk_dp->drm_dev = NULL;
+}
+
+static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_state)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+
+	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp->state = MTK_DP_STATE_IDLE;
+	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+
+	mtk_dp->enabled = false;
+	msleep(100);
+	mtk_dp_poweroff(mtk_dp);
+}
+
+static void mtk_dp_parse_drm_mode_timings(struct mtk_dp *mtk_dp,
+					  struct drm_display_mode *mode)
+{
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	drm_display_mode_to_videomode(mode, &timings->vm);
+	timings->frame_rate = mode->clock * 1000 / mode->htotal / mode->vtotal;
+	timings->htotal = mode->htotal;
+	timings->vtotal = mode->vtotal;
+}
+
+static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_state)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+
+	mtk_dp->conn = drm_atomic_get_new_connector_for_encoder(old_state->base.state,
+								bridge->encoder);
+	if (!mtk_dp->conn) {
+		drm_err(mtk_dp->drm_dev,
+			"Can't enable bridge as connector is missing\n");
+		return;
+	}
+
+	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld, MAX_ELD_BYTES);
+
+	conn_state =
+		drm_atomic_get_new_connector_state(old_state->base.state, mtk_dp->conn);
+	if (!conn_state) {
+		drm_err(mtk_dp->drm_dev,
+			"Can't enable bridge as connector state is missing\n");
+		return;
+	}
+
+	crtc = conn_state->crtc;
+	if (!crtc) {
+		drm_err(mtk_dp->drm_dev,
+			"Can't enable bridge as connector state doesn't have a crtc\n");
+		return;
+	}
+
+	crtc_state = drm_atomic_get_new_crtc_state(old_state->base.state, crtc);
+	if (!crtc_state) {
+		drm_err(mtk_dp->drm_dev,
+			"Can't enable bridge as crtc state is missing\n");
+		return;
+	}
+
+	mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state->adjusted_mode);
+	if (!mtk_dp_parse_capabilities(mtk_dp)) {
+		drm_err(mtk_dp->drm_dev,
+			"Can't enable bridge as nothing is plugged in\n");
+		return;
+	}
+
+	/* Training */
+	mtk_dp_train_handler(mtk_dp);
+	mtk_dp_state_handler(mtk_dp);
+	mtk_dp->enabled = true;
+}
+
+static enum drm_mode_status
+mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	u32 rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
+	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
+
+	if (rx_linkrate * mtk_dp->train_info.lane_count < mode->clock * bpp / 8)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock > 600000)
+		return MODE_CLOCK_HIGH;
+
+	//TODO: explain magic number: 62?
+	if ((mode->clock * 1000) / (mode->htotal * mode->vtotal) > 62)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static u32 *mtk_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+						     struct drm_bridge_state *bridge_state,
+						     struct drm_crtc_state *crtc_state,
+						     struct drm_connector_state *conn_state,
+						     unsigned int *num_output_fmts)
+{
+	u32 *output_fmts;
+
+	*num_output_fmts = 0;
+	output_fmts = kmalloc(sizeof(*output_fmts), GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+	*num_output_fmts = 1;
+	output_fmts[0] = MEDIA_BUS_FMT_FIXED;
+	return output_fmts;
+}
+
+static const u32 mt8195_input_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+};
+
+static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+						    struct drm_bridge_state *bridge_state,
+						    struct drm_crtc_state *crtc_state,
+						    struct drm_connector_state *conn_state,
+						    u32 output_fmt,
+						    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct drm_display_info *display_info =
+		&conn_state->connector->display_info;
+	u32 rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
+
+	*num_input_fmts = 0;
+
+	if (((rx_linkrate * mtk_dp->train_info.lane_count) <
+	     (mode->clock * 24 / 8)) &&
+	    ((rx_linkrate * mtk_dp->train_info.lane_count) >
+	     (mode->clock * 16 / 8)) &&
+	    (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+		input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+		if (!input_fmts)
+			return NULL;
+
+		*num_input_fmts = 1;
+		input_fmts[0] = MEDIA_BUS_FMT_YUYV8_1X16;
+	} else {
+		input_fmts = kmalloc(sizeof(mt8195_input_fmts), GFP_KERNEL);
+		if (!input_fmts)
+			return NULL;
+
+		*num_input_fmts = ARRAY_SIZE(mt8195_input_fmts);
+		memcpy(input_fmts, mt8195_input_fmts, sizeof(mt8195_input_fmts));
+	}
+
+	return input_fmts;
+}
+
+static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	unsigned int input_bus_format;
+
+	input_bus_format = bridge_state->input_bus_cfg.format;
+
+	dev_dbg(mtk_dp->dev, "input format 0x%04x, output format 0x%04x\n",
+		bridge_state->input_bus_cfg.format,
+		 bridge_state->output_bus_cfg.format);
+
+	mtk_dp->input_fmt = input_bus_format;
+	if (mtk_dp->input_fmt == MEDIA_BUS_FMT_YUYV8_1X16)
+		mtk_dp->info.format = MTK_DP_COLOR_FORMAT_YUV_422;
+	else
+		mtk_dp->info.format = MTK_DP_COLOR_FORMAT_RGB_444;
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
+	.atomic_check = mtk_dp_bridge_atomic_check,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_output_bus_fmts = mtk_dp_bridge_atomic_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = mtk_dp_bridge_atomic_get_input_bus_fmts,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.attach = mtk_dp_bridge_attach,
+	.detach = mtk_dp_bridge_detach,
+	.atomic_enable = mtk_dp_bridge_atomic_enable,
+	.atomic_disable = mtk_dp_bridge_atomic_disable,
+	.mode_valid = mtk_dp_bridge_mode_valid,
+	.get_edid = mtk_dp_get_edid,
+	.detect = mtk_dp_bdg_detect,
+};
+
+static int mtk_dp_probe(struct platform_device *pdev)
+{
+	struct mtk_dp *mtk_dp;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
+	if (!mtk_dp)
+		return -ENOMEM;
+
+	mtk_dp->dev = dev;
+
+	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(mtk_dp->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge), "Failed to get bridge\n");
+
+	ret = mtk_dp_dt_parse(mtk_dp, pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parsed dt\n");
+
+	drm_dp_aux_init(&mtk_dp->aux);
+	mtk_dp->aux.name = "aux_mtk_dp";
+	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+
+	mutex_init(&mtk_dp->dp_lock);
+	mutex_init(&mtk_dp->edid_lock);
+
+	platform_set_drvdata(pdev, mtk_dp);
+
+	mtk_dp_get_calibration_data(mtk_dp);
+
+	mtk_dp->phy = devm_phy_get(dev, "dp");
+
+	if (IS_ERR(mtk_dp->phy))
+		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy), "Failed to get phy\n");
+
+	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
+	mtk_dp->bridge.of_node = dev->of_node;
+	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+
+	mtk_dp->bridge.ops = DRM_BRIDGE_OP_EDID;
+	drm_bridge_add(&mtk_dp->bridge);
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	return 0;
+}
+
+static int mtk_dp_remove(struct platform_device *pdev)
+{
+	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
+
+	mtk_dp_video_mute(mtk_dp, true);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int mtk_dp_suspend(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	if (mtk_dp_plug_state(mtk_dp)) {
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
+		usleep_range(2000, 3000);
+	}
+
+	mtk_dp_power_disable(mtk_dp);
+	mtk_dp_hwirq_enable(mtk_dp, false);
+
+	pm_runtime_put_sync(dev);
+
+	return 0;
+}
+
+static int mtk_dp_resume(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev);
+
+	mtk_dp_init_port(mtk_dp);
+	mtk_dp_power_enable(mtk_dp);
+	mtk_dp_hwirq_enable(mtk_dp, true);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
+
+static const struct of_device_id mtk_dp_of_match[] = {
+	{ .compatible = "mediatek,mt8195-edp-tx", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
+
+struct platform_driver mtk_dp_driver = {
+	.probe = mtk_dp_probe,
+	.remove = mtk_dp_remove,
+	.driver = {
+		.name = "mediatek-drm-dp",
+		.of_match_table = mtk_dp_of_match,
+		.pm = &mtk_dp_pm_ops,
+	},
+};
+
+MODULE_AUTHOR("Jason-JH.Lin <jason-jh.lin@mediatek.com>");
+MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
+MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
new file mode 100644
index 000000000000..c446eef18169
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -0,0 +1,568 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre
+ */
+#ifndef _MTK_DP_REG_H_
+#define _MTK_DP_REG_H_
+
+#define MTK_DP_SIP_CONTROL_AARCH32 (BIT(0) | BIT(1) | BIT(5) | BIT(8) | BIT(10) | BIT(25) | BIT(31))
+#define MTK_DP_SIP_ATF_VIDEO_UNMUTE (BIT(5))
+#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE (BIT(0) | BIT(5))
+
+#define DP_PHY_GLB_BIAS_GEN_00 0
+#define RG_XTP_GLB_BIAS_INTR_CTRL GENMASK(20, 16)
+
+#define DP_PHY_GLB_DPAUX_TX (BIT(3))
+#define RG_CKM_PT0_CKTX_IMPSEL GENMASK(23, 20)
+
+#define DP_PHY_LANE_TX_0 (BIT(2) | BIT(8))
+#define RG_XTP_LN0_TX_IMPSEL_PMOS GENMASK(15, 12)
+#define RG_XTP_LN0_TX_IMPSEL_NMOS GENMASK(19, 16)
+
+#define DP_PHY_LANE_TX_1 (BIT(2) | BIT(9))
+#define RG_XTP_LN1_TX_IMPSEL_PMOS GENMASK(15, 12)
+#define RG_XTP_LN1_TX_IMPSEL_NMOS GENMASK(19, 16)
+
+#define DP_PHY_LANE_TX_2 (BIT(2) | BIT(8) | BIT(9))
+#define RG_XTP_LN2_TX_IMPSEL_PMOS GENMASK(15, 12)
+#define RG_XTP_LN2_TX_IMPSEL_NMOS GENMASK(19, 16)
+
+#define DP_PHY_LANE_TX_3 (BIT(2) | BIT(10))
+#define RG_XTP_LN3_TX_IMPSEL_PMOS GENMASK(15, 12)
+#define RG_XTP_LN3_TX_IMPSEL_NMOS GENMASK(19, 16)
+
+#define TOP_OFFSET (BIT(13))
+#define ENC0_OFFSET GENMASK(13, 12)
+#define ENC1_OFFSET (BIT(9) | BIT(12) | BIT(13))
+#define TRANS_OFFSET (BIT(10) | BIT(12) | BIT(13))
+#define AUX_OFFSET (BIT(9) | BIT(10) | BIT(12) | BIT(13))
+#define SEC_OFFSET (BIT(14))
+
+#define MTK_DP_HPD_DISCONNECT BIT(1)
+#define MTK_DP_HPD_CONNECT BIT(2)
+#define MTK_DP_HPD_INTERRUPT BIT(3)
+
+#define MTK_DP_0034 (BIT(2) | BIT(4) | BIT(5))
+#define DA_XTP_GLB_CKDET_EN_FORCE_VAL BIT(15)
+#define DA_XTP_GLB_CKDET_EN_FORCE_EN BIT(14)
+#define DA_CKM_INTCKTX_EN_FORCE_VAL BIT(13)
+#define DA_CKM_INTCKTX_EN_FORCE_EN BIT(12)
+#define DA_CKM_CKTX0_EN_FORCE_VAL BIT(11)
+#define DA_CKM_CKTX0_EN_FORCE_EN BIT(10)
+#define DA_CKM_XTAL_CK_FORCE_VAL BIT(9)
+#define DA_CKM_XTAL_CK_FORCE_EN BIT(8)
+#define DA_CKM_BIAS_LPF_EN_FORCE_VAL BIT(7)
+#define DA_CKM_BIAS_LPF_EN_FORCE_EN BIT(6)
+#define DA_CKM_BIAS_EN_FORCE_VAL BIT(5)
+#define DA_CKM_BIAS_EN_FORCE_EN BIT(4)
+#define DA_XTP_GLB_AVD10_ON_FORCE_VAL BIT(3)
+#define DA_XTP_GLB_AVD10_ON_FORCE BIT(2)
+#define DA_XTP_GLB_LDO_EN_FORCE_VAL BIT(1)
+#define DA_XTP_GLB_LDO_EN_FORCE_EN BIT(0)
+
+#define MTK_DP_1040 (BIT(6) | BIT(12))
+#define RG_DPAUX_RX_VALID_DEGLITCH_EN BIT(2)
+#define RG_XTP_GLB_CKDET_EN BIT(1)
+#define RG_DPAUX_RX_EN BIT(0)
+
+#define MTK_DP_ENC0_P0_3000 (ENC0_OFFSET + 0x00)
+#define LANE_NUM_DP_ENC0_P0_MASK GENMASK(1, 0)
+#define VIDEO_MUTE_SW_DP_ENC0_P0_MASK (BIT(2))
+#define VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT (BIT(1))
+#define VIDEO_MUTE_SEL_DP_ENC0_P0_MASK (BIT(3))
+#define VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT GENMASK(1, 0)
+#define ENHANCED_FRAME_EN_DP_ENC0_P0_MASK (BIT(4))
+#define ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT (BIT(2))
+
+#define MTK_DP_ENC0_P0_3004 (ENC0_OFFSET + 0x04)
+#define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK (BIT(8))
+#define VIDEO_M_CODE_SEL_DP_ENC0_P0_SHIFT (BIT(3))
+#define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK (BIT(9))
+#define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SHIFT (BIT(0) | BIT(3))
+
+#define MTK_DP_ENC0_P0_3008 (ENC0_OFFSET + 0x08)
+#define VIDEO_M_CODE_SW_0_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_300C (ENC0_OFFSET + 0x0C)
+#define VIDEO_M_CODE_SW_1_DP_ENC0_P0_MASK GENMASK(7, 0)
+
+#define MTK_DP_ENC0_P0_3010 (ENC0_OFFSET + 0x10)
+#define HTOTAL_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3014 (ENC0_OFFSET + 0x14)
+#define VTOTAL_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3018 (ENC0_OFFSET + 0x18)
+#define HSTART_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_301C (ENC0_OFFSET + 0x1C)
+#define VSTART_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3020 (ENC0_OFFSET + 0x20)
+#define HWIDTH_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3024 (ENC0_OFFSET + 0x24)
+#define VHEIGHT_SW_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3028 (ENC0_OFFSET + 0x28)
+#define HSW_SW_DP_ENC0_P0_MASK GENMASK(14, 0)
+#define HSW_SW_DP_ENC0_P0_SHIFT 0
+#define HSP_SW_DP_ENC0_P0_MASK (BIT(15))
+
+#define MTK_DP_ENC0_P0_302C (ENC0_OFFSET + 0x2C)
+#define VSW_SW_DP_ENC0_P0_MASK GENMASK(14, 0)
+#define VSW_SW_DP_ENC0_P0_SHIFT 0
+#define VSP_SW_DP_ENC0_P0_MASK (BIT(15))
+
+#define MTK_DP_ENC0_P0_3030 (ENC0_OFFSET + 0x30)
+#define HTOTAL_SEL_DP_ENC0_P0_SHIFT 0
+#define VTOTAL_SEL_DP_ENC0_P0_SHIFT (BIT(0))
+#define HSTART_SEL_DP_ENC0_P0_SHIFT (BIT(1))
+#define VSTART_SEL_DP_ENC0_P0_SHIFT GENMASK(1, 0)
+#define HWIDTH_SEL_DP_ENC0_P0_SHIFT (BIT(2))
+#define VHEIGHT_SEL_DP_ENC0_P0_SHIFT (BIT(0) | BIT(2))
+#define HSP_SEL_DP_ENC0_P0_SHIFT GENMASK(2, 1)
+#define HSW_SEL_DP_ENC0_P0_SHIFT GENMASK(2, 0)
+#define VSP_SEL_DP_ENC0_P0_SHIFT (BIT(3))
+#define VSW_SEL_DP_ENC0_P0_SHIFT (BIT(0) | BIT(3))
+#define VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK (BIT(11))
+#define VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT (BIT(0) | BIT(1) | BIT(3))
+#define VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK (BIT(12))
+#define VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT GENMASK(3, 2)
+
+#define MTK_DP_ENC0_P0_3034 (ENC0_OFFSET + 0x34)
+
+#define MTK_DP_ENC0_P0_3038 (ENC0_OFFSET + 0x38)
+#define VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK (BIT(11))
+#define VIDEO_SOURCE_SEL_DP_ENC0_P0_SHIFT (BIT(0) | BIT(1) | BIT(3))
+
+#define MTK_DP_ENC0_P0_303C (ENC0_OFFSET + 0x3C)
+#define SRAM_START_READ_THRD_DP_ENC0_P0_MASK GENMASK(5, 0)
+#define SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT 0
+#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK GENMASK(10, 8)
+#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT (BIT(3))
+#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT                                     \
+	(0 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT                                     \
+	(1 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT                                     \
+	(2 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT                                      \
+	(3 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT                                      \
+	(4 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)
+#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK GENMASK(14, 12)
+#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT GENMASK(3, 2)
+#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB                                     \
+	(0 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422                                \
+	(1 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+#define PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420                                \
+	(2 << PIXEL_ENCODE_FORMAT_DP_ENC0_P0_SHIFT)
+#define VIDEO_MN_GEN_EN_DP_ENC0_P0_MASK (BIT(15))
+#define VIDEO_MN_GEN_EN_DP_ENC0_P0_SHIFT GENMASK(3, 0)
+
+#define MTK_DP_ENC0_P0_3040 (ENC0_OFFSET + 0x40)
+#define SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK GENMASK(11, 0)
+#define SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT 0
+
+#define MTK_DP_ENC0_P0_3044 (ENC0_OFFSET + 0x44)
+#define VIDEO_N_CODE_0_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3048 (ENC0_OFFSET + 0x48)
+#define VIDEO_N_CODE_1_DP_ENC0_P0_MASK GENMASK(7, 0)
+
+#define MTK_DP_ENC0_P0_304C (ENC0_OFFSET + 0x4C)
+#define VBID_VIDEO_MUTE_DP_ENC0_P0_MASK (BIT(2))
+#define SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK (BIT(8))
+
+#define MTK_DP_ENC0_P0_3050 (ENC0_OFFSET + 0x50)
+#define VIDEO_N_CODE_MN_GEN_0_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3054 (ENC0_OFFSET + 0x54)
+#define VIDEO_N_CODE_MN_GEN_1_DP_ENC0_P0_MASK GENMASK(7, 0)
+
+#define MTK_DP_ENC0_P0_3064 (ENC0_OFFSET + 0x64)
+#define HDE_NUM_LAST_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3088 (ENC0_OFFSET + 0x88)
+#define AU_EN_DP_ENC0_P0_MASK (BIT(6))
+#define AU_EN_DP_ENC0_P0_SHIFT GENMASK(2, 1)
+#define AUDIO_8CH_EN_DP_ENC0_P0_MASK (BIT(7))
+#define AUDIO_8CH_SEL_DP_ENC0_P0_MASK (BIT(8))
+#define AUDIO_2CH_EN_DP_ENC0_P0_MASK (BIT(14))
+#define AUDIO_2CH_SEL_DP_ENC0_P0_MASK (BIT(15))
+
+#define MTK_DP_ENC0_P0_308C (ENC0_OFFSET + 0x8C)
+#define CH_STATUS_0_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3090 (ENC0_OFFSET + 0x90)
+#define CH_STATUS_1_DP_ENC0_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_ENC0_P0_3094 (ENC0_OFFSET + 0x94)
+#define CH_STATUS_2_DP_ENC0_P0_MASK GENMASK(7, 0)
+
+#define MTK_DP_ENC0_P0_30A0 (ENC0_OFFSET + 0xA0)
+
+#define MTK_DP_ENC0_P0_30A4 (ENC0_OFFSET + 0xA4)
+#define AU_TS_CFG_DP_ENC0_P0_MASK GENMASK(7, 0)
+
+#define MTK_DP_ENC0_P0_30A8 (ENC0_OFFSET + 0xA8)
+
+#define MTK_DP_ENC0_P0_30AC (ENC0_OFFSET + 0xAC)
+
+#define MTK_DP_ENC0_P0_30B0 (ENC0_OFFSET + 0xB0)
+
+#define MTK_DP_ENC0_P0_30B4 (ENC0_OFFSET + 0xB4)
+#define ISRC_CFG_DP_ENC0_P0_MASK GENMASK(15, 8)
+#define ISRC_CFG_DP_ENC0_P0_SHIFT (BIT(3))
+
+#define MTK_DP_ENC0_P0_30B8 (ENC0_OFFSET + 0xB8)
+
+#define MTK_DP_ENC0_P0_30BC (ENC0_OFFSET + 0xBC)
+#define ISRC_CONT_DP_ENC0_P0_MASK (BIT(0))
+#define ISRC_CONT_DP_ENC0_P0_SHIFT 0
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK GENMASK(10, 8)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT (BIT(3))
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2                             \
+	(1 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4                             \
+	(2 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8                             \
+	(3 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2                             \
+	(5 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4                             \
+	(6 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8                             \
+	(7 << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT)
+
+#define MTK_DP_ENC0_P0_30D8 (ENC0_OFFSET + 0xD8)
+
+#define MTK_DP_ENC0_P0_312C (ENC0_OFFSET + 0x12C)
+#define ASP_HB2_DP_ENC0_P0_MASK GENMASK(7, 0)
+#define ASP_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
+#define ASP_HB3_DP_ENC0_P0_SHIFT (BIT(3))
+
+#define MTK_DP_ENC0_P0_3130 (ENC0_OFFSET + 0x130)
+
+#define MTK_DP_ENC0_P0_3138 (ENC0_OFFSET + 0x138)
+
+#define MTK_DP_ENC0_P0_3154 (ENC0_OFFSET + 0x154)
+#define PGEN_HTOTAL_DP_ENC0_P0_MASK GENMASK(13, 0)
+
+#define MTK_DP_ENC0_P0_3158 (ENC0_OFFSET + 0x158)
+#define PGEN_HSYNC_RISING_DP_ENC0_P0_MASK GENMASK(13, 0)
+
+#define MTK_DP_ENC0_P0_315C (ENC0_OFFSET + 0x15C)
+#define PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK GENMASK(13, 0)
+
+#define MTK_DP_ENC0_P0_3160 (ENC0_OFFSET + 0x160)
+#define PGEN_HFDE_START_DP_ENC0_P0_MASK GENMASK(13, 0)
+
+#define MTK_DP_ENC0_P0_3164 (ENC0_OFFSET + 0x164)
+#define PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK GENMASK(13, 0)
+
+#define MTK_DP_ENC0_P0_3168 (ENC0_OFFSET + 0x168)
+#define PGEN_VTOTAL_DP_ENC0_P0_MASK GENMASK(12, 0)
+
+#define MTK_DP_ENC0_P0_316C (ENC0_OFFSET + 0x16C)
+#define PGEN_VSYNC_RISING_DP_ENC0_P0_MASK GENMASK(12, 0)
+
+#define MTK_DP_ENC0_P0_3170 (ENC0_OFFSET + 0x170)
+#define PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK GENMASK(12, 0)
+
+#define MTK_DP_ENC0_P0_3174 (ENC0_OFFSET + 0x174)
+#define PGEN_VFDE_START_DP_ENC0_P0_MASK GENMASK(12, 0)
+
+#define MTK_DP_ENC0_P0_3178 (ENC0_OFFSET + 0x178)
+#define PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK GENMASK(12, 0)
+
+#define MTK_DP_ENC0_P0_31B0 (ENC0_OFFSET + 0x1B0)
+#define PGEN_PATTERN_SEL_SHIFT (BIT(2))
+#define PGEN_PATTERN_SEL_MASK GENMASK(6, 4)
+
+#define MTK_DP_ENC0_P0_31C8 (ENC0_OFFSET + 0x1C8)
+#define VSC_EXT_VESA_HB0_DP_ENC0_P0_MASK GENMASK(7, 0)
+#define VSC_EXT_VESA_HB1_DP_ENC0_P0_MASK GENMASK(15, 8)
+#define VSC_EXT_VESA_HB1_DP_ENC0_P0_SHIFT (BIT(3))
+
+#define MTK_DP_ENC0_P0_31CC (ENC0_OFFSET + 0x1CC)
+#define VSC_EXT_VESA_HB2_DP_ENC0_P0_MASK GENMASK(7, 0)
+#define VSC_EXT_VESA_HB2_DP_ENC0_P0_SHIFT 0
+#define VSC_EXT_VESA_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
+
+#define MTK_DP_ENC0_P0_31D0 (ENC0_OFFSET + 0x1D0)
+#define VSC_EXT_CEA_HB0_DP_ENC0_P0_MASK GENMASK(7, 0)
+#define VSC_EXT_CEA_HB1_DP_ENC0_P0_MASK GENMASK(15, 8)
+#define VSC_EXT_CEA_HB1_DP_ENC0_P0_SHIFT (BIT(3))
+
+#define MTK_DP_ENC0_P0_31D4 (ENC0_OFFSET + 0x1D4)
+#define VSC_EXT_CEA_HB2_DP_ENC0_P0_MASK GENMASK(7, 0)
+#define VSC_EXT_CEA_HB2_DP_ENC0_P0_SHIFT 0
+#define VSC_EXT_CEA_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
+
+#define MTK_DP_ENC0_P0_31D8 (ENC0_OFFSET + 0x1D8)
+#define VSC_EXT_VESA_NUM_DP_ENC0_P0_MASK GENMASK(5, 0)
+#define VSC_EXT_VESA_NUM_DP_ENC0_P0_SHIFT 0
+#define VSC_EXT_CEA_NUM_DP_ENC0_P0_MASK GENMASK(13, 8)
+#define VSC_EXT_CEA_NUM_DP_ENC0_P0_SHIFT (BIT(3))
+
+#define MTK_DP_ENC0_P0_31DC (ENC0_OFFSET + 0x1DC)
+#define HDR0_CFG_DP_ENC0_P0_MASK GENMASK(7, 0)
+#define HDR0_CFG_DP_ENC0_P0_SHIFT 0
+
+#define MTK_DP_ENC0_P0_31E8 (ENC0_OFFSET + 0x1E8)
+
+#define MTK_DP_ENC0_P0_31EC (ENC0_OFFSET + 0x1EC)
+#define AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK (BIT(4))
+#define AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT (BIT(2))
+#define ISRC1_HB3_DP_ENC0_P0_MASK GENMASK(15, 8)
+#define ISRC1_HB3_DP_ENC0_P0_SHIFT (BIT(3))
+
+#define MTK_DP_ENC1_P0_3200 (ENC1_OFFSET + 0x00)
+
+#define MTK_DP_ENC1_P0_3280 (ENC1_OFFSET + 0x80)
+#define SDP_PACKET_TYPE_DP_ENC1_P0_MASK GENMASK(4, 0)
+#define SDP_PACKET_W_DP_ENC1_P0 (BIT(5))
+#define SDP_PACKET_W_DP_ENC1_P0_MASK (BIT(5))
+#define SDP_PACKET_W_DP_ENC1_P0_SHIFT (BIT(0) | BIT(2))
+
+#define MTK_DP_ENC1_P0_328C (ENC1_OFFSET + 0x8C)
+
+#define MTK_DP_ENC1_P0_3290 (ENC1_OFFSET + 0x90)
+
+#define MTK_DP_ENC1_P0_32A0 (ENC1_OFFSET + 0xA0)
+
+#define MTK_DP_ENC1_P0_32A4 (ENC1_OFFSET + 0xA4)
+
+#define MTK_DP_ENC1_P0_3300 (ENC1_OFFSET + 0x100)
+#define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK GENMASK(9, 8)
+#define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_SHIFT (BIT(3))
+
+#define MTK_DP_ENC1_P0_3304 (ENC1_OFFSET + 0x104)
+#define AU_PRTY_REGEN_DP_ENC1_P0_MASK (BIT(8))
+#define AU_CH_STS_REGEN_DP_ENC1_P0_MASK (BIT(9))
+#define AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK (BIT(12))
+
+#define MTK_DP_ENC1_P0_3324 (ENC1_OFFSET + 0x124)
+#define AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK GENMASK(9, 8)
+#define AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT (BIT(3))
+#define AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX                                       \
+	(0 << AUDIO_SOURCE_MUX_DP_ENC1_P0_SHIFT)
+
+#define MTK_DP_ENC1_P0_3364 (ENC1_OFFSET + 0x164)
+#define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK GENMASK(11, 0)
+#define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT 0
+#define FIFO_READ_START_POINT_DP_ENC1_P0_MASK GENMASK(15, 12)
+#define FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT GENMASK(3, 2)
+
+#define MTK_DP_ENC1_P0_3368 (ENC1_OFFSET + 0x168)
+#define VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT 0
+#define VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT (BIT(2))
+#define SDP_DP13_EN_DP_ENC1_P0_SHIFT (BIT(3))
+#define BS2BS_MODE_DP_ENC1_P0_MASK GENMASK(13, 12)
+#define BS2BS_MODE_DP_ENC1_P0_SHIFT GENMASK(3, 2)
+
+#define MTK_DP_ENC1_P0_33F4 (ENC1_OFFSET + 0x1F4)
+
+#define MTK_DP_TRANS_P0_3400 (TRANS_OFFSET + 0)
+#define PATTERN1_EN_DP_TRANS_P0_MASK (BIT(12))
+#define PATTERN1_EN_DP_TRANS_P0_SHIFT GENMASK(3, 2)
+#define PATTERN2_EN_DP_TRANS_P0_MASK (BIT(13))
+#define PATTERN3_EN_DP_TRANS_P0_MASK (BIT(14))
+#define PATTERN4_EN_DP_TRANS_P0_MASK (BIT(15))
+
+#define MTK_DP_TRANS_P0_3404 (TRANS_OFFSET + 0x4)
+#define DP_SCR_EN_DP_TRANS_P0_MASK (BIT(0))
+
+#define MTK_DP_TRANS_P0_340C (TRANS_OFFSET + 0xC)
+#define DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK (BIT(13))
+#define DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_SHIFT (BIT(0) | BIT(2) | BIT(3))
+
+#define MTK_DP_TRANS_P0_3410 (TRANS_OFFSET + 0x10)
+#define HPD_DEB_THD_DP_TRANS_P0_MASK GENMASK(3, 0)
+#define HPD_DEB_THD_DP_TRANS_P0_SHIFT 0
+#define HPD_INT_THD_DP_TRANS_P0_MASK GENMASK(7, 4)
+#define HPD_INT_THD_DP_TRANS_P0_SHIFT (BIT(2))
+#define HPD_INT_THD_DP_TRANS_P0_LOWER_500US (2 << HPD_INT_THD_DP_TRANS_P0_SHIFT)
+#define HPD_INT_THD_DP_TRANS_P0_UPPER_1100US                                   \
+	(2 << (HPD_INT_THD_DP_TRANS_P0_SHIFT + 2))
+#define HPD_DISC_THD_DP_TRANS_P0_MASK GENMASK(11, 8)
+#define HPD_DISC_THD_DP_TRANS_P0_SHIFT (BIT(3))
+#define HPD_CONN_THD_DP_TRANS_P0_MASK GENMASK(15, 12)
+#define HPD_CONN_THD_DP_TRANS_P0_SHIFT GENMASK(3, 2)
+
+#define MTK_DP_TRANS_P0_3414 (TRANS_OFFSET + 0x14)
+#define HPD_DB_DP_TRANS_P0_MASK (BIT(2))
+
+#define MTK_DP_TRANS_P0_3418 (TRANS_OFFSET + 0x18)
+#define IRQ_CLR_DP_TRANS_P0_MASK GENMASK(3, 0)
+#define IRQ_MASK_DP_TRANS_P0_MASK GENMASK(7, 4)
+#define IRQ_MASK_DP_TRANS_P0_SHIFT (BIT(2))
+#define IRQ_MASK_DP_TRANS_P0_DISC_IRQ (BIT(1) << IRQ_MASK_DP_TRANS_P0_SHIFT)
+#define IRQ_MASK_DP_TRANS_P0_CONN_IRQ (BIT(2) << IRQ_MASK_DP_TRANS_P0_SHIFT)
+#define IRQ_MASK_DP_TRANS_P0_INT_IRQ (BIT(3) << IRQ_MASK_DP_TRANS_P0_SHIFT)
+#define IRQ_STATUS_DP_TRANS_P0_MASK GENMASK(15, 12)
+#define IRQ_STATUS_DP_TRANS_P0_SHIFT GENMASK(3, 2)
+
+#define MTK_DP_TRANS_P0_342C (TRANS_OFFSET + 0x2C)
+#define XTAL_FREQ_DP_TRANS_P0_DEFAULT (BIT(0) | BIT(3) | BIT(5) | BIT(6))
+#define XTAL_FREQ_DP_TRANS_P0_MASK GENMASK(7, 0)
+
+#define MTK_DP_TRANS_P0_3430 (TRANS_OFFSET + 0x30)
+#define HPD_INT_THD_ECO_DP_TRANS_P0_MASK GENMASK(1, 0)
+#define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT BIT(1)
+
+#define MTK_DP_TRANS_P0_34A4 (TRANS_OFFSET + 0xA4)
+#define LANE_NUM_DP_TRANS_P0_MASK GENMASK(3, 2)
+#define LANE_NUM_DP_TRANS_P0_SHIFT (BIT(1))
+
+#define MTK_DP_TRANS_P0_3540 (TRANS_OFFSET + 0x140)
+#define FEC_EN_DP_TRANS_P0_MASK (BIT(0))
+#define FEC_EN_DP_TRANS_P0_SHIFT 0
+#define FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK (BIT(3))
+#define FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT GENMASK(1, 0)
+
+#define MTK_DP_TRANS_P0_3580 (TRANS_OFFSET + 0x180)
+#define POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK (BIT(8))
+#define POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK (BIT(9))
+#define POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK (BIT(10))
+#define POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK (BIT(11))
+
+#define MTK_DP_TRANS_P0_35C4 (TRANS_OFFSET + 0x1C4)
+#define SW_IRQ_MASK_DP_TRANS_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_TRANS_P0_35C8 (TRANS_OFFSET + 0x1C8)
+#define SW_IRQ_CLR_DP_TRANS_P0_MASK GENMASK(15, 0)
+
+#define SW_IRQ_STATUS_DP_TRANS_P0_MASK GENMASK(15, 0)
+#define SW_IRQ_STATUS_DP_TRANS_P0_SHIFT 0
+
+#define MTK_DP_TRANS_P0_35D0 (TRANS_OFFSET + 0x1D0)
+#define SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_TRANS_P0_35F0 (TRANS_OFFSET + 0x1F0)
+
+#define MTK_DP_AUX_P0_360C (AUX_OFFSET + 0xC)
+#define AUX_TIMEOUT_THR_AUX_TX_P0_MASK GENMASK(12, 0)
+
+#define MTK_DP_AUX_P0_3614 (AUX_OFFSET + 0x14)
+#define AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK GENMASK(6, 0)
+#define AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT 0
+
+#define MTK_DP_AUX_P0_3618 (AUX_OFFSET + 0x18)
+#define AUX_RX_FIFO_FULL_AUX_TX_P0_MASK (BIT(9))
+#define AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK GENMASK(3, 0)
+
+#define MTK_DP_AUX_P0_3620 (AUX_OFFSET + 0x20)
+#define AUX_RD_MODE_AUX_TX_P0_MASK (BIT(9))
+#define AUX_RX_FIFO_READ_PULSE_TX_P0_MASK (BIT(8))
+#define AUX_RX_FIFO_R_PULSE_TX_P0_SHIFT (BIT(3))
+#define AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK GENMASK(7, 0)
+#define AUX_RX_FIFO_READ_DATA_AUX_TX_P0_SHIFT 0
+
+#define MTK_DP_AUX_P0_3624 (AUX_OFFSET + 0x24)
+#define AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK GENMASK(3, 0)
+
+#define MTK_DP_AUX_P0_3628 (AUX_OFFSET + 0x28)
+#define AUX_RX_PHY_STATE_AUX_TX_P0_MASK GENMASK(9, 0)
+#define AUX_RX_PHY_STATE_AUX_TX_P0_SHIFT 0
+#define AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE                                     \
+	(BIT(0) << AUX_RX_PHY_STATE_AUX_TX_P0_SHIFT)
+
+#define MTK_DP_AUX_P0_362C (AUX_OFFSET + 0x2C)
+#define AUX_NO_LENGTH_AUX_TX_P0_MASK (BIT(0))
+#define AUX_NO_LENGTH_AUX_TX_P0_SHIFT 0
+#define AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK (BIT(1))
+#define AUX_RESERVED_RW_0_AUX_TX_P0_MASK GENMASK(15, 2)
+
+#define MTK_DP_AUX_P0_3630 (AUX_OFFSET + 0x30)
+#define AUX_TX_REQUEST_READY_AUX_TX_P0_MASK (BIT(3))
+#define AUX_TX_REQUEST_READY_AUX_TX_P0_SHIFT GENMASK(1, 0)
+
+#define MTK_DP_AUX_P0_3634 (AUX_OFFSET + 0x34)
+#define AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK GENMASK(15, 8)
+#define AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT (BIT(3))
+
+#define MTK_DP_AUX_P0_3640 (AUX_OFFSET + 0x40)
+#define AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK (BIT(6))
+#define AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT GENMASK(2, 1)
+#define AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT (BIT(0) | BIT(2))
+#define AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT (BIT(2))
+#define AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_SHIFT GENMASK(1, 0)
+#define AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT (BIT(1))
+#define AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT (BIT(0))
+#define AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK (BIT(0))
+#define AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT 0
+
+#define MTK_DP_AUX_P0_3644 (AUX_OFFSET + 0x44)
+#define MCU_REQUEST_COMMAND_AUX_TX_P0_MASK GENMASK(3, 0)
+
+#define MTK_DP_AUX_P0_3648 (AUX_OFFSET + 0x48)
+#define MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK GENMASK(15, 0)
+
+#define MTK_DP_AUX_P0_364C (AUX_OFFSET + 0x4C)
+#define MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK GENMASK(3, 0)
+
+#define MTK_DP_AUX_P0_3650 (AUX_OFFSET + 0x50)
+#define MCU_REQ_DATA_NUM_AUX_TX_P0_MASK GENMASK(15, 12)
+#define MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT GENMASK(3, 2)
+#define PHY_FIFO_RST_AUX_TX_P0_MASK (BIT(9))
+#define MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_MASK (BIT(8))
+#define MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_SHIFT (BIT(3))
+
+#define MTK_DP_AUX_P0_3658 (AUX_OFFSET + 0x58)
+#define AUX_TX_OV_EN_AUX_TX_P0_MASK (BIT(0))
+
+#define MTK_DP_AUX_P0_3690 (AUX_OFFSET + 0x90)
+#define RX_REPLY_COMPLETE_MODE_AUX_TX_P0_MASK (BIT(8))
+#define RX_REPLY_COMPLETE_MODE_AUX_TX_P0_SHIFT (BIT(3))
+
+#define MTK_DP_AUX_P0_3704 (AUX_OFFSET + 0x104)
+#define AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK (BIT(1))
+#define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MASK (BIT(2))
+#define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT (BIT(1))
+
+#define MTK_DP_AUX_P0_3708 (AUX_OFFSET + 0x108)
+
+#define MTK_DP_AUX_P0_37C8 (AUX_OFFSET + 0x1C8)
+#define MTK_ATOP_EN_AUX_TX_P0_MASK (BIT(0))
+#define MTK_ATOP_EN_AUX_TX_P0_SHIFT 0
+
+#define MTK_DP_TOP_PWR_STATE (TOP_OFFSET + 0x0)
+#define DP_PWR_STATE_MASK GENMASK(1, 0)
+#define DP_PWR_STATE_BANDGAP (BIT(0))
+#define DP_PWR_STATE_BANDGAP_TPLL (BIT(1))
+#define DP_PWR_STATE_BANDGAP_TPLL_LANE GENMASK(1, 0)
+
+#define MTK_DP_TOP_SWING_EMP (TOP_OFFSET + 0x4)
+#define DP_TX0_VOLT_SWING_MASK GENMASK(1, 0)
+#define DP_TX0_VOLT_SWING_SHIFT 0
+#define DP_TX0_PRE_EMPH_MASK GENMASK(3, 2)
+#define DP_TX0_PRE_EMPH_SHIFT (BIT(1))
+#define DP_TX1_VOLT_SWING_MASK GENMASK(9, 8)
+#define DP_TX1_VOLT_SWING_SHIFT (BIT(3))
+#define DP_TX1_PRE_EMPH_MASK GENMASK(11, 10)
+#define DP_TX2_VOLT_SWING_MASK GENMASK(17, 16)
+#define DP_TX2_PRE_EMPH_MASK GENMASK(19, 18)
+#define DP_TX3_VOLT_SWING_MASK GENMASK(25, 24)
+#define DP_TX3_PRE_EMPH_MASK GENMASK(27, 26)
+
+#define MTK_DP_TOP_RESET_AND_PROBE (TOP_OFFSET + 0x20)
+#define SW_RST_B_SHIFT 0
+#define SW_RST_B_PHYD (BIT(4) << SW_RST_B_SHIFT)
+
+#define MTK_DP_TOP_IRQ_STATUS (TOP_OFFSET + 0x28)
+#define RGS_IRQ_STATUS_SHIFT 0
+#define RGS_IRQ_STATUS_TRANSMITTER (BIT(1) << RGS_IRQ_STATUS_SHIFT)
+
+#define MTK_DP_TOP_IRQ_MASK (TOP_OFFSET + 0x2C)
+#define IRQ_MASK_AUX_TOP_IRQ BIT(2)
+
+#define MTK_DP_TOP_MEM_PD (TOP_OFFSET + 0x38)
+#define MEM_ISO_EN_SHIFT 0
+#define FUSE_SEL_SHIFT (BIT(1))
+
+#endif /*_MTK_DP_REG_H_*/
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c8a233f609f0..eab64d4c241b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -709,6 +709,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
+	&mtk_dp_driver,
 	&mtk_drm_platform_driver,
 	&mtk_dsi_driver,
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 3e7d1e6fbe01..8926416f4419 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -53,6 +53,7 @@ extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
+extern struct platform_driver mtk_dp_driver;
 extern struct platform_driver mtk_dsi_driver;
 
 #endif /* MTK_DRM_DRV_H */
-- 
2.34.1

