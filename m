Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4372447D0DB
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 Dec 2021 12:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244591AbhLVLTE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 Dec 2021 06:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244586AbhLVLTE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 Dec 2021 06:19:04 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D757C061746
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Dec 2021 03:19:03 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g132so1347882wmg.2
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Dec 2021 03:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/reVXFbwGvPtptFEcS4POHmCemx6nGpkPPsCHK0zcq8=;
        b=J5WWWvc3IuUjHTnsVCR24J6M6u9Kij+YAFcbqiLiwRsCR3JK6zKt1kUoLW7hfutiFp
         bjHdydoVbizMsaxlerROgGyk8ySUOE98cWEOSRSGIQ7hT9qDrOBxhoOQI2h1nVu2eRSu
         CjVizaNQZbKf0QXl8/XJACmJHDimmGHIn1jocmclYhrGj4VES2uGhaeN+iFM6+uPj/Rx
         jYeZBScOaSi6em7f6XS+pVQVklNbmfl09oP3zsayg3tUX4Y8SoKu9ghCyQxJrVi49/VR
         hZ+y+JxQoeGMBDf6hiXzkW+HUr4TOeD1gLJJllkFmWAz72D/owIg1JCV6qYoGF0PWyml
         cHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/reVXFbwGvPtptFEcS4POHmCemx6nGpkPPsCHK0zcq8=;
        b=ioJ4mMUnhMsVpJiU6ec753VhXGQmGYAx/+wmQMWalINXhC6uKaTmVUl+K6b4GE7bFR
         hdNzYhZ9PS8jTfekKbnroa/V9AZYJ3yjo6TED15tatN2sX8DvOOXZAfx9Vgwxv71KjON
         ct3er0cURc6oepiq+xUYx9+ghrcCrjFUjn27ibCXPeBMcmDlkJ6G2xYkCbz176GhKfxG
         FHqM925yGBEBf+2tsFZyDHL4wVygL55pBJiwOJucEZW1eqHYFs34y7nra7cMPGgsR4K9
         7T4MHtHO27ZF3CZ6YRLPlGzzFMqIaBNM07AmpiT5soeyQIkJ0SWlToC2DlolvIK4HaOR
         YD8Q==
X-Gm-Message-State: AOAM531Pb8ZB8s4nWIhzZN3LCH7u5lhLEdQzWtgPT7LcVmwBaQAqhqkJ
        Nhuoh+Llpsni9tcHlTEh8obqDA==
X-Google-Smtp-Source: ABdhPJwZmMqp90ob6RIH01SOsHCsXi+jUYNxlqmIKZvvGMW6B9dTSDKKs8jRlE62lkhrubrAM9iLjg==
X-Received: by 2002:a05:600c:6009:: with SMTP id az9mr626439wmb.32.1640171942136;
        Wed, 22 Dec 2021 03:19:02 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id i8sm809626wry.108.2021.12.22.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:19:01 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:18:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 9/9] backlight: qcom-wled: Respect enabled-strings in
 set_brightness
Message-ID: <YcMJoyVF4n8yDPUY@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-10-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-10-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> The hardware is capable of controlling any non-contiguous sequence of
> LEDs specified in the DT using qcom,enabled-strings as u32
> array, and this also follows from the DT-bindings documentation.  The
> numbers specified in this array represent indices of the LED strings
> that are to be enabled and disabled.
> 
> Its value is appropriately used to setup and enable string modules, but
> completely disregarded in the set_brightness paths which only iterate
> over the number of strings linearly.
> Take an example where only string 2 is enabled with
> qcom,enabled_strings=<2>: this string is appropriately enabled but
> subsequent brightness changes would have only touched the zero'th
> brightness register because num_strings is 1 here.  This is simply
> addressed by looking up the string for this index in the enabled_strings
> array just like the other codepaths that iterate over num_strings.
> 
> Likewise enabled_strings is now also used in the autodetection path for
> consistent behaviour: when a list of strings is specified in DT only
> those strings will be probed for autodetection, analogous to how the
> number of strings that need to be probed is already bound by
> qcom,num-strings.  After all autodetection uses the set_brightness
> helpers to set an initial value, which could otherwise end up changing
> brightness on a different set of strings.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Fixes: 03b2b5e86986 ("backlight: qcom-wled: Add support for WLED4 peripheral")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
