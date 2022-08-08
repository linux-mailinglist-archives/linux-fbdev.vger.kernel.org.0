Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC4A58C2FF
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 Aug 2022 07:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235494AbiHHFqw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 8 Aug 2022 01:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbiHHFqv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 8 Aug 2022 01:46:51 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5C5DFD4;
        Sun,  7 Aug 2022 22:46:42 -0700 (PDT)
X-UUID: 5f9f0a52b07f45639a2c320be271104a-20220808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VYf6ezy+/tgRHSxGzJXfNlPkkPg4ZknRRAkBfdbZORU=;
        b=jDvh4+64DMoZeeiCyFLavW6xLEs1PQPUnXjuZEqNk4jUFU0YnroyL0xZAg70bt+KNlyNpvw8JJpAsAM2wwm5FSxrsJ8U1pJMxCizUF45TyJ7xRC+dpg1iwc/kpgKFKpH+0g1+cvz193a7fgwNShpkzyI7BaK5jC/WXtU1TpHSsM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:1145f007-8b2c-427d-be21-a07512c8074d,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
        am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:38fb2fae-9535-44a6-aa9b-7f62b79b6ff6,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5f9f0a52b07f45639a2c320be271104a-20220808
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 902237526; Mon, 08 Aug 2022 13:46:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 13:46:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Aug 2022 13:46:39 +0800
Message-ID: <d9eb673132f643e39caeb422309bf4315f0c136e.camel@mediatek.com>
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
Date:   Mon, 8 Aug 2022 13:46:39 +0800
In-Reply-To: <20220805101459.3386-4-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
         <20220805101459.3386-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi, Bo-Chen:

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
> +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +	u32 irq_status;
> +
> +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> +
> +	if (!(irq_status & RGS_IRQ_STATUS_TRANSMITTER))
> +		return IRQ_HANDLED;

If one of MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
MTK_DP_HPD_DISCONNECT exist, does it imply RGS_IRQ_STATUS_TRANSMITTER
exist? If so, I think this checking is redundant because we could
directly check MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
MTK_DP_HPD_DISCONNECT.

> +
> +	irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> +		     mtk_dp_hwirq_get_clear(mtk_dp);
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;
> +
> +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> +		train_info->hpd_inerrupt = true;

train_info->hpd_inerrupt is useless, so drop it.

> +
> +	if (!(irq_status & MTK_DP_HPD_CONNECT ||
> +	      irq_status & MTK_DP_HPD_DISCONNECT))
> +		return IRQ_WAKE_THREAD;

this could be changed to

if (irq_status == MTK_DP_HPD_INTERRUPT)
	return IRQ_WAKE_THREAD;

But I find one problem. If irq_status == MTK_DP_HPD_INTERRUPT |
MTK_DP_HPD_CONNECT, the thread would not be waked up. Is this what you
want?

Regards,
CK

> +
> +	if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> +	       HPD_DB_DP_TRANS_P0_MASK))
> +		train_info->cable_plugged_in = true;
> +	else
> +		train_info->cable_plugged_in = false;
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +			   DP_PWR_STATE_MASK);
> +
> +	return IRQ_HANDLED;
> +}
> +

