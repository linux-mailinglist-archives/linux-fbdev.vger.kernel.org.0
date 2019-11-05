Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50CAAEFA64
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Nov 2019 11:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387917AbfKEKE5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 5 Nov 2019 05:04:57 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40571 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387742AbfKEKE5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 5 Nov 2019 05:04:57 -0500
Received: by mail-lj1-f193.google.com with SMTP id q2so14537594ljg.7
        for <linux-fbdev@vger.kernel.org>; Tue, 05 Nov 2019 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Syu30Am6BErl09auW6zTpaceggouTxknVxJ/Bz3Nu6s=;
        b=F3UmVNykzWHUTwNdwBuIbGn2Gmfwp0lPCaec0SGFmqb3Uet67QafNd3kCYlw6Ko+iZ
         xv75pN0y9ypmC6pikz0liwOGhAiNts/UROWuHig/DbuhUeFBXD4yqjhPU382v6bC9Ru0
         /j8rerZpggbnjA3tv+Ouiy3Tj9W/7DfdMcsnk1B6kFVShopOgMjoLO9MthZ4KIHuWxuc
         BQP4u2JN974kAVhnIVbXsl02XqxL6+gMbv3UJRx1mRF+XO8D2Fmke5YyV809sOBHqgmv
         rvgASQ5uItepUr0wXaAijVdeu8uYwD5Cz3CiEi/f3Yi1VzBKw690MH7685YqlBJAUyAK
         /oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Syu30Am6BErl09auW6zTpaceggouTxknVxJ/Bz3Nu6s=;
        b=hvQu1MmDd72XHRPXHUZa21D+ga33N4u6/OW4LnzQeFbtoefgZZIL4v+QgZ3XlBuFQ4
         7nsYl97oCZlc4ttEGrXwCgih0Rn0ZCXN5Mkp/bSo7qA4MfXj14wKlYXzlJ6txgRgECsW
         Zt0AWXgUIsVGLNiMJ9NhsgcpvSCGvFWIxAkS2QAuTijWVlFalIw4BGAZBTL+GIW2itO3
         wOFxZOgiAlFsI6OWV1Y/JUvRnIDD/hszQSAQ3/wHXlFxAlMhFbDqiKFePCFX/Mk6JrYY
         s97TvpRIvS6Zm7V9dljpdBaK/QyHKiy9fo3EDLlmjgE0O+gSWxS2HnIu2U8F8foQ2Vkp
         k5fg==
X-Gm-Message-State: APjAAAX17FR4ajHaIgBgrh9ZKAxq9TiaTrSZJ/Oave7LFck4bYa1mCAo
        yPUofdnhDQd4gOCSQLBOCI1h61IUjK0UU7PF6kyLWg==
X-Google-Smtp-Source: APXvYqzNQn4xnOeOTV9UejT9zf0JppB8XIps/M7O6A+dhmKjufcoOTliNdNUw1qqwcAYUPtRHSb50EJJlG+Vv1iRlcY=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr8950214ljj.251.1572948295656;
 Tue, 05 Nov 2019 02:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-38-arnd@arndb.de>
In-Reply-To: <20191018154201.1276638-38-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 11:04:44 +0100
Message-ID: <CACRpkdajkSh6Bbvpfycm83j1GuCm+pTfw9fQS53JEfG2i07MKg@mail.gmail.com>
Subject: Re: [PATCH 38/46] video: backlight: tosa: use gpio lookup table
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Oct 18, 2019 at 5:43 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The driver should not require a machine specific header. Change
> it to pass the gpio line through a lookup table, and move the
> timing generator definitions into the drivers itself.
>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> ---
> I'm not overly confident that I got the correct device names
> for the lookup table, it would be good if someone could
> double-check.

You're anyway doing more than required for the people who
may or may not be using this platform. Brokenness can surely
be fixed later, it's not like we are taking down the entire Amazon
cloud or something.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
