Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7009D58140F
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 Jul 2022 15:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbiGZNWx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 26 Jul 2022 09:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbiGZNWx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 26 Jul 2022 09:22:53 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52FB52BB31;
        Tue, 26 Jul 2022 06:22:47 -0700 (PDT)
X-UUID: 26dc3eeed2d74fedb77701fe27d90ddd-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:db6dc055-fe34-4f64-8398-18f5f1dc8141,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:45
X-CID-INFO: VERSION:1.1.8,REQID:db6dc055-fe34-4f64-8398-18f5f1dc8141,OB:0,LOB:
        0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
        N:release,TS:45
X-CID-META: VersionHash:0f94e32,CLOUDID:2efa8bb3-06d2-48ef-b2dd-540836705165,C
        OID:c054147f60fb,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 26dc3eeed2d74fedb77701fe27d90ddd-20220726
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 636267679; Tue, 26 Jul 2022 21:22:40 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id 15.2.792.3;
 Tue, 26 Jul 2022 13:22:32 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 18:06:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 18:06:51 +0800
Message-ID: <c70db24fb66f844a2b53c229fff6e943e99398db.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
        "Jitao Shi =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?=" 
        <jitao.shi@mediatek.com>,
        "wenst@chromium.org" <wenst@chromium.org>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>,
        "LiangXu Xu =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?=" 
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
Date:   Tue, 26 Jul 2022 18:06:50 +0800
In-Reply-To: <80f223c8ecf262a62feb047d39b9ea2d8655fd14.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
         <20220712111223.13080-6-rex-bc.chen@mediatek.com>
         <378f904a445e90d65048ed07a1a55fd8c633f934.camel@mediatek.com>
         <9c5b85034ec77be80d771ce3a17260453f007728.camel@mediatek.com>
         <80f223c8ecf262a62feb047d39b9ea2d8655fd14.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 2022-07-26 at 17:34 +0800, CK Hu wrote:
> On Tue, 2022-07-26 at 14:42 +0800, Rex-BC Chen wrote:
> > On Mon, 2022-07-25 at 17:16 +0800, CK Hu wrote:
> > > Hi, Bo-Chen:
> > > 
> > > On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> > > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > 
> > > > This patch adds a embedded displayport driver for the MediaTek
> > > > mt8195
> > > > SoC.
> > > > 
> > > > It supports the MT8195, the embedded DisplayPort units. It
> > > > offers
> > > > DisplayPort 1.4 with up to 4 lanes.
> > > > 
> > > > The driver creates a child device for the phy. The child device
> > > > will
> > > > never exist without the parent being active. As they are
> > > > sharing
> > > > a
> > > > register range, the parent passes a regmap pointer to the child
> > > > so
> > > > that
> > > > both can work with the same register range. The phy driver sets
> > > > device
> > > > data that is read by the parent to get the phy device that can
> > > > be
> > > > used
> > > > to control the phy properties.
> > > > 
> > > > This driver is based on an initial version by
> > > > Jitao shi <jitao.shi@mediatek.com>
> > > > 
> > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +
> > > > +static int mtk_dp_training(struct mtk_dp *mtk_dp)
> > > > +{
> > > > +	short max_retry = 50;
> > > > +	int ret;
> > > > +
> > > > +	do {
> > > > +		ret = mtk_dp_train_start(mtk_dp);
> > > > +		if (!ret)
> > > > +			break;
> > > > +		else if (ret != -EAGAIN)
> > > > +			return ret;
> > > > +	} while (--max_retry);
> > > 
> > > mtk_dp_train_start() would never return -EAGAIN, so drop this
> > > while
> > > loop.
> > > 
> > > Regards,
> > > CK
> > > 
> > 
> > Hello CK,
> > 
> > the function will not return -EAGAIN, but we still want to retry 50
> > times if mtk_dp_train_start() is failed. If we retry 50 times and
> > it
> > is
> > still failed. We can confirm there are some issues for the device.
> > 
> > I will remove the else if of -EAGAIN and keep th while loop.
> 
> In this version, it never retry. And I believe you've tested this no-
> retry version. If this no-retry version works fine, why do you insist
> on retry? If you really need retry, merge this retry into
> mtk_dp_train_start() because mtk_dp_train_start() have already retry.
> 
> Regards,
> CK
> 

Hello Ck,

There are many different devices we are not testing for DP devices.
I think we need to keep this.
This retry is for restart with init state.

I think it's better to keep it here and it's more clear.

I will remain the comments above, and I think it's enough.

BRs,
Bo-Chen

> > 
> > BRs,
> > Bo-Chen
> > > > 
> > > > +	if (!max_retry)
> > > > +		return -ETIMEDOUT;
> > > > +
> > > > +	ret = mtk_dp_video_config(mtk_dp);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +	mtk_dp_video_enable(mtk_dp, true);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > 
> > > 
> > 
> > 
> 
> 

