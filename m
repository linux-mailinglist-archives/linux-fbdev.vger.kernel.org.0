Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4CF5AAABE
	for <lists+linux-fbdev@lfdr.de>; Fri,  2 Sep 2022 10:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbiIBI6K (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 2 Sep 2022 04:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbiIBI6J (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 2 Sep 2022 04:58:09 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5443BA0603;
        Fri,  2 Sep 2022 01:58:06 -0700 (PDT)
X-UUID: 55bd09ba86ae45aeb6c12ff406430924-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LjdTy1xd5BYoKHJkgGQjVcamnY1XU8R1SpCmvWnZVUs=;
        b=AQYfPnEB1lf1xCywnf/7nQX5ptfQ8yrDYBoQKx81Q3s5mCiHpvqOApsZXr2E1ZU8YRUU4kxXXe2PmUWi0DV4bgtVB/v/2Knnh20nyTn7SmBSjdhOGNzgoeDwVU1s5dkB8jygWgdU+eUKSHr/5qq8kWdnnRy5O3R/jpvX52jv9f8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e58f0edb-4376-49fc-bd67-41fb7b4bb93a,OB:0,L
        OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
        Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:3f566756-e800-47dc-8adf-0c936acf4f1b,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 55bd09ba86ae45aeb6c12ff406430924-20220902
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1814608957; Fri, 02 Sep 2022 16:58:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 16:57:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 16:57:58 +0800
Message-ID: <e5e925911c428cab87bbe12cda1dd657e1bb5075.camel@mediatek.com>
Subject: Re: [PATCH v17 10/10] drm/mediatek: dp: Audio support for MT8195
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
Date:   Fri, 2 Sep 2022 16:57:58 +0800
In-Reply-To: <20220901044149.16782-11-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
         <20220901044149.16782-11-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_CSS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi, Bo-Chen:

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds audio support to the DP driver for MT8195 with up to
> 8
> channels.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 482
> +++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  51 +++
>  2 files changed, 532 insertions(+), 1 deletion(-)
> 
> 

[snip]

> +#define MTK_DP_ENC0_P0_308C			0x308c
> +#define CH_STATUS_0_DP_ENC0_P0_MASK			GENMASK(15, 0)
> +#define MTK_DP_ENC0_P0_3090			0x3090
> +#define CH_STATUS_1_DP_ENC0_P0_MASK			GENMASK(15, 0)
> +#define MTK_DP_ENC0_P0_3094			0x3094
> +#define CH_STATUS_2_DP_ENC0_P0_MASK			GENMASK(7, 0)
> +#define MTK_DP_ENC0_P0_30A0			0x30a0

Useless, so drop it.

Regards,
CK

> +#define DP_ENC0_30A0_MASK				(BIT(7) |
> BIT(8) | BIT(12))
> +#define MTK_DP_ENC0_P0_30A4			0x30a4
> +#define AU_TS_CFG_DP_ENC0_P0_MASK			GENMASK(7, 0)
> +#define MTK_DP_ENC0_P0_30A8			0x30a8
> 

