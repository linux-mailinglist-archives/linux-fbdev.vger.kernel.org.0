Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF0653F7BF
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jun 2022 10:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbiFGIBg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Jun 2022 04:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiFGIBe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Jun 2022 04:01:34 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE1ECC148;
        Tue,  7 Jun 2022 01:01:30 -0700 (PDT)
X-UUID: d742e5a3f56f4ec89160624d0e463bdc-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:5f35ce3b-6f41-4603-a32d-3e26e3b75624,OB:0,LO
        B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
        TION:release,TS:45
X-CID-INFO: VERSION:1.1.5,REQID:5f35ce3b-6f41-4603-a32d-3e26e3b75624,OB:0,LOB:
        10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:45
X-CID-META: VersionHash:2a19b09,CLOUDID:69b7737e-c8dc-403a-96e8-6237210dceee,C
        OID:a9c23a514e78,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:0,BEC:nil
X-UUID: d742e5a3f56f4ec89160624d0e463bdc-20220607
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 298287096; Tue, 07 Jun 2022 16:01:27 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 16:01:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 16:01:25 +0800
Message-ID: <387fc4f9a65b87467fbff3878ad371bee4552e6e.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From:   CK Hu <ck.hu@mediatek.com>
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Guillaume Ranquet <granquet@baylibre.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Kishon Vijay Abraham I" <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, "Helge Deller" <deller@gmx.de>,
        Jitao shi <jitao.shi@mediatek.com>
CC:     Markus Schneider-Pargmann <msp@baylibre.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-phy@lists.infradead.org>, <linux-fbdev@vger.kernel.org>
Date:   Tue, 7 Jun 2022 16:01:25 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
         <20220523104758.29531-19-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi, Rex:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the embedded DisplayPort units. It offers
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
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---

[snip]

> +
> +static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
> +{
> +	switch (mtk_dp->state) {

Does mtk_dp->state has any relation with mtk_dp->train_state. If yes,
mix mtk_dp->state and mtk_dp->train_state into one state. If no, move
calling mtk_dp_state_handler() out of mtk_dp_train_handler().

Regards,
CK

> +	case MTK_DP_STATE_INITIAL:
> +		mtk_dp_video_mute(mtk_dp, true);
> +		mtk_dp->state = MTK_DP_STATE_IDLE;
> +		break;
> +
> +	case MTK_DP_STATE_IDLE:
> +		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> +			mtk_dp->state = MTK_DP_STATE_PREPARE;
> +		break;
> +
> +	case MTK_DP_STATE_PREPARE:
> +		mtk_dp_video_config(mtk_dp);
> +		mtk_dp_video_enable(mtk_dp, true);
> +
> +		mtk_dp->state = MTK_DP_STATE_NORMAL;
> +		break;
> +
> +	case MTK_DP_STATE_NORMAL:
> +		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp->state = MTK_DP_STATE_IDLE;
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}

