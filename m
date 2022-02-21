Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1078A4BD3E7
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Feb 2022 03:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343993AbiBUClN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 20 Feb 2022 21:41:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238658AbiBUClM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 20 Feb 2022 21:41:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763CB201BD;
        Sun, 20 Feb 2022 18:40:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0EAA361121;
        Mon, 21 Feb 2022 02:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1AEC340FC;
        Mon, 21 Feb 2022 02:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645411249;
        bh=bFvQNAVbGlS7Vkgnjf6TBiEr7ZXdUWSxzalTjblThqE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iOYpZ2RVDoZAyMqglzcqxB77Kn23NhumIkrWlWsgMLG7zA8Q2HUuKaf0ipbHD0CGd
         vV0i0mCqfEjrzAVlC/+8zFYxsxpJSNZ0zn71+DkAWdJ7Q0vAZnpeEE9sg8BW+5XWQ9
         amaKz06WAgN7qj1LrM4IcCudViHKWnOtzX6hXsGSbfQRMztAQgeYeN/ESpG0sigFCi
         /ttN43FUaa3fLNP/lBM7feYg7oBzFY2k+vBFLYr4EdK/kRa41WJQJEbmO6ncLEi54H
         ATPW7yxxPVIJZ7pKwL+xoIQHtN8M0MjlVgJjCxlcj5/J5CP0XGsiHhzIEVT3m2PlLo
         zOCTIgkiWe+og==
Received: by mail-ej1-f46.google.com with SMTP id r13so6307345ejd.5;
        Sun, 20 Feb 2022 18:40:49 -0800 (PST)
X-Gm-Message-State: AOAM5328kLL2/OMR4TocWTyq2/X0WvpYGiD2/7KJ4Gns+cEjVGVmrlTm
        aftmJLm9mOPkIH8IxAS0xny4GWdvEqnS453Q3A==
X-Google-Smtp-Source: ABdhPJxIHE/AHCRll/nSdxrQ+Ux5BiWkeUzMrG89lMATKPsbYYOa8h8y1euGyif6EtqH2TYXRNJ80g4ZoB5oWBNlWs8=
X-Received: by 2002:a17:907:a06c:b0:6c9:408e:cec with SMTP id
 ia12-20020a170907a06c00b006c9408e0cecmr13894591ejc.510.1645411247627; Sun, 20
 Feb 2022 18:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com> <20220218145437.18563-9-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-9-granquet@baylibre.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Mon, 21 Feb 2022 10:40:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
Message-ID: <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
Subject: Re: [PATCH v8 08/19] drm/mediatek: dpi: move dimension mask to board config
To:     Guillaume Ranquet <granquet@baylibre.com>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, deller@gmx.de,
        CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

HI, Guillaume:

Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add flexibility by moving the dimension mask to the board config

After change 'board' to 'SoC',

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 454f8563efae4..8ca3455ed64ee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -127,6 +127,8 @@ struct mtk_dpi_conf {
>         u32 num_output_fmts;
>         bool is_ck_de_pol;
>         bool swap_input_support;
> +       // Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no =
shift)
> +       u32 dimension_mask;
>         const struct mtk_dpi_yc_limit *limit;
>  };
>
> @@ -156,30 +158,30 @@ static void mtk_dpi_disable(struct mtk_dpi *dpi)
>  static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
>                                  struct mtk_dpi_sync_param *sync)
>  {
> -       mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> -                    sync->sync_width << HPW, HPW_MASK);
> -       mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> -                    sync->back_porch << HBP, HBP_MASK);
> +       mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH, sync->sync_width << HPW,
> +                    dpi->conf->dimension_mask << HPW);
> +       mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->back_porch << HBP,
> +                    dpi->conf->dimension_mask << HBP);
>         mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> -                    HFP_MASK);
> +                    dpi->conf->dimension_mask << HFP);
>  }
>
>  static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
>                                  struct mtk_dpi_sync_param *sync,
>                                  u32 width_addr, u32 porch_addr)
>  {
> -       mtk_dpi_mask(dpi, width_addr,
> -                    sync->sync_width << VSYNC_WIDTH_SHIFT,
> -                    VSYNC_WIDTH_MASK);
>         mtk_dpi_mask(dpi, width_addr,
>                      sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
>                      VSYNC_HALF_LINE_MASK);
> +       mtk_dpi_mask(dpi, width_addr,
> +                    sync->sync_width << VSYNC_WIDTH_SHIFT,
> +                    dpi->conf->dimension_mask << VSYNC_WIDTH_SHIFT);
>         mtk_dpi_mask(dpi, porch_addr,
>                      sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> -                    VSYNC_BACK_PORCH_MASK);
> +                    dpi->conf->dimension_mask << VSYNC_BACK_PORCH_SHIFT)=
;
>         mtk_dpi_mask(dpi, porch_addr,
>                      sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> -                    VSYNC_FRONT_PORCH_MASK);
> +                    dpi->conf->dimension_mask << VSYNC_FRONT_PORCH_SHIFT=
);
>  }
>
>  static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
> @@ -813,6 +815,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
> +       .dimension_mask =3D HPW_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -825,6 +828,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
> +       .dimension_mask =3D HPW_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -836,6 +840,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
> +       .dimension_mask =3D HPW_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -847,6 +852,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
> +       .dimension_mask =3D HPW_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> --
> 2.34.1
>
