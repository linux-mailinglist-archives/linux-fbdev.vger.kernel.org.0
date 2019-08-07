Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B83768545F
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Aug 2019 22:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388554AbfHGUPe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 7 Aug 2019 16:15:34 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40363 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387888AbfHGUPd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 7 Aug 2019 16:15:33 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so42355341pla.7
        for <linux-fbdev@vger.kernel.org>; Wed, 07 Aug 2019 13:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RU+mCl+d15cBnmP6BMoJqIyEACy478kUYuCNnNZJiqw=;
        b=RwoY0vyVibrSFxjnucYfjp+aWRh2NgUEtgqFYjY8w08e7aiLVLcxKn9RCWHq4b7SJk
         8FUeg3lCxv6f5agtWIgt/tatmSYIRk7tQRv0RZf4BH0NKtCUnT5xLuQvXFDvXqH0W8Ui
         PKtctk6GL5/3C3yNzZ90bt706+jZtcmRS4NJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RU+mCl+d15cBnmP6BMoJqIyEACy478kUYuCNnNZJiqw=;
        b=j32mc/FOGL4DmQLfipjI7ZRTWb0AFN8FKEili06Ri9gXHRqwVy5M2P6O2gkO2EMuMw
         xYa7TuVYd4715vKVTRX6JuSWY6sbl+PwZgJd88/QZdfcKbt0LLyW0cpNt0Zdmlibtfra
         JresY5ik9AU23QsDyCQwTHavXB2FjqNmmon+f1XRw7tw7/Zx00PgucaG5PRW1piRkXNl
         a7trH6SeRLqVF6OOUkQ+OIbJypSz4rogbAG6une/UpPU2zkzo2ET6/vzQ8LXHkqdNgNp
         yDXcy8nCsIBYai3QIf5/FAFSOEkJoazdUDZBS3dIGeKYDXlAIOBr3HWjx04LT6aBBCcV
         DjhQ==
X-Gm-Message-State: APjAAAUcL4XsuM6wWhyIOhlj1uzRVX0rZJEkVFrCPIDNhBVONWu+b5JZ
        5kSAECZxgm8ZOW2vT/j7IxgKfQ==
X-Google-Smtp-Source: APXvYqzcVZwYo5rrOlwBwZoU659GCbZRYFCC2aSl+NJNpuqYHhxbX896kG9fN1cjA8EAoMnQE6+lFQ==
X-Received: by 2002:a17:902:b582:: with SMTP id a2mr10103527pls.128.1565208933200;
        Wed, 07 Aug 2019 13:15:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id w197sm116457813pfd.41.2019.08.07.13.15.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 13:15:32 -0700 (PDT)
Date:   Wed, 7 Aug 2019 13:15:28 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190807201528.GO250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-3-mka@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jul 09, 2019 at 12:00:05PM -0700, Matthias Kaehlcke wrote:
> Backlight brightness curves can have different shapes. The two main
> types are linear and non-linear curves. The human eye doesn't
> perceive linearly increasing/decreasing brightness as linear (see
> also 88ba95bedb79 "backlight: pwm_bl: Compute brightness of LED
> linearly to human eye"), hence many backlights use non-linear (often
> logarithmic) brightness curves. The type of curve currently is opaque
> to userspace, so userspace often uses more or less reliable heuristics
> (like the number of brightness levels) to decide whether to treat a
> backlight device as linear or non-linear.
> 
> Export the type of the brightness curve via the new sysfs attribute
> 'scale'. The value of the attribute can be 'linear', 'non-linear' or
> 'unknown'. For devices that don't provide information about the scale
> of their brightness curve the value of the 'scale' attribute is 'unknown'.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Daniel (et al): do you have any more comments on this patch/series or
is it ready to land?

Thanks

Matthias
