Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3422B5CD4C
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2019 12:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfGBKGu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 2 Jul 2019 06:06:50 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51724 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfGBKGu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 2 Jul 2019 06:06:50 -0400
Received: by mail-wm1-f66.google.com with SMTP id 207so267265wma.1
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jul 2019 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IPhxNdYQv1IO45V1N89WkeYw72yq7YkYbzXa74/qLm8=;
        b=TmcjfCcxp9A8p09QuoZGu11Tfov1i2w+va27tjKlP+UMLAP9yOMJJmoYEsh6iIKPXW
         msQS1R0Vph9Wj+ScXIqkevVlPoxzL1HHYEnL0H2gqmnJ7GS8yuphQVdojxjDby/fnzqh
         iIKFUsFtpKGPWwSUsSgmtl07V6KTaUluSQ5tQYCKwUwjc3Q5IQfEJBVH6DJYu/677awV
         IlHuPJslNPQamm0aYo9JmdAJhR+kyipkS/zZM93qGpMREddffT/vUybnRw+4iSTpjxOC
         8zyfIrQE+miGNfNstjUZCVlvoYaIGoEeAVlmi724OpGlxR6bdJYkAvraWA3+o22qkLzb
         LxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IPhxNdYQv1IO45V1N89WkeYw72yq7YkYbzXa74/qLm8=;
        b=IPFoc4n9f7S79345NwLdXw8MBoSIz4Eqg4yvjJUnBRP1nEg5fLsIuNORXAO7Zx7NFc
         l2VKLH+gz4kMy7X2K0ky53NEcdzKtogPH8TSVhQADWmc9m4/LnHbit7+DTunmo5L0aa9
         43pCTN462vlqLD8hRfUOsVrHqRBxlojFdhxZ5rP50OgJRlYZkq6cF6107kSHvVZd9B7t
         l7XVkgtqedr2j5Y6bmKs9TaWX+Fw/LjrblUfBrMP/Sdy6AiJmBO1xJtnmhDZ5Z1aGY2n
         d3qraRmZ5OhuY8nZOBYtL7Q6W1PHQ8nuHnmYApFALEzangF+yOy83TSs7DdbfBnnIk/r
         6XmQ==
X-Gm-Message-State: APjAAAVV80F0kS1atX+5GHwtS6+V5iNFsA38EuTzjF60k5J44iJjQUyi
        0fv03ow0nOG81PQ36ZQ0LC5f5Q==
X-Google-Smtp-Source: APXvYqwdjByD+ebiA2jaUAfMZ0F44rSTtYAIiX/eLfpUiDzg2avALCgxqEFC+Vkzsv/GOweWWbSJqA==
X-Received: by 2002:a1c:a654:: with SMTP id p81mr2771343wme.36.1562062008717;
        Tue, 02 Jul 2019 03:06:48 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id m24sm2055652wmi.39.2019.07.02.03.06.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 03:06:48 -0700 (PDT)
Date:   Tue, 2 Jul 2019 11:06:46 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Kevin Hilman <khilman@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 00/12] ARM: davinci: da850-evm: remove more legacy GPIO
 calls
Message-ID: <20190702100646.q3wgzgacvp67m6xv@holly.lan>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <fe42c0e1-2bfb-2b1c-2c38-0e176e88ec6e@ti.com>
 <20190702063653.GC4652@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190702063653.GC4652@dell>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jul 02, 2019 at 07:36:53AM +0100, Lee Jones wrote:
> On Mon, 01 Jul 2019, Sekhar Nori wrote:
> 
> > Hi Lee, Daniel, Jingoo,
> > 
> > On 25/06/19 10:04 PM, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > 
> > > This is another small step on the path to liberating davinci from legacy
> > > GPIO API calls and shrinking the davinci GPIO driver by not having to
> > > support the base GPIO number anymore.
> > > 
> > > This time we're removing the legacy calls used indirectly by the LCDC
> > > fbdev driver.
> > > 
> > > The first three patches modify the GPIO backlight driver. The first
> > > of them adds the necessary functionality, the other two are just
> > > tweaks and cleanups.
> > 
> > Can you take the first three patches for v5.3 - if its not too late? I
> > think that will make it easy for rest of patches to make into subsequent
> > kernel releases.
> 
> It's already too late in the cycle (-rc7) for that.  I require patches
> of this nature to have a good soak in -next before being merged. There
> shouldn't be an issue with getting them into v5.4 though.

On the other hand I think we did take a patch that did much the same 
thing as patch 1/12 in this series:
https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git/commit/?h=for-backlight-next&id=98b7404eb7d64e55f8fdd419cb3965a8abf0e217

I'm not 100% sure but I think that might allow the patchset to be split
into two that are independent (one for Davinci and one for gpio
backlight improvements).


Daniel.

> 
> > > Next two patches enable the GPIO backlight driver in
> > > davinci_all_defconfig.
> > > 
> > > Patch 6/12 models the backlight GPIO as an actual GPIO backlight device.
> > > 
> > > Patches 7-9 extend the fbdev driver with regulator support and convert
> > > the da850-evm board file to using it.
> > > 
> > > Last three patches are improvements to the da8xx fbdev driver since
> > > we're already touching it in this series.
> > 
> > Thanks,
> > Sekhar
> > 
> 
> -- 
> Lee Jones [李琼斯]
> Linaro Services Technical Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
