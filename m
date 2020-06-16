Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347831FA984
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2020 09:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgFPHG7 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 16 Jun 2020 03:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726782AbgFPHG7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 16 Jun 2020 03:06:59 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDD8C03E97C
        for <linux-fbdev@vger.kernel.org>; Tue, 16 Jun 2020 00:06:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t18so19552935wru.6
        for <linux-fbdev@vger.kernel.org>; Tue, 16 Jun 2020 00:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=S6Wt2049xOyn9uDBo8RtO0TmdMtlWUY24rAkQY/ouSI=;
        b=jH5zB2sl5+QcbiTOlHEBYBJ5vMNw9h/Hu8/Q/WEvwbj4Xt+SONwj0Ppd7fh90BM0tT
         Hp3sfHy3IVyWzMSLyGu+k1OIJ6ma1DlcfUSDapcAbZeSUH9tyVMMA8SQzqMulzp1Kt3d
         fvQz79e35Zb+AzwR0jFx8+bCiM6L9/rWBZhlCy0Rb2ZaUY7FKU1tY3oC+qgcODyEqvxo
         DcHJFVViyExCkxevk0UEBlUOHoAblTD3Rkc6pL0QvjGA0QoWnaO1KIbUWByQ0JgPixsX
         CzLA+ByKo8IhJysdlKawbnk+SPhUyylISdd+xf8uicFILiScM4a9RY6qVrhbplhLgOf1
         ZZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=S6Wt2049xOyn9uDBo8RtO0TmdMtlWUY24rAkQY/ouSI=;
        b=MWshfUtmeBPhX6Zd4AcAzA51jrlqWUklFCtHqgmTwnDQ2IyQV2SYCihumGGalzXu82
         mTgP80FjunhBoe+Oe4FhktEznF+9ObQpmnDF73jof/gRAawRFNfCHpFSGiVMksdLm4qQ
         W+7EbCWmPDzRLP4RVTOqVVHh6vWQNU/HrwrWpXNJ+r6ns5d5VLNhtzY0kx5n5L7BNFbY
         6Azb3LBH1XHEiiKO49KAD+Znjg127vCnzc8Nta1GfMvwXaKHpO53motAMvDi0xGJ6gl/
         NrqQJnJUc2KjzHODrNsE3+UMtxwSd5qL/tvNlGKtSUPy1iSHtAXSiG92lqRZ6KjC52Nk
         2HWw==
X-Gm-Message-State: AOAM531jrMmJyFhJam4VanKCPdpEcyja7bnL50cKjOnFRlf4GQfvBrsS
        1lKy6UTMosmmhKDD6reGPJsDGw==
X-Google-Smtp-Source: ABdhPJxTcyWzB10Tj4UoI0tMy/u3LqUlapmPnhWb4IqpH0dhk1/y3mG9xdwdxvPulRAXR8aBPGJpnQ==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr1425261wrs.223.1592291217037;
        Tue, 16 Jun 2020 00:06:57 -0700 (PDT)
Received: from dell ([109.180.115.156])
        by smtp.gmail.com with ESMTPSA id a81sm2809160wmd.25.2020.06.16.00.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 00:06:56 -0700 (PDT)
Date:   Tue, 16 Jun 2020 08:06:54 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pwm: iqs620a: Use 64-bit division
Message-ID: <20200616070654.GC2608702@dell>
References: <20200615141606.2814208-1-thierry.reding@gmail.com>
 <20200615141606.2814208-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200615141606.2814208-3-thierry.reding@gmail.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 15 Jun 2020, Thierry Reding wrote:

> The PWM framework is going to change the PWM period and duty cycles to
> be 64-bit unsigned integers. To avoid build errors on platforms that do
> not natively support 64-bit division, use explicity 64-bit division.
> 
> Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> ---
>  drivers/pwm/pwm-iqs620a.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
