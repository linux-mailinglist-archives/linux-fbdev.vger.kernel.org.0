Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503AB425DC9
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 Oct 2021 22:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbhJGUsS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 Oct 2021 16:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241085AbhJGUsS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 7 Oct 2021 16:48:18 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E9FC061570
        for <linux-fbdev@vger.kernel.org>; Thu,  7 Oct 2021 13:46:23 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so9054382ota.6
        for <linux-fbdev@vger.kernel.org>; Thu, 07 Oct 2021 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AzPcN97cKsNPALhXpMD11mH7HEQFoOQxmRwJj4GT2BE=;
        b=VKE1L+LNJEY5RERAvLjjCsaH/jdKjoku3gHwtdboexhAsqiGhsrBthGb5Bevr2KL0+
         jYu0WOqYVJd76tRyLHu5v0RDHRXhT3UI5ixFqKcrvx4m/ZZosj+JGaDDjHY7+j87pVvj
         p0DVEPcEZ8ZyFwHVBRvaQza8MAbygGXJtdr9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AzPcN97cKsNPALhXpMD11mH7HEQFoOQxmRwJj4GT2BE=;
        b=SYNR1LCThasR3tSgHKLifNETJQ2bX+ItAR3A0LBuLY03Dix0AstRTmNwDjFVN6sUFz
         2H5tB4jdwYhmHaTrPwe2vPq58q02w1lsiIlLrl4VePu6nRgvNc876p+Q6iLJflESXO+k
         4kXQFrjBNonX6TKnj7YzmpsXvT5Ioc36ZulbjI0f2/tX2vbPC99pdR9/1xu8R2DBwn5+
         zJ50ckxOmm95RevkW2+gL7ic277SGTlqp9YDpH4mQ+bjhXjjjIopi8QC9NL+IDJ88Z18
         Xz56TMoL76aRgqKIxnw1syIsKvyDVEn0y2FusdCov87V95gh5/y+yfNubfnAoextRAMm
         6PKg==
X-Gm-Message-State: AOAM531eY33VzMV6aBc1rjtNnNoTSpMuYZ4/gLjZoC3vK85zLRWhGrVV
        Q4jPz/tx8ESM1zz09zCzvwi2tO2eSh1xWm+BzQpEyw==
X-Google-Smtp-Source: ABdhPJweLV2SqPIqB/I4y9UNqm9St3+8NImkU0IzW6xIcGeoqaYzaiZnETNJ/uKVGt4qTegoVLXLut8mi4j1L8pdWt0=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id f14mr5293990ote.159.1633639583170;
 Thu, 07 Oct 2021 13:46:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 16:46:22 -0400
MIME-Version: 1.0
In-Reply-To: <5d3f4343-da38-04b4-fdb9-cb2dd4983db2@gmail.com>
References: <20211006193819.2654854-1-swboyd@chromium.org> <5d3f4343-da38-04b4-fdb9-cb2dd4983db2@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 16:46:22 -0400
Message-ID: <CAE-0n50s_cOLA0xRa8mmUS2Nawd5X7WiQE3PvOLHu+i=hE3Eow@mail.gmail.com>
Subject: Re: [PATCH v2 00/34] component: Make into an aggregate bus
To:     Andrzej Hajda <andrzej.hajda@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Emma Anholt <emma@anholt.net>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        James Qian Wang <james.qian.wang@arm.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Sandy Huang <hjc@rock-chips.com>,
        Saravana Kannan <saravanak@google.com>,
        Sebastian Reichel <sre@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Takashi Iwai <tiwai@suse.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Will Deacon <will@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Quoting Andrzej Hajda (2021-10-07 03:16:27)
> Hi Stephen,
>
> On 06.10.2021 21:37, Stephen Boyd wrote:
> > This series is from discussion we had on reordering the device lists for
> > drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> > the aggregate device onto and then we probe the aggregate device once
> > all the components are probed and call component_add(). The probe/remove
> > hooks are where the bind/unbind calls go, and then a shutdown hook is
> > added that can be used to shutdown the drm display pipeline at the right
> > time.
> >
> > This works for me on my sc7180 board. I no longer get a warning from i2c
> > at shutdown that we're trying to make an i2c transaction after the i2c
> > bus has been shutdown. There's more work to do on the msm drm driver to
> > extract component device resources like clks, regulators, etc. out of
> > the component bind function into the driver probe but I wanted to move
> > everything over now in other component drivers before tackling that
> > problem.
>
>
> As I understand you have DSI host with i2c-controlled DSI bridge. And
> there is an issue that bridge is shutdown before msmdrm. Your solution
> is to 'adjust' device order on pm list.
> I had similar issue and solved it locally by adding notification from
> DSI bridge to DSI host that is has to be removed: mipi_dsi_detach, this
> notification escalates in DSI host to component_del and this allow to
> react properly.
>
> Advantages:
> - it is local (only involves DSI host and DSI device),
> - it does not depend on PM internals,
> - it can be used in other scenarios as well - unbinding DSI device driver
>
> Disadvantage:
> - It is DSI specific (but this is your case), I have advertised some
> time ago more general approach [1][2].
>
> [1]: https://static.sched.com/hosted_files/osseu18/0f/deferred_problem.pdf
> [2]: https://lwn.net/Articles/625454/
>

I think these are all points for or against using the component code in
general? Maybe you can send patches that you think can solve the problem
I'm experiencing and we can review them on the list.
