Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B062E2A4C1B
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Nov 2020 17:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgKCQ66 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Nov 2020 11:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbgKCQ66 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Nov 2020 11:58:58 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69AEC0617A6
        for <linux-fbdev@vger.kernel.org>; Tue,  3 Nov 2020 08:58:55 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id k18so8723wmj.5
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Nov 2020 08:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HqZuOp1IITKuiPPZaNsPGJeGO0RvbPcrP3kFi4nxuE8=;
        b=YyYsWNkrDNuDCpBgKSwGff4dnxBPuEnHIujXjJob4UwYR9oZMzoahOm0S6UDEuelBp
         0JiaTPUTaGdcEPBqTBiLK9gZ4wGWog+PhgUGKPaMeD1SiQ2wOFNxmx0YcsNVl6p7Ts70
         551GO9y9V1INFtKFyblT/ajtDwMRnyAH0sn2Fho/SZHEx/7sOvp7W0PLVuSpozEVODbX
         hzVklKagnDgIDsk7B0+YcYDLkWtyuGeMdIU0FNNIegNuaGtGTMYaezd7GKzoEcvn8Cmj
         SbhGqB/vLR3JSCyd8MgiN8b6EHd80yEgW1FgS8tQS2Sn/MpCEsXGba6CRvT1hFrUzWDr
         xwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HqZuOp1IITKuiPPZaNsPGJeGO0RvbPcrP3kFi4nxuE8=;
        b=ISffFl/rWyKMylz0rYeIatwcwm/htq6Z4vmPq67fX+SbQZx/QpLDampdeNenj3t25E
         3c9iP+0D+Yq3z/XG2HP0wDqkOkxo1NB2dEp6JXY7xf8pRpRadgRq6K72/m5FWPsiTsRv
         TzOc1uzCkqdu0ak6YBRFqj+mX7f5MmN7ICYDWp5C482MBeR1jaHiUHxIlvoYhUt7J6fh
         bKiKpLtaw3DgslAqDa3lIWUayG4xkRZtlPf8KSTrzI9a6uVCginicUswocGf3Wg72Hs6
         JPll4xnayRiXivMY3dcj5iOtxLlJWFhZFMryQI4rvUt3OrhS4gKsiKm7mIZoCLNtXNhO
         p0+g==
X-Gm-Message-State: AOAM533PmHjW3iXsA3h2hZiOqnG8PSwiuh3D04sdcEIJ3RH1nh5njdS6
        VJSDXRoYLQ7zJrG5FvAWJ7YmJw==
X-Google-Smtp-Source: ABdhPJyKFVzDM1bYQ7reHvRRi8XCIV24MNoWqNViuGekTs+HNbjzL62ZGEz0MRy0rZGLpTKBpe5IdQ==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr100113wmi.42.1604422734274;
        Tue, 03 Nov 2020 08:58:54 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id g14sm26953238wrx.22.2020.11.03.08.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:58:53 -0800 (PST)
Date:   Tue, 3 Nov 2020 16:58:51 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Sebastian Reichel <sre@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3] MAINTAINERS: add Dan Murphy as TI LP8xxx drivers
 maintainer
Message-ID: <20201103165851.uabbg4zazofyis62@holly.lan>
References: <20201103162832.14085-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103162832.14085-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Nov 03, 2020 at 05:28:32PM +0100, Krzysztof Kozlowski wrote:
> Milo Kim's email in TI bounces with permanent error (550: Invalid
> recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> credits and add Dan Murphy from TI to look after:
>  - TI LP855x backlight driver,
>  - TI LP8727 charger driver,
>  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Acked-by: Dan Murphy <dmurphy@ti.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>

> 
> ---
> 
> Dear Lee,
> 
> Could you take care about this patch?

Just in case Lee wants it:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
