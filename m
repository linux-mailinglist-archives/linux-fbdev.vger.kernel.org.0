Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D664226FCCC
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Sep 2020 14:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgIRMpj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Sep 2020 08:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgIRMpj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Sep 2020 08:45:39 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E7BC06174A
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Sep 2020 05:45:39 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k15so5478904wrn.10
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Sep 2020 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=mkjGA7pXWKUs0Nfv07SZZRXfgMyaUHALkc311WYJd5c=;
        b=IjP59USZ4bt/dNbg6oSq65GvWXtsZNBOpmHcvEGwUUe7X+YQ8CuVdvzCJGUW31mYN+
         kutEcRAjJR4RcIEaSUCQ+2SZ1Rv35nHNuqPRysdFMn9OVDXJ9a8uh6YI7JPIBIExQFFw
         1nb0o6gG1SpBjtUqoSxsN0I9Nz6cEgQsIpwa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=mkjGA7pXWKUs0Nfv07SZZRXfgMyaUHALkc311WYJd5c=;
        b=oFbUhqRhSzPuGoHjOSDVttuT14ndvnrPSATuGmh6CukNaGpiEbb9hWgJqCelgJ4tPY
         8XkMY/EjRuX/GMXi41PFJeAXma+gW4XvGWiYyAIFlxjim5GkUb6d4LdsZ+psUTK/N8lO
         DlzI6FF9clC3v3qkqE8fbqxl5b1d/UNbXJpd/RlnwwqVcXKkVlX1G2JaoUH6fYyGn/VH
         0rxTWfAB89aeMSGiWbVPgh/n8DgrhJlJFbfgVmzIIRFPIrTETb3zs4rFAFPXFIsR5w8o
         VTaSqMxPij0mIuZcyQV4qhn+L6Ig54A1gkVjdxUeP+edXpbVxr4AuTu9j2uZLSJQ0Lak
         wiNw==
X-Gm-Message-State: AOAM532MoUtc9divWlLDay4FEyul1xDlZVmGNW5TlYYNlLY+FF864Z8O
        umqAaeF/VITGh3Q8JiyW1eAASw==
X-Google-Smtp-Source: ABdhPJyDK0gDuuHiczv9k6y+Mdkm1lj9HIgPKWCvChWYK5+PoIgy7TapyPO7BGOVyhxEfKVMzA4lGQ==
X-Received: by 2002:adf:81a3:: with SMTP id 32mr37517353wra.368.1600433138210;
        Fri, 18 Sep 2020 05:45:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e18sm4912651wrx.50.2020.09.18.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:45:37 -0700 (PDT)
Date:   Fri, 18 Sep 2020 14:45:35 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc:     b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
        daniel.vetter@ffwll.ch, ndesaulniers@google.com,
        gustavoars@kernel.org, jirislaby@kernel.org,
        george.kennedy@oracle.com, natechancellor@gmail.com,
        peda@axentia.se, krzysztof.h1@wp.pl, akpm@linux-foundation.org,
        adaplas@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fbcon: Remove the superfluous break
Message-ID: <20200918124535.GB438822@phenom.ffwll.local>
Mail-Followup-To: Jing Xiangfeng <jingxiangfeng@huawei.com>,
        b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
        ndesaulniers@google.com, gustavoars@kernel.org,
        jirislaby@kernel.org, george.kennedy@oracle.com,
        natechancellor@gmail.com, peda@axentia.se, krzysztof.h1@wp.pl,
        akpm@linux-foundation.org, adaplas@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200918010521.69950-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918010521.69950-1-jingxiangfeng@huawei.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Sep 18, 2020 at 09:05:21AM +0800, Jing Xiangfeng wrote:
> Remove the superfluous break, as there is a 'return' before it.
> 
> Fixes: bad07ff74c32 ("fbcon: smart blitter usage for scrolling")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/video/fbdev/core/fbcon.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 0b49b0f44edf..623359aadd1e 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1727,7 +1727,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>  				    vc->vc_video_erase_char,
>  				    vc->vc_size_row * count);
>  			return true;
> -			break;
>  
>  		case SCROLL_WRAP_MOVE:
>  			if (b - t - count > 3 * vc->vc_rows >> 2) {
> @@ -1818,7 +1817,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>  				    vc->vc_video_erase_char,
>  				    vc->vc_size_row * count);
>  			return true;
> -			break;
>  
>  		case SCROLL_WRAP_MOVE:
>  			if (b - t - count > 3 * vc->vc_rows >> 2) {
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
