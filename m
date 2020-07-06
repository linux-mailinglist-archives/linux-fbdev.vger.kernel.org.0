Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C363C2152EC
	for <lists+linux-fbdev@lfdr.de>; Mon,  6 Jul 2020 09:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgGFHNp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 6 Jul 2020 03:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbgGFHNo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 6 Jul 2020 03:13:44 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C2BC061794
        for <linux-fbdev@vger.kernel.org>; Mon,  6 Jul 2020 00:13:44 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l17so38088070wmj.0
        for <linux-fbdev@vger.kernel.org>; Mon, 06 Jul 2020 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=y6aItrK3ggYlleH0/viUOY6qolHTQy/1u/+BpOihMeo=;
        b=Hg0xmjE2A2QgB70rmuXJ5Pw8tCPqmCSk8JyeYpHNJadeb74FDA/UNMbzhfZk64RUnP
         Zr1rpnoAHP8vavTwaW59I5ARloISn3axV1g6YgmRwGj5OWiSj+WmXPOmPtEbzqknfQWU
         ZEub0cl9lD2LDwyIaNdZxbMfO0V7M5aBmDE7L9N2p3GkyLma3aAtEVmjt1kQl/1CfoLJ
         8G9W1b0Lti/IYKiuN1mAlMLdlrJFH51PHTACl4zbOUDV3kuYMT4KnNzeIJlnnTDm4kA2
         PyqBePTZPGxmSCPnXDR9CrS1Vy9NuS/x9NqZ8lMU11tTceRZNBArWLIisVl+XdKf+pmi
         BywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=y6aItrK3ggYlleH0/viUOY6qolHTQy/1u/+BpOihMeo=;
        b=dYl62qcWbtrZ8XspOYgJ4a5ac/AnsODweYvWdWorgeEBKk1NP0YjCIhiHZ7McOc/Xq
         jcSdzVD5dgTEH3+N2CBkiwsHJJZtCq7ew6j0CDqjmLGthF9Yyg/wdZZC0kENPtvDzpNC
         npq3y5MhPSqaOz8qDWGisA5aFdNP29GEUwDd39a0tt3VLQ4AicaK3LI5pjWfz2BzMBDM
         FBxuSLywoxd3svj7Tl8o9SW11U+W0n4XW4jrny7Qdfigb4alvP+WgJdgL0BEzK4dc+oZ
         jYZa4PHbP9DqfSSWGZEn0ZDNdUQ6hbTEPhxAqCu/ZWIngG/eytRjZlXjaP4GqrQaXMuT
         1uOg==
X-Gm-Message-State: AOAM532D098ms3fRgGVeDICGHiYqMVfj7EcpQdFqpMATPJf+uMRtSKxQ
        L9rZnsE3tPMM+Y9QaAsu4k09vQ==
X-Google-Smtp-Source: ABdhPJxWsjw1xgjYJUFiPLMMd5RNjJNu0hJkWTnvqG5HIkpSNJgHQAoTPWkdT0q52MWphuM5cnUMdA==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr47190853wma.161.1594019623028;
        Mon, 06 Jul 2020 00:13:43 -0700 (PDT)
Received: from dell ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id l3sm6561303wrx.22.2020.07.06.00.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 00:13:42 -0700 (PDT)
Date:   Mon, 6 Jul 2020 08:13:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Message-ID: <20200706071340.GC2821869@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 24 Jun 2020, Lee Jones wrote:

> Attempting to clean-up W=1 kernel builds, which are currently
> overwhelmingly riddled with niggly little warnings.
> 
> Lee Jones (8):
>   backlight: lms501kf03: Remove unused const variables
>   backlight: lcd: Add missing kerneldoc entry for 'struct device parent'
>   backlight: ili922x: Add missing kerneldoc descriptions for
>     CHECK_FREQ_REG() args
>   backlight: ili922x: Remove invalid use of kerneldoc syntax
>   backlight: ili922x: Add missing kerneldoc description for
>     ili922x_reg_dump()'s arg
>   backlight: backlight: Supply description for function args in existing
>     Kerneldocs
>   backlight: lm3630a_bl: Remove invalid checks for unsigned int < 0
>   backlight: qcom-wled: Remove unused configs for LED3 and LED4
> 
>  drivers/video/backlight/backlight.c  | 2 ++
>  drivers/video/backlight/ili922x.c    | 8 ++++++--
>  drivers/video/backlight/lcd.c        | 1 +
>  drivers/video/backlight/lm3630a_bl.c | 4 ++--
>  drivers/video/backlight/lms501kf03.c | 8 --------
>  drivers/video/backlight/qcom-wled.c  | 8 --------
>  6 files changed, 11 insertions(+), 20 deletions(-)

All applied to Backlight.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
