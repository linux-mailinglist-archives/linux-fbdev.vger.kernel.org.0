Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7A426FCC2
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Sep 2020 14:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgIRMmN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Sep 2020 08:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgIRMmI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Sep 2020 08:42:08 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCC1C06174A
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Sep 2020 05:42:07 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so5482346wrs.5
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Sep 2020 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=SOcYopzpVA91Ur8JOndAUuW5kC5KQpU+aqaU8ciX7/I=;
        b=XJthRxMj7p5FVQ8UB8QHPjpkyrZ1DYRAiW2zVjRAhJUW0e0QzTxX9S0LywyZSJEGAX
         oQ6rcMf41/DYJXO67/Xq8aoMk84qRFYHTNdeA/7L9sScQbt/SEfZaJSlI5KxMxxR+CIT
         M/6Aec09cMTtIOtfSD5s3TkOo40GHFODxElv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=SOcYopzpVA91Ur8JOndAUuW5kC5KQpU+aqaU8ciX7/I=;
        b=Z0S3vTsiduiHI9rEgBN1legXvFqCcXi1Q1N2gvpDBSKopsjkr428tr+Tbtaci7JxHI
         4INLrFnfOWwmzCBZtqbwXWlzg6ds4jBEoE4RI9GuX8FhuuE+4rm/UcXVtqlLSvGPwg4P
         WkwHIQgcHCMPHEPXs3FbOjR3dcX0hDz2xiYYB/ACMa+znPKao+GcNUodS0fSW3Csn5bx
         ql0DpELbGf24B6TAx1E045L80EBKRQOYcS5FjGJay6gYX6cteueXWiTnFYVIBF5TfdTp
         Ge8TTMnmO0lV+MrFZyWc81kBrAsaQnFNNKGiX3NqZfkPUEEwds1fPfOg3Wtp8vWktqZQ
         n7Zw==
X-Gm-Message-State: AOAM530sKM9t5StJ3/Qo3f6fP6Ux0FJXy92avNhO8XBX0icjzBAQ/7rA
        85fri/vEtdcjEcuqJ/pLlmfolA==
X-Google-Smtp-Source: ABdhPJzrTC3CW6AB1dTSGBrjqUS3H6j44ck9bWQgvGGmKSFb26qrBxqU+OHgoRbREA252KDgVlNEww==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr41100529wrs.153.1600432926218;
        Fri, 18 Sep 2020 05:42:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d2sm5156057wro.34.2020.09.18.05.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:42:05 -0700 (PDT)
Date:   Fri, 18 Sep 2020 14:42:03 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Paul Mackerras <paulus@samba.org>,
        Russell King <linux@armlinux.org.uk>,
        Andres Salomon <dilinger@queued.net>,
        Antonino Daplas <adaplas@gmail.com>,
        linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-geode@lists.infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] fbdev: aty: remove CONFIG_PM container
Message-ID: <20200918124203.GY438822@phenom.ffwll.local>
Mail-Followup-To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
        Russell King <linux@armlinux.org.uk>,
        Andres Salomon <dilinger@queued.net>,
        Antonino Daplas <adaplas@gmail.com>, linux-fbdev@vger.kernel.org,
        kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Sep 17, 2020 at 05:23:14PM +0530, Vaibhav Gupta wrote:
> The changes made in below mentioned commit removed CONFIG_PM containers
> from drivers/video/fbdev/aty/atyfb_base.c but not from
> drivers/video/fbdev/aty/atyfb.h for respective callbacks.
> 
> This resulted in error for implicit declaration for those callbacks.
> 
> Fixes: 348b2956d5e6 ("fbdev: aty: use generic power management")
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

Applied, thanks.
-Daniel

> ---
>  drivers/video/fbdev/aty/atyfb.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
> index a7833bc98225..551372f9b9aa 100644
> --- a/drivers/video/fbdev/aty/atyfb.h
> +++ b/drivers/video/fbdev/aty/atyfb.h
> @@ -287,8 +287,8 @@ static inline void aty_st_8(int regindex, u8 val, const struct atyfb_par *par)
>  #endif
>  }
>  
> -#if defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || \
> -defined (CONFIG_FB_ATY_GENERIC_LCD) || defined (CONFIG_FB_ATY_BACKLIGHT)
> +#if defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) || \
> +defined (CONFIG_FB_ATY_BACKLIGHT)
>  extern void aty_st_lcd(int index, u32 val, const struct atyfb_par *par);
>  extern u32 aty_ld_lcd(int index, const struct atyfb_par *par);
>  #endif
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
