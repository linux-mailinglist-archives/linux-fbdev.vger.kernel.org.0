Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24D3C4AFA
	for <lists+linux-fbdev@lfdr.de>; Wed,  2 Oct 2019 12:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbfJBKHn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 2 Oct 2019 06:07:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39672 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbfJBKHn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 2 Oct 2019 06:07:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so18957738wrj.6
        for <linux-fbdev@vger.kernel.org>; Wed, 02 Oct 2019 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8215o5L5rg8Jn8PvXMpKTkwp0UWQ7G/wTp1RzC1miWw=;
        b=DTOctIKi3TC2V8YqzjCVfP8yozCtDlf8lmDyvwawFn4uwT6vW3n9HK5xwOA1/PeVkj
         hYjrjyDHa35kI9OABP5WohPSLTGuWvoY+OPWGhLf/fqyJR7HyQiSJSHoGwlmN+Ah4k44
         1i3zI4m+GCjKqaVunXUELVhlFNbSqi677sTPrZIJMJP2GJtwwme1oHWKFVMePdL8KZyE
         8H6j8VnX/Y6ZNU1tjewA/nS8T5eFlr9UEWKHJERc0ocvqo1pKobJllgI75ZNnChUQ3pF
         pMCRm4IjIUSyaQ8DHqx2EBwPQhYBZeb5c575NSy4GaTQWrNWyVKOCu3zogO8bywGoc2j
         OnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8215o5L5rg8Jn8PvXMpKTkwp0UWQ7G/wTp1RzC1miWw=;
        b=JfhXkAlfouqGB+hdGBAtn92ERVta+ONDnJZcGsQkbIA0qqoj6uvIpvLFIHoG2qx+p7
         iRrw1LMjRLYAAsN7YBgtewmzHsfPqCFWX3huItwXog9AzNXQ1/Dd91d6wRwBsKJE0rTi
         K0FFcI/l//9g+AEWMEXtXRj77z0yXEl89xkhSJg91nxbUpvbQqBNVNOiSTM6McXl9LoD
         A4QuEHdUoDJ0PHocGAd3Zye0JCAiCX998RXWBHPZrFE2/0yPn6aycpbiZoazTYNWqNJC
         Qpuenq1aBAeLhmml1t7/AIXfTtCwLkMyJqlCNNSckfdpfUHQP72fPnp2oOqliCu0fO4O
         e0UQ==
X-Gm-Message-State: APjAAAVJ/N6O8k6f8YPzSCxXzSYub1Q1AGJPvmPDHu1DJfdR/TCVhVGx
        CYAzJ3BVpCAyNfY3T8UlRfpLVw==
X-Google-Smtp-Source: APXvYqw0Eb6miBPDCyV5NBM+w1t6VFTHTfOhXpGWg3xUNG7gHtmXzQM6vSPoLjFnSHzsdhPQlt+sug==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr1946992wrj.56.1570010859481;
        Wed, 02 Oct 2019 03:07:39 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id g4sm25657217wrw.9.2019.10.02.03.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 03:07:38 -0700 (PDT)
Date:   Wed, 2 Oct 2019 11:07:37 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: Don't assign levels table repeatedly
Message-ID: <20191002100737.orm5ghpnw6oe6b3r@holly.lan>
References: <20191001162835.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001162835.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Oct 01, 2019 at 04:29:24PM -0700, Matthias Kaehlcke wrote:
> pwm_backlight_probe() re-assigns pb->levels for every brightness
> level. This is not needed and was likely not intended, since
> neither side of the assignment changes during the loop. Assign
> the field only once.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Makes sense but this should probably be dropping the curly braces too.


Daniel.

> ---
> 
>  drivers/video/backlight/pwm_bl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index 746eebc411df..959436b9e92b 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -564,6 +564,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>  	memset(&props, 0, sizeof(struct backlight_properties));
>  
>  	if (data->levels) {
> +		pb->levels = data->levels;
> +
>  		/*
>  		 * For the DT case, only when brightness levels is defined
>  		 * data->levels is filled. For the non-DT case, data->levels
> @@ -572,8 +574,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>  		for (i = 0; i <= data->max_brightness; i++) {
>  			if (data->levels[i] > pb->scale)
>  				pb->scale = data->levels[i];
> -
> -			pb->levels = data->levels;
>  		}
>  
>  		if (pwm_backlight_is_linear(data))
> -- 
> 2.23.0.444.g18eeb5a265-goog
> 
