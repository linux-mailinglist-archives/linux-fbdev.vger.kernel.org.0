Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA98F734B
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Nov 2019 12:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKKLll (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Nov 2019 06:41:41 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37536 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfKKLll (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Nov 2019 06:41:41 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so4583021wmj.2
        for <linux-fbdev@vger.kernel.org>; Mon, 11 Nov 2019 03:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QrjCfBQcJwKIUUDAjSOiaKTYkFf5ndTaGfgn7ED2v/8=;
        b=xR/rfmwJkeoO0nfTViXcVfHVxtjQPIw+/g/mwtDyiWl0xvZzkju6l8kehaXwzlh2hE
         N1caFwcFkMVVjG7mM4hS1Blyhb6dQzMq3+L4kUjJL7APe9OhT789Q95imMdQbJBfa0pQ
         vSqM98PXFHwYP30Pq63EGCZNqrne1AYiDuqsb+LDO5ixEeUtq3iWulMX0I0BfR1te1hR
         Am4LMzfA9QgqbhrIfmXKSTmNE5mYxbuQVgCl78YPyliG86quWG85iMrVE6FPq8mHZZWB
         sux1xYxifK6ex8Q9BAODwMIaAlOmKV8P9Sc/tZOdcAfUTD3EagSv9YO0fIxUmlGiDJfy
         8isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QrjCfBQcJwKIUUDAjSOiaKTYkFf5ndTaGfgn7ED2v/8=;
        b=GfF00i8/Nu2v80CAvlrKXyEZvdrAojLBmSOQ41nH3VvucHKL7hzeLPD5/JpAURPTRY
         9+US2mLQbVQZzI2PvJP2bUTCNt/v2PqEoUJHHq9MbRCWEx2TieRXq8HvuliSq2uCxdJI
         8osTfqD9SiT6U0dRpZaqIlvQa28XMGHHai9MybFnY76TG28OX1W1smlPCl3hnc46/RK/
         BbR32kjqKVr5c3luB59kB0hE1Io4YQft2ER4FmbBCo0wc/6sXrSjXfrUiZg5Nv64x/80
         sPKkXFO8Ae3EXpmJBWX9sr2XVcApi7AMxO2+AcngpC1LYSxfXP5ygZCWDut45OoU/P2D
         dmOg==
X-Gm-Message-State: APjAAAVpbh8miTyQyaTdpLZCNVhbpkrHwljEDp56BViJQHFN2izALpsb
        mmh5HDbKtcTwLVd/mltIuzaDuA==
X-Google-Smtp-Source: APXvYqzVlKEucZs/sDv+ll++yan1K7OhNmoAUm0WJEXWNZIj5Q9haqGMCwNCLqw05ElIJj46eF9uUw==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr9278569wmc.164.1573472498674;
        Mon, 11 Nov 2019 03:41:38 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id g8sm15865768wmk.23.2019.11.11.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 03:41:38 -0800 (PST)
Date:   Mon, 11 Nov 2019 11:41:30 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191111114130.GL3218@dell>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 22 Oct 2019, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> While working on my other series related to gpio-backlight[1] I noticed
> that we could simplify the driver if we made the only user of platform
> data use GPIO lookups and device properties. This series tries to do
> that.
> 
> First two patches contain minor fixes. Third patch makes the driver
> explicitly drive the GPIO line. Fourth patch adds all necessary data
> structures to ecovec24. Patch 5/9 unifies much of the code for both
> pdata and non-pdata cases. Patches 6-7/9 remove unused platform data
> fields. Last two patches contain additional improvements for the GPIO
> backlight driver while we're already modifying it.

All applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
