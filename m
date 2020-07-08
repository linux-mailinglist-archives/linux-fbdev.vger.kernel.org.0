Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895A2218876
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Jul 2020 15:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgGHNGj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Jul 2020 09:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729335AbgGHNGi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Jul 2020 09:06:38 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33959C08C5DC
        for <linux-fbdev@vger.kernel.org>; Wed,  8 Jul 2020 06:06:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f139so3027509wmf.5
        for <linux-fbdev@vger.kernel.org>; Wed, 08 Jul 2020 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oLDzCYJWqSNQ9M1Ha7TNoiTF86yo/dq5RVgwN+Hsw1U=;
        b=njp2qXt1BaQ9kGGg90luhkLagzFxxSHWZIvLMjW4ava2YlPKpTyY1GIKzjAH7bLwrS
         inHWc6CpR96XN/KM/jhpCmu0rpF5hbLSxq6FrbQCw8CSjwSUKgNw/feC5qcZDyfd6kdm
         fqSSom5qrymbjRD5NGi9tFXYrB0um5EGRsT7zjfn39+/2jyEmUdHDgiIOKUutaNemg3E
         qbkBmJquE063NY/LDkwIVbVwAS96Wuup42pGE5Y/2UWyC6zfXwBQ6x+GdBXbbsspgbBD
         3/0a5CUliPqvgIRb2V8+iVZj3YdbZrXEgme8zlejZWv+NQ9TSPXNC3LTdveW3kJXoBBB
         VEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oLDzCYJWqSNQ9M1Ha7TNoiTF86yo/dq5RVgwN+Hsw1U=;
        b=eQXHQ80NxFaCWyiyDl7tL1zDlUYoqduxTHKWCgiDySlOOwNLxBXyPcrRY8Vx4sY3hv
         6FzHXTxa5XP1QOt8yFjL/nLdreoGRJjUjYkS4lbSghQXuy4y+37PJa+iWomFqINamfcK
         138UrQ2etVsTfB3y5fFuHlANQ0PQqWfaprbPYXLcirx0io8NcAfqWoFwvfKIzZslpCM/
         eY87legiq9NPX6cbc9YT5aJLfjKZelV//DjASu3fuVRlh8t2tWqX8tFW5YeHJWp4eJrV
         hvIHDctqcWryFkcUPXEETXPxPNHBUpPVD3Mrg7dVfqKTGQvoOTrurouTvkn5XWwyiu42
         kZNQ==
X-Gm-Message-State: AOAM530n5c5WvRuDF6LsZI4M1Q+/DwghdlgSUQ3VwJbEPjQHJ+KPnPmm
        +Y95yrrUwjMv8rZropb4r02k+Q==
X-Google-Smtp-Source: ABdhPJycffceCLL7aGQilAq3ooqxDBsNO0dVSgTCtQTuz32w5GffuQpcf1XdckbErcpZYECigf7F+A==
X-Received: by 2002:a1c:81d3:: with SMTP id c202mr9208740wmd.54.1594213596871;
        Wed, 08 Jul 2020 06:06:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z10sm6072444wrm.21.2020.07.08.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 06:06:36 -0700 (PDT)
Date:   Wed, 8 Jul 2020 14:06:34 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Gyungoh Yoo <jack.yoo@skyworksinc.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/1] video: backlight: sky81452-backlight: Fix some
 kerneldoc issues
Message-ID: <20200708130634.5tttrzlq2zfx7uho@holly.lan>
References: <20200708130419.3445042-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708130419.3445042-1-lee.jones@linaro.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 08, 2020 at 02:04:19PM +0100, Lee Jones wrote:
> Firstly, all lines must begin with a '*'.  Secondly, arg descriptions
> must be spelt correctly, so fix misspelling of 'gpioD_enable' and
> 'short_detecTion_threshold'
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/video/backlight/sky81452-backlight.c:46: warning: bad line:                 If it is not defined, default name is lcd-backlight.
>  drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'gpiod_enable' not described in 'sky81452_bl_platform_data'
>  drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'short_detection_threshold' not described in 'sky81452_bl_platform_data'
> 
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
