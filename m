Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BC43D138A
	for <lists+linux-fbdev@lfdr.de>; Wed, 21 Jul 2021 18:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhGUPcR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 21 Jul 2021 11:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhGUPcR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 21 Jul 2021 11:32:17 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BF7C061575
        for <linux-fbdev@vger.kernel.org>; Wed, 21 Jul 2021 09:12:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id w13so1654011wmc.3
        for <linux-fbdev@vger.kernel.org>; Wed, 21 Jul 2021 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/TUzm+r4i6x5Fd/Y3rX+aarORyvThPVGsjhta7pdUUM=;
        b=yZPs+TcXZ1V41RVZMWBuNGilPtIeCDldum5OeQcSGae4Mn5XjHY0vH+8iWxFd8gIZ4
         xpj0CJemOHD9W5q27JWjhyjesPikTk8qFkzk8+d0dbiSLySBzx1VpqE9svaTMShr0vZs
         36qlbNp3FlX2ILqwg8145IaoH1ZONp3GurlNQ9aMm2gLU/sXtxUo+GK57ebYSOjaHtyl
         fUL3EptnCgsrKx1pKjDx+4MvNEnefaS6LoivYw7Nj27BOEcGgDuMxTRJbAa3X0T1gPiM
         yWUFXSp4ebsgML35pFNObM5oP69YztYaAMumym1HzZ4DN+9CLKzSyv8MdMFtV/NwSz3X
         HtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/TUzm+r4i6x5Fd/Y3rX+aarORyvThPVGsjhta7pdUUM=;
        b=iip0RxJTF/fxKFmP1+nV4DW5BgcxiMjcmKsus8dd304pW15RYj6q03chnp4LTQ5IAq
         GLs6wIKPNcaIXKH5gA1hnqLD48BIaj6b787bwdwHlvllCVp4dr0H0ifx4D7ZPuXULV2K
         AKQPY7DK1vE7v9gThVOiVlntNVvOYYh6nEpmvlyZZT4tAEg/+G2tDqyFC4ujCxCNg3T0
         ojWhvKfiOxXwikXDV3KHQo+xA7PZsvQLwRO7o/2sharJcHg5e/allp0FY07bNL64v3/R
         KZ0yCOlJMXmEljq4+JVYT03X6kUXXUlwKD5l4lFN2jMu/S/jOomPWBE1JKg6hzHmr17K
         DJOw==
X-Gm-Message-State: AOAM530e+lEPTupYpg3SI6JqvTnjKEeHKE+gWXvqaGhVOY2WrTH1ts8+
        Gs0nsTaedGeuENGSTOwacs5Sgw==
X-Google-Smtp-Source: ABdhPJz8Ko7Nyv1om8SRWu+YtegWLgb20eGcf8MN6pTdjl7RvLZ1nBBGcfXbCL0VzBESOb1gFcWz2w==
X-Received: by 2002:a05:600c:cb:: with SMTP id u11mr37131480wmm.66.1626883971685;
        Wed, 21 Jul 2021 09:12:51 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id p2sm22356766wmg.6.2021.07.21.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:12:50 -0700 (PDT)
Date:   Wed, 21 Jul 2021 17:12:49 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
Message-ID: <20210721161249.gehnwkscto2hlh7s@maple.lan>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
> On 7/21/21 12:49 PM, Daniel Thompson wrote:
> > > I'm not sure that's correct, we can simply say that any new uses of the
> > > pwm-backlight should specify the initial GPIO configuration, and for the
> > > legacy ones, use whatever is in the code now.
> > 
> > I'm not 100% against the idea... however if we still have to get the
> > code to read state from the hardware right for legacy cases that means
> > we have to do the same work but with fewer people testing it.
> 
> We can do something like this:
> 
> if (of_property_read_bool(np, "enable-active-high"))
>   gpiod_direction_output(pb->enable_gpio, 1);
> else if (of_property_read_bool(np, "enable-active-low"))
>   gpiod_direction_output(pb->enable_gpio, 0);
> else {
>   WARN_ON_ONCE("Fix your DT"); // or some such notification
>   ... legacy code path ...
> }
> 
> Note that I picked the same DT prop names as drivers/gpio/gpiolib-of.c
> of_gpio_flags_quirks() uses, because we are headed into similar mess here
> I'm afraid.

I don't quite understand what you mean here. We are using gpiolib so
for us there is no concept of active-high or active-low. The only
concept for us is whether enable_gpio is asserted or not.

What the DT property would be describing is purely whether the
bootloader left the backlight on or off. This sails very close to the
edge of what is in-scope for DT (at least it does it we can read
the inherited state directly from the hardware).

What it also means decisions about the DT bindings are more about
whether, if the backlight is lit up, the bootloader should also disclose
what it thinks it has established as the PWM duty cycle as well.

Overall I have fairly grave concerns that this simply moves
fragility into the bootloader rather then reducing it.


Daniel.
