Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A55110327
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Dec 2019 18:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfLCRJl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Dec 2019 12:09:41 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44123 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfLCRJk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 3 Dec 2019 12:09:40 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so4572439wrm.11
        for <linux-fbdev@vger.kernel.org>; Tue, 03 Dec 2019 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4aNKjl9ZXdF3AK1cV58XGK57a6lAFd0g+SUxwHwseyM=;
        b=FaxzFbnZEuJHu+72oQwz5fbgxQvzkOPZZqwR5J9/3HaGy6vlJ1JXKtjtRj8kXJzjcf
         cebam9NRy927CWhIwukGyksu/O2FzRZYwolnbrLg+GFuZKKbuDQszQKM8mCUXNNdW2pb
         x3R8Iy+WOdlNtMsZSM+kt5ghqbl/4opipl0uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4aNKjl9ZXdF3AK1cV58XGK57a6lAFd0g+SUxwHwseyM=;
        b=iqV7wALsAMHZgcMXvk5l49BUKetVYEObZzvTfmDN/LlIPoGZjskEuyJATL+sEGN2MW
         +o3gChgcdCg7tWnc5R6VI570UDHfAWKVfGQx5LGj8Wq+LDIppOYw8TRBwDaxpHwaPBMy
         q1VnPyNl/J2B3slDlKWwnzRnxUmMVG7znhg5IMj7ybG/q1ZGp6rqfiXMJ5FpK55AqANm
         cwuY5jwmPuKJPRWrvXJr+Xso6nW00ixiSfhxK3nVYsg01p1UKSEY7nauk/B6Q7qzmH6k
         NmcHLIvSpjTsGkrsTh08M0s1NxqBdzncGcq+rFforSUpOFF03kybxDxt1cWEHjFbVyIl
         hndQ==
X-Gm-Message-State: APjAAAWaveQHSXrB7jIwZLyMamJldH6ThXEd8C1yC9b7C9Por/obk22d
        Yz8HZyp+NhBbon9yGqfNAnDrqw==
X-Google-Smtp-Source: APXvYqxK4lj4oCGHsKgjKafAITg82puCSFA+6gcgZOmxj+U2vnlp/3O9ktmtLb34cFTlGaTmxCytrw==
X-Received: by 2002:a05:6000:118d:: with SMTP id g13mr6755027wrx.141.1575392978895;
        Tue, 03 Dec 2019 09:09:38 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id g25sm3278615wmh.3.2019.12.03.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:09:37 -0800 (PST)
Date:   Tue, 3 Dec 2019 18:09:35 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 07/12] video: fbdev: intelfb: use const pointer for
 fb_ops
Message-ID: <20191203170935.GI624164@phenom.ffwll.local>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <171c573bc2977a6ec374753ac7bb03a3523ca2b7.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171c573bc2977a6ec374753ac7bb03a3523ca2b7.1575390740.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Dec 03, 2019 at 06:38:49PM +0200, Jani Nikula wrote:
> Use const for fb_ops to let us make the fbops struct const in the
> future.
> 
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/intelfb/intelfb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/intelfb/intelfb.h b/drivers/video/fbdev/intelfb/intelfb.h
> index b54db05f028d..5de703902a21 100644
> --- a/drivers/video/fbdev/intelfb/intelfb.h
> +++ b/drivers/video/fbdev/intelfb/intelfb.h
> @@ -273,7 +273,7 @@ struct intelfb_vsync {
>  
>  struct intelfb_info {
>  	struct fb_info *info;
> -	struct fb_ops  *fbops;
> +	const struct fb_ops *fbops;

I think aside from a lone assignment in intelfb_pci_register this is
entirely unused. But I also think resistance is futile so

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	struct pci_dev *pdev;
>  
>  	struct intelfb_hwstate save_state;
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
