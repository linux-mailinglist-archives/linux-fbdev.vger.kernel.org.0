Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19504103D8F
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Nov 2019 15:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbfKTOnz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Nov 2019 09:43:55 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:56799 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731732AbfKTOny (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Nov 2019 09:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RazfukX+mfulswAwCO+uVfKNQyeNJjTPuAJGNFDskdQ=; b=A/AgZIvtK1bk5djc/nM2d6Eh7+
        wvPBnxO8tvdtphrOstY3CIbL5vcFYACKDAUb9+g25vZ/FDJhoB2wlGdBj4cSBOc68u6folDOF9VC7
        6vF95DSpDywRuO2BNtYIpfY2dYkksAdl3LawCj9qPsxv9Siz9MYpwKdKSQrCWqyYfyD9CXUHHGHy5
        ocKeOIcWuxYxrQCak79ze7JsE2JWL3m4jogjc+Y7XwVTHtLCrv/3suw++ELwsH6BVrPR00rdPk2vm
        J+5NijQ5ibthMOc6XHAnugqnHzUcbANpZE7vZPahkBpNKKD73Bb6tVsEYBp/T+C3+gKVh+36LeNDx
        bFJT9MCw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53371 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iXRCy-0001hm-3L; Wed, 20 Nov 2019 15:43:52 +0100
Subject: Re: [PATCH v1 3/5] fbtft: Drop useless #ifdef CONFIG_OF and dead code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        devel@driverdev.osuosl.org
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
 <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <37435de0-873d-d20c-ac66-420ba91356fd@tronnes.org>
Date:   Wed, 20 Nov 2019 15:43:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 20.11.2019 10.57, skrev Andy Shevchenko:
> First of all there is no need to guard GPIO request by CONFIG_OF.
> It works for everybody independently on resource provider. While here,
> rename the function to reflect the above.
> 
> Moreover, since we have a global dependency to OF, the rest of
> conditional compilation is no-op, i.e. it's always be true.
> 
> Due to above drop useless #ifdef CONFIG_OF and therefore dead code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c

<snip>

> @@ -1184,17 +1176,10 @@ static struct fbtft_platform_data *fbtft_probe_dt(struct device *dev)
>  		pdata->display.backlight = 1;
>  	if (of_find_property(node, "init", NULL))
>  		pdata->display.fbtftops.init_display = fbtft_init_display_dt;
> -	pdata->display.fbtftops.request_gpios = fbtft_request_gpios_dt;
> +	pdata->display.fbtftops.request_gpios = fbtft_request_gpios;

You can ditch the .request_gpios callback and call fbtft_request_gpios()
directly in fbtft_register_framebuffer(). That will make it safe to drop
the OF dependency, otherwise .request_gpios will be NULL in the non-DT
case. This is one of the bugs that follwed the gpio refactoring.

You can also ditch the .request_gpios_match callback if you want, it
isn't called anymore (it is set in fb_agm1264k-fl).

Noralf.

>  
>  	return pdata;
>  }
> -#else
> -static struct fbtft_platform_data *fbtft_probe_dt(struct device *dev)
> -{
> -	dev_err(dev, "Missing platform data\n");
> -	return ERR_PTR(-EINVAL);
> -}
> -#endif
>  
>  /**
>   * fbtft_probe_common() - Generic device probe() helper function
> 
