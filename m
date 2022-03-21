Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C264E215C
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Mar 2022 08:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238257AbiCUH00 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 21 Mar 2022 03:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244518AbiCUH0Y (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 21 Mar 2022 03:26:24 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BE258806;
        Mon, 21 Mar 2022 00:24:59 -0700 (PDT)
X-UUID: bf319316ec4c4ac78d0bf8b63b671b06-20220321
X-UUID: bf319316ec4c4ac78d0bf8b63b671b06-20220321
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1336590698; Mon, 21 Mar 2022 15:24:54 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 21 Mar 2022 15:24:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Mar
 2022 15:24:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 15:24:52 +0800
Message-ID: <dae3ccb3e2f658418d6b1c061181a0b9291c108f.camel@mediatek.com>
Subject: Re: [PATCH v8 17/19] drm/mediatek: add hpd debounce
From:   Rex-BC Chen <rex-bc.chen@mediatek.com>
To:     Guillaume Ranquet <granquet@baylibre.com>,
        <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
        <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
        <chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
        <deller@gmx.de>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
        <angelogioacchino.delregno@collabora.com>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-phy@lists.infradead.org>, <linux-fbdev@vger.kernel.org>
Date:   Mon, 21 Mar 2022 15:24:52 +0800
In-Reply-To: <20220218145437.18563-18-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
         <20220218145437.18563-18-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 2022-02-18 at 15:54 +0100, Guillaume Ranquet wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> Implement the DP HDP debounce described in DP 1.4a 3.3.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 2a3d5f15b651b..fe91ab8b2fd89 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -178,6 +178,8 @@ struct mtk_dp {
>  	struct device *codec_dev;
>  	u8 connector_eld[MAX_ELD_BYTES];
>  	struct drm_connector *conn;
> +	bool need_debounce;
> +	struct timer_list debounce_timer;
>  };
>  
>  static struct regmap_config mtk_dp_regmap_config = {
> @@ -1698,6 +1700,9 @@ static irqreturn_t mtk_dp_hpd_event_thread(int
> hpd, void *dev)
>  	if (event < 0)
>  		return IRQ_HANDLED;
>  
> +	if (mtk_dp->need_debounce && mtk_dp-
> >train_info.cable_plugged_in)
> +		msleep(100);
> +
>  	if (mtk_dp->drm_dev) {
>  		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
>  		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> @@ -1776,6 +1781,13 @@ static irqreturn_t
> mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
>  	}
>  	train_info->cable_state_change = true;
>  
> +	if (train_info->cable_state_change) {
> +		if (!train_info->cable_plugged_in) {
> +			mod_timer(&mtk_dp->debounce_timer, jiffies +
> msecs_to_jiffies(100) - 1);
> +			mtk_dp->need_debounce = false;
> +		}
> +	}
> +
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -2239,6 +2251,13 @@ static const struct drm_bridge_funcs
> mtk_dp_bridge_funcs = {
>  	.detect = mtk_dp_bdg_detect,
>  };
>  
> +static void mtk_dp_debounce_timer(struct timer_list *t)
> +{
> +	struct mtk_dp *mtk_dp = from_timer(mtk_dp, t, debounce_timer);
> +
> +	mtk_dp->need_debounce = true;
> +}
> +
>  static int mtk_dp_probe(struct platform_device *pdev)
>  {
>  	struct mtk_dp *mtk_dp;
> @@ -2319,6 +2338,9 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  	else
>  		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  
> +	mtk_dp->need_debounce = true;
> +	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
> +
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> @@ -2332,6 +2354,7 @@ static int mtk_dp_remove(struct platform_device
> *pdev)
>  	platform_device_unregister(mtk_dp->phy_dev);
>  
>  	mtk_dp_video_mute(mtk_dp, true);
> +	del_timer_sync(&mtk_dp->debounce_timer);
>  
>  	pm_runtime_disable(&pdev->dev);
>  

