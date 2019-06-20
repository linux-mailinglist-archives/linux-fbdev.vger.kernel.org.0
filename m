Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0EA4CEB2
	for <lists+linux-fbdev@lfdr.de>; Thu, 20 Jun 2019 15:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfFTNcD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 20 Jun 2019 09:32:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50857 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfFTNcC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 20 Jun 2019 09:32:02 -0400
Received: by mail-wm1-f66.google.com with SMTP id c66so3130336wmf.0
        for <linux-fbdev@vger.kernel.org>; Thu, 20 Jun 2019 06:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s4mJvF/EBCi9urzBjDVk6HyByyO2EXSJJe+w8Mr6PqE=;
        b=fcQ2LGsvLhMHenQaR0fPJrheg/Ke4ddcB5Wu7YfIryVJUo9ToV0DrbYLLy5uEKt+Te
         2eAlQZaWMnmihwnpB4DJYMLeVliQetctkognWmabqg2/bsj8vtTQ3Wdrk+/7DO4VmNG3
         idw+XcIFBhIqZqB++Mw/O8IMVCpYutg5pJSVKzdMLiLzmItHKlz0b8OfrR7rtZ9kG3B0
         PKKZxH1aruGECIB8MkZB2p8I+nWXXn5inX9QgpLCSUp9zSeHDaxhypHI8x4Pe1hjvwhw
         vzzKpP408bHesT24rsySd1QPusV0TiHkwQeIkwFsr0iPxO7OVyk0/rcCLNTy7QcBcnmw
         lOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s4mJvF/EBCi9urzBjDVk6HyByyO2EXSJJe+w8Mr6PqE=;
        b=JCw7d98NhDR91mbsoD90a00rRrMuYxSHoCu5zKOiUqFsSZApIYnv3XHDtgQ8XnU6+V
         y7V9rVEtyl5zwRT/JeV8sgfIANQmGPfThkV9Ig7wQ3yZBPkqsIoeV45+V2jo3OntGgrb
         mTj27ykQaUiP0v8rTCfS0qTlVSWxo/+69Naxn+r/Py8XptHBbhA6lNXb1lUBXwHRdMw/
         3juk38nqR4U07PooUqgrg4x0/hO6yZ0WRkab6Noyk7Njh1+P+uDuT6Zx3HV45JKlz7u1
         7zVdST0lj2ZjpbTx0JvFXjauNkFpCKiWvT0Ud6RrYizerP1nPynrujtfrTQhy/OBADu/
         R7SQ==
X-Gm-Message-State: APjAAAX/N9hCi5/4IP082i3EKjXv87dxfy8F44imo8U/Mm4AsT1qV2fq
        hKN0GAPoEuCnWb+wCmJpbnX75w==
X-Google-Smtp-Source: APXvYqyZ+XwqzkDzsOqDlRPJBWJqgVr7mKBJlSUjoZoLBHrCLh8eDBez55m86Gy5WHroG5f6vyKnPA==
X-Received: by 2002:a1c:cb0c:: with SMTP id b12mr2974917wmg.93.1561037520557;
        Thu, 20 Jun 2019 06:32:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.googlemail.com with ESMTPSA id l19sm2782480wmj.33.2019.06.20.06.31.59
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 06:31:59 -0700 (PDT)
Subject: Re: [PATCH v1] backlight: Don't build support by default
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        fbdev <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Antonino Daplas <adaplas@gmail.com>
References: <70bd61f9-8fc5-75b1-9f32-7a5826ce6b48@free.fr>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <7958bf6a-5c2e-1330-1800-f9dbce3c01c6@linaro.org>
Date:   Thu, 20 Jun 2019 14:31:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <70bd61f9-8fc5-75b1-9f32-7a5826ce6b48@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 12/06/2019 14:27, Marc Gonzalez wrote:
> b20c5249aa6a ("backlight: Fix compile error if CONFIG_FB is unset")
> added 'default m' for BACKLIGHT_CLASS_DEVICE and LCD_CLASS_DEVICE.

It took me some little while until I realized this patch is from 2005 
which explains why I couldn't find it in the modern git repo!


> Let's go back to not building support by default.

At first glance disabling this by default looks like it would cause some 
existing defconfig files to disable useful drivers.

For backlight I think this isn't true (because both DRM and FB_BACKLIGHT 
have a "select" on BACKLIGHT_CLASS_DEVICE).

However for LCD it is not nearly as clear cut. Commit message needs to 
explain why this won't cause unacceptable problems for existinng 
defconfig files.


Daniel.




> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>   drivers/video/backlight/Kconfig | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 8b081d61773e..40676be2e46a 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -10,7 +10,6 @@ menu "Backlight & LCD device support"
>   #
>   config LCD_CLASS_DEVICE
>           tristate "Lowlevel LCD controls"
> -	default m
>   	help
>   	  This framework adds support for low-level control of LCD.
>   	  Some framebuffer devices connect to platform-specific LCD modules
> @@ -143,7 +142,6 @@ endif # LCD_CLASS_DEVICE
>   #
>   config BACKLIGHT_CLASS_DEVICE
>           tristate "Lowlevel Backlight controls"
> -	default m
>   	help
>   	  This framework adds support for low-level control of the LCD
>             backlight. This includes support for brightness and power.
> 

