Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987F5533C2E
	for <lists+linux-fbdev@lfdr.de>; Wed, 25 May 2022 14:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237667AbiEYMBu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 25 May 2022 08:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiEYMBt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 25 May 2022 08:01:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA30FDD;
        Wed, 25 May 2022 05:01:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 22D861F44D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653480101;
        bh=F1F4jhbrNEQ3CCy7KGKBR+is9F4rhkQOEU0CQ1t/4vI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZaUKr/IggQ5jzu5IdAvmbRfj072K4RQwepDOrvHjQ9MwkmtGkxO2gtj7YfrKtV3HO
         qnfdRjJwuNxI+0Ir0hKlxSvSwCtBIawpDNThcWifoltYpNGG8lse1rhjNeCDFNoM3V
         Xl9tx06OUvZMtWhT8Y5uvNWkRKwBZ1gKHqayBiXuDAmwEq7G+2rZJI/opM1w4EPHma
         XMOImZk4iTV/PPRbpu6WyQdtbYTK1Odd4W0DoCFgUuIL2tLd+rqpeSwKMgPD1hbSPc
         GP6tLFP7Q01XExVCL8+bMWopFkWugUCveMrA3G2fkldDmceunmU97OQMpn4gfuSuMY
         ibmA0HdwzZW1Q==
Message-ID: <4c19d5fb-1e45-9149-4208-5d848eeb7565@collabora.com>
Date:   Wed, 25 May 2022 14:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 03/21] drm/edid: Convert cea_sad helper struct to
 kernelDoc
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Helge Deller <deller@gmx.de>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Cc:     dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-4-granquet@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523104758.29531-4-granquet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   include/drm/drm_edid.h | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..37c420423625 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -359,12 +359,18 @@ struct edid {
>   
>   #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
>   
> -/* Short Audio Descriptor */
> +/**
> + * struct cea_sad - Short Audio Descriptor.

Perhaps....

* struct cea_sad - CEA Short Audio Descriptor

...but that's relative to personal liking and nothing else, it's also fine as
it is, if you like it more as it is. The ball is yours :-P

Regardless of any choice about changing the description or not:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> + * @format: See HDMI_AUDIO_CODING_TYPE_*.
> + * @channels: max number of channels - 1.
> + * @freq: See CEA_SAD_FREQ_*.
> + * @byte2: meaning depends on format.
> + */
>   struct cea_sad {
>   	u8 format;
> -	u8 channels; /* max number of channels - 1 */
> +	u8 channels;
>   	u8 freq;
> -	u8 byte2; /* meaning depends on format */
> +	u8 byte2;
>   };
>   
>   struct drm_encoder;

