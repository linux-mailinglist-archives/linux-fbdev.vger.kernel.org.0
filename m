Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1CD5A8CDF
	for <lists+linux-fbdev@lfdr.de>; Thu,  1 Sep 2022 06:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbiIAEmI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 1 Sep 2022 00:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbiIAEmE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 1 Sep 2022 00:42:04 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF300E3407;
        Wed, 31 Aug 2022 21:42:00 -0700 (PDT)
X-UUID: f321b2dec3b34e16974cc00da7162e9c-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wUiZHJMPP2vSpfxe/mbTbSnmztzLDmwWnQP1odHMthU=;
        b=d/hf7lGrWr+gX2xFedMVmE2g+lmPn8ScY4yEGoiLJg+xmPOMc1FqOp6n4Y5ToVdR4vq8zTlqif8zWm4K/PgKXEzsj1zfwegl2SZBTCbN7LVdkpawTO7aWiGhJomos54gT7qStM6pm+gn9u61p83Zko9PvJ3F9uEPhopwXpE3i4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c9542f8f-370d-46b7-aeb9-e34d374ebcb0,OB:0,L
        OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
        e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:cb18c520-1c20-48a5-82a0-25f9c331906d,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
        nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f321b2dec3b34e16974cc00da7162e9c-20220901
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1235069391; Thu, 01 Sep 2022 12:41:54 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 12:41:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 12:41:53 +0800
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
Subject: [PATCH v17 10/10] drm/mediatek: dp: Audio support for MT8195
Date:   Thu, 1 Sep 2022 12:41:49 +0800
Message-ID: <20220901044149.16782-11-rex-bc.chen@mediatek.com>
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

From: Guillaume Ranquet <granquet@baylibre.com>

This patch adds audio support to the DP driver for MT8195 with up to 8
channels.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 482 +++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  51 +++
 2 files changed, 532 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index dd34dae417e5..dfa942ca62da 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -29,6 +29,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
+#include <sound/hdmi-codec.h>
 #include <video/videomode.h>
 
 #include "mtk_dp_reg.h"
@@ -47,6 +48,8 @@
 #define MTK_DP_TBC_BUF_READ_START_ADDR 0x8
 #define MTK_DP_TRAIN_VOLTAGE_LEVEL_RETRY 5
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 10
+#define MTK_DP_VERSION 0x11
+#define MTK_DP_SDP_AUI 0x4
 
 enum {
 	MTK_DP_CAL_GLB_BIAS_TRIM = 0,
@@ -71,9 +74,18 @@ struct mtk_dp_train_info {
 	unsigned int channel_eq_pattern;
 };
 
+struct mtk_dp_audio_cfg {
+	bool detect_monitor;
+	int sad_count;
+	int sample_rate;
+	int word_length_bits;
+	int channels;
+};
+
 struct mtk_dp_info {
 	enum dp_pixelformat format;
 	struct videomode vm;
+	struct mtk_dp_audio_cfg audio_cur_cfg;
 };
 
 struct mtk_dp_efuse_fmt {
@@ -111,12 +123,22 @@ struct mtk_dp {
 	struct phy *phy;
 	struct regmap *regs;
 	struct timer_list debounce_timer;
+
+	/* For audio */
+	bool audio_enable;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct platform_device *audio_pdev;
+
+	struct device *codec_dev;
+	/* protect the plugged_cb as it's used in both bridge ops and audio */
+	struct mutex update_plugged_status_lock;
 };
 
 struct mtk_dp_data {
 	int bridge_type;
 	unsigned int smc_cmd;
 	const struct mtk_dp_efuse_fmt *efuse_fmt;
+	bool audio_supported;
 };
 
 static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -512,6 +534,169 @@ static void mtk_dp_pg_enable(struct mtk_dp *mtk_dp, bool enable)
 			   PGEN_PATTERN_SEL_VAL << 4, PGEN_PATTERN_SEL_MASK);
 }
 
+static void mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
+					struct mtk_dp_audio_cfg *cfg)
+{
+	u32 channel_enable_bits;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3324,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK);
+
+	/* audio channel count change reset */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4,
+			   DP_ENC_DUMMY_RW_1, DP_ENC_DUMMY_RW_1);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK |
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK |
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK |
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK |
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK);
+
+	switch (cfg->channels) {
+	case 2:
+		channel_enable_bits = AUDIO_2CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_2CH_EN_DP_ENC0_P0_MASK;
+		break;
+	case 8:
+	default:
+		channel_enable_bits = AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_8CH_EN_DP_ENC0_P0_MASK;
+		break;
+	}
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+			   channel_enable_bits | AU_EN_DP_ENC0_P0,
+			   AUDIO_2CH_SEL_DP_ENC0_P0_MASK |
+			   AUDIO_2CH_EN_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_EN_DP_ENC0_P0_MASK |
+			   AU_EN_DP_ENC0_P0);
+
+	/* audio channel count change reset */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, 0, DP_ENC_DUMMY_RW_1);
+
+	/* enable audio reset */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4,
+			   DP_ENC_DUMMY_RW_1_AUDIO_RST_EN,
+			   DP_ENC_DUMMY_RW_1_AUDIO_RST_EN);
+}
+
+static void mtk_dp_audio_channel_status_set(struct mtk_dp *mtk_dp,
+					    struct mtk_dp_audio_cfg *cfg)
+{
+	struct snd_aes_iec958 iec = { 0 };
+
+	switch (cfg->sample_rate) {
+	case 32000:
+		iec.status[3] = IEC958_AES3_CON_FS_32000;
+		break;
+	case 44100:
+		iec.status[3] = IEC958_AES3_CON_FS_44100;
+		break;
+	case 48000:
+		iec.status[3] = IEC958_AES3_CON_FS_48000;
+		break;
+	case 88200:
+		iec.status[3] = IEC958_AES3_CON_FS_88200;
+		break;
+	case 96000:
+		iec.status[3] = IEC958_AES3_CON_FS_96000;
+		break;
+	case 192000:
+		iec.status[3] = IEC958_AES3_CON_FS_192000;
+		break;
+	default:
+		iec.status[3] = IEC958_AES3_CON_FS_NOTID;
+		break;
+	}
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_20_16;
+		break;
+	case 20:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_20_16 |
+				IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	case 24:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_24_20 |
+				IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	default:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_NOTID;
+	}
+
+	/* IEC 60958 consumer channel status bits */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_308C,
+			   0, CH_STATUS_0_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3090,
+			   iec.status[3] << 8, CH_STATUS_1_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3094,
+			   iec.status[4], CH_STATUS_2_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
+					      int channels)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_312C,
+			   (min(8, channels) - 1) << 8,
+			   ASP_HB2_DP_ENC0_P0_MASK | ASP_HB3_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_sdp_trigger_aui(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+			   MTK_DP_SDP_AUI, SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+			   SDP_PACKET_W_DP_ENC1_P0, SDP_PACKET_W_DP_ENC1_P0);
+}
+
+static void mtk_dp_sdp_set_data(struct mtk_dp *mtk_dp, u8 *data_bytes)
+{
+	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_ENC1_P0_3200,
+				data_bytes, 0x10);
+}
+
+static void mtk_dp_sdp_set_header_aui(struct mtk_dp *mtk_dp,
+				      struct dp_sdp_header *header)
+{
+	u32 db_addr = MTK_DP_ENC0_P0_30D8 + (MTK_DP_SDP_AUI - 1) * 8;
+
+	mtk_dp_bulk_16bit_write(mtk_dp, db_addr, (u8 *)header, 4);
+}
+
+static void mtk_dp_disable_sdp_aui(struct mtk_dp *mtk_dp)
+{
+	/* Disable periodic send */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A8 & 0xfffc, 0,
+			   0xff << ((MTK_DP_ENC0_P0_30A8 & 3) * 8));
+}
+
+static void mtk_dp_setup_sdp_aui(struct mtk_dp *mtk_dp,
+				 struct dp_sdp *sdp)
+{
+	u32 shift;
+
+	mtk_dp_sdp_set_data(mtk_dp, sdp->db);
+	mtk_dp_sdp_set_header_aui(mtk_dp, &sdp->sdp_header);
+	mtk_dp_disable_sdp_aui(mtk_dp);
+
+	shift = (MTK_DP_ENC0_P0_30A8 & 3) * 8;
+
+	mtk_dp_sdp_trigger_aui(mtk_dp);
+	/* Enable periodic sending */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A8 & 0xfffc,
+			   0x05 << shift, 0xff << shift);
+}
+
 static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640, DP_AUX_P0_3640_VAL);
@@ -1041,6 +1226,32 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 		mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
 }
 
+static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
+{
+	u32 val[3];
+
+	if (mute) {
+		val[0] = VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0 |
+			 VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0;
+		val[1] = 0;
+		val[2] = 0;
+	} else {
+		val[0] = 0;
+		val[1] = AU_EN_DP_ENC0_P0;
+		/* Send one every two frames */
+		val[2] = 0x0F;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030,
+			   val[0],
+			   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0 |
+			   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+			   val[1], AU_EN_DP_ENC0_P0);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4,
+			   val[2], AU_TS_CFG_DP_ENC0_P0_MASK);
+}
+
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
@@ -1080,6 +1291,76 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 
 	mtk_dp->info.format = DP_PIXELFORMAT_RGB;
 	memset(&mtk_dp->info.vm, 0, sizeof(struct videomode));
+	mtk_dp->audio_enable = false;
+}
+
+static void mtk_dp_sdp_set_down_cnt_init(struct mtk_dp *mtk_dp,
+					 u32 sram_read_start)
+{
+	u32 sdp_down_cnt_init = 0;
+	struct drm_display_mode mode;
+	struct videomode *vm = &mtk_dp->info.vm;
+
+	drm_display_mode_from_videomode(vm, &mode);
+
+	if (mode.clock > 0)
+		sdp_down_cnt_init = sram_read_start *
+				    mtk_dp->train_info.link_rate * 2700 * 8 /
+				    (mode.clock * 4);
+
+	switch (mtk_dp->train_info.lane_count) {
+	case 1:
+		sdp_down_cnt_init = max_t(u32, sdp_down_cnt_init, 0x1A);
+		break;
+	case 2:
+		/* case for LowResolution && High Audio Sample Rate */
+		sdp_down_cnt_init = max_t(u32, sdp_down_cnt_init, 0x10);
+		sdp_down_cnt_init += mode.vtotal <= 525 ? 4 : 0;
+		break;
+	case 4:
+	default:
+		sdp_down_cnt_init = max_t(u32, sdp_down_cnt_init, 6);
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3040,
+			   sdp_down_cnt_init,
+			   SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
+{
+	int pix_clk_mhz;
+	u32 dc_offset;
+	u32 spd_down_cnt_init = 0;
+	struct drm_display_mode mode;
+	struct videomode *vm = &mtk_dp->info.vm;
+
+	drm_display_mode_from_videomode(vm, &mode);
+
+	pix_clk_mhz = mtk_dp->info.format == DP_PIXELFORMAT_YUV420 ?
+		      mode.clock / 2000 : mode.clock / 1000;
+
+	switch (mtk_dp->train_info.lane_count) {
+	case 1:
+		spd_down_cnt_init = 0x20;
+		break;
+	case 2:
+		dc_offset = (mode.vtotal <= 525) ? 0x14 : 0x00;
+		spd_down_cnt_init = 0x18 + dc_offset;
+		break;
+	case 4:
+	default:
+		dc_offset = (mode.vtotal <= 525) ? 0x08 : 0x00;
+		if (pix_clk_mhz > mtk_dp->train_info.link_rate * 27)
+			spd_down_cnt_init = 0x8;
+		else
+			spd_down_cnt_init = 0x10 + dc_offset;
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364, spd_down_cnt_init,
+			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
@@ -1091,6 +1372,8 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 				    MTK_DP_PIX_PER_ADDR);
 	mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
 
 static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
@@ -1342,6 +1625,20 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	return 0;
 }
 
+static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
+						 struct mtk_dp_audio_cfg *cfg)
+{
+	if (!mtk_dp->data->audio_supported)
+		return false;
+
+	if (mtk_dp->info.audio_cur_cfg.sad_count <= 0) {
+		drm_info(mtk_dp->drm_dev, "The SADs is NULL\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 {
 	phy_reset(mtk_dp->phy);
@@ -1446,6 +1743,46 @@ static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
 	}
 }
 
+static void mtk_dp_audio_sdp_setup(struct mtk_dp *mtk_dp,
+				   struct mtk_dp_audio_cfg *cfg)
+{
+	struct dp_sdp sdp;
+	struct hdmi_audio_infoframe frame;
+
+	hdmi_audio_infoframe_init(&frame);
+	frame.coding_type = HDMI_AUDIO_CODING_TYPE_PCM;
+	frame.channels = cfg->channels;
+	frame.sample_frequency = cfg->sample_rate;
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		break;
+	case 20:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_20;
+		break;
+	case 24:
+	default:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_24;
+		break;
+	}
+
+	hdmi_audio_infoframe_pack_for_dp(&frame, &sdp, MTK_DP_VERSION);
+
+	mtk_dp_audio_sdp_asp_set_channels(mtk_dp, cfg->channels);
+	mtk_dp_setup_sdp_aui(mtk_dp, &sdp);
+}
+
+static void mtk_dp_audio_setup(struct mtk_dp *mtk_dp,
+			       struct mtk_dp_audio_cfg *cfg)
+{
+	mtk_dp_audio_sdp_setup(mtk_dp, cfg);
+	mtk_dp_audio_channel_status_set(mtk_dp, cfg);
+
+	mtk_dp_audio_setup_channels(mtk_dp, cfg);
+	mtk_dp_audio_set_divider(mtk_dp);
+}
+
 static int mtk_dp_video_config(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_config_mn_mode(mtk_dp);
@@ -1489,6 +1826,10 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
 
 		if (!mtk_dp->train_info.cable_plugged_in) {
+			mtk_dp_disable_sdp_aui(mtk_dp);
+			memset(&mtk_dp->info.audio_cur_cfg, 0,
+			       sizeof(mtk_dp->info.audio_cur_cfg));
+
 			mtk_dp->need_debounce = false;
 			mod_timer(&mtk_dp->debounce_timer,
 				  jiffies + msecs_to_jiffies(100) - 1);
@@ -1575,6 +1916,16 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return 0;
 }
 
+static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
+		mtk_dp->plugged_cb(mtk_dp->codec_dev,
+				   mtk_dp->enabled &
+				   mtk_dp->info.audio_cur_cfg.detect_monitor);
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+}
+
 static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
@@ -1615,7 +1966,6 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 					   DP_PWR_STATE_MASK);
 		}
 	}
-
 	return ret;
 }
 
@@ -1625,6 +1975,8 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	bool enabled = mtk_dp->enabled;
 	struct edid *new_edid = NULL;
+	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
+	struct cea_sad *sads;
 
 	if (!enabled) {
 		drm_bridge_chain_pre_enable(bridge);
@@ -1650,6 +2002,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 		new_edid = NULL;
 	}
 
+	if (new_edid) {
+		audio_caps->sad_count = drm_edid_to_sad(new_edid, &sads);
+		audio_caps->detect_monitor = drm_detect_monitor_audio(new_edid);
+	}
+
 	if (!enabled) {
 		/* power off panel */
 		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
@@ -1843,7 +2200,19 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	mtk_dp_video_enable(mtk_dp, true);
 
+	mtk_dp->audio_enable =
+		mtk_dp_edid_parse_audio_capabilities(mtk_dp,
+						     &mtk_dp->info.audio_cur_cfg);
+	if (mtk_dp->audio_enable) {
+		mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_cur_cfg);
+		mtk_dp_audio_mute(mtk_dp, false);
+	} else {
+		memset(&mtk_dp->info.audio_cur_cfg, 0,
+		       sizeof(mtk_dp->info.audio_cur_cfg));
+	}
+
 	mtk_dp->enabled = true;
+	mtk_dp_update_plugged_status(mtk_dp);
 
 	return;
 power_off_aux:
@@ -1858,7 +2227,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
 	mtk_dp->enabled = false;
+	mtk_dp_update_plugged_status(mtk_dp);
 	mtk_dp_video_enable(mtk_dp, false);
+	mtk_dp_audio_mute(mtk_dp, true);
 
 	if (mtk_dp->train_info.cable_plugged_in) {
 		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
@@ -2015,6 +2386,100 @@ static void mtk_dp_debounce_timer(struct timer_list *t)
 	mtk_dp->need_debounce = true;
 }
 
+/*
+ * HDMI audio codec callbacks
+ */
+static int mtk_dp_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	if (!mtk_dp->enabled) {
+		dev_err(mtk_dp->dev, "%s, DP is not ready!\n", __func__);
+		return -ENODEV;
+	}
+
+	mtk_dp->info.audio_cur_cfg.channels = params->cea.channels;
+	mtk_dp->info.audio_cur_cfg.sample_rate = params->sample_rate;
+
+	mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_cur_cfg);
+
+	return 0;
+}
+
+static int mtk_dp_audio_startup(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, false);
+
+	return 0;
+}
+
+static void mtk_dp_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, true);
+}
+
+static int mtk_dp_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
+				size_t len)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	if (mtk_dp->enabled)
+		memcpy(buf, mtk_dp->conn->eld, len);
+	else
+		memset(buf, 0, len);
+
+	return 0;
+}
+
+static int mtk_dp_audio_hook_plugged_cb(struct device *dev, void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
+{
+	struct mtk_dp *mtk_dp = data;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	mtk_dp->plugged_cb = fn;
+	mtk_dp->codec_dev = codec_dev;
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+
+	mtk_dp_update_plugged_status(mtk_dp);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
+	.hw_params = mtk_dp_audio_hw_params,
+	.audio_startup = mtk_dp_audio_startup,
+	.audio_shutdown = mtk_dp_audio_shutdown,
+	.get_eld = mtk_dp_audio_get_eld,
+	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
+	.no_capture_mute = 1,
+};
+
+static int mtk_dp_register_audio_driver(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &mtk_dp_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = mtk_dp,
+	};
+
+	mtk_dp->audio_pdev = platform_device_register_data(dev,
+							   HDMI_CODEC_DRV_NAME,
+							   PLATFORM_DEVID_AUTO,
+							   &codec_data,
+							   sizeof(codec_data));
+	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2059,8 +2524,19 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to request mediatek dptx irq\n");
 
+	mutex_init(&mtk_dp->update_plugged_status_lock);
+
 	platform_set_drvdata(pdev, mtk_dp);
 
+	if (mtk_dp->data->audio_supported) {
+		ret = mtk_dp_register_audio_driver(dev);
+		if (ret) {
+			dev_err(dev, "Failed to register audio driver: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
 							PLATFORM_DEVID_AUTO,
 							&mtk_dp->regs,
@@ -2106,6 +2582,8 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	del_timer_sync(&mtk_dp->debounce_timer);
 	drm_bridge_remove(&mtk_dp->bridge);
 	platform_device_unregister(mtk_dp->phy_dev);
+	if (mtk_dp->audio_pdev)
+		platform_device_unregister(mtk_dp->audio_pdev);
 
 	return 0;
 }
@@ -2141,12 +2619,14 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
 	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_edp_efuse_fmt,
+	.audio_supported = false,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
 	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_dp_efuse_fmt,
+	.audio_supported = true,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 3f01ba44871f..096ad6572a5e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -115,6 +115,8 @@
 #define HSW_SEL_DP_ENC0_P0				BIT(7)
 #define VSP_SEL_DP_ENC0_P0				BIT(8)
 #define VSW_SEL_DP_ENC0_P0				BIT(9)
+#define VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0		BIT(11)
+#define VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0		BIT(12)
 #define MTK_DP_ENC0_P0_3034			0x3034
 #define MTK_DP_ENC0_P0_3038			0x3038
 #define VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK		BIT(11)
@@ -139,6 +141,38 @@
 #define SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK		BIT(8)
 #define MTK_DP_ENC0_P0_3064			0x3064
 #define HDE_NUM_LAST_DP_ENC0_P0_MASK			GENMASK(15, 0)
+#define MTK_DP_ENC0_P0_3088			0x3088
+#define AU_EN_DP_ENC0_P0				BIT(6)
+#define AUDIO_8CH_EN_DP_ENC0_P0_MASK			BIT(7)
+#define AUDIO_8CH_SEL_DP_ENC0_P0_MASK			BIT(8)
+#define AUDIO_2CH_EN_DP_ENC0_P0_MASK			BIT(14)
+#define AUDIO_2CH_SEL_DP_ENC0_P0_MASK			BIT(15)
+#define MTK_DP_ENC0_P0_308C			0x308c
+#define CH_STATUS_0_DP_ENC0_P0_MASK			GENMASK(15, 0)
+#define MTK_DP_ENC0_P0_3090			0x3090
+#define CH_STATUS_1_DP_ENC0_P0_MASK			GENMASK(15, 0)
+#define MTK_DP_ENC0_P0_3094			0x3094
+#define CH_STATUS_2_DP_ENC0_P0_MASK			GENMASK(7, 0)
+#define MTK_DP_ENC0_P0_30A0			0x30a0
+#define DP_ENC0_30A0_MASK				(BIT(7) | BIT(8) | BIT(12))
+#define MTK_DP_ENC0_P0_30A4			0x30a4
+#define AU_TS_CFG_DP_ENC0_P0_MASK			GENMASK(7, 0)
+#define MTK_DP_ENC0_P0_30A8			0x30a8
+#define MTK_DP_ENC0_P0_30BC			0x30bc
+#define ISRC_CONT_DP_ENC0_P0				BIT(0)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK	GENMASK(10, 8)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(5 << 8)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(6 << 8)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)
+#define MTK_DP_ENC0_P0_30D8			0x30d8
+#define MTK_DP_ENC0_P0_312C			0x312c
+#define ASP_HB2_DP_ENC0_P0_MASK				GENMASK(7, 0)
+#define ASP_HB3_DP_ENC0_P0_MASK				GENMASK(15, 8)
+#define MTK_DP_ENC0_P0_3130			0x3130
+#define MTK_DP_ENC0_P0_3138			0x3138
 #define MTK_DP_ENC0_P0_3154			0x3154
 #define PGEN_HTOTAL_DP_ENC0_P0_MASK			GENMASK(13, 0)
 #define MTK_DP_ENC0_P0_3158			0x3158
@@ -167,9 +201,23 @@
 #define ISRC1_HB3_DP_ENC0_P0_MASK			GENMASK(15, 8)
 
 /* offset: ENC1_OFFSET (0x3200) */
+#define MTK_DP_ENC1_P0_3200			0x3200
+#define MTK_DP_ENC1_P0_3280			0x3280
+#define SDP_PACKET_TYPE_DP_ENC1_P0_MASK			GENMASK(4, 0)
+#define SDP_PACKET_W_DP_ENC1_P0				BIT(5)
+#define SDP_PACKET_W_DP_ENC1_P0_MASK			BIT(5)
+#define MTK_DP_ENC1_P0_328C			0x328c
+#define VSC_DATA_RDY_VESA_DP_ENC1_P0_MASK		BIT(7)
 #define MTK_DP_ENC1_P0_3300			0x3300
 #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_VAL		2
 #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK		GENMASK(9, 8)
+#define MTK_DP_ENC1_P0_3304			0x3304
+#define AU_PRTY_REGEN_DP_ENC1_P0_MASK			BIT(8)
+#define AU_CH_STS_REGEN_DP_ENC1_P0_MASK			BIT(9)
+#define AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK	BIT(12)
+#define MTK_DP_ENC1_P0_3324			0x3324
+#define AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK		GENMASK(9, 8)
+#define AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX		0
 #define MTK_DP_ENC1_P0_3364			0x3364
 #define SDP_DOWN_CNT_IN_HBLANK_DP_ENC1_P0_VAL		0x20
 #define SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK	GENMASK(11, 0)
@@ -186,6 +234,9 @@
 							 VIDEO_STABLE_CNT_THRD_DP_ENC1_P0 | \
 							 SDP_DP13_EN_DP_ENC1_P0 | \
 							 BS2BS_MODE_DP_ENC1_P0)
+#define MTK_DP_ENC1_P0_33F4			0x33f4
+#define DP_ENC_DUMMY_RW_1_AUDIO_RST_EN			BIT(0)
+#define DP_ENC_DUMMY_RW_1				BIT(9)
 
 /* offset: TRANS_OFFSET (0x3400) */
 #define MTK_DP_TRANS_P0_3400				0x3400
-- 
2.18.0

