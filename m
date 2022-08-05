Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15DF958A7FF
	for <lists+linux-fbdev@lfdr.de>; Fri,  5 Aug 2022 10:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240471AbiHEIXR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 5 Aug 2022 04:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiHEIXQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 5 Aug 2022 04:23:16 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2654B10559;
        Fri,  5 Aug 2022 01:23:07 -0700 (PDT)
X-UUID: 521aec51c0c4465abc9ee5c222b83544-20220805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=fZpMTsQZkArkRmPkA9bGC5qIbPXJZeiECvd366oDb1M=;
        b=YG1lyG8H6fSq8782yFTLNihYwXA8iKNA8Tp5cXjPKpQcYaUiDbJRRwDKhM9N1DjAessn7cS6n6lnnZPxoLNnugcU1DrPkQybogBLNp8XOXShlRACeoRnOKCkddHso7GJyixueNox3s+oW2L/KUiRGSz3NbnTAOPuvoV/WgmXpNQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:0bd14161-1a20-498a-bb5e-d5e59151099c,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:3fc3dd9b-da39-4e3b-a854-56c7d2111b46,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 521aec51c0c4465abc9ee5c222b83544-20220805
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 579496137; Fri, 05 Aug 2022 16:23:00 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 5 Aug 2022 16:22:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 5 Aug 2022 16:22:58 +0800
Message-ID: <790262de6afed95870bc2e81771c166045d4757a.camel@mediatek.com>
Subject: Re: [PATCH v15 05/11] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From:   Rex-BC Chen <rex-bc.chen@mediatek.com>
To:     CK Hu <ck.hu@mediatek.com>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "airlied@linux.ie" <airlied@linux.ie>
CC:     "msp@baylibre.com" <msp@baylibre.com>,
        "granquet@baylibre.com" <granquet@baylibre.com>,
        Jitao Shi =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= 
        <jitao.shi@mediatek.com>,
        "wenst@chromium.org" <wenst@chromium.org>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>,
        LiangXu Xu =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?= 
        <LiangXu.Xu@mediatek.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Fri, 5 Aug 2022 16:22:58 +0800
In-Reply-To: <202347b5f781ba1a9abe7297c9906793ad547d0d.camel@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
         <20220727045035.32225-6-rex-bc.chen@mediatek.com>
         <202347b5f781ba1a9abe7297c9906793ad547d0d.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SPF_TEMPERROR,UNPARSEABLE_RELAY,URIBL_CSS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 2022-08-02 at 13:09 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Wed, 2022-07-27 at 12:50 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195
> > SoC.
> > 
> > It supports the MT8195, the embedded DisplayPort units. It offers
> > DisplayPort 1.4 with up to 4 lanes.
> > 
> > The driver creates a child device for the phy. The child device
> > will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> > 
> > This driver is based on an initial version by
> > Jitao shi <jitao.shi@mediatek.com>
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
> > +{
> > +	struct mtk_dp *mtk_dp = dev;
> > +
> > +	if (mtk_dp->train_info.hpd_inerrupt) {
> 
> When the thread is running, mtk_dp->train_info.hpd_inerrupt would be
> true. So this checking is redundant.
> 

Hello CK,

ok, I will remove it.

> > +		dev_dbg(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");
> > +		mtk_dp->train_info.hpd_inerrupt = false;
> > +		mtk_dp_hpd_sink_event(mtk_dp);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> > +{
> > +	struct mtk_dp *mtk_dp = dev;
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +	u32 irq_status;
> > +
> > +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> > +
> > +	if (!irq_status)
> > +		return IRQ_HANDLED;
> > +
> > +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER) {
> 
> Combine this if-checking with previous if-checking, it would be:
> 
> if (!(irq_status & RGS_IRQ_STATUS_TRANSMITTER))
> 	return IRQ_HANDLED;
> 

ok.

> > +		irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> > +			     mtk_dp_hwirq_get_clear(mtk_dp);
> > +
> > +		if (!irq_status)
> > +			return IRQ_HANDLED;
> > +
> > +		if (irq_status & MTK_DP_HPD_INTERRUPT)
> 
> Does this interrupt MTK_DP_HPD_INTERRUPT have any relation with
> MTK_DP_HPD_CONNECT and MTK_DP_HPD_CONNECT? From the naming, I guess
> that when MTK_DP_HPD_CONNECT happen, MTK_DP_HPD_INTERRUPT would also
> happen. Either for MTK_DP_HPD_DISCONNECT. When would
> MTK_DP_HPD_INTERRUPT happen but MTK_DP_HPD_CONNECT or
> MTK_DP_HPD_DISCONNECT does not happen.
> 

There is no relation for these status. They are individual.
MTK_DP_HPD_INTERRUPT is for interrupt from sink device. After receiving
this source device should do some actions.

MTK_DP_HPD_CONNECT and MTK_DP_HPD_DISCONNECT are for HPD status.

BRs,
Bo-Chen

> Regards,
> CK
> 
> > +			train_info->hpd_inerrupt = true;
> > +
> > +		if (!(irq_status & MTK_DP_HPD_CONNECT ||
> > +		      irq_status & MTK_DP_HPD_DISCONNECT))
> > +			return IRQ_WAKE_THREAD;
> > +
> > +		if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> > +		       HPD_DB_DP_TRANS_P0_MASK))
> > +			train_info->cable_plugged_in = true;
> > +		else
> > +			train_info->cable_plugged_in = false;
> > +
> > +		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > +				   DP_PWR_STATE_MASK);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> 
> 

