Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DC557454E
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 Jul 2022 08:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiGNGwE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 Jul 2022 02:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiGNGwD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 Jul 2022 02:52:03 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35CE2872A;
        Wed, 13 Jul 2022 23:51:54 -0700 (PDT)
X-UUID: b429b8c9050f401a862da3b3f2aa3118-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ba925e1f-f082-483a-8be6-0102a9ea29cf,OB:10,L
        OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,AC
        TION:release,TS:51
X-CID-INFO: VERSION:1.1.8,REQID:ba925e1f-f082-483a-8be6-0102a9ea29cf,OB:10,LOB
        :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:51
X-CID-META: VersionHash:0f94e32,CLOUDID:b800f532-b9e4-42b8-b28a-6364427c76bb,C
        OID:da579af93ed8,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: b429b8c9050f401a862da3b3f2aa3118-20220714
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1058698050; Thu, 14 Jul 2022 14:51:48 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 14:51:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 14:51:47 +0800
Message-ID: <24726b8a5994961b966cf90b1f56c71a844d274a.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date:   Thu, 14 Jul 2022 14:51:47 +0800
In-Reply-To: <20220712111223.13080-6-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
         <20220712111223.13080-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi, Bo-Chen:

On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
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
> ---

[snip]

> +static int mtk_dp_train_tps_2_3(struct mtk_dp *mtk_dp, u8
> target_linkrate,
> +				u8 target_lane_count, int
> *iteration_count,
> +				u8 *lane_adjust,  int *status_control,
> +				u8 *prev_lane_adjust)
> +{
> +	u8 val;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +
> +	if (*status_control == 1) {
> +		if (mtk_dp->train_info.tps4) {
> +			mtk_dp_train_set_pattern(mtk_dp, 4);
> +			val = DP_TRAINING_PATTERN_4;
> +		} else if (mtk_dp->train_info.tps3) {
> +			mtk_dp_train_set_pattern(mtk_dp, 3);
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_3;
> +		} else {
> +			mtk_dp_train_set_pattern(mtk_dp, 2);
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_2;
> +		}
> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> +				   DP_TRAINING_PATTERN_SET, val);
> +		drm_dp_dpcd_read(&mtk_dp->aux,
> +				 DP_ADJUST_REQUEST_LANE0_1,
> lane_adjust,
> +				 sizeof(*lane_adjust) * 2);
> +
> +		mtk_dp_train_update_swing_pre(mtk_dp,
> +					      target_lane_count,
> lane_adjust);
> +		*status_control = 2;
> +		(*iteration_count)++;
> +	}
> +
> +	drm_dp_link_train_channel_eq_delay(&mtk_dp->aux, mtk_dp-
> >rx_cap);
> +
> +	drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);
> +
> +	if (!drm_dp_clock_recovery_ok(link_status, target_lane_count)) 

I think this checking is redundant. I think we could just keep
drm_dp_channel_eq_ok() and drop drm_dp_clock_recovery_ok() here because
if drm_dp_clock_recovery_ok() fail, it imply that
drm_dp_channel_eq_ok() would fail. So just check drm_dp_channel_eq_ok()
is enough.

Regards,
CK

> {
> +		mtk_dp->train_info.cr_done = false;
> +		mtk_dp->train_info.eq_done = false;
> +		dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
> +		return -EINVAL;
> +	}
> +
> +	if (drm_dp_channel_eq_ok(link_status, target_lane_count)) {
> +		mtk_dp->train_info.eq_done = true;
> +		dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
> +		return 0;
> +	}
> +
> +	if (*prev_lane_adjust == link_status[4])
> +		(*iteration_count)++;
> +	else
> +		*prev_lane_adjust = link_status[4];
> +
> +	return -EAGAIN;
> +}
> +

