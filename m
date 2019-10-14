Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 743B9D5C59
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Oct 2019 09:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbfJNH1P (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Oct 2019 03:27:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40590 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730409AbfJNH1P (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Oct 2019 03:27:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so18378011wrv.7
        for <linux-fbdev@vger.kernel.org>; Mon, 14 Oct 2019 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=U6/vqqI+KFne/Y1dUe/Jfr2lNHLnywOUOorz0nDROSE=;
        b=xfMY0SiR5P3VvexTUHqw+8OwvkSFp1LclUgomGX8ksXD9q+KX3colpmtmOQTdGsSr1
         mLiKIi4t6EbNMkHrkaw6c9HN0uFFJPrEveqy1XNvtv8xxA4a3rmzkcgsc9ArmbsDqi+q
         BVBGVv4Bz102IqKVDtJRIvf445rKWFHWpSvGTw590ibcF0ATNRW1OqFNBbueDBB0fKNW
         WmL9j6X+gmvrsvEh5CzILouSfDc8LlVezqWssmsW32To36UlqbkrTmMdHv3oamJyMUnp
         VJl9ivKm4uvwcw4URs8Tp0jzVZbp8nDo6aTXnyBSyPiY3pl1viQ5mYhAzoaBsKx6fifV
         6peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=U6/vqqI+KFne/Y1dUe/Jfr2lNHLnywOUOorz0nDROSE=;
        b=KJT95GGxQzoguIZHlCcamOuPZtgZDwMEQUFH+IGMnbJeK/fT4RYeS3uG+MG7xEyuKL
         0tRG1iDEVo+ZsSp2imw4YrNsOzQS/a/XzkzVNU1NXw3AXATfP1KvGTREmAyvwJafEqgS
         EQVSxu47jISzRaASOKKF9inqng97/vDWVn0YRJqwSBHXuC2N39V4R+5oRyHeVZaM5jCw
         9tl/LllSy9TBkL946/Jfj2XmG+nk6whky6DBuGwIJvI6ApH9u9AXg1dICGGoh2BYQalq
         KV57g/JJ9zUq8Y1LW5F2+57lhVp2eTLVkJqOJMDk5A2BKhd9siRLUUr7/jtdx7kJyyRg
         q7MA==
X-Gm-Message-State: APjAAAVLX6snLPmGZfRK5VU0wZH64C7FCQy3eYQcMbiZxPm1jvYoPr/o
        n7Lu4jRwdDGThBzh41zXDAoOjA==
X-Google-Smtp-Source: APXvYqwNx4BWT3sUTOLgHRxO1bczBBeKgEVPdgkFIDoixi5Si9gU2rsgGmIYce/VDvFK7gDzI8aLMw==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr23551615wrc.251.1571038032239;
        Mon, 14 Oct 2019 00:27:12 -0700 (PDT)
Received: from dell ([2.27.167.11])
        by smtp.gmail.com with ESMTPSA id x2sm21172669wrn.81.2019.10.14.00.27.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 00:27:11 -0700 (PDT)
Date:   Mon, 14 Oct 2019 08:27:10 +0100
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
Subject: Re: [PATCH v2 1/4] backlight: pwm_bl: fix cie1913 comments and
 constant
Message-ID: <20191014072710.GE4545@dell>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-2-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191008120327.24208-2-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 08 Oct 2019, Rasmus Villemoes wrote:

> The "break-even" point for the two formulas is L==8, which is also
> what the code actually implements. [Incidentally, at that point one
> has Y=0.008856, not 0.08856].
> 
> Moreover, all the sources I can find say the linear factor is 903.3
> rather than 902.3, which makes sense since then the formulas agree at
> L==8, both yielding the 0.008856 figure to four significant digits.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/video/backlight/pwm_bl.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
