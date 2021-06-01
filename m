Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CA03933AE
	for <lists+linux-fbdev@lfdr.de>; Thu, 27 May 2021 18:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhE0Q1m (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 27 May 2021 12:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235513AbhE0Q1l (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 27 May 2021 12:27:41 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389F0C061574
        for <linux-fbdev@vger.kernel.org>; Thu, 27 May 2021 09:26:08 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m18so509664wrv.2
        for <linux-fbdev@vger.kernel.org>; Thu, 27 May 2021 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sYfRojD79IjGqc7nXmoUz1TVBKWvqSb4uV+m+zK9THk=;
        b=lgrw5ga3WKPAoziTjNoBM5nBMOAQDvKM3uLTPCxqTZFAFeNVTFjk4a/+4JLAdmLVPN
         Dm8Lu+EttQQjXJO/l5z4zx8rCYTD2Dkleix1U0EhD8B1ugYZT4bFp0taxSuw7tAG8LbV
         gRWSOodIJOTqgNWQBrtpf+Wo7H9hJlh5/krjKfdoFbTwlXTxymPpXi3YpQA5AqIknzJj
         ZJnDqjfTLlepY9LvnsOGKpdkltNV0eAgLQSWL5Gv3DIAQQmhT5YCKDYYDHAgH3fPdZ8c
         +YF9sN8dYhVCHfuLCBkwquugfBQtuLj2l2eWCHbWOOgHbPJOAsTzMzCpESvsFhz8pP++
         0dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sYfRojD79IjGqc7nXmoUz1TVBKWvqSb4uV+m+zK9THk=;
        b=Xjml4wLCCwZ9MnupJqkSGZ8gLJ2Z2GCYOvXfNynxMGgQplWtxfXthJdnum4cF/44WU
         LHpy3fQ3Sg9FQwUb8itd89/n9xkazQOBGXQTg2gOI0YPgXe6InwBonmebgnaunpE3d7E
         BG9+HUSF1tyMixcKSYuW74qPAN1OWEbRBrqfp7yu5cIvY2ch+ScWjQABgufwgFJMpzjS
         s+dnaWW59YsEzNAuNJxEIIYJbd7/N11XzXnVyJrL1kXP6nni1xhC/Xa3fDxElc72jixa
         gQUaMtfdHCUzrSXgdVrq6Dey7HoTNiQSIBc/fe4sTtnt8QcLqS7y5iwzxFY8kNj3W6xc
         jcfA==
X-Gm-Message-State: AOAM532Ax95ysk8/MkSZou5SpRmEZcc2jY6y5d2QcOZdp4hxzVQXhirW
        zbfrB7NvLeljXbu82f+Ntsf/Sg==
X-Google-Smtp-Source: ABdhPJxM+yIpAp4eL9sHrYNbLxW3nG30aoIiJSUnb2poiCGc7Ta6Z2ALK/q7HvKiZyAPXq3UXZYhug==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr1040670wrp.73.1622132766819;
        Thu, 27 May 2021 09:26:06 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id i5sm3955864wrw.29.2021.05.27.09.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 09:26:06 -0700 (PDT)
Date:   Thu, 27 May 2021 17:26:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210527162604.GL543307@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
 <a81bfa44-ed86-207c-0f8c-c9bbad62733d@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a81bfa44-ed86-207c-0f8c-c9bbad62733d@somainline.org>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 27 May 2021, Konrad Dybcio wrote:

> Hi,
> 
> > Why are you Reviewing/Acking a patch that was applied on the 10th?
> 
> Forgive me if it turns out I'm blind, but I can't see the patch
> being in either -next, backlight/for-next, or 5.13-rc3. Perhaps it
> was omitted after all?

Interesting.  It's not you, it's me!

No idea what happened exactly TBH, but it's applied again.

Should be in -next tomorrow.  Apologies for the delay.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
