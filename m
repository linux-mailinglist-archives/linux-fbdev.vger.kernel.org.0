Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5134A5295
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Sep 2019 11:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730015AbfIBJLi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Sep 2019 05:11:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40324 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730117AbfIBJLe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Sep 2019 05:11:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id t9so13743779wmi.5
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Sep 2019 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8oqJdBiHyKqAlISuPnLa2MGGfZJDAaKp4XjFcqqHTI8=;
        b=DIHmB+MhpRayg6spOmLydYJ01PHT4VKTWXLlYhvJPb+LIBpWOOgWnzwVP9Emq17Spb
         8lPzi2/StfEbpYNaD3ubpzc+CkNRKgTx0mPxR56ZaqRQ2hZqkPMbtu790XYGirmaYKIB
         ShOSAq5oxixfW/1idndxBdzTSy0fCMrA1dsEEHQauEwpO+USJiaw0r4acOgDtxUpovnk
         sCRsT5siGKSqyshqIeIE/0CFUbmTbr2iaDvAGstjGPD1k9vkNiX5GM/QwUsdIOJeQw3y
         y4hoirYqZgpW/jo3rscQSbPHqKBMeO4KAorS2upSf46AV+2Ta85G4U69DxF7exqggh8f
         kOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8oqJdBiHyKqAlISuPnLa2MGGfZJDAaKp4XjFcqqHTI8=;
        b=UQ9qEpUQ60YgNAkMwnRPQ3QCE3+7JcIUilZnOm4jNUBPb8WDACFaDXvlx7Kk9bSIDI
         60l5HQOGx4M6l+OKZ9wegCZb79fdA6so69jk4tZDMevlneDP8Oaz4UGuIQjxPV8nh0Qt
         sTmvL/z0/lhs6+7gYBfHu56YABZheibtLnzA0SMmkiBXPMOJC1cK6ew7ZqBYDlR8j/xg
         sQ2RQwlU4HdT2I0qiF3LKBLndEHJM0bAYMwHRdab9ty1Q98PpUEudGf/d6Mrokj0y1uu
         /OD2jF4S587TxMKN4sa8wA+1llFNL4rI4TEboJwVqlB7B+/EvfheYxXql/7vjbCcM/9t
         s1/Q==
X-Gm-Message-State: APjAAAWUyYCQ+Mo3fqm/Mm8fI8CgtuPl2JrRY28ublMFXiYx8u9gJVrr
        6vR1Zpiyp/1exsfaEw2zcpg3uw==
X-Google-Smtp-Source: APXvYqz6zTE3+7Cab43jkjP1vZUcgAoMSLfW1kYAvqHXdmLYBFVgNKWMXsb5YhZZGLOZta3H6WSVOg==
X-Received: by 2002:a1c:7619:: with SMTP id r25mr299001wmc.153.1567415492632;
        Mon, 02 Sep 2019 02:11:32 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id s15sm6398842wmh.12.2019.09.02.02.11.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:11:32 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:11:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     jingoohan1@gmail.com, daniel.thompson@linaro.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com
Subject: Re: [PATCH v3] backlight: gpio-backlight: Correct initial power
 state handling
Message-ID: <20190902091130.GG32232@dell>
References: <20190731084018.5318-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190731084018.5318-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 31 Jul 2019, Peter Ujfalusi wrote:

> The default-on property - or the def_value via legacy pdata) should be
> handled as:
> if it is 1, the backlight must be enabled (kept enabled)
> if it is 0, the backlight must be disabled (kept disabled)
> 
> This only works for the case when default-on is set. If it is not set then
> the brightness of the backlight is set to 0. Now if the backlight is
> enabled by external driver (graphics) the backlight will stay disabled since
> the brightness is configured as 0. The backlight will not turn on.
> 
> In order to minimize screen flickering during device boot:
> 
> The initial brightness should be set to 1.
> 
> If booted in non DT mode or no phandle link to the backlight node:
> follow the def_value/default-on to select UNBLANK or POWERDOWN
> 
> If in DT boot we have phandle link then leave the GPIO in a state which the
> bootloader left it and let the user of the backlight to configure it
> further.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
> 
> sorry for the delay, but got distracted a bit with the resend of this...
> Let's try again ;)
> 
> Changes since v2 (https://lore.kernel.org/patchwork/patch/1002359/):
> - Rebased on drm-next
> 
> Changes since v1:
> - Implement similiar initial power state handling as pwm backlight have
> 
> Regards,
> Peter
> 
>  drivers/video/backlight/gpio_backlight.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
