Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A75E5810C0
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 Jul 2022 12:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238210AbiGZKGJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 26 Jul 2022 06:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238182AbiGZKGI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 26 Jul 2022 06:06:08 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1938C62D2;
        Tue, 26 Jul 2022 03:06:06 -0700 (PDT)
X-UUID: 3f58163cb94a407c8e7c05eefa6614b5-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:59565c01-56bb-40b8-8533-06e05dbc404d,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:7896fad3-912a-458b-a623-74f605a77e93,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 3f58163cb94a407c8e7c05eefa6614b5-20220726
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1380004839; Tue, 26 Jul 2022 18:06:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id 15.2.792.3;
 Tue, 26 Jul 2022 10:06:01 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 17:34:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 17:34:47 +0800
Message-ID: <80f223c8ecf262a62feb047d39b9ea2d8655fd14.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From:   CK Hu <ck.hu@mediatek.com>
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>,
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
Date:   Tue, 26 Jul 2022 17:34:47 +0800
In-Reply-To: <9c5b85034ec77be80d771ce3a17260453f007728.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
         <20220712111223.13080-6-rex-bc.chen@mediatek.com>
         <378f904a445e90d65048ed07a1a55fd8c633f934.camel@mediatek.com>
         <9c5b85034ec77be80d771ce3a17260453f007728.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 2022-07-26 at 14:42 +0800, Rex-BC Chen wrote:
> On Mon, 2022-07-25 at 17:16 +0800, CK Hu wrote:
> > Hi, Bo-Chen:
> > 
> > On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This patch adds a embedded displayport driver for the MediaTek
> > > mt8195
> > > SoC.
> > > 
> > > It supports the MT8195, the embedded DisplayPort units. It offers
> > > DisplayPort 1.4 with up to 4 lanes.
> > > 
> > > The driver creates a child device for the phy. The child device
> > > will
> > > never exist without the parent being active. As they are sharing
> > > a
> > > register range, the parent passes a regmap pointer to the child
> > > so
> > > that
> > > both can work with the same register range. The phy driver sets
> > > device
> > > data that is read by the parent to get the phy device that can be
> > > used
> > > to control the phy properties.
> > > 
> > > This driver is based on an initial version by
> > > Jitao shi <jitao.shi@mediatek.com>
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > 
> > [snip]
> > 
> > > +
> > > +static int mtk_dp_training(struct mtk_dp *mtk_dp)
> > > +{
> > > +	short max_retry = 50;
> > > +	int ret;
> > > +
> > > +	do {
> > > +		ret = mtk_dp_train_start(mtk_dp);
> > > +		if (!ret)
> > > +			break;
> > > +		else if (ret != -EAGAIN)
> > > +			return ret;
> > > +	} while (--max_retry);
> > 
> > mtk_dp_train_start() would never return -EAGAIN, so drop this while
> > loop.
> > 
> > Regards,
> > CK
> > 
> 
> Hello CK,
> 
> the function will not return -EAGAIN, but we still want to retry 50
> times if mtk_dp_train_start() is failed. If we retry 50 times and it
> is
> still failed. We can confirm there are some issues for the device.
> 
> I will remove the else if of -EAGAIN and keep th while loop.

In this version, it never retry. And I believe you've tested this no-
retry version. If this no-retry version works fine, why do you insist
on retry? If you really need retry, merge this retry into
mtk_dp_train_start() because mtk_dp_train_start() have already retry.

Regards,
CK

> 
> BRs,
> Bo-Chen
> > > 
> > > +	if (!max_retry)
> > > +		return -ETIMEDOUT;
> > > +
> > > +	ret = mtk_dp_video_config(mtk_dp);
> > > +	if (ret)
> > > +		return ret;
> > > +	mtk_dp_video_enable(mtk_dp, true);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > 
> > 
> 
> 

