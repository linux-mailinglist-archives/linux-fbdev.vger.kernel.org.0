Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E8B249A75
	for <lists+linux-fbdev@lfdr.de>; Wed, 19 Aug 2020 12:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgHSKgg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 19 Aug 2020 06:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgHSKgf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 19 Aug 2020 06:36:35 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35F1C061757
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Aug 2020 03:36:34 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r4so20960486wrx.9
        for <linux-fbdev@vger.kernel.org>; Wed, 19 Aug 2020 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gqSQwu4Ak76ivz5DMvC1qM1RY6caUZn/vouX4UHQw3I=;
        b=CjTCQsyG1PMArt9IepD1AZqckRAk1VWAupEx7JQzkjyj4JJtTiWuflR0Sq2kWOlrIf
         AaWwWJUo9s790go1/kOWmsg3VfSuAnCqhaYqnGEB6NvqzaiMeVKL89+mPVfkyKYPRlBv
         F3ln4glh1kKamDQItyNdbbUd7KHQSe8bFfn4AizOyXRJqpf+aUiB9OfBMIVowmmj2Dkh
         32sW2AQHtksXyyfuS9GtW7tEBbufEqgBBuEtIhHGMLcPJifWSr5hNYlXBV2WgAPKdYLb
         OaXZiEsEgE4phiiHO9APtrdwmO5dgImWpr7tt84CkOXUGcvVgNU47iRONft3akrqJZK5
         hGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gqSQwu4Ak76ivz5DMvC1qM1RY6caUZn/vouX4UHQw3I=;
        b=G9h0NDVlRLnC5RPSw4ovKIIhkJvSD0/J7eF+zzt2VZTJ1NgAGysTBSo6vDoVXF7wig
         ak1L9BBwj78W/CC3mq/JYRM81EoEXB/dzqBNlmq78dAblgx+OE5whN+mHkyVy8vIicSU
         ASNS8p0ZzSTfz9jc4sEAI3JJ/jA6fsQPr17o/StKad+2AWbcXq+5LT8OEbnXoWto9fQc
         A7HN0YM14hgmpOqeVXnLKzy2INsoypScyEYNrqhPfQgz8dkOc9ooSrJ1gy8gaUfJBxhY
         JruaD6ehyr9xORbMa9fjXRvAtrK7SnW4/5kOQuo4u7VmfjHbSCA7nZYbGEmBIe/SXVdr
         zH8Q==
X-Gm-Message-State: AOAM533xcCa6M797MrKEaTMWEvIHNrCldexuYOMgyLmbc1T9N8Gf1KcI
        ukZQ1TkPtBg2M/yfGyJ7EnpkWg==
X-Google-Smtp-Source: ABdhPJzE34UTUHjY+WGW7nyIcaHkOe0CiQFL3LKWYRMXnifP8QvLNy0lyjk41fn9cLNJWf7pqvvz6Q==
X-Received: by 2002:a5d:60cb:: with SMTP id x11mr23007048wrt.281.1597833393382;
        Wed, 19 Aug 2020 03:36:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id b203sm5105222wmc.22.2020.08.19.03.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 03:36:32 -0700 (PDT)
Date:   Wed, 19 Aug 2020 11:36:31 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        Bryan Wu <cooloney@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix refcount
 imbalance on error
Message-ID: <20200819103631.bptd34ij3fid4ych@holly.lan>
References: <20200819030456.7054-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819030456.7054-1-dinghao.liu@zju.edu.cn>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Aug 19, 2020 at 11:04:56AM +0800, Dinghao Liu wrote:
> When of_property_read_u32_array() returns an error code, a
> pairing refcount decrement is needed to keep np's refcount
> balanced.
> 
> Fixes: f705806c9f355 ("backlight: Add support Skyworks SKY81452 backlight driver")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/sky81452-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> index 0ce181585008..8268ac43d54f 100644
> --- a/drivers/video/backlight/sky81452-backlight.c
> +++ b/drivers/video/backlight/sky81452-backlight.c
> @@ -217,6 +217,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
>  					num_entry);
>  		if (ret < 0) {
>  			dev_err(dev, "led-sources node is invalid.\n");
> +			of_node_put(np);
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -- 
> 2.17.1
> 
