Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05778506FED
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Apr 2022 16:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345595AbiDSOSY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Apr 2022 10:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347044AbiDSOSW (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Apr 2022 10:18:22 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6138D6146
        for <linux-fbdev@vger.kernel.org>; Tue, 19 Apr 2022 07:15:38 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu29so29723195lfb.0
        for <linux-fbdev@vger.kernel.org>; Tue, 19 Apr 2022 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qxyAAJCwk86YjxNZvzK22H+Q1D0EYzqfXkSlEcQ3oGI=;
        b=U8TznkIEfkbn6wBOe66bedzDevL3UCKOj2LIyC+yTGFJGe6H3CAWKuIFxq5wvflo2M
         YPqSiNhdSo2UNK5R9O5lCdht+dpY1uQXmpjL/Z2JFciY07hF8cmoQIVlKVZcMQkrMdzh
         xQm2rYQ0y3EHpvQGdBCAJQhmqrJzsgMGbbKb5iv69GK1zwsTBUeeLrPf+fWbm8h+OHA8
         vn0GNOWufxa2UwVQxTLp7VsjdfB/OMoUd3kiZk3aI2ynnkLj6hV4IE9GaixWqYMB2hOy
         2zvKaEDzVunsnL9lz2/5ZLP2otiiwePv+BwjP1+txAY9RzGc80diIVCJYeA3N5BV6gHd
         SN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qxyAAJCwk86YjxNZvzK22H+Q1D0EYzqfXkSlEcQ3oGI=;
        b=wcxGUJQ1j+RQ8Bw0gJdUCE5NX+ET8xTW9mo3U8WLfPMqmmRmxxnoe5DQeHiuFUlkI6
         vPlG1mznvW1V+enAs5hZ1+/W8sENiqHY9Gaew5cBZwSPu5ZkowtBo5Siap0YcM4D1Kut
         gId1CBn2dRlIMu8xQgqCUviVKb+uTRgBrRiW7NlIFxegeifs/RTFzesezsBAI8HR2jPe
         ZG5lX8NIXSCaeRcYoyOmjb9yFucYyCYS2xMGbuLJs+m6ZnPjRypz6ihRfZLEVdelvepU
         YAginGDgmEyejUcL7ZiP/MNhQLAN8xjdmLUFUeQLRQeK0LvrPqVR1ax1w8pJTsoPMBAQ
         xeyA==
X-Gm-Message-State: AOAM531kUs5vRP8CDkdsAMbz5EhnEDvEHdpwYDEmB08m0Ao6egIXU7vT
        FWjyahNaO9gDvLrEDxb90h5VAYrYtT3rJ+c0byosMw==
X-Google-Smtp-Source: ABdhPJxIT9MKS48QeVlFyb2PryH3hNOoBA+EcM/qYaYW4YqWA7WkuSzrRWCJdkdrX1W/EdQ0V2GdotZdJALOaahglbM=
X-Received: by 2002:a05:6512:2627:b0:44a:f55c:ded9 with SMTP id
 bt39-20020a056512262700b0044af55cded9mr11491748lfb.373.1650377736569; Tue, 19
 Apr 2022 07:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 Apr 2022 16:15:00 +0200
Message-ID: <CAPDyKFpNx9xt1xwO-EKAx_qYtfcM5RUC6=Kh9NZ5o+A=H5ut6A@mail.gmail.com>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        Kevin Hilman <khilman@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Mark Brown <broonie@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 19 Apr 2022 at 15:37, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is the full series for converting OMAP1 to multiplatform, rebased
> from my 2019 attempt to do the same thing. The soc tree contains simpler
> patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> means we are getting closer to completing this for all ARMv5 platforms
> (I have patches for PXA, which is the last one remaining).
>
> Janusz already tested the branch separately and did the missing work
> for the common-clk conversion after my previous approach was broken.
>
> The fbdev, mmc and ASoC portion of Janusz' work already went into the
> corresponding maintainer tree, but I include them here for reference.
> Unless there are any objections, I would add the entire series to the
> for-next branch of the soc tree, but only send the first 36 patches early
> in the merge window. After everything else has made it in, I would rebase
> the last two patches and send them separately, which may or may not make
> it in the merge window.

Sounds like a good plan to me. I usually send the MMC pull-request on
Mondays, the first day of the merge window.

[...]

Kind regards
Uffe
