Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B82053102D
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 May 2022 15:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbiEWKxF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 23 May 2022 06:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234713AbiEWKxA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 23 May 2022 06:53:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DB931DF0
        for <linux-fbdev@vger.kernel.org>; Mon, 23 May 2022 03:52:24 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id s28so20628306wrb.7
        for <linux-fbdev@vger.kernel.org>; Mon, 23 May 2022 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qE+cksaCFc5SRgD9rNWOD5X/+lhkld4nKdJjzmlsxwk=;
        b=hJPA41wIXu/KYlSuLXbrmwR+Z+c4UH9f5gHJSjMr56V+23lmXqH21Rx617toCrGyjW
         25tHR0MqoZHq60hcwOsRDB7xP5qd2kRUD/XTofIeymrdnuYERhU4KYJsBkOPEHFp283i
         76t1xD9bMMd4nPEVaWgIRKP0plc7D9KvZp8qCrj4oqmR5W5srlg5gf1HzmE0PkhWCdAL
         y238J1snhyM85q+vrlGKKfZlP92J4+CqdfyW9CLLDjSAwyuUVeL+ZxvwwdZcXiEMw+vT
         lsBNrdgG1djIRmbLj45hO/d77rdpxEEjm/bvKKNFuASIEwPETy3HD8BR21HVhg3eCEgC
         hBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qE+cksaCFc5SRgD9rNWOD5X/+lhkld4nKdJjzmlsxwk=;
        b=xZzAhN//tsRRI8Yj4zbten7UyBmv+VjscaAziKqAcQ5NT8JLHbdgi2Dfxi7qYK2Lu0
         O83vbfadWJT4AtjShFJPI3P5W7loUUh9Ilnjq3mZvA7rdaUZcxsgEmo3X0ShsN5HM7yh
         4Mre30XGct+5Ql6OIb5AAhvvT6VDn88gAF+Sd/hpPksJv0+HBwykIsPO2NVg7D9Bsyt4
         F6WlcK1VI1coyNYrnCBsD2ejsOVT3DYSv6mA26xF/ZwweUceCLw4/rB+RWg1UouFQkG5
         bjVCrPWzrU5v40B4ANIFbUblBA7hAh8hsIZkFcVAIh6xrwW7iQWkjaQFvlTQTlibxTbP
         f6cA==
X-Gm-Message-State: AOAM532Ay7L6syTppz+In0LqBTJgUihE9s2XQkCSOwT7MadeuvKpUCPA
        y0wE/tX+mPKSXyB1kMd+6G802w==
X-Google-Smtp-Source: ABdhPJysbkUzZQrK1j7s57Vo+fzYM8NAXRr4PRC9Gj8W1X9ftC861ByAuoDu9p4aeFWa3KNcoEGr8Q==
X-Received: by 2002:a05:6000:1e1a:b0:20f:c403:9180 with SMTP id bj26-20020a0560001e1a00b0020fc4039180mr10191493wrb.147.1653303142717;
        Mon, 23 May 2022 03:52:22 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6141:9d1b:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 03:52:22 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
To:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Helge Deller <deller@gmx.de>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Cc:     dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v10 21/21] drm/mediatek: DP audio support for mt8195
Date:   Mon, 23 May 2022 12:47:54 +0200
Message-Id: <20220523104758.29531-22-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
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

This patch adds audio support to the DP driver for mt8195 with up to 8
channels.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 784 +++++++++++++++++++++++++++++-
 1 file changed, 777 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index c056bc3ca9f6..05da6565c7f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -108,9 +108,41 @@ enum mtk_dp_color_depth {
 	MTK_DP_COLOR_DEPTH_UNKNOWN = 5,
 };
 
+enum mtk_dp_sdp_type {
+	MTK_DP_SDP_NONE = 0x00,
+	MTK_DP_SDP_ACM = 0x01,
+	MTK_DP_SDP_ISRC = 0x02,
+	MTK_DP_SDP_AVI = 0x03,
+	MTK_DP_SDP_AUI = 0x04,
+	MTK_DP_SDP_SPD = 0x05,
+	MTK_DP_SDP_MPEG = 0x06,
+	MTK_DP_SDP_NTSC = 0x07,
+	MTK_DP_SDP_VSP = 0x08,
+	MTK_DP_SDP_VSC = 0x09,
+	MTK_DP_SDP_EXT = 0x0A,
+	MTK_DP_SDP_PPS0 = 0x0B,
+	MTK_DP_SDP_PPS1 = 0x0C,
+	MTK_DP_SDP_PPS2 = 0x0D,
+	MTK_DP_SDP_PPS3 = 0x0E,
+	MTK_DP_SDP_DRM = 0x10,
+	MTK_DP_SDP_MAX_NUM
+};
+
+struct mtk_dp_sdp_packet {
+	enum mtk_dp_sdp_type type;
+	struct dp_sdp sdp;
+};
+
+struct mtk_dp_audio_cfg {
+	int sample_rate;
+	int word_length_bits;
+	int channels;
+};
+
 struct mtk_dp_info {
 	enum mtk_dp_color_depth depth;
 	enum dp_pixelformat format;
+	struct mtk_dp_audio_cfg audio_caps;
 	struct mtk_dp_timings timings;
 };
 
@@ -148,10 +180,22 @@ struct mtk_dp {
 	struct clk *dp_tx_clk;
 
 	bool enabled;
+	bool audio_enable;
 
 	bool has_fec;
 	/* Protects the mtk_dp struct */
 	struct mutex dp_lock;
+	/* Protects the plugged_cb as it's used in both bridge ops and audio */
+	struct mutex update_plugged_status_lock;
+	/* Protects the eld data as it's used in both bridge ops and audio */
+	struct mutex eld_lock;
+	/* Protects edid as it is used in both bridge ops and IRQ handler */
+	struct mutex edid_lock;
+	struct edid *edid;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
+	u8 connector_eld[MAX_ELD_BYTES];
 
 	struct drm_connector *conn;
 	bool need_debounce;
@@ -512,15 +556,363 @@ static int mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
 	return ret;
 }
 
+static int mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
+				       struct mtk_dp_audio_cfg *cfg)
+{
+	int ret;
+	u32 channel_enable_bits;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3324,
+				 AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX,
+			    AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK);
+	if (ret)
+		return ret;
+
+	/* audio channel count change reset */
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(9), BIT(9));
+	if (ret)
+		return ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+				 AU_PRTY_REGEN_DP_ENC1_P0_MASK,
+			    AU_PRTY_REGEN_DP_ENC1_P0_MASK);
+	if (ret)
+		return ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+				 AU_CH_STS_REGEN_DP_ENC1_P0_MASK,
+			    AU_CH_STS_REGEN_DP_ENC1_P0_MASK);
+	if (ret)
+		return ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+				 AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK,
+			    AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK);
+	if (ret)
+		return ret;
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
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+				 channel_enable_bits | AU_EN_DP_ENC0_P0_MASK,
+			   AUDIO_2CH_SEL_DP_ENC0_P0_MASK | AUDIO_2CH_EN_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_EN_DP_ENC0_P0_MASK | AU_EN_DP_ENC0_P0_MASK);
+	if (ret)
+		return ret;
+
+	/* audio channel count change reset */
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, 0, BIT(9));
+	if (ret)
+		return ret;
+
+	/* enable audio reset */
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(0), BIT(0));
+
+	return ret;
+}
+
+static int mtk_dp_audio_channel_status_set(struct mtk_dp *mtk_dp,
+					   struct mtk_dp_audio_cfg *cfg)
+{
+	int ret;
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
+			IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	case 24:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_24_20 |
+			IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	default:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_NOTID;
+	}
+
+	/* IEC 60958 consumer channel status bits */
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_308C,
+				 0,
+			   CH_STATUS_0_DP_ENC0_P0_MASK);
+	if (ret)
+		return ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3090,
+				 iec.status[3] << 8,
+			   CH_STATUS_1_DP_ENC0_P0_MASK);
+	if (ret)
+		return ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3094, iec.status[4],
+				 CH_STATUS_2_DP_ENC0_P0_MASK);
+
+	return ret;
+}
+
+static int mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
+					     int channels)
+{
+	if (channels != 2 && channels != 8)
+		channels = 8;
+
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_312C,
+			   (channels - 1) << ASP_HB3_DP_ENC0_P0_SHIFT,
+			   ASP_HB2_DP_ENC0_P0_MASK | ASP_HB3_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
+}
+
 static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
 {
 	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
 		  HPD_DB_DP_TRANS_P0_MASK);
 }
 
-static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
+static int mtk_dp_sdp_trigger_packet(struct mtk_dp *mtk_dp,
+				     enum mtk_dp_sdp_type type)
+{
+	int ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, type,
+				 SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+	if (ret)
+		return ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, SDP_PACKET_W_DP_ENC1_P0,
+				 SDP_PACKET_W_DP_ENC1_P0);
+
+	return ret;
+}
+
+static void mtk_dp_sdp_set_data(struct mtk_dp *mtk_dp, u8 *data_bytes)
+{
+	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_ENC1_P0_3200, data_bytes, 0x10);
+}
+
+static void mtk_dp_sdp_set_header(struct mtk_dp *mtk_dp,
+				  enum mtk_dp_sdp_type type,
+				  struct dp_sdp_header *header)
+{
+	u32 db_addr;
+
+	switch (type) {
+	case MTK_DP_SDP_DRM:
+		db_addr = MTK_DP_ENC0_P0_3138;
+		break;
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		db_addr = MTK_DP_ENC0_P0_3130;
+		break;
+	default:
+		db_addr = MTK_DP_ENC0_P0_30D8 + (type - MTK_DP_SDP_ACM) * 8;
+	}
+
+	mtk_dp_bulk_16bit_write(mtk_dp, db_addr, (u8 *)header, 4);
+}
+
+static const u32 mtk_dp_sdp_type_to_reg[MTK_DP_SDP_MAX_NUM] = {
+	/* MTK_DP_SDP_NONE => */ 0x0,
+	/* MTK_DP_SDP_ACM  => */ MTK_DP_ENC0_P0_30B4,
+	/* MTK_DP_SDP_ISRC => */ MTK_DP_ENC0_P0_30B4 + 1,
+	/* MTK_DP_SDP_AVI  => */ MTK_DP_ENC0_P0_30A4 + 1,
+	/* MTK_DP_SDP_AUI  => */ MTK_DP_ENC0_P0_30A8,
+	/* MTK_DP_SDP_SPD  => */ MTK_DP_ENC0_P0_30A8 + 1,
+	/* MTK_DP_SDP_MPEG => */ MTK_DP_ENC0_P0_30AC,
+	/* MTK_DP_SDP_NTSC => */ MTK_DP_ENC0_P0_30AC + 1,
+	/* MTK_DP_SDP_VSP  => */ MTK_DP_ENC0_P0_30B0,
+	/* MTK_DP_SDP_VSC  => */ MTK_DP_ENC0_P0_30B8,
+	/* MTK_DP_SDP_EXT  => */ MTK_DP_ENC0_P0_30B0 + 1,
+	/* MTK_DP_SDP_PPS0 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS1 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS2 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS3 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_DRM  => */ MTK_DP_ENC0_P0_31DC,
+};
+
+static int mtk_dp_disable_sdp(struct mtk_dp *mtk_dp, enum mtk_dp_sdp_type type)
+{
+	if (type == MTK_DP_SDP_NONE)
+		return -EINVAL;
+
+	/* Disable periodic send */
+	return mtk_dp_update_bits(mtk_dp, mtk_dp_sdp_type_to_reg[type] & 0xfffc, 0,
+			   0xFF << ((mtk_dp_sdp_type_to_reg[type] & 3) * 8));
+}
+
+static int mtk_dp_setup_sdp(struct mtk_dp *mtk_dp,
+			    struct mtk_dp_sdp_packet *packet)
+{
+	int ret = -EINVAL;
+
+	mtk_dp_sdp_set_data(mtk_dp, packet->sdp.db);
+	mtk_dp_sdp_set_header(mtk_dp, packet->type, &packet->sdp.sdp_header);
+
+	mtk_dp_disable_sdp(mtk_dp, packet->type);
+
+	switch (packet->type) {
+	case MTK_DP_SDP_NONE:
+		break;
+	case MTK_DP_SDP_ISRC:
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
+					 0x1C << ISRC1_HB3_DP_ENC0_P0_SHIFT,
+					 ISRC1_HB3_DP_ENC0_P0_MASK);
+		if (ret)
+			break;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, MTK_DP_SDP_ISRC,
+					 SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+		if (ret)
+			break;
+
+		if (packet->sdp.sdp_header.HB3 & BIT(2))
+			ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+						 BIT(ISRC_CONT_DP_ENC0_P0_SHIFT),
+						 ISRC_CONT_DP_ENC0_P0_MASK);
+		else
+			ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC, 0,
+						 ISRC_CONT_DP_ENC0_P0_MASK);
+
+		if (ret)
+			break;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+					 SDP_PACKET_W_DP_ENC1_P0,
+					 SDP_PACKET_W_DP_ENC1_P0);
+		if (ret)
+			break;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30B4,
+					 5 << ISRC_CFG_DP_ENC0_P0_SHIFT,
+					 ISRC_CFG_DP_ENC0_P0_MASK);
+		break;
+	case MTK_DP_SDP_DRM:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31DC,
+					 5 << HDR0_CFG_DP_ENC0_P0_SHIFT,
+					 HDR0_CFG_DP_ENC0_P0_MASK);
+		if (ret)
+			break;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
+					 0x1C << ISRC1_HB3_DP_ENC0_P0_SHIFT,
+				   ISRC1_HB3_DP_ENC0_P0_MASK);
+		if (ret)
+			break;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, MTK_DP_SDP_ISRC,
+					 SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+		if (ret)
+			break;
+
+		if (packet->sdp.sdp_header.HB3 & BIT(2))
+			ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+						 BIT(ISRC_CONT_DP_ENC0_P0_SHIFT),
+					   ISRC_CONT_DP_ENC0_P0_MASK);
+		else
+			ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC, 0,
+						 ISRC_CONT_DP_ENC0_P0_MASK);
+
+		if (ret)
+			break;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+					 SDP_PACKET_W_DP_ENC1_P0,
+				   SDP_PACKET_W_DP_ENC1_P0);
+		if (ret)
+			break;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30B4,
+					 5 << ISRC_CFG_DP_ENC0_P0_SHIFT,
+				   ISRC_CFG_DP_ENC0_P0_MASK);
+		break;
+	case MTK_DP_SDP_ACM:
+	case MTK_DP_SDP_AVI:
+	case MTK_DP_SDP_AUI:
+	case MTK_DP_SDP_SPD:
+	case MTK_DP_SDP_MPEG:
+	case MTK_DP_SDP_NTSC:
+	case MTK_DP_SDP_VSP:
+	case MTK_DP_SDP_VSC:
+	case MTK_DP_SDP_EXT:
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		/* Enable periodic sending */
+		ret = mtk_dp_update_bits(mtk_dp,
+					 mtk_dp_sdp_type_to_reg[packet->type] & 0xfffc,
+					 0x05 << ((mtk_dp_sdp_type_to_reg[packet->type] & 3) * 8),
+					 0xff << ((mtk_dp_sdp_type_to_reg[packet->type] & 3) * 8));
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int mtk_dp_sdp_vsc_ext_disable(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A0, 0,
+				 BIT(7) | BIT(8) | BIT(12));
+	if (ret)
+		return ret;
+
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_328C, 0, BIT(7));
+
+	return ret;
+}
+
+static int mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
 {
-	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
+	return mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
 		     BIT(AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT) |
 		     BIT(AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT) |
 		     BIT(AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT) |
@@ -1244,20 +1636,71 @@ static int mtk_dp_training_set_scramble(struct mtk_dp *mtk_dp, bool enable)
 			   DP_SCR_EN_DP_TRANS_P0_MASK);
 }
 
-static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
+static int mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 {
+	int ret;
 	u32 val = BIT(VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT);
 
 	if (enable)
 		val |= BIT(VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
-			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
-			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
+				 VIDEO_MUTE_SEL_DP_ENC0_P0_MASK | VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
+
+	if (ret)
+		return ret;
 
 	if (mtk_dp_is_edp(mtk_dp))
 		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
 	else
 		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
+
+	return 0;
+}
+
+static int mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
+{
+	int ret;
+
+	if (mute) {
+		ret = mtk_dp_update_bits(mtk_dp,
+					 MTK_DP_ENC0_P0_3030,
+				   BIT(VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT) |
+				   BIT(VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT),
+				   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK);
+		if (ret)
+			return ret;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088, 0,
+					 AU_EN_DP_ENC0_P0_MASK);
+		if (ret)
+			return ret;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4, 0,
+					 AU_TS_CFG_DP_ENC0_P0_MASK);
+		if (ret)
+			return ret;
+
+	} else {
+		ret = mtk_dp_update_bits(mtk_dp,
+					 MTK_DP_ENC0_P0_3030, 0,
+				   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK);
+		if (ret)
+			return ret;
+
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+					 BIT(AU_EN_DP_ENC0_P0_SHIFT),
+				   AU_EN_DP_ENC0_P0_MASK);
+		if (ret)
+			return ret;
+
+		/* Send one every two frames */
+		ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4, 0x0F,
+					 AU_TS_CFG_DP_ENC0_P0_MASK);
+	}
+
+	return ret;
 }
 
 static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1327,6 +1770,83 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 	mtk_dp->info.timings.frame_rate = 60;
 
 	mtk_dp->has_fec = false;
+	mtk_dp->audio_enable = false;
+}
+
+static int mtk_dp_sdp_set_down_cnt_init(struct mtk_dp *mtk_dp,
+					u32 sram_read_start)
+{
+	u32 sdp_down_cnt_init = 0;
+	u32 dc_offset;
+	struct drm_display_mode mode;
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	drm_display_mode_from_videomode(&timings->vm, &mode);
+
+	if (mtk_dp->info.timings.pix_rate_khz > 0)
+		sdp_down_cnt_init = sram_read_start *
+				    mtk_dp->train_info.link_rate * 2700 * 8 /
+				    (timings->pix_rate_khz * 4);
+
+	switch (mtk_dp->train_info.lane_count) {
+	case 1:
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x1A ?
+						  sdp_down_cnt_init :
+						  0x1A; /* 26 */
+		break;
+	case 2:
+		/* case for LowResolution && High Audio Sample Rate */
+		dc_offset = mode.vtotal <= 525 ? 0x04 : 0x00;
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x10 ?
+						  sdp_down_cnt_init :
+						  0x10 + dc_offset; /* 20 or 16 */
+		break;
+	case 4:
+	default:
+		sdp_down_cnt_init =
+			sdp_down_cnt_init > 0x06 ? sdp_down_cnt_init : 0x06; /*6 */
+		break;
+	}
+
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3040,
+			   sdp_down_cnt_init
+				   << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
+			   SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
+{
+	int pix_clk_mhz;
+	u32 dc_offset;
+	u32 spd_down_cnt_init = 0;
+	struct drm_display_mode mode;
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	drm_display_mode_from_videomode(&timings->vm, &mode);
+
+	pix_clk_mhz = mtk_dp->info.format == DP_PIXELFORMAT_YUV420 ?
+				    mtk_dp->info.timings.pix_rate_khz / 2000 :
+				    mtk_dp->info.timings.pix_rate_khz / 1000;
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
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364, spd_down_cnt_init,
+			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
@@ -1343,6 +1863,8 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 	}
 
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
 
 static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
@@ -1420,6 +1942,17 @@ static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
 	return 0;
 }
 
+static void mtk_dp_sdp_stop_sending(struct mtk_dp *mtk_dp)
+{
+	u8 packet_type;
+
+	for (packet_type = MTK_DP_SDP_ACM; packet_type < MTK_DP_SDP_MAX_NUM;
+	     packet_type++)
+		mtk_dp_disable_sdp(mtk_dp, packet_type);
+
+	mtk_dp_sdp_vsc_ext_disable(mtk_dp);
+}
+
 static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
 					  u8 dpcd_adjust_req[2])
 {
@@ -1725,6 +2258,52 @@ static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	return true;
 }
 
+static int mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
+						struct mtk_dp_audio_cfg *cfg)
+{
+	struct cea_sad *sads;
+	int sad_count;
+	int i;
+	int ret = 0;
+
+	mutex_lock(&mtk_dp->edid_lock);
+	if (!mtk_dp->edid) {
+		mutex_unlock(&mtk_dp->edid_lock);
+		dev_err(mtk_dp->dev, "EDID not found!\n");
+		return -EINVAL;
+	}
+
+	sad_count = drm_edid_to_sad(mtk_dp->edid, &sads);
+	mutex_unlock(&mtk_dp->edid_lock);
+	if (sad_count <= 0) {
+		drm_info(mtk_dp->drm_dev, "The SADs is NULL\n");
+		return 0;
+	}
+
+	for (i = 0; i < sad_count; i++) {
+		int sample_rate;
+		int word_length;
+		/* Only PCM supported at the moment */
+		if (sads[i].format != HDMI_AUDIO_CODING_TYPE_PCM)
+			continue;
+
+		sample_rate = drm_cea_sad_get_sample_rate(&sads[i]);
+		word_length =
+			drm_cea_sad_get_uncompressed_word_length(&sads[i]);
+		if (sample_rate <= 0 || word_length <= 0)
+			continue;
+
+		cfg->channels = sads[i].channels;
+		cfg->word_length_bits = word_length;
+		cfg->sample_rate = sample_rate;
+		ret = 1;
+		break;
+	}
+	kfree(sads);
+
+	return ret;
+}
+
 static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 {
 	phy_reset(mtk_dp->phy);
@@ -1830,6 +2409,48 @@ static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
 	}
 }
 
+static void mtk_dp_audio_sdp_setup(struct mtk_dp *mtk_dp,
+				   struct mtk_dp_audio_cfg *cfg)
+{
+	struct mtk_dp_sdp_packet packet;
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
+	packet.type = MTK_DP_SDP_AUI;
+	hdmi_audio_infoframe_pack_for_dp(&frame, &packet.sdp,
+					 MTK_DP_DP_VERSION_11);
+
+	mtk_dp_audio_sdp_asp_set_channels(mtk_dp, cfg->channels);
+	mtk_dp_setup_sdp(mtk_dp, &packet);
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
 static void mtk_dp_video_config(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_mn_overwrite_disable(mtk_dp);
@@ -1845,6 +2466,7 @@ static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
 	switch (mtk_dp->state) {
 	case MTK_DP_STATE_INITIAL:
 		mtk_dp_video_mute(mtk_dp, true);
+		mtk_dp_audio_mute(mtk_dp, true);
 		mtk_dp->state = MTK_DP_STATE_IDLE;
 		break;
 
@@ -1857,12 +2479,19 @@ static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
 		mtk_dp_video_config(mtk_dp);
 		mtk_dp_video_enable(mtk_dp, true);
 
+		if (mtk_dp->audio_enable) {
+			mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+			mtk_dp_audio_mute(mtk_dp, false);
+		}
+
 		mtk_dp->state = MTK_DP_STATE_NORMAL;
 		break;
 
 	case MTK_DP_STATE_NORMAL:
 		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
 			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
+			mtk_dp_sdp_stop_sending(mtk_dp);
 			mtk_dp->state = MTK_DP_STATE_IDLE;
 		}
 		break;
@@ -1901,7 +2530,15 @@ static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
 			}
 			break;
 
-		case MTK_DP_TRAIN_STATE_CHECKEDID:
+		case MTK_DP_TRAIN_STATE_CHECKEDID: {
+			int caps_found = mtk_dp_edid_parse_audio_capabilities(mtk_dp,
+				&mtk_dp->info.audio_caps);
+			mtk_dp->audio_enable = caps_found > 0;
+			if (!mtk_dp->audio_enable)
+				memset(&mtk_dp->info.audio_caps, 0,
+				       sizeof(mtk_dp->info.audio_caps));
+		}
+
 			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
 			break;
 
@@ -1914,6 +2551,7 @@ static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
 			ret = mtk_dp_train_start(mtk_dp);
 			if (ret == 0) {
 				mtk_dp_video_mute(mtk_dp, true);
+				mtk_dp_audio_mute(mtk_dp, true);
 				mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;
 				mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
 			} else if (ret != -EAGAIN) {
@@ -1988,11 +2626,13 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 		if (!mtk_dp->train_info.cable_plugged_in ||
 		    !mtk_dp_plug_state(mtk_dp)) {
 			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
 
 			mtk_dp_initialize_priv_data(mtk_dp);
 			mtk_dp_set_idle_pattern(mtk_dp, true);
 			if (mtk_dp->has_fec)
 				mtk_dp_fec_enable(mtk_dp, false);
+			mtk_dp_sdp_stop_sending(mtk_dp);
 
 			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 					   DP_PWR_STATE_BANDGAP_TPLL,
@@ -2107,6 +2747,18 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return ret;
 }
 
+static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
+{
+	bool connected, has_audio;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	connected = mtk_dp_plug_state(mtk_dp);
+	has_audio = drm_detect_monitor_audio(mtk_dp->edid);
+	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
+		mtk_dp->plugged_cb(mtk_dp->codec_dev, connected & has_audio);
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+}
+
 static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
@@ -2122,6 +2774,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 			ret = connector_status_connected;
 	}
 
+	mtk_dp_update_plugged_status(mtk_dp);
 	return ret;
 }
 
@@ -2308,6 +2961,7 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	mtk_dp->state = MTK_DP_STATE_IDLE;
 	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
 
@@ -2345,6 +2999,10 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
+	mutex_lock(&mtk_dp->eld_lock);
+	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld, MAX_ELD_BYTES);
+	mutex_unlock(&mtk_dp->eld_lock);
+
 	mtk_dp->enabled = true;
 }
 
@@ -2491,6 +3149,104 @@ static void mtk_dp_debounce_timer(struct timer_list *t)
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
+	struct mtk_dp_audio_cfg cfg;
+
+	if (!mtk_dp->enabled) {
+		pr_err("%s, DP is not ready!\n", __func__);
+		return -ENODEV;
+	}
+
+	cfg.channels = params->cea.channels;
+	cfg.sample_rate = params->sample_rate;
+	cfg.word_length_bits = 24;
+
+	mtk_dp_audio_setup(mtk_dp, &cfg);
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
+		memcpy(buf, mtk_dp->connector_eld, len);
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
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2534,9 +3290,21 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EPROBE_DEFER, "failed to request mediatek dptx irq\n");
 
 	mutex_init(&mtk_dp->dp_lock);
+	mutex_init(&mtk_dp->edid_lock);
+	mutex_init(&mtk_dp->eld_lock);
+	mutex_init(&mtk_dp->update_plugged_status_lock);
 
 	platform_set_drvdata(pdev, mtk_dp);
 
+	if (!mtk_dp_is_edp(mtk_dp)) {
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
@@ -2579,6 +3347,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
 
 	platform_device_unregister(mtk_dp->phy_dev);
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	del_timer_sync(&mtk_dp->debounce_timer);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.35.1

