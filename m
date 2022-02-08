Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7EE4AD414
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Feb 2022 09:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbiBHIyH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Feb 2022 03:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352167AbiBHIyF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Feb 2022 03:54:05 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2947C03FEC5
        for <linux-fbdev@vger.kernel.org>; Tue,  8 Feb 2022 00:54:00 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j5-20020a05600c1c0500b0034d2e956aadso1069972wms.4
        for <linux-fbdev@vger.kernel.org>; Tue, 08 Feb 2022 00:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TwOpOhCkewurBTdSPeNG/7ZJDIatq7Dw8T+vkk/TtIs=;
        b=lW/GiqdU3VVDp/fM92/DOGcQiYkmHr49MJ8+ldaZtWG+Rz0AGaKzffcSP6e7mKYNtp
         49/IjQdY63rG2pETJUo630qcGPZsdVPQIJj873h1TvLczfsWYqMZ38inMSLfNaQihw9x
         LhQvvvpv/jIbjn+KTCIi6iLEIN8lvzm/6z25rtRwYmtebnh9Sej2ZI4P16dbsIDlL9mh
         weGZIiRJ4jqQDxuxM3tk44SqZbaAO/aFwlinYdFKoqsb7UiI8wm+hdy5UPdESAp0DOyB
         bO2AMyvRX9Z6EXZ6UNE/DXSiy8BmQ9npowQ8ZGmqcoPgFy3Y+1vOh8MWE6YKaPeRtFOk
         ZR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TwOpOhCkewurBTdSPeNG/7ZJDIatq7Dw8T+vkk/TtIs=;
        b=ZZHgGqut0ztVFADNHrwsdxMXcP7APzs+9bjWy4qBPQM1npRhnQ1vaQxj4/cXc1zV1/
         Crq+HEWlCYrU7r3sLMvdCw19bGtQjZiB0MONW80htmQavsvnFurCRuskQAEFm6vjZUsS
         FWpfF1CNcxe/RngoNVBMPEmwPCXWIeBS5LVbskTzMZKnT6xy2USRcDLQyEGFUhxSCGzC
         J5HH3DodygcCOhVCStGWLei6KKSoridwE7xn5/SEOp/TCSL4mX4cshc8s584Um4AKftU
         hVHtPc9VznDKd8IoWlXDACgif2vk3Iqp5k/szd8f+a9gKDdkq4vkAhhCsH+cN3ywYlvz
         HnyQ==
X-Gm-Message-State: AOAM532DWyrJtc7OQKYcRKI1IydfMFY5XY9qp8z54EPRk/Iina4DmujG
        6lJTabO/7EorIKMievk/Hysm6g==
X-Google-Smtp-Source: ABdhPJyOewoFyg7DILHZmhtw2fzDp/fVpk8M5K4TsGNIZ1zInW2wlEQgwVzk/ZuITeCHKUQCDC3Q7w==
X-Received: by 2002:a1c:a595:: with SMTP id o143mr191510wme.78.1644310439409;
        Tue, 08 Feb 2022 00:53:59 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o10sm7645041wri.69.2022.02.08.00.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 00:53:58 -0800 (PST)
Date:   Tue, 8 Feb 2022 08:53:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-pwm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: Avoid open coded arithmetic in memory
 allocation
Message-ID: <YgIvpFp8igFkVsP+@google.com>
References: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, 05 Feb 2022, Christophe JAILLET wrote:

> kmalloc_array()/kcalloc() should be used to avoid potential overflow when
> a multiplication is needed to compute the size of the requested memory.
> 
> So turn a kzalloc()+explicit size computation into an equivalent kcalloc().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/video/backlight/pwm_bl.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
