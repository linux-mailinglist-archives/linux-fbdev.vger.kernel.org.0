Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90654B6AC
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Jun 2019 13:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731566AbfFSLGA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Jun 2019 07:06:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52059 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbfFSLF6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Jun 2019 07:05:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so1280913wma.1
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Jun 2019 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xl41q9hNOc/g9EYGMDVv6e3kqykgA8u4AjfGsUyaRHQ=;
        b=JdBKTLDrjuc2YV4PWxdd20VcvL3iFMegCFa3Q6/uzxvqugEYTjmLnyj3TVyv5+lys4
         PVN+wGlTXU/nam3nxiTvzOWWzj9hPkoHQ+xbPGb+E3B8NyUvnBV/CfvX4yvCMHuiSmFt
         3AqbNmYSEqL1Es3/1h3AwunxKHbRwcaLzPU1yKE6dk5/1OO04B5XEPyBvkL2tpm1Flem
         EFAI8EhR6ft5+W4a1Rcw04rvaT/1+0dFW8gjs1eG/PoBy2xi+eySWVD8tVEPwTsoKRwn
         F9bSd1N5bhkLh+fdtRtGYuKSbiqJP1LG/v1NxcE+PbhV/JwyBeI09YxUpy7B5UiSy2q3
         Vipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xl41q9hNOc/g9EYGMDVv6e3kqykgA8u4AjfGsUyaRHQ=;
        b=aMRRhLLA0yd8VAdLaZm1iMQvuKD1nPrS5fYxegt7D0Iu6bB46BfBleC7dI414h9cge
         xSK+cgWRjt05uX9pJDVUgHQwhTuuacEhMu/qPuIBEB4kBtQkLsjy82hCphNHKjcwkfOJ
         4SLctlKHcDaj5XIICbY5QQbVi4MUi8NGDKkQFNE6CK3KGO9Obi13GYKkJ8J+Wwh4M7Nf
         nt4gu3O3Q2xou4t+J+0HNcnvaXMgL5EaVDLTqZ2pewkjdw5q8N1prE3EbE4ZKi9d4UrE
         pSWyqMwJpl4erbuuyT6L1kdkIq5G626RVRmykvC3ngRTAAngqxaM4X2V1LLaDY6YLabW
         cstw==
X-Gm-Message-State: APjAAAVkqH3vBgsNKLxUQdu0S4VtOD+3jqWdQJwCCOoKaZK1J40YPtBf
        sCGP2+nsyHNppibPdML/2BPeLg==
X-Google-Smtp-Source: APXvYqy0Vj4gusY17LcUMJkB9rXJuNIK1DSDRJXpXkTwo5jvGI4HfycfIswmjX9F29RGTZ3uyd8gDw==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr7615451wmj.2.1560942356321;
        Wed, 19 Jun 2019 04:05:56 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u6sm1599073wml.9.2019.06.19.04.05.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 04:05:55 -0700 (PDT)
Date:   Wed, 19 Jun 2019 12:05:53 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/4] MAINTAINERS: Add entry for stable backlight sysfs
 ABI documentation
Message-ID: <20190619110553.zyz3jqshscqxqtum@holly.lan>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-2-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613194326.180889-2-mka@chromium.org>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jun 13, 2019 at 12:43:23PM -0700, Matthias Kaehlcke wrote:
> Add an entry for the stable backlight sysfs ABI to the MAINTAINERS
> file.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Well spotted. Thanks!

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57f496cff999..d51e74340870 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2857,6 +2857,7 @@ F:	drivers/video/backlight/
>  F:	include/linux/backlight.h
>  F:	include/linux/pwm_backlight.h
>  F:	Documentation/devicetree/bindings/leds/backlight
> +F:	Documentation/ABI/stable/sysfs-class-backlight
>  
>  BATMAN ADVANCED
>  M:	Marek Lindner <mareklindner@neomailbox.ch>
> -- 
> 2.22.0.rc2.383.gf4fbbf30c2-goog
> 
