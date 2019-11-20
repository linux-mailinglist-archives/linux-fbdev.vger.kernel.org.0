Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6068B104108
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Nov 2019 17:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732848AbfKTQmA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Nov 2019 11:42:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40348 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728632AbfKTQmA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Nov 2019 11:42:00 -0500
Received: by mail-wm1-f65.google.com with SMTP id y5so308664wmi.5
        for <linux-fbdev@vger.kernel.org>; Wed, 20 Nov 2019 08:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DoBrdkQjnM2M/sNIIdwf16laThZkuQKlh8PPcfsQfYM=;
        b=GN0/nFYDPFzOUrHsl9BbUvlxMEQgUTa5wU0hEQG8hzQRTEesfxWZBj4Q/qj3QnsV4K
         AjN2mkwABi+vsodfnJLOTctxxyuhkQ55UuAtU8xswqrCnp7gxOrM8XDS6g1oeux1y2AZ
         q8O3Fd5bQRf9OxPkeDbthgLX0cnVMUMd6NecI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=DoBrdkQjnM2M/sNIIdwf16laThZkuQKlh8PPcfsQfYM=;
        b=tMBzeDu38pohV/i64Dhe4gOh/ogcUdLGmb2NZOv16kF4p7/c/ojs0NtV74M0PV16RD
         Klc+LH1cBdOIHQXwk6UqsDdPUPl0h7zY9Vfb4fSEj96lfMDyt2xojFWVO6qpxR9rvMpO
         huwVvFM8ze5gMWsFKBk2jChVJsGr0dOPPz//i28BtFQXQoq2ktxhLy5cBDTi01neTSDt
         65ykeuDWkDV9R+52Wrp7Hq5RLL7npAtlmAszJREw1qZb6T2IRo2Yvd7oADAeiW5Qdx9Y
         zLIx6PO6cbWlYjsHm9sVinJDPCwirmOpAekvOYnWzEJJgCxOO8dmGlW4P2oD3nzdzLqf
         12sw==
X-Gm-Message-State: APjAAAV60eXPbq7WNtJRCH8ih+36e5Rhy1DAsfes0XMB+95xdv0I/1JE
        FAakqy4MbcQIy1dGHNXhAQ71wQ==
X-Google-Smtp-Source: APXvYqxcp61Ouq7qqx6fMqpJbU5o8VCWsZA5gd0+Tv52/4/6QtREkNjADbOEaEE5seygIX0OYcGmYw==
X-Received: by 2002:a1c:cc01:: with SMTP id h1mr4269171wmb.172.1574268118420;
        Wed, 20 Nov 2019 08:41:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j2sm32071445wrt.61.2019.11.20.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 08:41:57 -0800 (PST)
Date:   Wed, 20 Nov 2019 17:41:55 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] staging: fbtft: Fix Kconfig indentation
Message-ID: <20191120164155.GR30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20191120133911.13539-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120133911.13539-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 20, 2019 at 09:39:11PM +0800, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I expect Greg will pick this up.
-Daniel

> ---
>  drivers/staging/fbtft/Kconfig | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
> index d994aea84b21..19d9d88e9150 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -95,8 +95,8 @@ config FB_TFT_PCD8544
>  	  Generic Framebuffer support for PCD8544
>  
>  config FB_TFT_RA8875
> -        tristate "FB driver for the RA8875 LCD Controller"
> -        depends on FB_TFT
> +	tristate "FB driver for the RA8875 LCD Controller"
> +	depends on FB_TFT
>  	help
>  	  Generic Framebuffer support for RA8875
>  
> @@ -132,10 +132,10 @@ config FB_TFT_SSD1289
>  	  Framebuffer support for SSD1289
>  
>  config FB_TFT_SSD1305
> -        tristate "FB driver for the SSD1305 OLED Controller"
> -        depends on FB_TFT
> -        help
> -          Framebuffer support for SSD1305
> +	tristate "FB driver for the SSD1305 OLED Controller"
> +	depends on FB_TFT
> +	help
> +	  Framebuffer support for SSD1305
>  
>  config FB_TFT_SSD1306
>  	tristate "FB driver for the SSD1306 OLED Controller"
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
