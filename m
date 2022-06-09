Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58A054417F
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Jun 2022 04:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236692AbiFICaU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Jun 2022 22:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiFICaS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Jun 2022 22:30:18 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE6A167D5;
        Wed,  8 Jun 2022 19:30:16 -0700 (PDT)
X-UUID: dd1bd8e1630141b0bd212d121e8881e5-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:e3600c47-fefd-4c44-94cd-3943c328797c,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:45
X-CID-INFO: VERSION:1.1.5,REQID:e3600c47-fefd-4c44-94cd-3943c328797c,OB:0,LOB:
        0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
        N:release,TS:45
X-CID-META: VersionHash:2a19b09,CLOUDID:dc49b77e-c8dc-403a-96e8-6237210dceee,C
        OID:340581f72794,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:0,BEC:nil
X-UUID: dd1bd8e1630141b0bd212d121e8881e5-20220609
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 646342669; Thu, 09 Jun 2022 10:30:08 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 9 Jun 2022 10:30:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 9 Jun 2022 10:30:07 +0800
Message-ID: <49f4f8732eb1df31b0c8a82761e1c4dad9aef106.camel@mediatek.com>
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
        Chunfeng Yun =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= 
        <Chunfeng.Yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, "Helge Deller" <deller@gmx.de>,
        Jitao Shi =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= 
        <jitao.shi@mediatek.com>
CC:     Markus Schneider-Pargmann <msp@baylibre.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Date:   Thu, 9 Jun 2022 10:30:07 +0800
In-Reply-To: <75c00caca74b8366ca2c4594a8229b6de95c5f47.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
         <20220523104758.29531-19-granquet@baylibre.com>
         <f791f46c6307a18818574cb7fb8653bcc84aa9ad.camel@mediatek.com>
         <75c00caca74b8366ca2c4594a8229b6de95c5f47.camel@mediatek.com>
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

On Wed, 2022-06-08 at 18:26 +0800, Rex-BC Chen wrote:
> On Tue, 2022-06-07 at 15:47 +0800, CK Hu wrote:
> > Hi, Rex:
> > 
> > On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > > 
> > > It supports the mt8195, the embedded DisplayPort units. It offers
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
> > > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > ---
> > 
> > [snip]
> > 
> > > +
> > > +static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> > > +{
> > > +	ssize_t ret;
> > > +	u8 sink_count;
> > > +	bool locked;
> > > +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> > > +	u32 sink_count_reg = DP_SINK_COUNT_ESI;
> > > +	u32 link_status_reg = DP_LANE0_1_STATUS;
> > > +
> > > +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg,
> > > &sink_count);
> > > +	if (ret < 0) {
> > > +		drm_err(mtk_dp->drm_dev, "Read sink count failed:
> > > %ld\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> > > link_status,
> > > +			       sizeof(link_status));
> > > +	if (!ret) {
> > > +		drm_err(mtk_dp->drm_dev, "Read link status failed:
> > > %ld\n",
> > > +			ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	locked = drm_dp_channel_eq_ok(link_status,
> > > +				      mtk_dp->train_info.lane_count);
> > > +	if (!locked && mtk_dp->train_state >
> > > MTK_DP_TRAIN_STATE_TRAINING_PRE)
> > 
> > Before enter this function, mtk_dp->train_state is set to
> > MTK_DP_TRAIN_STATE_STARTUP, so this never happen, drop this.
> > 
> 
> The interrupt from sink device could come any time. Why it's
> impossible?

I still ask this question: "For eDP, when does disconnect happened?" If
it indeed happen, I still do not like to change state here. When
disconnect, the training flow would result in fail finally and need not
to change state here, but the training flow would block for a while
when disconnect. You could add some check point to check train_info-
>cable_plugged_in to quickly break out the training flow.

Regards,
CK

> 
> > > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
> > > +
> > > +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> > > +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> > > DP_DEVICE_SERVICE_IRQ_VECTOR,
> > > +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> > > +
> > > +	if (DP_GET_SINK_COUNT(sink_count) &&
> > > +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> > > +		mtk_dp->train_info.check_cap_count = 0;
> > > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;
> > 
> > Why change state from MTK_DP_TRAIN_STATE_STARTUP to
> > MTK_DP_TRAIN_STATE_CHECKEDID? In mtk_dp_train_handler(),
> > mtk_dp_parse_capabilities() is true then change to
> > MTK_DP_TRAIN_STATE_CHECKEDID. Give a reason why these two are
> > different.
> > 
> > Regards,
> > CK
> > 
> 
> I will drop this and drop state of MTK_DP_TRAIN_STATE_CHECKEDID.
> MTK_DP_TRAIN_STATE_CHECKEDID is only used for audio.
> We can check enable status in another place.
> 
> BRs,
> Bo-Chen
> 
> > > +		msleep(20);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > 
> > 
> 
> 

