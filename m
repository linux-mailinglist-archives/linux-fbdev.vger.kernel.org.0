Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92981569C59
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 Jul 2022 10:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiGGIBO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 Jul 2022 04:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbiGGIBN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 7 Jul 2022 04:01:13 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98439326C9;
        Thu,  7 Jul 2022 01:01:11 -0700 (PDT)
X-UUID: 8e11ae3e131f4fe9aad04cfe3e6e87c3-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:0d6df8ef-6d73-434d-8be4-4eae1ed0160d,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:45
X-CID-INFO: VERSION:1.1.8,REQID:0d6df8ef-6d73-434d-8be4-4eae1ed0160d,OB:0,LOB:
        0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
        N:release,TS:45
X-CID-META: VersionHash:0f94e32,CLOUDID:1f1acb86-57f0-47ca-ba27-fe8c57fbf305,C
        OID:6d872c5026ec,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8e11ae3e131f4fe9aad04cfe3e6e87c3-20220707
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1296204468; Thu, 07 Jul 2022 16:00:55 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 7 Jul 2022 16:00:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 7 Jul 2022 16:00:53 +0800
Message-ID: <7af5710c5a9c0c30e38ca81a72fe30c1c7749bbb.camel@mediatek.com>
Subject: Re: [PATCH v13 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date:   Thu, 7 Jul 2022 16:00:53 +0800
In-Reply-To: <20220701062808.18596-6-rex-bc.chen@mediatek.com>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
         <20220701062808.18596-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi, Bo-Chen:

On Fri, 2022-07-01 at 14:28 +0800, Bo-Chen Chen wrote:
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

> +
> +static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
> +				   enum dp_pixelformat color_format)
> +{
> +	u32 val;
> +
> +	/* update MISC0 */
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +			   color_format << DP_TEST_COLOR_FORMAT_SHIFT,
> +			   DP_TEST_COLOR_FORMAT_MASK);
> +
> +	switch (color_format) {
> +	case DP_PIXELFORMAT_YUV422:
> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
> +		break;
> +	case DP_PIXELFORMAT_RGB:
> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
> +		break;
> +	default:

The default case would never happen, remove it.

Regards,
CK

> +		drm_warn(mtk_dp->drm_dev, "Unsupported color format:
> %d\n",
> +			 color_format);
> +		return -EINVAL;
> +	}
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
> +			   val, PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
> +	return 0;
> +}
> +

