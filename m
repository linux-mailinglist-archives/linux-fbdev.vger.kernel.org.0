Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B068922815B
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Jul 2020 15:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgGUNwi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Jul 2020 09:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgGUNwh (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Jul 2020 09:52:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FC0C0619DA
        for <linux-fbdev@vger.kernel.org>; Tue, 21 Jul 2020 06:52:37 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r12so21197703wrj.13
        for <linux-fbdev@vger.kernel.org>; Tue, 21 Jul 2020 06:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=a/xttlG5Xmu7Wk/M4tJwIHBfITlAjLmITWDdy7PgMM8=;
        b=yZZ6QXaSmRA7KyXsnWq2IouBLSRUuYnLNl6nG/ze/pUjh+PeiAbgftj93TcMZLGIb1
         XEbbqQ38j9OzsMbSOiDaoURO4nenUnOwAopy7wubW+1Bb9bnet96gvXNS++rJg4l/kVh
         pslstSlN8mQHKviN1lk+5RRGKIOQks34LCm8QkLWAsv6duX0hUaqsm+uxFKawnCXn+42
         WlSRI0FUu0TEbBmhbYTBg35MVInwjTL7GrCuJlqHsPxKZe0iS3/VViDta+jhjTtQVY67
         NIdv/HZU2H1Q+vuE9+jzghSlMEtDB7YEHDzuJiprBaaM8pwqdIZGQmuNt3arjdH/tUz2
         Jp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=a/xttlG5Xmu7Wk/M4tJwIHBfITlAjLmITWDdy7PgMM8=;
        b=ewLaed1pqD392gRQoKHarqmewwR5fs8tPx2LLwB7/5pNg3hOx3OqMrcQ8QjmlZ+s2P
         bovx1kWD/Fnle0ztmVcuRxHLUB4nQBcx5Kft7a9zcX+Hz8hAEXKAJJH/X4omJBNcwAGO
         qyXjNd+dDIHcUBzkJTRRHWM8Q41tIGXCb+ThyeYNwosqtm5+kiSrbzp/oQ/HamlNNYpD
         BbpVDCVkJflBYnoohGSJN/E50TGO61Mm3QSalp9YWl741I6/GsyzWxGTgRpWVHfjo+J6
         b8rad31CM4rwC/nvRpzqRnI5BMLxEYFUyKgWK25Tlr7nmYloGMNWQzsteZhMWj2Wrgq7
         1BPg==
X-Gm-Message-State: AOAM5313mPcK4wklYhB5KBDGdmNk6cK2qkYOMpDIMNkiaOOowuaJHioI
        iCLw5Ad48bhNeLR2qly8NwMk9A==
X-Google-Smtp-Source: ABdhPJx8QQ+edlbQkzaooVBvyxptignCQ9uQq5RqF/oWQQwrUwcKLUiSRqozu4UcoqmhYtAp2bsirQ==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr2026322wru.364.1595339556090;
        Tue, 21 Jul 2020 06:52:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id 65sm3567880wmd.20.2020.07.21.06.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 06:52:35 -0700 (PDT)
Date:   Tue, 21 Jul 2020 14:52:33 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/1] video: backlight: cr_bllcd: Remove unused variable
 'intensity'
Message-ID: <20200721135233.53gmti745t66la5i@holly.lan>
References: <20200721073919.925935-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721073919.925935-1-lee.jones@linaro.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jul 21, 2020 at 08:39:19AM +0100, Lee Jones wrote:
> Fixes the following kernel build warning:
> 
>  drivers/video/backlight/cr_bllcd.c: In function ‘cr_backlight_set_intensity’:
>  drivers/video/backlight/cr_bllcd.c:62:6: warning: unused variable ‘intensity’ [-Wunused-variable]
>  62 | int intensity = bd->props.brightness;
>  | ^~~~~~~~~
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Fixes: 24d34617c24f ("backlight: cr_bllcd: Introduce gpio-backlight semantics")
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

I doubt you are awaiting this for a one line fixup... but just in case:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
