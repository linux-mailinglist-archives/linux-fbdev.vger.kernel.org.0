Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEBCD4E7B7E
	for <lists+linux-fbdev@lfdr.de>; Sat, 26 Mar 2022 01:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiCYT2X (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 25 Mar 2022 15:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiCYT1t (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 25 Mar 2022 15:27:49 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79F21F9FE4
        for <linux-fbdev@vger.kernel.org>; Fri, 25 Mar 2022 12:01:18 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w127so9130408oig.10
        for <linux-fbdev@vger.kernel.org>; Fri, 25 Mar 2022 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:user-agent:references:in-reply-to:mime-version:date:message-id
         :subject:to:cc;
        bh=UsVgeYfaJ509Tslgy60qrERiqqOcqL3jk0p30JmJkWQ=;
        b=hhlRnUQXbyBJmzhAL+CM/0K5cZ1aybx8S1kxzmMXQQ4jS6mL1MILd20jSy8DtFbZHZ
         tuiUZm+wRRIEudV/r9pD63VU89MvND8veQkiyC4DYFenrNwPvhByBOwC13TA9CwbQoZ/
         jGyLtzGYZlTMgGGCNq7KOzeYzg399O6i2BX+1n0HlxBLm5I1XYjCgzyXuCuVBqmvEyAP
         Obn9n0SJjJ7Dlyj5c+00dybeH9tzrLGeCLK7O+mUw9yTJ/J9CxTNS1DxTor3+3TbHX21
         6dvmswhw1vgSH8FA6KcEemRrApsTi9zOTOVWSQ5cLXC0uTq8h0Ji3+mG+HcpDEdXStN1
         ZkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:user-agent:references:in-reply-to
         :mime-version:date:message-id:subject:to:cc;
        bh=UsVgeYfaJ509Tslgy60qrERiqqOcqL3jk0p30JmJkWQ=;
        b=Oq3mnXl2l9gvnt822NAOCqIVnY9LR2rUgwtwH7iyo0JUxenp75ClCBjPinP+LCY/rX
         LOlBd3IlaBwqk5Um8KkQzlB3onlB/aX2czIiZ2rDNJWSafq9KXbHN+jCrWxAfo/X6glw
         mqqeyUKxPxwcHZMOoV3K4l5x+m8CeDYS4PFtf48m1FPpqxEcTgSwlSnT1Y7JeqPbli3Y
         i7LDg/HkDY9/FYsc07SZd5m1oweIM6IyApIUTWRqrBmzxBj7opUkZ789Ob51nip8asfJ
         4z6nAaQrMPFtIl3U2VmEQSy6epa8F+iqasTtzjO3DOzQQIpL0qIU3KiNZUbmy3/Kq5de
         kOBw==
X-Gm-Message-State: AOAM532a/kRQ6fykPQK/vGYJ9bG2H8U+o7ztcc7tah5g1KaLZQavMjck
        I9WhEEIHfcOXQY0NxMG4hMdcXgLumEEagrq/1V99iCaB/hQ=
X-Google-Smtp-Source: ABdhPJw5cZK8/9EAx8SjjCkfF2UirJgUYGr8gfKiuxQmwCyGvJA58RP/M318o7Lu6s72crly3nL6u8xwlk9WEs9kfFQ=
X-Received: by 2002:a05:6870:d191:b0:dd:a91e:82dc with SMTP id
 a17-20020a056870d19100b000dda91e82dcmr9542770oac.248.1648230822908; Fri, 25
 Mar 2022 10:53:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 12:53:42 -0500
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220325171511.23493-1-granquet@baylibre.com>
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
Date:   Fri, 25 Mar 2022 12:53:42 -0500
Message-ID: <CABnWg9tJvCJrFCFR1Ax_M4gPaqhqS94kCkzmfb-naCh_S36vEg@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/mediatek: Add mt8195 DisplayPort driver
To:     angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
        chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org,
        deller@gmx.de, ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org,
        markyacoub@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 25 Mar 2022 18:14, Guillaume Ranquet <granquet@baylibre.com> wrote:
>this series is built around the DisplayPort driver. The dpi/dpintf
>driver and the added helper functions are required for the DisplayPort
>driver to work.
>
>This v9 is not quite ready yet, as project constraints forces me to
>publish v9 this week, I'm sorry if it's not standard practice.
>
>Moreover, it is still un-tested on a recent kernel.
>The integration kernel we are using is still based on 5.10... but we
>are actively working on bringing up a mt8195 integration branch on 5.17.
>The patches have been rebased on top of next-20220301 and have been
>tested to build sucessfully (no functional testing).
>
>Changes from v8:
>- The DP-Phy now has its own dt-bindings and now shares a regmap using the
>  syscon facility with the DP driver.
>- hot plug detection has been removed from the Embedded Display Port.
>  patch and moved to the patch adding External Display Port support.
>- started working on better error handling for the mtk_dp driver.
>- rebased on linux-next.
>- removal of tvd pll clocks re-introduced by mistake.
>- various coding style fixes.
>
>Things that are in my todolist for v10:
>- fixing the train_handler in the mtk_dp driver, as I haven't been able
>  to reproduce locally (hopefully migrating to running the tests on a
>  more recent kernel will help)
>- explaining the various sleep/delays introduced in the drivers
>- explaining some of the differences between mt8195 and "legacy"
>- retrieve CK/DE support from panel driver instead of hardcoding it into
>  the dpi driver.
>- better error handling/reporting in mtk_dp
>- look into re-implementing mtk_dp_aux_transfer() using drm_dp_dpcd_read and
>  drm_dp_dpcd_write as suggested by Rex.
>
>Older revisions:
>RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
>v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
>v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
>v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
>v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
>v5  - https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
>v6  - https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/
>v7  - https://lore.kernel.org/linux-mediatek/20211217150854.2081-1-granquet@baylibre.com/
>v8  - https://lore.kernel.org/linux-mediatek/20220218145437.18563-1-granquet@baylibre.com/
>
>Functional dependencies are:
>- Add Mediatek Soc DRM (vdosys0) support for mt8195
>  https://lore.kernel.org/all/20211026155911.17651-1-jason-jh.lin@mediatek.com/
>- Add MediaTek SoC DRM (vdosys1) support for mt8195
>  https://lore.kernel.org/all/20211029075203.17093-1-nancy.lin@mediatek.com/
>
>Guillaume Ranquet (15):
>  dt-bindings: mediatek,dp_phy: Add Display Port PHY binding
>  drm/edid: Convert cea_sad helper struct to kernelDoc
>  drm/edid: Add cea_sad helpers for freq/length
>  drm/mediatek: dpi: move dpi limits to SoC config
>  drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
>  drm/mediatek: dpi: implement a swap_input toggle in SoC config
>  drm/mediatek: dpi: move dimension mask to SoC config
>  drm/mediatek: dpi: move hvsize_mask to SoC config
>  drm/mediatek: dpi: move swap_shift to SoC config
>  drm/mediatek: dpi: move the yuv422_en_bit to SoC config
>  drm/mediatek: dpi: move the csc_enable bit to SoC config
>  drm/mediatek: dpi: Add dpintf support
>  drm/meditek: dpi: Add matrix_sel helper
>  drm/mediatek: Add mt8195 External DisplayPort support
>  drm/mediatek: DP audio support for mt8195
>
>Jitao Shi (2):
>  drm/mediatek: add hpd debounce
>  drm/mediatek: change the aux retries times when receiving AUX_DEFER
>
>Markus Schneider-Pargmann (5):
>  dt-bindings: mediatek,dpi: Add DP_INTF compatible
>  dt-bindings: mediatek,dp: Add Display Port binding
>  video/hdmi: Add audio_infoframe packing for DP
>  phy: phy-mtk-dp: Add driver for DP phy
>  drm/mediatek: Add mt8195 Embedded DisplayPort driver
>
> .../display/mediatek/mediatek,dp.yaml         |   97 +
> .../display/mediatek/mediatek,dpi.yaml        |   11 +-
> .../bindings/phy/mediatek,dp-phy.yaml         |   43 +
> MAINTAINERS                                   |    1 +
> drivers/gpu/drm/drm_edid.c                    |   74 +
> drivers/gpu/drm/mediatek/Kconfig              |    8 +
> drivers/gpu/drm/mediatek/Makefile             |    2 +
> drivers/gpu/drm/mediatek/mtk_dp.c             | 3204 +++++++++++++++++
> drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  568 +++
> drivers/gpu/drm/mediatek/mtk_dpi.c            |  222 +-
> drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    8 +
> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
> drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
> drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
> drivers/phy/mediatek/Kconfig                  |    8 +
> drivers/phy/mediatek/Makefile                 |    1 +
> drivers/phy/mediatek/phy-mtk-dp.c             |  202 ++
> drivers/video/hdmi.c                          |   82 +-
> include/drm/dp/drm_dp_helper.h                |    2 +
> include/drm/drm_edid.h                        |   25 +-
> include/linux/hdmi.h                          |    7 +-
> include/linux/soc/mediatek/mtk-mmsys.h        |    3 +-
> 23 files changed, 4541 insertions(+), 73 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
>
>--
>2.34.1
>

This is actually v9.
Please ignore these as I will resend the patches properly tagged as v9.

Sorry for the inconveniance,
Guillaume.
