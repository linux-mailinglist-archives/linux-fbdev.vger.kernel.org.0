Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA65654BFFA
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Jun 2022 05:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbiFODG6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 14 Jun 2022 23:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbiFODG5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 14 Jun 2022 23:06:57 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5333C4B846;
        Tue, 14 Jun 2022 20:06:51 -0700 (PDT)
X-UUID: d4359e43390542e3a412e5f3f9e7e785-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6fac960f-eae7-4e47-aba4-4f6689ee5700,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:ae2640f6-e099-41ba-a32c-13b8bfe63214,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: d4359e43390542e3a412e5f3f9e7e785-20220615
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1589099927; Wed, 15 Jun 2022 11:06:47 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Jun 2022 11:06:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 15 Jun 2022 11:06:45 +0800
Message-ID: <6efcd9fbd86e923d2b124f7a97e8e3b8ddece252.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
        <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-fbdev@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Wed, 15 Jun 2022 11:06:45 +0800
In-Reply-To: <20220610105522.13449-6-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
         <20220610105522.13449-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi, Bo-Chen:

On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
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
> [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> +{
> +	u8 val;
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
> +	usleep_range(2000, 5000);
> +
> +	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
> +
> +	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &=
> DP_TRAINING_AUX_RD_MASK;
> +
> +	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
> +				      mtk_dp->rx_cap[mtk_dp-
> >max_linkrate]);
> +	train_info->lane_count = min_t(int, mtk_dp->max_lanes,
> +				       drm_dp_max_lane_count(mtk_dp-
> >rx_cap));
> +
> +	train_info->tps3 = drm_dp_tps3_supported(mtk_dp->rx_cap);
> +	train_info->tps4 = drm_dp_tps4_supported(mtk_dp->rx_cap);
> +
> +	train_info->sink_ssc = !!(mtk_dp->rx_cap[DP_MAX_DOWNSPREAD] &
> +				  DP_MAX_DOWNSPREAD_0_5);

I think this is redundant because next statement would set sink_scc to
false.

Regards,
CK

> +
> +	train_info->sink_ssc = false;
> +
> +	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
> +	if (val & DP_MST_CAP) {
> +		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
> +		drm_dp_dpcd_readb(&mtk_dp->aux,
> +				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
> &val);
> +		if (val)
> +			drm_dp_dpcd_writeb(&mtk_dp->aux,
> +					   DP_DEVICE_SERVICE_IRQ_VECTOR
> _ESI0,
> +					   val);
> +	}
> +
> +	return 0;
> +}

