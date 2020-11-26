Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9639E2C567B
	for <lists+linux-fbdev@lfdr.de>; Thu, 26 Nov 2020 14:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389434AbgKZN4R (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 26 Nov 2020 08:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389007AbgKZN4R (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 26 Nov 2020 08:56:17 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBB6C0613D4
        for <linux-fbdev@vger.kernel.org>; Thu, 26 Nov 2020 05:56:17 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 64so2216797wra.11
        for <linux-fbdev@vger.kernel.org>; Thu, 26 Nov 2020 05:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MlSKa9SzW7tV05r9J8yh1C/GcEEmHuhq2z7iKSDUD3s=;
        b=MegZ4q3xM/nXtE8bFSbvICWs38kMLrPlhROvmVCx1jJO1z1x69aoBKsh3cgyjzqA5a
         KXhJwaAmTVBCj3F6ZLEopJ3KYECGvvYAW6arwqBMIahYqsOpFRyHBjeh3DeGrx4HFFTV
         3sOg29o5zrNEr1lyeoZaVyN2A3y+Pdm/vekA/yfkuRECWGryCxh7xJlodTAssHV5yjLe
         g0Wh4k8Yv0A4TOuowBalJzdzINEox4QTwL6w62lh/3N6tK69AEHmuQYvQlRRvLHHppf0
         ByMfvp3UsMo5MM+Unxiub9alS0nZJrRTnlA0jp7hSUq9Fy4JtsqMJzRvrH365ugPQoAC
         TlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MlSKa9SzW7tV05r9J8yh1C/GcEEmHuhq2z7iKSDUD3s=;
        b=eXpnBRPXRrrok2azRo9Vsqc4bG0NQfiq4Ani4V3Ox/MaRxAVJfvk2KwxGYtrJ6cktc
         I1Y9rC0pPdlnW/wF08eMEb6T2LOMsA57XZaBoOHtRpMCGI7CjViEiB3HPKPahAE7L8WH
         KZFJBqQ9CqqDXAQq9azX/eAJeXcxYgbgKKgSnlr5v34GO5KplLhbqCkuIwJGUvtihEo8
         /xFsAUblymYHyoS0Ap4By5Me+gLGCUe0Lzg55qFb972fhmf5w8Woi/gNvOPFXUJDVEBv
         lRdGje3pw0NggAVzlp4wl9GNTnF5RBU1KgLzIjuyyIHXNF0l30asjkSB4q8hv5f7S1om
         l7mA==
X-Gm-Message-State: AOAM531OtigTRQOZ7YrF9psO4bDb3u1RC7bk6N7yW6wEFWfHsRajrfb2
        ycwC/kGIJDaJFZrh5P2JeLPxhw==
X-Google-Smtp-Source: ABdhPJzKDFqiT8yWHg4vy4m8fsJiB8F+Ed5gYSvcw2oyFJAQofyhEZQ8FjDDfNK+UauvnPhPwzXUtA==
X-Received: by 2002:a5d:4588:: with SMTP id p8mr4089315wrq.224.1606398975823;
        Thu, 26 Nov 2020 05:56:15 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id w186sm8889134wmb.26.2020.11.26.05.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:56:15 -0800 (PST)
Date:   Thu, 26 Nov 2020 13:56:13 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] ARM: locomo: make locomo bus's remove callback return
 void
Message-ID: <20201126135613.GE2455276@dell>
References: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 26 Nov 2020, Uwe Kleine-König wrote:

> The driver core ignores the return value of struct bus_type::remove
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct locomo_driver::remove return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and ensures future
> users behave accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> if desired the change to arch/arm/mach-sa1100/collie.c can be split out
> of this patch. The change of prototype then doesn't affect this driver
> any more. There is one locomo-driver that is already now unaffected:
> drivers/leds/leds-locomo.c. This driver doesn't have a remove callback.
> 
> Best regards
> Uwe
> 
>  arch/arm/common/locomo.c               | 5 ++---
>  arch/arm/include/asm/hardware/locomo.h | 2 +-
>  arch/arm/mach-sa1100/collie.c          | 6 ------
>  drivers/input/keyboard/locomokbd.c     | 4 +---
>  drivers/video/backlight/locomolcd.c    | 3 +--

Acked-by: Lee Jones <lee.jones@linaro.org>

>  5 files changed, 5 insertions(+), 15 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
