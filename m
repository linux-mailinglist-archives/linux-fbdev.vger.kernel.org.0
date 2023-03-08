Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4926B068E
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Mar 2023 13:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjCHMEf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Mar 2023 07:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjCHMEe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Mar 2023 07:04:34 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FF5B8625
        for <linux-fbdev@vger.kernel.org>; Wed,  8 Mar 2023 04:04:30 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p16so9644108wmq.5
        for <linux-fbdev@vger.kernel.org>; Wed, 08 Mar 2023 04:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678277069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amflx+MPu/55qREv7D1gpSWbJ6NWDsdR+AZRDR7ovnE=;
        b=MXXuoAJ25BhikwDMJMbsOMMSMTpkbh236/a+M7b/jvA/yI2WL8SKcnJseSiiTCATdv
         ygqlltiWCufIHuCEJMDnUjiNuXT+L46Bjff6zQncWfRMPoJRqeq88lx1I7fznBoo9f/C
         5i+6ag5xC/vwCsuF5Llp00jNeH+zhHkBKjfiDq4sBIWepdUjQrCx9R1Y7oD5NklTCbmJ
         uu9IEi6ZiZGowy4ePxMiVGKFpRPZwOhe8F5App/XMXzVlJkaC8zDAigwkr4vtC/8q2OT
         54Gj6NJp2shY2QwYlupJrlElYNiF9bzE5fPZf015nbNbfc7C+vs4RmM1/yFmN77Rg97r
         aZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678277069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amflx+MPu/55qREv7D1gpSWbJ6NWDsdR+AZRDR7ovnE=;
        b=IQKBmKvznbxKFBCt1sJFVlwRKDoxDErlrBtM118+O8ObUVmvMq9TaMZSotGwPRYAOh
         7zpR1uGiQDRVM582UG2R8PDYaABqwUbX2cnx+t3Lpl3UEwR/gt6KZ9Zxk4NvCCGOeoON
         lZANKM8jlQorfm7U0lJ669reJsNcGdwVVWBNQxGkz8u6CQRmSly4O6Hp7rRl/CzVjzIo
         76q8AVpglydm/uUVbRnOqt3qiFc3b1wVCmL/io450zY5p4xQC6sS8+erNe1J/zo9p1cy
         YNjNsJQZdnFVrB8RN10udWt3DTeJv5zGK258K+rqy7qI6vFKk8bSFZ7DOguja7o9ybTc
         LKFw==
X-Gm-Message-State: AO0yUKWmVXEb7SGvAPwUi7Fy/WsiIvMZo4EW6BYXmmJ6yq3XKoOlnvBG
        B25/V5uLMx3FsPH3PS/lYw79/w==
X-Google-Smtp-Source: AK7set+BQHFboi4QXgAYqrYtuSpR1zmoAeIuRNLA1tt4tiD/NZOIeUje28/bcJ5vKzbXewtLlkt13Q==
X-Received: by 2002:a05:600c:3512:b0:3ea:e554:7815 with SMTP id h18-20020a05600c351200b003eae5547815mr16957712wmq.9.1678277068004;
        Wed, 08 Mar 2023 04:04:28 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c189500b003e71a6be279sm15336997wmp.37.2023.03.08.04.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 04:04:27 -0800 (PST)
Date:   Wed, 8 Mar 2023 12:04:25 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 00/13] backlight: Convert to platform remove callback
 returning void
Message-ID: <20230308120425.GA6174@aspen.lan>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Mar 08, 2023 at 08:39:32AM +0100, Uwe Kleine-K�nig wrote:
> Uwe Kleine-K�nig (13):
>   backlight: aat2870_bl: Convert to platform remove callback returning
>     void
>   backlight: adp5520_bl: Convert to platform remove callback returning
>     void
>   backlight: cr_bllcd: Convert to platform remove callback returning
>     void
>   backlight: da9052_bl: Convert to platform remove callback returning
>     void
>   backlight: hp680_bl: Convert to platform remove callback returning
>     void
>   backlight: led_bl: Convert to platform remove callback returning void
>   backlight: lm3533_bl: Convert to platform remove callback returning
>     void
>   backlight: lp8788_bl: Convert to platform remove callback returning
>     void
>   backlight: mt6370-backlight: Convert to platform remove callback
>     returning void
>   backlight: pwm_bl: Convert to platform remove callback returning void
>   backlight: qcom-wled: Convert to platform remove callback returning
>     void
>   backlight: rt4831-backlight: Convert to platform remove callback
>     returning void
>   backlight: sky81452-backlight: Convert to platform remove callback
>     returning void

Whole series is:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Thanks!
