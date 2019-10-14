Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36703D5C64
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Oct 2019 09:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbfJNH1u (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Oct 2019 03:27:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45048 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbfJNH1t (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Oct 2019 03:27:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id z9so18344888wrl.11
        for <linux-fbdev@vger.kernel.org>; Mon, 14 Oct 2019 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Q5BHsZHxaQuBnsC0n/rsVoiaHAm2VXfTTXiC030BJgs=;
        b=K8uBglN/gYVEhhG9uvD0jxpL+kBC7VMC3W6M/I1GYQtLwoF+9PBzncmew5ihD7lRR/
         TNfGGegf5VdqF1Bz+s6k/sVm2IVvUeOPyQsiHPQ0px5gkz9Rd9s6Pm6s0Rnl8GdvL1pt
         sCt23Tm3/dh+zeCrWdDNF2Mxmt3Ok4iwrRpVu3+vJCEi4yulCnHktAiOkCRJjIFBcq9m
         eKdm5Op2XTuFc4d0ys4Jqpxa6y1uZlSo9BAgkCq7WwhELcX0kF2OB+OB+k7UhSEjrxU+
         QrLa9LQ8Urk0ltRsYf74NGzLUvIPrvWYHhtlZuuLXN7ZVXrtxOxZGzYVJ4z+xf+D/Q6m
         CMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Q5BHsZHxaQuBnsC0n/rsVoiaHAm2VXfTTXiC030BJgs=;
        b=YdTTdk5LO+j/1lPzC+59U2z/sSi+gzZTyvypvUVSwAP/mvXB6r/Rl89HmgAFjg/gzc
         rmoFiYaXz80gNerpXwCjMWTHi73A3d4VXkwo7K3HOze5G1hAijVRqDp0kb4NehNofFgp
         7THUBTl2ESIduMZnEshOP/IxYfGn7bRs5z4dIjg7m+M4OhqRnd6+pie6GSwRW+dkad3W
         Ag9j2gB2icRJbJ1/yPnr+ABDTYBj9/j2S+bg889fd3IAPaVzxgcFC+/YO4oGEmfXbbPI
         /DG9VrXPrcbw7EpH2WfeJE2YvbAY6+gJc47dZ0tyinf+j4x7b6n55DxiYEA8zg0AmD1k
         ldRw==
X-Gm-Message-State: APjAAAWm77D5XynRATqiE0jEB3PuWZ1X3FEnEQU0miTT6IDeAS7xj67i
        xPB5gtTklO0MOx4TLy48rXP2mw==
X-Google-Smtp-Source: APXvYqwDm2Pu3gF5wLWhDaqvm22UpUh6vWq/BlOq37ZQHR6R8Ub8u3VH4fE0xrIa7I5M58b1ImJhUQ==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr20624080wrv.8.1571038067578;
        Mon, 14 Oct 2019 00:27:47 -0700 (PDT)
Received: from dell ([2.27.167.11])
        by smtp.gmail.com with ESMTPSA id n3sm7073653wrr.50.2019.10.14.00.27.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 00:27:47 -0700 (PDT)
Date:   Mon, 14 Oct 2019 08:27:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] backlight: pwm_bl: switch to power-of-2 base for
 fixed-point math
Message-ID: <20191014072745.GH4545@dell>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-5-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191008120327.24208-5-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 08 Oct 2019, Rasmus Villemoes wrote:

> Using a power-of-2 instead of power-of-10 base makes the computations
> much cheaper. 2^16 is safe; retval never becomes more than 2^48 +
> 2^32/2. On a 32 bit platform, the very expensive 64/32 division at the
> end of cie1931() instead becomes essentially free (a shift by 32 is
> just a register rename).
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/video/backlight/pwm_bl.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
