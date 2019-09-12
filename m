Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5421DB0C6C
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Sep 2019 12:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbfILKP4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 12 Sep 2019 06:15:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52395 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730581AbfILKP4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 12 Sep 2019 06:15:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id x2so1480800wmj.2
        for <linux-fbdev@vger.kernel.org>; Thu, 12 Sep 2019 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qV/8aDUA0K+Uc5KBI6c3mxsT5gQYmiuGy0QNU9fogWY=;
        b=HLjGOu+sn5ATRNqb1gwBenUe3YEznyBNgtpyNgD/hKYBSs2QWWj3q18VgmisjNAewd
         RNmV62/glB9NMWlTYreMQ8i988/9Jjm214Dz5RAkH7cCtvhHHfw6Mk1ERT6Y8GPhYORJ
         kd5DxajIDHvhtYq5FeINW0DJ8J718ZDT2WY7pioOc9NiqXhScZdwWhwh55PVYqwP2G5L
         r6CVnpKMGSH2XwHnGVwwKW7BcDOS6lDh1FgQh/PaZGipA+5obnd/Z7NiIpVfV/jd9AmP
         zSnrZZdWYVO8Qq4DzJt0TaurCl50dJKbmXbH2HFzmR7RUFq/JBMlDLx8PHTD9pQjeZYE
         eL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qV/8aDUA0K+Uc5KBI6c3mxsT5gQYmiuGy0QNU9fogWY=;
        b=cNieS8qPGRi9IV8nE3J7/BwypmJPhAxR6jY5l8k8+5jkVuqrqNikYFTlMx8B2mrqEm
         VmtvVA/bqR4vXdnU4+YoITMxzqUMMBkKCn5HA+d6XXO8P4/EXxaH+e8FBpCcNXqvO7S4
         FPg2acXW06zDCmiyuEhwNQfA0ExPzC+V8m2La/oNL5v+RzlgJsbOCcjlpoVXaXbTE6pi
         FAEfSWHDHkLwOAftCpXqkdGNRsfMiXeKJWzBbpleOaj/kTATpCfMJO1qlJADUx8ejudP
         HRVuGmXQWh9AbXfqXoh4TZjZk5/RbewZGOFXPUO1HcmDmkUb5sni2NWCGul3Qccexv4J
         6tdw==
X-Gm-Message-State: APjAAAV8s+LhLM6dCuG1yIT9eGTfiAZd9Eno8XVtmSHK7JcMohLOF9QE
        o4iy+7LlxJSniFrSB/2wc8eNEPDfqb8KWA==
X-Google-Smtp-Source: APXvYqwEOebgxZSBp13laDErgGyI2+sHKBFq4eelialn4eIjvYIachYOGeJu7mTeLm3/dq7MUiKVsw==
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr7626852wmb.104.1568283354131;
        Thu, 12 Sep 2019 03:15:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id q9sm4061169wmq.15.2019.09.12.03.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 03:15:53 -0700 (PDT)
Date:   Thu, 12 Sep 2019 11:15:51 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props
 constant
Message-ID: <20190912101551.7uwu23o3dqyon35p@holly.lan>
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813085855.8302-1-nishkadg.linux@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Aug 13, 2019 at 02:28:55PM +0530, Nishka Dasgupta wrote:
> Static structure micro_bl_props, having type backlight_properties, is
> used only once, when it is passed as the last argument to function
> devm_backlight_device_register(). devm_backlight_device_register() is
> defined with its last parameter being declared constant. Hence make
> micro_bl_props itself constant as well.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/ipaq_micro_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
> index 1123f67c12b3..85b16cc82878 100644
> --- a/drivers/video/backlight/ipaq_micro_bl.c
> +++ b/drivers/video/backlight/ipaq_micro_bl.c
> @@ -44,7 +44,7 @@ static const struct backlight_ops micro_bl_ops = {
>  	.update_status  = micro_bl_update_status,
>  };
>  
> -static struct backlight_properties micro_bl_props = {
> +static const struct backlight_properties micro_bl_props = {
>  	.type = BACKLIGHT_RAW,
>  	.max_brightness = 255,
>  	.power = FB_BLANK_UNBLANK,
> -- 
> 2.19.1
