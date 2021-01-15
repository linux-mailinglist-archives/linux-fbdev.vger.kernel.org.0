Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34DA72F7B88
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 Jan 2021 14:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730706AbhAONDI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 15 Jan 2021 08:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22925 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731753AbhAONDH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 15 Jan 2021 08:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610715700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3qUW7zevwWXvqoHLvj7/qMiSow/x6RjQU2aGd0I7oQM=;
        b=HVT8tCkvQPRWE0YacQt55FLA19bmhMg9IVa0uv1rSjapmwyqD0SFh1Z3FPc8+KbAoWtBL9
        1yYyyF7Lz8TgZ4l3QEqF23OVSJq1zOZ/hjLuDGDH+IQumXKSVsvIwoVclmH+/9PauzocWq
        qc8TMAMSEFKCIJiN6oSRxB48Yv5ZH2s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-4ePZPx2tORSPvnovb3guGw-1; Fri, 15 Jan 2021 08:01:39 -0500
X-MC-Unique: 4ePZPx2tORSPvnovb3guGw-1
Received: by mail-ej1-f70.google.com with SMTP id f26so3553560ejy.9
        for <linux-fbdev@vger.kernel.org>; Fri, 15 Jan 2021 05:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3qUW7zevwWXvqoHLvj7/qMiSow/x6RjQU2aGd0I7oQM=;
        b=NufqOOQuObscbCQnR+NBnKbdusWZjf2mKXG2ANGqAHB5X4xNRh+hcoaCpRR2XklJS/
         MC9gzIG16wtcEBEVEykpBPdkNNxiNoIoalHF8GltF1ZvUuMlGE6pr9aDilpwju0IgMI0
         1WH7T7xsxGo2phibtKCN+t1LEKe7ZrbDIH2xxjWeAQNRucBtTBFItHyZG1kDaCkiBQmb
         r49fOE5MOBlbJnY/d+EeCtvPhn5m+/WZ4juRhbTAHjtbhy5yztGsMYkNOS87NcghR+x+
         uSpeAdOsb5d/i+lImgzv9Lfh+lxPG5C20aNT4tnTwdKraAEE4SvoGdt6ppRPj9IN+dER
         lFwA==
X-Gm-Message-State: AOAM5308OR2nNZq433pXohL5NXmVle59FirqDHblVV8+83JByQZDF6i9
        cK6a5yxXLZB18asAEx/RUHCW4QQQuXmeEozQXxJWeyq7uC/RrwYBxO7Enk2YnoTCqu66g8Q2/cp
        muganEkp/aCgAOSbo4ITrPf96u71mPTyOyqIjomFlhCMAR7Vhe3i50QTwgeVj5cNXM/0h1XQxAx
        g=
X-Received: by 2002:aa7:c3cf:: with SMTP id l15mr9872030edr.282.1610715697722;
        Fri, 15 Jan 2021 05:01:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSbrm6SCCaLbwlHv8lkUeYr1MZpYtkeZpgl2hGxP6VV61JUoSC5yFA3uhY6tpBmytmFUs2YA==
X-Received: by 2002:aa7:c3cf:: with SMTP id l15mr9872000edr.282.1610715697449;
        Fri, 15 Jan 2021 05:01:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id k22sm1947702eji.101.2021.01.15.05.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 05:01:36 -0800 (PST)
Subject: Re: [PATCH 3/6 v6] fbdev/simplefb: Add the N64's mode
To:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, linux-fbdev@vger.kernel.org
References: <20210113171159.ed46ea46b7af0cc6cf2a85d8@gmx.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <70447198-f7e5-ac18-8593-6a995cce6700@redhat.com>
Date:   Fri, 15 Jan 2021 14:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210113171159.ed46ea46b7af0cc6cf2a85d8@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

On 1/13/21 4:11 PM, Lauri Kasanen wrote:
> By keeping it separate for the platform, we save 748 bytes.
> This brings simplefb to 2.5kb from 3.2kb, when a native fb driver
> was 1.5kb.
> 
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  include/linux/platform_data/simplefb.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
> index ca83376..c9d4f2c 100644
> --- a/include/linux/platform_data/simplefb.h
> +++ b/include/linux/platform_data/simplefb.h
> @@ -13,6 +13,12 @@
>  #include <linux/types.h>
> 
>  /* format array, use it to initialize a "struct simplefb_format" array */
> +#ifdef CONFIG_MACH_NINTENDO64
> +#define SIMPLEFB_FORMATS \
> +{ \
> +	{ "r5g5b5a1", 16, {11, 5}, {6, 5}, {1, 5}, {0, 1}, DRM_FORMAT_RGBA5551 }, \
> +}
> +#else
>  #define SIMPLEFB_FORMATS \
>  { \
>  	{ "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565 }, \
> @@ -25,6 +31,7 @@
>  	{ "x2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {0, 0}, DRM_FORMAT_XRGB2101010 }, \
>  	{ "a2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {30, 2}, DRM_FORMAT_ARGB2101010 }, \
>  }
> +#endif
> 
>  /*
>   * Data-Format for Simple-Framebuffers

I am honestly not entirely convinced of the #ifdef-ery this adds. I understand that RAM is
tight on the N64, but this saves just 700 bytes, which even on the N64 is not a lot.

Right now it might be just 1 #ifdef for the N64, but if other platforms follow this example?

Honestly I would prefer to just see the format added to the existing SIMPLEFB_FORMATS
define without the #ifdef.

Alternatively:

Are you using devicetree or are you using a board.c file to instantiate everything?
If it is the latter I guess we could add a const struct simplefb_format * to the pdata
and then just pass in the format directly. I can even imagine the code which uses
the SIMPLEFB_FORMATS having a #ifdef CONFIG_OF around it in that case to optimize it out...

That would be a more generic solution which hopefully will save as much if not more
space...

Regards,

Hans

