Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A328CC52B
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2019 23:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfJDVsA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 4 Oct 2019 17:48:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46461 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfJDVsA (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 4 Oct 2019 17:48:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so7894109ljl.13
        for <linux-fbdev@vger.kernel.org>; Fri, 04 Oct 2019 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=96jk8p/6XP5ut+JBHE0IBsdTmxOUR/fsv3ZcRWDzMOg=;
        b=hboFmV/U4IcPI89MtzDp+OzE5KwsWErja8LOnkuuLwv0fksWiRpqJQZRis7rFIeVPP
         Ooj27rcXns2Y4feoVEtg49n8CryY2RaGyouBUeaqk2ra5EWaVF1b9SJCzpbS0ccPcx6o
         OKGdwKxr435NLGf2rhVWgjPumSWR2SHoXx0hKGzQWcUyTo9N2UXJEk48l4i2HhDZs/lk
         /w5UDGdeyD3/r3JdKqYvjgprnF2+BDf/24afsGx6mveKIokPtaSJGfI7WbyMW88ICvUl
         cpiuvmH0N+uNxhDXRpNNofDROfjzaePmP13ERqR66MmREXUZCh8g2+gPv00qpvzL0Kk7
         +7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=96jk8p/6XP5ut+JBHE0IBsdTmxOUR/fsv3ZcRWDzMOg=;
        b=K1xJD225VJlLHOibZ0e0da9TzU+tl2vQsfMlgs1hzxuiEc+aibGtSAQoqbh2mCB4yj
         OPa4/mg1NeTRtjV6AY+orTYv+pv8iGj2meM2k67a/9/njLHf89idqMC3o66Y65B0TwWf
         1vC0ZJAF379E7ubbQ7f7QQvbjLbw1pTv6G8+u6w+uuPm6aPCQv93BVp+8G9AsscMDt4s
         FSDWK0cP4y7CPND9mvdvGPPUZC+NzjhjAV7wwPPyTkiQrGfWy3l+7tQfrhWm7Fo1+iqn
         XyY6YUunAftTmrm4goQcJhzFocXO3kt3xGi7Rsm+tBhoDynzYEnjr5rO2F0IFhbpsEnn
         A4rw==
X-Gm-Message-State: APjAAAVP6AU06fN0AFh0tiVNr6HEn7wq2u6Dcuf1SY5GWXfVsbYWzkNr
        qJpR914gr3/1h1PqYxYwFLQpJHAPzxL89uxUx7TY2Q==
X-Google-Smtp-Source: APXvYqxdZOCfwMC4ckXG//o/o4H8hELcsXHe3EoTOHIYVBOebIobkD8VaGs1KQIIBFvGy9ppesFAq6cvMyUvfIsKzS0=
X-Received: by 2002:a2e:6344:: with SMTP id x65mr10670505ljb.59.1570225678386;
 Fri, 04 Oct 2019 14:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125837.4472-1-brgl@bgdev.pl> <20191001125837.4472-2-brgl@bgdev.pl>
In-Reply-To: <20191001125837.4472-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:47:47 +0200
Message-ID: <CACRpkdbnkMvcSOoLGWi9nSfcpcNT0T28kFX=gyk6jSZ4UWG3gQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] backlight: gpio: remove unneeded include
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Oct 1, 2019 at 2:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We no longer use any symbols from of_gpio.h. Remove this include.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks Bartosz,
Linus Walleij
