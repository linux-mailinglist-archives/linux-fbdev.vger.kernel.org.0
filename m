Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBE82077CE
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2020 17:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404256AbgFXPnZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jun 2020 11:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404146AbgFXPnZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jun 2020 11:43:25 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BAAC061573
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:43:25 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so2979397wml.3
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QM8WHNX4JVzp1tT3alZnq1KeTZs+/wuqZ6hsAIKxcMA=;
        b=Olmv6gOFR6NbOAqgFzCBJx/sCYV/IREx2uVFDnyNUpwSY/mDxH4RQEaIIqwkxB4ICw
         OmlyLQtUPS7BKq9rjxqW7PsmSayRlxNsp3CBwqOphzrTJesmqsd/9oNQrA3IlpYUW0PZ
         fudSy31IumvzQrnLbUbjZSN5JGU9DP5XWjcMbAryKvmqsYifSefNVUqu2Su8OXQvPMVE
         dsVZolchYV5cK7gk0/DRSho+Ia0WuTzYBvKGvhRhtgPUURP4Ndkk9KgCqzQ81nwD7C0z
         CNpkJgEMvLNJ4qfZ1RFZnaKXBpWwSTDYACp0W4/tSjgSY9pUvicATh27hnBP4HKau3Ho
         XwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QM8WHNX4JVzp1tT3alZnq1KeTZs+/wuqZ6hsAIKxcMA=;
        b=LbR4fxJnTuVrcHeCs/EvT9a29V7MOoMNm2NkDWmzJhPywU4+wnGlU9arDRm7dhIo/l
         V37POSJyiabVLH+ZiV0SemZVs4UiXAtvRM1Oz2Yax3GnXGIDS/VIX5jcGjkkv3MbVMZA
         cWI0XThqp4nlK8I3yKCQBK1ftAizXpNOt4r31Cs4Z7UNTjioaCIdUloMdTw5WfSNReEv
         R18skh6uWqVCfoSw/arQnRsJV3kOJy9Gf2P+RBAhadlj/xYoO0RYyCRVx79E2OS+LS9s
         ScSt7Y9ZVZJtk/gkaNc3equdkl+u0xGBjfqacGlZ25zbUkueZCxeOBepGOjmgkFfLghK
         Q61w==
X-Gm-Message-State: AOAM530tES1RXc3O4C49Hq++6ltkqLFGr04rTwYPkMbLtnSqePoVmT9Z
        Oq7/lwfD56cWyW4lw4Hw0Beq+w==
X-Google-Smtp-Source: ABdhPJwj67zlK538LD9M3+i8IFmwRhOZYaUWn/TQagj8Vmc62JySmFUQKYtWcbTLacIAWDoe1q9dnA==
X-Received: by 2002:a7b:c345:: with SMTP id l5mr32069049wmj.31.1593013403867;
        Wed, 24 Jun 2020 08:43:23 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id c143sm8597840wmd.1.2020.06.24.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:43:23 -0700 (PDT)
Date:   Wed, 24 Jun 2020 16:43:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Message-ID: <20200624154321.GH954398@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624153216.GA1814806@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200624153216.GA1814806@ravnborg.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 24 Jun 2020, Sam Ravnborg wrote:

> Hi Lee.
> 
> On Wed, Jun 24, 2020 at 03:57:13PM +0100, Lee Jones wrote:
> > Attempting to clean-up W=1 kernel builds, which are currently
> > overwhelmingly riddled with niggly little warnings.
> > 
> > Lee Jones (8):
> >   backlight: lms501kf03: Remove unused const variables
> >   backlight: lcd: Add missing kerneldoc entry for 'struct device parent'
> 
> 
> >   backlight: ili922x: Add missing kerneldoc descriptions for
> >     CHECK_FREQ_REG() args
> >   backlight: ili922x: Remove invalid use of kerneldoc syntax
> >   backlight: ili922x: Add missing kerneldoc description for
> >     ili922x_reg_dump()'s arg
> I wonder why these warnings show up as nothing pulls in this .c file.
> Anyway I would suggest to drop using kerneldoc syntax for single drivers
> like this - and the benefit here is low.
> Now they are typed, otherwise this ahd been fine in a single patch.

What do you mean by 'nothing pulls it in'?

> >   backlight: backlight: Supply description for function args in existing
> >     Kerneldocs
> >   backlight: lm3630a_bl: Remove invalid checks for unsigned int < 0
> >   backlight: qcom-wled: Remove unused configs for LED3 and LED4
> 
> The other fixes looks good.
> They are all:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks (although this should be Reviewed-by).

> >  drivers/video/backlight/backlight.c  | 2 ++
> >  drivers/video/backlight/ili922x.c    | 8 ++++++--
> >  drivers/video/backlight/lcd.c        | 1 +
> >  drivers/video/backlight/lm3630a_bl.c | 4 ++--
> >  drivers/video/backlight/lms501kf03.c | 8 --------
> >  drivers/video/backlight/qcom-wled.c  | 8 --------
> >  6 files changed, 11 insertions(+), 20 deletions(-)
> > 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
