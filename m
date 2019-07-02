Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2057F5C962
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2019 08:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbfGBGg6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 2 Jul 2019 02:36:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44155 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfGBGg6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 2 Jul 2019 02:36:58 -0400
Received: by mail-wr1-f67.google.com with SMTP id e3so6791639wrs.11
        for <linux-fbdev@vger.kernel.org>; Mon, 01 Jul 2019 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kL52YKQhFRfe3VLS8UGs1QL98Cpg/XLkHXZMM+/zcyM=;
        b=YZV+d5gqyzrP4gJNY5WwDuXGyrmn0m0DVdTv+9ppXaeW71PBbeOby+m1eElOIBixjX
         bkEre9t6nF7NUX9U965KXC/EJ8N98Cru9PsOJGSjGF9gFnwp8/QzBDy5LTRHXHi9aqrI
         zW9Z41R0hL7APL7VK5m6sYCxRpZfFKvd1bTVN0BR21ivFK/UZmgSRk9ygU2x48NnBA8X
         AcBGEN/Jh0clFSqBDXkVTpFBncTcdw03s0bRc1OCI9d189YVkL5re+bSQrm+0KZ0TqmV
         AWij6o1bxNwElPFN+PCnj2zJDkewnveeiEIoypEZ0ljdMwx5LuxyF3hah2RwmITTiE2x
         w1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kL52YKQhFRfe3VLS8UGs1QL98Cpg/XLkHXZMM+/zcyM=;
        b=cHIU1E8RTSjHR8NFJNEXkpep9O8ITTtNiLl1/mwobVyIPaNs4C0Z2XK6qw4iH8g4RE
         12REBcNJuqdpl2RsXPtVC0chInzspFko8Iqydv8AjT7LoN+wmc7nooGGEHOHFNG20Q6p
         aWAx7cjXpcdWWEcvCB0c3kp67elYjvM5VH/m0O6b0oXAjLp72apgGjeAmoM6PIdKPann
         ugvy8rng4k6MmIBGJbR7ISPx2IvpUgcVVCKq9M5eVjnyI6Q7iTht5gMgX+vy0XrEXuGB
         5MY/RchiuGNU2sAbbk493uypWyRiAC6ztBMkEbe0diKvfXO3EcSSjEufdaVsZLRtof0V
         7UFg==
X-Gm-Message-State: APjAAAX0OyigeO/8Q2acIKN0joGEI7aYe2ck40he7U3amwl0RqHPawEb
        T3x72C9aw4ikBblFV8Pjrf4Wuw==
X-Google-Smtp-Source: APXvYqyNIADHpitNQlVYgOHrVqbwIkf6QAAdkpRA5Xs8300TxHIp8LjNRmcFL/fWRjeA4UT1R1Qr1A==
X-Received: by 2002:a05:6000:1285:: with SMTP id f5mr7035937wrx.315.1562049416043;
        Mon, 01 Jul 2019 23:36:56 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id h133sm1648236wme.28.2019.07.01.23.36.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 23:36:55 -0700 (PDT)
Date:   Tue, 2 Jul 2019 07:36:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sekhar Nori <nsekhar@ti.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kevin Hilman <khilman@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 00/12] ARM: davinci: da850-evm: remove more legacy GPIO
 calls
Message-ID: <20190702063653.GC4652@dell>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <fe42c0e1-2bfb-2b1c-2c38-0e176e88ec6e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe42c0e1-2bfb-2b1c-2c38-0e176e88ec6e@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 01 Jul 2019, Sekhar Nori wrote:

> Hi Lee, Daniel, Jingoo,
> 
> On 25/06/19 10:04 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > This is another small step on the path to liberating davinci from legacy
> > GPIO API calls and shrinking the davinci GPIO driver by not having to
> > support the base GPIO number anymore.
> > 
> > This time we're removing the legacy calls used indirectly by the LCDC
> > fbdev driver.
> > 
> > The first three patches modify the GPIO backlight driver. The first
> > of them adds the necessary functionality, the other two are just
> > tweaks and cleanups.
> 
> Can you take the first three patches for v5.3 - if its not too late? I
> think that will make it easy for rest of patches to make into subsequent
> kernel releases.

It's already too late in the cycle (-rc7) for that.  I require patches
of this nature to have a good soak in -next before being merged. There
shouldn't be an issue with getting them into v5.4 though.

> > Next two patches enable the GPIO backlight driver in
> > davinci_all_defconfig.
> > 
> > Patch 6/12 models the backlight GPIO as an actual GPIO backlight device.
> > 
> > Patches 7-9 extend the fbdev driver with regulator support and convert
> > the da850-evm board file to using it.
> > 
> > Last three patches are improvements to the da8xx fbdev driver since
> > we're already touching it in this series.
> 
> Thanks,
> Sekhar
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
