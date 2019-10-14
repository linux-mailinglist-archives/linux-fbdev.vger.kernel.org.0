Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18ED8D5C5F
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Oct 2019 09:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfJNH1j (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Oct 2019 03:27:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38199 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfJNH1i (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Oct 2019 03:27:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id y18so8898505wrn.5
        for <linux-fbdev@vger.kernel.org>; Mon, 14 Oct 2019 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Lsu4fhje736plADrPfFak7Hyuvi8ToLdp9rnCK4hwgE=;
        b=QAeR6xlIwruriMfHuFp2cv0YcQ7dfUCPQKWO3lSStColxpeElXzjO1pIuQnkS1TUZN
         cty42z8g8KK99VaGUqB/ZKPZqONUVjGeeKHaO7U/ZeaPF/37YP+WnTh+wZVEllLcTG7w
         JQWbBUZoVWjxcHApwBnUGZGGLTX9yOvDPZDrs9WfgOL76QsRx9nGg4GgBGDJNp7H0VNL
         ndbPJ0Tv48BYDmb3RoNgWP2uo3DBciF1dy4MU724NcdBreSG4GtL9V6VplxrcEZdM5bi
         d5sPeIPQDBqskiN+LDOq4H1eHwwsSO34kxUg/hgSYldiDuEN2bNCl0bBPIeHsn8M84kI
         c+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Lsu4fhje736plADrPfFak7Hyuvi8ToLdp9rnCK4hwgE=;
        b=D3gjzELgfZfeG7h3lMZzGVDJtIiIPrCkhLd9We1vq9gk18+3WzZGRHYPqJo/63eZuA
         0/h+UWHAGa2otHtnlFWcMdoM7GK/kY8oyjr5CMXn0lhvL59UoZ29oAAz1fLgUmxc3xQ7
         LPU11yD04YD3ZJwaQtkdGI30mFHF+WMBDqhU1eFrWuNbEdmuPBHTPBrc/PRtdEjO0RM9
         oTnLBSGPMmyy46tk3HSJcDBkWTpcc7Ys2sTj+pPpt/nddeXsYHvgOg+U7UBd7xOfkbAC
         vV8Pl0+d6NXnrNkqVjz8c+pVmhehQU04uHLYko0G9lvyt1Pzv3LfEr/6r4TYqwC3Pkas
         s4dQ==
X-Gm-Message-State: APjAAAWRAFMwTRuhvfJN/HIyRdsuEC5XrvRuktcXm553lTAvHGFAbzDb
        xBhu7//zn0P5Iwt+g5Hed7akwQ==
X-Google-Smtp-Source: APXvYqzw9fkcyJEo4AQK7M4LJ3HxW6G4IjmVLs+xsK03nZjv0Pw9xmGK1kAVONlnHG2VAyBzoqVlSg==
X-Received: by 2002:adf:e705:: with SMTP id c5mr23614156wrm.375.1571038056779;
        Mon, 14 Oct 2019 00:27:36 -0700 (PDT)
Received: from dell ([2.27.167.11])
        by smtp.gmail.com with ESMTPSA id f20sm14187442wmb.6.2019.10.14.00.27.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 00:27:36 -0700 (PDT)
Date:   Mon, 14 Oct 2019 08:27:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] backlight: pwm_bl: drop use of int_pow()
Message-ID: <20191014072734.GG4545@dell>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-4-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191008120327.24208-4-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 08 Oct 2019, Rasmus Villemoes wrote:

> For a fixed small exponent of 3, it is more efficient to simply use
> two explicit multiplications rather than calling the int_pow() library
> function: Aside from the function call overhead, its implementation
> using repeated squaring means it ends up doing four 64x64
> multiplications.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/video/backlight/pwm_bl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
