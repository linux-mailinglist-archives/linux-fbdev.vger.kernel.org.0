Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E90B253B30F
	for <lists+linux-fbdev@lfdr.de>; Thu,  2 Jun 2022 07:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbiFBFbu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 Jun 2022 01:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiFBFbu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 2 Jun 2022 01:31:50 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE20A13CC9;
        Wed,  1 Jun 2022 22:31:45 -0700 (PDT)
X-UUID: 1a33ec1c412c4d6c88542977ecfa93ce-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6a7536f1-e1b3-4f14-999b-7b2c5bf2504a,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:45
X-CID-INFO: VERSION:1.1.5,REQID:6a7536f1-e1b3-4f14-999b-7b2c5bf2504a,OB:0,LOB:
        0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
        N:release,TS:45
X-CID-META: VersionHash:2a19b09,CLOUDID:2a53900d-3a0d-4bbe-9d72-0e5d26d57423,C
        OID:953b5f299f8e,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:1,File:nil,QS:0,BEC:nil
X-UUID: 1a33ec1c412c4d6c88542977ecfa93ce-20220602
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1182987510; Thu, 02 Jun 2022 13:31:39 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 13:31:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 13:31:37 +0800
Message-ID: <a903bdb73b93c4e61bbe9e62231347632445c2af.camel@mediatek.com>
Subject: Re: [PATCH v10 00/21] drm/mediatek: Add mt8195 DisplayPort driver
From:   Rex-BC Chen <rex-bc.chen@mediatek.com>
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= 
        <Chunfeng.Yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, "Helge Deller" <deller@gmx.de>,
        CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= 
        <ck.hu@mediatek.com>,
        Jitao Shi =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= 
        <jitao.shi@mediatek.com>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "maxime@cerno.tech" <maxime@cerno.tech>
CC:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Date:   Thu, 2 Jun 2022 13:31:37 +0800
In-Reply-To: <358b183faed73672e8fa4f6eb0d48fb067aec87d.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
         <358b183faed73672e8fa4f6eb0d48fb067aec87d.camel@mediatek.com>
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

On Thu, 2022-06-02 at 11:50 +0800, Rex-BC Chen wrote:
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > this series is built around the DisplayPort driver. The dpi/dpintf
> > driver and the added helper functions are required for the
> > DisplayPort
> > driver to work.
> > 
> > This v10 still has some un-answered comments and TODOs for v11.
> > 
> > This has been tested sucessfully on a 5.18-next based "vendor
> > branch".
> > 
> > There's a missing dependency in the mediatek clock framework to
> > allow
> > a
> > mux clock to change it's parent automatically on rate change.
> > Without this change, the dpi driver won't properly set the clocks
> > on
> > mode change and thus nothing will be displayed on screen.
> > 
> > Changes from v9:
> > - The DP-Phy is back to being a child device of the DP driver (as
> > in
> > v8)
> > - hot plug detection has been added back to Embedded Display
> > Port...
> > as
> >   after discussing with mediatek experts, this is needed eventhough
> > the
> >   Embedded Display port is not un-pluggable
> > - rebased on linux-next
> > - simplified/split train_handler function, as suggested by Rex
> > - added comments on the sleep/delays present in the code
> > - removed previous patch introducing retries when receiving
> > AUX_DEFER
> > as
> >   this is already handled in the dp_aux framework
> > - added max-lane and max-linkrate device tree u8 properties instead
> > of
> >   hardcoded #defines
> > 
> > Things that are in my todolist for v11:
> > - retrieve CK/DE support from panel driver instead of hardcoding it
> > into
> >   the dpi driver
> > - refcount the dp driver "enabled" status for "future proofing"
> > - review the drm_dp_helpers for features/functions that have been
> >   re-implemented in the mediatek dp drivers
> > 
> > Older revisions:
> > RFC - 
> > 
https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
> > v1  - 
> > 
https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
> > v2  - 
> > 
https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
> > v3  - 
> > 
https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
> > v4  - 
> > 
https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
> > v5  - 
> > 
https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
> > v6  - 
> > 
https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/
> > v7  - 
> > 
https://lore.kernel.org/linux-mediatek/20211217150854.2081-1-granquet@baylibre.com/
> > v8  - 
> > 
https://lore.kernel.org/linux-mediatek/20220218145437.18563-1-granquet@baylibre.com/
> > v9  - 
> > 
https://lore.kernel.org/all/20220327223927.20848-1-granquet@baylibre.com/
> > 
> > Functional dependencies are:
> > - Add Mediatek Soc DRM (vdosys0) support for mt8195
> >   
> > 
https://lore.kernel.org/linux-mediatek/20220419094143.9561-2-jason-jh.lin@mediatek.com/
> > - Add MediaTek SoC DRM (vdosys1) support for mt8195
> >   
> > 
https://lore.kernel.org/linux-mediatek/20220512053128.31415-1-nancy.lin@mediatek.com/
> > 
> > 
> > Guillaume Ranquet (15):
> >   drm/edid: Convert cea_sad helper struct to kernelDoc
> >   drm/edid: Add cea_sad helpers for freq/length
> >   drm/mediatek: dpi: move dpi limits to SoC config
> >   drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
> >   drm/mediatek: dpi: implement a swap_input toggle in SoC config
> >   drm/mediatek: dpi: move dimension mask to SoC config
> >   drm/mediatek: dpi: move hvsize_mask to SoC config
> >   drm/mediatek: dpi: move swap_shift to SoC config
> >   drm/mediatek: dpi: move the yuv422_en_bit to SoC config
> >   drm/mediatek: dpi: move the csc_enable bit to SoC config
> >   drm/mediatek: dpi: Add dpintf support
> >   drm/mediatek: dpi: Only enable dpi after the bridge is enabled
> >   drm/meditek: dpi: Add matrix_sel helper
> >   drm/mediatek: Add mt8195 External DisplayPort support
> >   drm/mediatek: DP audio support for mt8195
> > 
> > Jitao Shi (1):
> >   drm/mediatek: add hpd debounce
> > 
> > Markus Schneider-Pargmann (5):
> >   dt-bindings: mediatek,dpi: Add DPINTF compatible
> >   dt-bindings: mediatek,dp: Add Display Port binding
> >   video/hdmi: Add audio_infoframe packing for DP
> >   phy: phy-mtk-dp: Add driver for DP phy
> >   drm/mediatek: Add mt8195 Embedded DisplayPort driver
> > 
> >  .../display/mediatek/mediatek,dp.yaml         |   99 +
> >  .../display/mediatek/mediatek,dpi.yaml        |   13 +-
> >  MAINTAINERS                                   |    1 +
> >  drivers/gpu/drm/drm_edid.c                    |   74 +
> >  drivers/gpu/drm/mediatek/Kconfig              |    8 +
> >  drivers/gpu/drm/mediatek/Makefile             |    2 +
> >  drivers/gpu/drm/mediatek/mtk_dp.c             | 3419
> > +++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  570 +++
> >  drivers/gpu/drm/mediatek/mtk_dpi.c            |  272 +-
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    8 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    8 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    3 +
> >  drivers/phy/mediatek/Kconfig                  |    8 +
> >  drivers/phy/mediatek/Makefile                 |    1 +
> >  drivers/phy/mediatek/phy-mtk-dp.c             |  200 +
> >  drivers/video/hdmi.c                          |   82 +-
> >  include/drm/dp/drm_dp_helper.h                |    2 +
> >  include/drm/drm_edid.h                        |   26 +-
> >  include/linux/hdmi.h                          |    7 +-
> >  include/linux/soc/mediatek/mtk-mmsys.h        |    4 +-
> >  22 files changed, 4765 insertions(+), 81 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> 
> Hello all,
> 
> Due to the resource issue, I will keep upstreaming Guillaume's MT8195
> dp/edp series.
> 
> I will check the comments for v8/v9/v10 and have some discussion with
> you.
> 
> Thanks for your all comments.
> 
> BRs,
> Bo-Chen
> 

Hello all,

Because the patches of dp_intf seem to be almost completed, I want to
split this series into two series:
dp_intf and edp/dp.

It will be easier to review and maintain this series.

Thanks!

BRs,
Bo-Chen

