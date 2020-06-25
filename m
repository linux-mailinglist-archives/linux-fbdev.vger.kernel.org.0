Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F197209BDB
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2020 11:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390855AbgFYJYj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jun 2020 05:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390848AbgFYJYj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jun 2020 05:24:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B8CC0613ED
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:24:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g75so4824336wme.5
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jun 2020 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EaOaR3l9HHxJyu97gRJLmzWQVTWMAcMmNEcB1lcmPNM=;
        b=l0NeXiakjdrXrLaBLIadefKz8F7+uyKt5t8RNkWbO405PGH/BZlG7ucw7IkjzZ9wK5
         pOFvA45fVJyNpEcvwKTJ4EG0KhFxxfY3pjjhc9JzCoT3kHSe1jOgmHODowQxUGG2FiKI
         yZKssraojrjtQZI6OtOlcrvQCZo1hNcJlSJyToTanRleQMoy+FooP2BSXH93BwrhKzi0
         +zryj2eO1f08xEkWifRc0qeLiBx2LzTlRzbY8yPbRKajweEMeycjGzvCiACtHFxLbRLK
         EgS2b5n252zk49kR0c4T7PyzpHEdZ1+hFE2Hkk25xROet1O/dW+JLLQjtJsCj4GzbSde
         JvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EaOaR3l9HHxJyu97gRJLmzWQVTWMAcMmNEcB1lcmPNM=;
        b=oUpcrDNIYaq2J/DVaFaab4gHZQdtAU3sg3re4JqCP9R6QutfaT5FftjjN4+JON6Z/A
         KYBV5Y4JpT5XO+iUYnj3jkgsIDs6RgHaObkcC0rLmoEY5/fSPzApeR3EjIS5TqmDdJbv
         OpKjCMnLZL1qHCV02t0aZi/USzwwxgERlCTZf5vzR/BHHi0EnN9X3ILnLI9NwZgBKdsW
         inhUtCRR0VgD2Bp/cxZZBRb2lfaXCvnaKqo1shG8FckTdt+VZ7QQKlNyMKpJ86C4m74K
         B4uMqBz7VXd5rRo7Jq7lr8+mah5BIyfZFAGgQJEQZTVyymKGH24Sl3xt9mNMDrwVYryT
         UBMg==
X-Gm-Message-State: AOAM533uuvkc5raXbKIs8MFNrzClziFCsfGQ54GQOKY5B6KoutaQechl
        06PHz/sajrel7ZsN+zmGOM3nsw==
X-Google-Smtp-Source: ABdhPJxraWfUM9OicOYalfWG6fhp1iNyu1akGB9XabtzprNxns7odWMJc425dq+X61YgK7Y4EfXJrw==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr2381038wmb.61.1593077077320;
        Thu, 25 Jun 2020 02:24:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id 138sm12311705wma.23.2020.06.25.02.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 02:24:36 -0700 (PDT)
Date:   Thu, 25 Jun 2020 10:24:34 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/8] backlight: lms501kf03: Remove unused const variables
Message-ID: <20200625092434.szrdyt3sxmxmfajg@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200624145721.2590327-2-lee.jones@linaro.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jun 24, 2020 at 03:57:14PM +0100, Lee Jones wrote:
> W=1 kernel build reports:
> 
>  drivers/video/backlight/lms501kf03.c:96:28: warning: ‘seq_sleep_in’ defined but not used [-Wunused-const-variable=]
>  96 | static const unsigned char seq_sleep_in[] = {
>  | ^~~~~~~~~~~~
>  drivers/video/backlight/lms501kf03.c:92:28: warning: ‘seq_up_dn’ defined but not used [-Wunused-const-variable=]
>  92 | static const unsigned char seq_up_dn[] = {
>  | ^~~~~~~~~
> 
> Either 'seq_sleep_in' nor 'seq_up_dn' have been used since the
> driver first landed in 2013.
> 
> Cc: <stable@vger.kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/lms501kf03.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
> index 8ae32e3573c1a..c1bd02bb8b2ee 100644
> --- a/drivers/video/backlight/lms501kf03.c
> +++ b/drivers/video/backlight/lms501kf03.c
> @@ -89,14 +89,6 @@ static const unsigned char seq_rgb_gamma[] = {
>  	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>  };
>  
> -static const unsigned char seq_up_dn[] = {
> -	0x36, 0x10,
> -};
> -
> -static const unsigned char seq_sleep_in[] = {
> -	0x10,
> -};
> -
>  static const unsigned char seq_sleep_out[] = {
>  	0x11,
>  };
> -- 
> 2.25.1
> 
