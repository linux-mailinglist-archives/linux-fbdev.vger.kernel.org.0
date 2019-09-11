Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64EAEAFAD1
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Sep 2019 12:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfIKKvy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Sep 2019 06:51:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50471 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727342AbfIKKvy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Sep 2019 06:51:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id c10so2871231wmc.0
        for <linux-fbdev@vger.kernel.org>; Wed, 11 Sep 2019 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Uryc0/pqdqKJAZc5VoGKLbUrzv2t7H2FdK8rw8hlLgg=;
        b=YeChDvIWXEB0TstAMgYAD4rorZ17PMeVJH48y0XNFopRTKZkFqUzX25bM6/kDkwlSB
         viruUn+aG6aBu7i775BC0uPh+Nsgx/H/fOmG9216rwKNJhReVC/5NFTPYosGl7ssOqXf
         Ip70bQ66StWipRujTpPgoTIYal+mCceDScD4Xpm6y026t3KvdNv8aQG0AX1QCn4xSqqg
         J2DFJGyp8hAvpPJxNa+g/OKeKf5D0HyIxw3JdyOMhYjvFneVT7aV2X+MA1yMM361/1py
         /X/tC/wr7UCCvVd8QF24ZWpp+8FpWc8i3kUAx2gpGTztEI/E2jSfyarbbeJ/q9Js94L+
         T3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uryc0/pqdqKJAZc5VoGKLbUrzv2t7H2FdK8rw8hlLgg=;
        b=ZOFaLN58Bh4mSUlBoO+oyth+rUPajLNYKFdlo3Z1ci3KAFAF+xyWt6q5FFKoZYzKnE
         hNBneTsXzstIq+OL3HSUCGiEE01pjwmdBZY/gZVooi14H7gqIYBo9gsuui1jl4j0mHTl
         QcOse8M+EPsF2QKCVx+CyHePf2YbucVvcbhjCFzF5k5Fmt1pJWqlqP8CsCDtqaReX2CM
         6F75lToxfQ41OkTIIS7QP7Q+Wj6RliH7DxT5EhjGK+hyYtkmeyvFRAmJsc+IJ6hd4FNK
         9KsuM9WzWNa07PpI1jxsKq1JssbmeMeMRuC+ZuJbhkx9tUBwnAaRk/3/ibmlbSSFIOdF
         pj8Q==
X-Gm-Message-State: APjAAAXoHJNpbbUcrOdDN2UV3ItjeA2eZPUCSkSvN4O1RvkMWIoCLcuO
        JXdR6oqPwxgmZODes5udsbvfYw==
X-Google-Smtp-Source: APXvYqxQ+TkhPae6YnwpETNmnZCKnGfRVMJswmmeya3cK+zZE7nfR1qS/48jxDEUAMDXwJhtaDBYyw==
X-Received: by 2002:a1c:110:: with SMTP id 16mr3544521wmb.88.1568199110456;
        Wed, 11 Sep 2019 03:51:50 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id b144sm2485131wmb.3.2019.09.11.03.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 03:51:49 -0700 (PDT)
Date:   Wed, 11 Sep 2019 11:51:48 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        hns@goldelico.com
Subject: Re: [PATCH] backlight: lm3630a: fix module aliases
Message-ID: <20190911105148.4prmcr2f2r36sgrf@holly.lan>
References: <20190910152359.7448-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910152359.7448-1-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Sep 10, 2019 at 05:23:59PM +0200, Andreas Kemnade wrote:
> Devicetree aliases are missing, so that module autoloading
> does not work properly.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/lm3630a_bl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index 3b45a1733198..9d67c07db2f2 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -617,12 +617,14 @@ static const struct i2c_device_id lm3630a_id[] = {
>  	{}
>  };
>  
> +MODULE_DEVICE_TABLE(i2c, lm3630a_id);
> +
>  static const struct of_device_id lm3630a_match_table[] = {
>  	{ .compatible = "ti,lm3630a", },
>  	{ },
>  };
>  
> -MODULE_DEVICE_TABLE(i2c, lm3630a_id);
> +MODULE_DEVICE_TABLE(of, lm3630a_match_table);
>  
>  static struct i2c_driver lm3630a_i2c_driver = {
>  	.driver = {
> -- 
> 2.11.0
> 
