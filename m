Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6588DAE32
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Oct 2019 15:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbfJQNXd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Oct 2019 09:23:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55737 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394421AbfJQNXa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Oct 2019 09:23:30 -0400
Received: by mail-wm1-f68.google.com with SMTP id a6so2541723wma.5
        for <linux-fbdev@vger.kernel.org>; Thu, 17 Oct 2019 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=w6ztz66F+XUhul9dF9IbLT3GjbciXy1TD14N9xxwUhc=;
        b=rgiTnz8TbEsBCg1prLfdv0eg5SkZU1fwa2hpfuDtD1TuNuH56nwGXcWjVe2rDdSsgL
         My2TSbqBqTP+SxFwAQLulcSksIdQb1hTv9Ths5+IufIjuYBOBslMoy9vUCRjlQZH1NHN
         vY+gEtpTNqLG8aYs7eLaJ40/Bh7fiNh35pXrJQYBnd43/wsMXkfjQRyyEpW6hBdd7l7I
         KZTbEJRTZFPZ2o9c1ced83Z91QmSCbwDBChTjt8pCZ6Ry+va7Izul+/iEh7glpwWJA7j
         TUkVfotpb9T4QIJA5w10qaXrTrxVOdYe9Wn799NoWJgQ1BzzUTWzjPsZfF95wp9SJmoF
         8iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=w6ztz66F+XUhul9dF9IbLT3GjbciXy1TD14N9xxwUhc=;
        b=WqNqe6L3rGrD/roJQDbswMTkBjT303LWds73MmIJbDFzEJFPDl3Yxu6IwKqvksLlDm
         yszmf3Z0GULvGDELCOLiQMpac3fCFDsi5J1e44V+8884k0wi4iYg9pUeLd7ePrgTptYn
         Vbl4nw4AMb3YJ7zT+SQUopCcP6KPV5Iu3pi9O55C9AIgVtQ6F6eTBfHfEnWTBo689Ave
         Sx2qZRSYZE8QNjYtPDIjl3iV5u5clIgdzjWKte/UkHXwefEfb4hp+J1moNSPua1yAqmY
         a8WcLqCMzu8HhS80EY1aA5QcU5NX8BecLVtOiDWD3IMjD59V6sLTcoqnADsJgt0yWVkv
         vo5Q==
X-Gm-Message-State: APjAAAUtlaUfE06D8B7LxumJ7/J9SfeQBed9H5B6kMbd5bq+CGP5e2Mq
        oRZs6SVWJygS64shrqoStwBL8g==
X-Google-Smtp-Source: APXvYqwLUwrX7DMEERuphZrAscX4CgBPVWC13LFneIeTdrAl+0BB4RRBD8tasC+m2a4yQj8hK+OrtQ==
X-Received: by 2002:a1c:1ad6:: with SMTP id a205mr2748694wma.110.1571318606936;
        Thu, 17 Oct 2019 06:23:26 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id q14sm2703400wre.27.2019.10.17.06.23.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 06:23:26 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:23:24 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191017132324.GP4365@dell>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
 <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 17 Oct 2019, Daniel Thompson wrote:

> On Tue, Oct 15, 2019 at 09:18:16PM +0200, Sebastian Andrzej Siewior wrote:
> > From: Thomas Gleixner <tglx@linutronix.de>
> > 
> > CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
> > Both PREEMPT and PREEMPT_RT require the same functionality which today
> > depends on CONFIG_PREEMPT.
> > 
> > Switch the Kconfig dependency to CONFIG_PREEMPTION.
> > 
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > [bigeasy: +LCD_HP700]
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> (I know... the review for this particular patch is trivial but an
> Acked-by from a maintainer means something specific and it is Lee
> Jones who coordinates landing cross sub-system patch sets for
> backlight).

Right.  Thanks Dan.

So what are the OP's expectations in that regard?  I see this is a
large set and I am only privy to this patch, thus lack wider
visibility.  Does this patch depend on others, or is it independent?
I'm happy to take it, but wish to avoid bisectability issues in the
next release kernel.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
