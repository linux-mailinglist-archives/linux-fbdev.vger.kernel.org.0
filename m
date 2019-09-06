Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A2FABF76
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Sep 2019 20:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395357AbfIFSgU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Sep 2019 14:36:20 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37304 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395356AbfIFSgU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Sep 2019 14:36:20 -0400
Received: by mail-ed1-f65.google.com with SMTP id i1so7175257edv.4
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Sep 2019 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lO0nmJGj3qNeZy1jblunupcejeIOLFHpQMS8i+3jAJM=;
        b=T69/NHgSRutH4MVQh4miV96D5Jy263UZJjwn3l9XZ00mlMus91OVBApb3qHZA+1PnS
         Ds8ho7fY0qEIQAJzR0Sf5dQt+RnwjBr4g5tblNF0pjifa8dFBR1hUP8GmB2CruSuPHPS
         d04b49rz+oyCgtPWI3Dms5bUXn9f2UP1Mrrgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=lO0nmJGj3qNeZy1jblunupcejeIOLFHpQMS8i+3jAJM=;
        b=eB5Am+HwecVUFcN2w/mUM9pj9oztlFiXIGutQLyB4+sFdV8nmfqNq6+EGXEBMWBTgp
         A75bCZ3K7Kt4HxKROGbmx/GFIlYLvgiACN82uBB0z89HD6eRFwsuHa3Ez/JV53uhb8O0
         RbRqNttz0tS2PlMyAYruHlTUpPBcEV8tkd6Pxylj7kPaWKbwR3BXTrdOgpySsndYm+LJ
         LAdZwGdHvuz63tyTXJOqqN/HYTLsMgTEPS0BmjCOewd+WrcvKbctWH00C+a0Ot4whidj
         LZcvL43W/eu7KZXoPAg2Jo65VJInYf1g5A6Ulnws7nmQufQGfoT/kHhnmlkqvMcCmeeY
         8r9A==
X-Gm-Message-State: APjAAAVNQyrWGG0ODjsPrhc8Ads+Ca8BUVA0459kOuMTrL9kUzFKYHIp
        NUuIl+vr0+JZy5nco2KPgHXrMA==
X-Google-Smtp-Source: APXvYqx789yzKS2n919Rr3nMiD7uU3gkBYDT8XJuEaRGbxTk9pLWcj32Sf9U9K93tl8wsjTyy9EXmA==
X-Received: by 2002:a17:906:1c46:: with SMTP id l6mr8652259ejg.304.1567794978426;
        Fri, 06 Sep 2019 11:36:18 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id mh8sm654618ejb.74.2019.09.06.11.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 11:36:17 -0700 (PDT)
Date:   Fri, 6 Sep 2019 20:36:15 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/sa1100fb: Remove even more dead code
Message-ID: <20190906183615.GH3958@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190906151307.1127187-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906151307.1127187-1-arnd@arndb.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Sep 06, 2019 at 05:13:00PM +0200, Arnd Bergmann wrote:
> This function lost its only call site as part of
> earlier dead code removal, so remove it as well:
> 
> drivers/video/fbdev/sa1100fb.c:975:21: error: unused function 'sa1100fb_min_dma_period' [-Werror,-Wunused-function]
> 
> Fixes: 390e5de11284 ("fbdev/sa1100fb: Remove dead code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Queud for 5.5 in drm-misc-next since Bart is away from merge duties until
end of this month.
-Daniel
> ---
>  drivers/video/fbdev/sa1100fb.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
> index ae2bcfee338a..81ad3aa1ca06 100644
> --- a/drivers/video/fbdev/sa1100fb.c
> +++ b/drivers/video/fbdev/sa1100fb.c
> @@ -967,19 +967,6 @@ static void sa1100fb_task(struct work_struct *w)
>  }
>  
>  #ifdef CONFIG_CPU_FREQ
> -/*
> - * Calculate the minimum DMA period over all displays that we own.
> - * This, together with the SDRAM bandwidth defines the slowest CPU
> - * frequency that can be selected.
> - */
> -static unsigned int sa1100fb_min_dma_period(struct sa1100fb_info *fbi)
> -{
> -	/*
> -	 * FIXME: we need to verify _all_ consoles.
> -	 */
> -	return sa1100fb_display_dma_period(&fbi->fb.var);
> -}
> -
>  /*
>   * CPU clock speed change handler.  We need to adjust the LCD timing
>   * parameters when the CPU clock is adjusted by the power management
> -- 
> 2.20.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
