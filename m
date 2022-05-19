Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1183452DA28
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 May 2022 18:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241992AbiESQ1H (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 May 2022 12:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241996AbiESQ1D (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 May 2022 12:27:03 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E89D4116
        for <linux-fbdev@vger.kernel.org>; Thu, 19 May 2022 09:27:01 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id w10so3496215vsa.4
        for <linux-fbdev@vger.kernel.org>; Thu, 19 May 2022 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:user-agent:references:in-reply-to:mime-version:date:message-id
         :subject:to:cc;
        bh=D3BsvTGZmL9aXn8JC2DlxbBhxOaQqmVN5f5pOf4WE4o=;
        b=Wdbve9pVOQfTCQ8qHIZq21Qqz+xsUOAaavE8ZtUJ9EblcqE54EBHnNXjuCxpwYGpor
         x4JgBbxZg77ZEAnCTT0kqlEZ/o/n17D8A0eVw1bfm2qy1z6ki8Rk1os7osw5nwYQtmDJ
         dWe7PFxstS5Yi5ZvCBNqRNNi55N7BlBUXf4UbrdAgQFpVWfVo7+Qk0uy/cnuWKCmsn1F
         B7HDdWZgo2ml5tOL/yDMoTEHgTVr2MA4oll4/SoapPprGkcSufMBge8WouN5+m6vPQ49
         A+4KWf4Mi66zOuv/wwToUPvT+BZC3ilqbBHUO6PSVKpTz/Hmp8QRDEB6XzvnVrGrAt6Y
         o6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:user-agent:references:in-reply-to
         :mime-version:date:message-id:subject:to:cc;
        bh=D3BsvTGZmL9aXn8JC2DlxbBhxOaQqmVN5f5pOf4WE4o=;
        b=wKgOrQqbNDCFMhzIKY2oWa4g4giqny6yip+XP3Ui5wrXMa59S3g9daGYlIROMeshfj
         OeSysIokuMp6DRxV9jCuZu3nhedVD3BNrmd+nUwVmt21M+5+Qyk7mrYC54vlMhbGzVZM
         MuXXknySUgr2Dh4cIMjSgwNmag5EbHsDzguin987MD+eDhSAZdPhdQABNZ8NVRsOHj+5
         J4DGqHvHr2izA6k827r5SGMzc2z7fiRuDW54W1YjURKKTl4azPjjIe2xv823enR3nwfd
         FFcN0paGHvLH9oZU2BqPq5Lrs+WZZ8lfN8DZTSvzLk8YoY1pjJYC17ohawgpuSxx7Lkw
         vsgw==
X-Gm-Message-State: AOAM5329TM52gr6VE2+G5PYwA/wwj5w5RT+KxQUshOaGXWQViIqeu7pQ
        BBGoT+SBKSp8niILvqUugRyaEOFTVrZyLcM1jyzLMKrkkoc=
X-Google-Smtp-Source: ABdhPJx+NNr1h6VgTuwMD1Bhi8EcRUBgWUvE0krCGgcnnrPzo4cs17ylt6Dfy/iIo/Qh4cdkDItrCl7KQ2kO/HmmW/M=
X-Received: by 2002:a67:d516:0:b0:335:c0b5:1e5d with SMTP id
 l22-20020a67d516000000b00335c0b51e5dmr2517279vsj.13.1652977620240; Thu, 19
 May 2022 09:27:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 09:26:59 -0700
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com> <20220327223927.20848-19-granquet@baylibre.com>
 <20220429083933.q3w75q3zuyyuvo4w@houat> <CABnWg9tzhZjrdKT4chkDrY-uH8BMUoxyNLUSwfuG6Sv1J+8ddg@mail.gmail.com>
 <20220512074446.ihilbbnbuwesxbbg@houat>
In-Reply-To: <20220512074446.ihilbbnbuwesxbbg@houat>
MIME-Version: 1.0
Date:   Thu, 19 May 2022 09:26:59 -0700
Message-ID: <CABnWg9tHRc_7VZ1z6NeMEDfQvxam_xOimBnM=hzBUqkhzPOSCA@mail.gmail.com>
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort driver
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     airlied@linux.ie, angelogioacchino.delregno@collabora.com,
        chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org,
        ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de,
        jitao.shi@mediatek.com, kishon@ti.com, krzk+dt@kernel.org,
        maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de,
        vkoul@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, markyacoub@google.com,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 12 May 2022 09:44, Maxime Ripard <maxime@cerno.tech> wrote:
>Hi,
>
>On Wed, May 11, 2022 at 05:59:13AM -0700, Guillaume Ranquet wrote:
>> >> +#include <drm/drm_atomic_helper.h>
>> >> +#include <drm/drm_bridge.h>
>> >> +#include <drm/drm_crtc.h>
>> >> +#include <drm/dp/drm_dp_helper.h>
>> >> +#include <drm/drm_edid.h>
>> >> +#include <drm/drm_of.h>
>> >> +#include <drm/drm_panel.h>
>> >> +#include <drm/drm_print.h>
>> >> +#include <drm/drm_probe_helper.h>
>> >> +#include <linux/arm-smccc.h>
>> >> +#include <linux/clk.h>
>> >> +#include <linux/delay.h>
>> >> +#include <linux/errno.h>
>> >> +#include <linux/kernel.h>
>> >> +#include <linux/mfd/syscon.h>
>> >> +#include <linux/nvmem-consumer.h>
>> >> +#include <linux/of.h>
>> >> +#include <linux/of_irq.h>
>> >> +#include <linux/of_platform.h>
>> >> +#include <linux/phy/phy.h>
>> >> +#include <linux/platform_device.h>
>> >> +#include <linux/pm_runtime.h>
>> >> +#include <linux/regmap.h>
>> >> +#include <sound/hdmi-codec.h>
>> >> +#include <video/videomode.h>
>> >> +
>> >> +#include "mtk_dp_reg.h"
>> >> +
>> >> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
>> >> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
>> >> +
>> >> +//TODO: platform/device data or dts?
>> >
>> >DTS :)
>>
>> It's probably going to be a platform_data struct for v10...
>> If I have time, I'll change it to a dts property for v10.
>
>I can't really imagine a case where we would need platform_data
>nowadays. If you have a device tree, then it should be part of the
>binding.
>
>What issue would you like to address by using a platform_data?
>

Ok, I'll migrate to dt then. I didn't realize platform_data were depreciated.

Angelo wants the MAX_LINRATE and MAX_LANES defines to be configurable.
I imagined platform_data would be more appropriate as (per my understanding) the
limitation is associated with a specific SoC.

>> >> +static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
>> >> +{
>> >> +	return connector_status_connected;
>> >> +}
>> >
>> >I'm not quite sure what's going on there. You seem to have some support
>> >for HPD interrupts above, but you always report the display as
>> >connected?
>> >
>> >I'd assume that either you don't have HPD support and then always report
>> >it as connected, or you have HPD support and report the current status
>> >in detect, but that combination seems weird.
>>
>> The HPD logic needs more work, some things have been broken when I split
>> the driver into three patches eDP - DP - Audio
>> The assumption at first was that eDP didn't need any HPD handling... but it
>> seems I was wrong and the eDP driver needs to be reworked.
>
>That can be made into a patch of its own if you prefer.
>
>You first introduce the driver without status reporting (always
>returning connected or unknown), and then add the needed bits for HPD.
>
>However, that first patch shouldn't contain the interrupt plumbing and
>so on, it's just confusing.
>

After discussing a while with Mediatek, it appears that hot plug detection
needs to be handled even for eDP... (which is always connected).
So I'll revert to the split I made earlier in v8 where hot plug detection was
part of the eDP patch the addition of the External display port was a
trivial patch [1].

>> >> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
>> >> +				    struct drm_connector *connector)
>> >> +{
>> >> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>> >> +	bool enabled = mtk_dp->enabled;
>> >> +	struct edid *new_edid = NULL;
>> >> +
>> >> +	if (!enabled)
>> >> +		drm_bridge_chain_pre_enable(bridge);
>> >> +
>> >> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
>> >> +	usleep_range(2000, 5000);
>> >> +
>> >> +	if (mtk_dp_plug_state(mtk_dp))
>> >> +		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
>> >> +
>> >> +	if (!enabled)
>> >> +		drm_bridge_chain_post_disable(bridge);
>> >
>> >Are you sure we can't get a mode set while get_edid is called?
>> >
>> >If we can, then you could end up disabling the device while it's being
>> >powered on.
>>
>> I'm a bit unsure, I need to spend more time in the drm stack to make sure.
>> I'll get back to you when I have a definitive answer.
>
>So, it looks like it's ok.
>
>get_edid is your implementation of get_modes, which is called by
>drm_helper_probe_single_connector_modes
>
>https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_probe_helper.c#L416
>
>This is the standard implemantion of fill_modes, which is called
>whenever the get_connector ioctl is called (or similar paths, like
>drm_client_modeset_probe)
>
>drm_helper_probe_single_connector_modes is under the assumption that the
>mode_config.mutex is held though, and that the big lock. So it should be
>serialized there.
>
>Just for future proofing though, it would be better to use refcounting
>there. Would runtime_pm work for you there?
>

Thx for looking into this for me.
Not sure runtime_pm works here as it would only refcount if compiled
with CONFIG_PM?
I'd rather use the enabled field as a refcounter instead of a boolean.

Unless I'm totally missing your point?

Thx,
Guillaume.

>> >> +static void mtk_dp_parse_drm_mode_timings(struct mtk_dp *mtk_dp,
>> >> +					  struct drm_display_mode *mode)
>> >> +{
>> >> +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
>> >> +
>> >> +	drm_display_mode_to_videomode(mode, &timings->vm);
>> >> +	timings->frame_rate = mode->clock * 1000 / mode->htotal / mode->vtotal;
>> >
>> >drm_mode_vrefresh()
>> >
>> >> +	timings->htotal = mode->htotal;
>> >> +	timings->vtotal = mode->vtotal;
>> >> +}
>> >
>> >It's not really clear to me why you need to duplicate drm_display_mode
>> >here?
>> >
>> It's saved to be re-used in mtk_dp_set_msa().
>> It's not ideal, I'll check if I can get the mode directly from mtk_dp_set_msa()
>
>Yeah, it looks like mtk_dp_set_msa() uses fairly straightforward values,
>this will be just as easy with drm_display_mode.
>
>Maxime


[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220218145437.18563-17-granquet@baylibre.com/
