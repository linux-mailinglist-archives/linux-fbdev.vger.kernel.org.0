Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCF1A5282
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 11:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbfIBJGv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 05:06:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33770 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729886AbfIBJGu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 05:06:50 -0400
Received: by mail-wr1-f65.google.com with SMTP id u16so13205286wrr.0
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0GID28MOVw3IqgOtjsXJT38X0mktzIfxk7qKPFjEw8Y=;
        b=B4t36eTzRUg10X2oYdNxqdht2V8mmilid7efZANO7l/f0AtKhN/HTTcWldm5et9WB/
         D8zgaoG3x9ANGJmSrXDSeKvaanVJl5cIdOJK7Mmk0Luvj35cpHGC5V5EjWHwfStmeMea
         yl2kob86RjHU0biSFMF/44xWdj07sODUCQygtk4Rb6fff9NaNPfs27G1QGJcCYTaGF3c
         uw74a3Ro9TE0GVaEjpfh4jgmUZPWIK+RBo4/r5OwH477Z3OWl7dj4KxLtm4qrfAwgzew
         65ia/DVRC1GBFpzPQTH0iMAuFW8lrYm66R2B1LtFF96qrkoPG1dgNXVg+6mZhjv29f8f
         99bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0GID28MOVw3IqgOtjsXJT38X0mktzIfxk7qKPFjEw8Y=;
        b=LBk5+5bn93F9uS/2FiEi44Hjwd9T0zAlvz6kxlNDCvXmirziwFd/znCpkLC/4K0iWE
         B+EPAaO8v3uPAU6BfuQKoRL4epS3snSG5R85l6E5ld3MKyAlMcA/deHmJc/y7NtMKTLR
         BJXZ+UjBAMqRontCHc+KkNoSoDzC2/cIX6hpoXS53CGOdyspy3PuswMDFZu+aSZLn6jl
         /Bm+D69F/OCmrrOjda6JdfxkkcH/hIVH+N0ACd6T2ZfRKfmz1z5l4yD86Dpzq2/IFibU
         HhsIK0Ju3Tjbd2eb0h0tgyJ21zlddTxd5XxGUHpB0fpuO5BbbvDnI7R20sGrRGY4RDAR
         DslA==
X-Gm-Message-State: APjAAAVhVGSduQVy+ephUH8Rqhl3P8/UI+P6txxqoXBtXuz6aoxop/q7
        8T8bIEeVM7WXWYiWBNyi7o3u1w==
X-Google-Smtp-Source: APXvYqyGchDBpbIV0gXn9irGSUfGOAygOBZe+P22P17+hvKlBQgWDe2vziKLR0WrBSi+Ty7HtNTYKA==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr36364617wrc.331.1567415208695;
        Mon, 02 Sep 2019 02:06:48 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id n14sm49290434wra.75.2019.09.02.02.06.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:06:48 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:06:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: backlight: tosa_lcd: drop check because
 i2c_unregister_device() is NULL safe
Message-ID: <20190902090646.GE32232@dell>
References: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 20 Aug 2019, Wolfram Sang wrote:

> No need to check the argument of i2c_unregister_device() because the
> function itself does it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Build tested only, buildbot is happy, too.
> 
> Please apply to your tree.
> 
>  drivers/video/backlight/tosa_lcd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
