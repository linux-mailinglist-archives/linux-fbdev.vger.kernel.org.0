Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 253C575218
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jul 2019 17:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388371AbfGYPGo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jul 2019 11:06:44 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33051 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388312AbfGYPGo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jul 2019 11:06:44 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so35986214wme.0
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jul 2019 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9VtQKkWfK+zYdSn/FuhvWkGyTUaVAJL5pFGjK3Jszyw=;
        b=NCfJmCd8P2t6v8IcsdtfxPzIXC8X1tdp4ymjAkfOUgseY6CuTV1UTCF6xEdaRLcCOP
         NzkX8U1rKRSvE5SxGe0uRSyuXSwDWi2BF9d13lHzCMxf4z/8aayrsozzCFTFlIdPZiIc
         9TP1m1z7SjSPpyBtWGLIfCZFuTBS2OfEZ+X7k2U5v/oR1Zvpq82pnlbP6LTt4Q1FATxC
         BgiCKNt4MIl6bOu7crachvPy0FyU86WagPmpZnJKyaahjcuGD2U5DE6ICe8QXjYgHFPP
         qxiiq+fzaA/H2Vgs1/BUC00xLaDTnh9n1wDhlZEsRMQLdETgn+aoSevPHwepmEsrPB1H
         z4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=9VtQKkWfK+zYdSn/FuhvWkGyTUaVAJL5pFGjK3Jszyw=;
        b=ui0Toue3oSsZv/MF/oygx9l6fhQkvSDTH1hz57T2kouqsAZe+o6CZyU9Y7RDr+yfT6
         7D58k4/FzdZUVxDOVb5JslQsPOkNmgadk3V1QqATFU1j9MbJCbefk4roYYrxeoo770JR
         J3u6OKW/CPHgJ8o8gohrCWeTSnzIZQFauZf6/5AyFgl2X2uk03vR+k9nG6FEzw7PxZo5
         UMqe659KiV0Z6UaqSKZcFSb+ynBUfLysJ0PqgW5e+Hip+NJgQcxaLs8jGJpeuLm4wDBG
         M1aWqKR4NmsST97T2tmOY6fovD1ywoYdIT3fSsG1JriDEzll0aTpOn/IuA9l7XbN59ZY
         apwA==
X-Gm-Message-State: APjAAAVXuhGf3gbER5mJ7trpJvBgFd2DHS1hrT/94ji88n9QiKW7CPsZ
        RONYK4dUlj0WxWr5pFW0JVd2aA==
X-Google-Smtp-Source: APXvYqy7PYsDNSGGPztWvKILWoiMBkdSFcP1jE+VamLix3I9wR/Ic/qiQW/YzmKquGc9thA8U8t8FQ==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr73281045wmk.24.1564067202435;
        Thu, 25 Jul 2019 08:06:42 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id f204sm73012839wme.18.2019.07.25.08.06.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 08:06:41 -0700 (PDT)
Date:   Thu, 25 Jul 2019 16:06:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190725150629.GN23883@dell>
References: <20190725143224.GB31803@ravnborg.org>
 <20190725143934.GH15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190725143934.GH15868@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 25 Jul 2019, Daniel Vetter wrote:

> On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> > There was no users left - so drop the code to support EARLY_FB_BLANK.
> > This patch removes the support in backlight,
> > and drop the notifier in fbmem.
> > 
> > That EARLY_FB_BLANK is not used can be verified that no driver set any of:
> > 
> >     lcd_ops.early_set_power()
> >     lcd_ops.r_early_set_power()
> > 
> > Noticed while browsing backlight code for other reasons.
> 
> Ah I didn't grep hard enough, I didn't realize that no one sets the
> lcd_ops->(r_)early_set_power hooks. Nice find!
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
> > Cc: Peter Rosin <peda@axentia.se>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > ---
> > 
> > Build tested with various architectures, configs.
> > 
> > Lee, Daniel - OK to commit to drm-misc-next where fbdev stuff is
> > maintained today?
> 
> backlight is separate from fbdev in Lee's own tree, not in drm-misc. I
> think at least.

That's correct.  We'll sort that once we have all the Acks.

> >  drivers/video/backlight/lcd.c    |  8 --------
> >  drivers/video/fbdev/core/fbmem.c | 12 +-----------
> >  include/linux/fb.h               |  4 ----
> >  include/linux/lcd.h              | 10 ----------
> >  4 files changed, 1 insertion(+), 33 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
