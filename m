Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9304958C29C
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 Aug 2022 06:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbiHHEsJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 8 Aug 2022 00:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbiHHEsI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 8 Aug 2022 00:48:08 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB41F5F74;
        Sun,  7 Aug 2022 21:48:06 -0700 (PDT)
X-UUID: cac1e6bf6c934e52bb808befa3072591-20220808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=J5GbJ91e8X3YtX3xXH8tAPXytmP3O2IQ15CfuTz/yzs=;
        b=c3OgPbChHFw4p6ZyGlYD2uC0MuRyj5R3gH50j5Ac9WTgTThXGsDvcQBtoX0sG+Pd8YvdNm30CoRnSgc2MPl8URnu6SUg1dw8YVggqkgyiV7X9gl0CnKe1wQdPdZuOFHcBVyYn7FpdMqAmuPlrhhe0/w57dCeEO5p4Jz5mtnKF6Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:4469bdfd-28f5-4bc5-9a34-af31b40eb282,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
        am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:4e3e089c-da39-4e3b-a854-56c7d2111b46,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cac1e6bf6c934e52bb808befa3072591-20220808
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1624936309; Mon, 08 Aug 2022 12:48:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 8 Aug 2022 12:48:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Aug 2022 12:48:01 +0800
Message-ID: <759311a0e40401c3c0f230e700b00878daf81a87.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From:   CK Hu <ck.hu@mediatek.com>
To:     Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
        <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
        <airlied@linux.ie>
CC:     <msp@baylibre.com>, <granquet@baylibre.com>,
        <jitao.shi@mediatek.com>, <wenst@chromium.org>,
        <angelogioacchino.delregno@collabora.com>,
        <liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-fbdev@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Mon, 8 Aug 2022 12:48:01 +0800
In-Reply-To: <20220805101459.3386-4-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
         <20220805101459.3386-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi. Bo-Chen:

On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

[snip]

> +
> +static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> +{
> +	u8 val;
> +	ssize_t ret;
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
> +	usleep_range(2000, 5000);
> +
> +	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
> +
> +	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
> +				      drm_dp_max_link_rate(mtk_dp-
> >rx_cap));
> +	train_info->lane_count = min_t(int, mtk_dp->max_lanes,
> +				       drm_dp_max_lane_count(mtk_dp-
> >rx_cap));
> +
> +	train_info->tps3 = drm_dp_tps3_supported(mtk_dp->rx_cap);
> +	train_info->tps4 = drm_dp_tps4_supported(mtk_dp->rx_cap);

You could drop tps3, tps4 and add channel_eq_pattern like this:

if (drm_dp_tps4_supported(mtk_dp->rx_cap))
	train_info->channel_eq_pattern = DP_TRAINING_PATTERN_4;
else if (drm_dp_tps4_supported(mtk_dp->rx_cap))
	train_info->channel_eq_pattern = DP_TRAINING_PATTERN_3;
else
	train_info->channel_eq_pattern = DP_TRAINING_PATTERN_2;

Regards,
CK

> +
> +	train_info->sink_ssc = drm_dp_max_downspread(mtk_dp->rx_cap);
> +
> +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
> +	if (ret < 1) {
> +		drm_err(mtk_dp->drm_dev, "Read mstm cap failed\n");
> +		return ret == 0 ? -EIO : ret;
> +	}
> +
> +	if (val & DP_MST_CAP) {
> +		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
> +		ret = drm_dp_dpcd_readb(&mtk_dp->aux,
> +					DP_DEVICE_SERVICE_IRQ_VECTOR_ES
> I0,
> +					&val);
> +		if (ret < 1) {
> +			drm_err(mtk_dp->drm_dev, "Read irq vector
> failed\n");
> +			return ret == 0 ? -EIO : ret;
> +		}
> +
> +		if (val)
> +			drm_dp_dpcd_writeb(&mtk_dp->aux,
> +					   DP_DEVICE_SERVICE_IRQ_VECTOR
> _ESI0,
> +					   val);
> +	}
> +
> +	return 0;
> +}
> +

