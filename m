Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF50F3C2547
	for <lists+linux-fbdev@lfdr.de>; Fri,  9 Jul 2021 15:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhGIN4E (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 9 Jul 2021 09:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbhGIN4D (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 9 Jul 2021 09:56:03 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687EFC0613DD
        for <linux-fbdev@vger.kernel.org>; Fri,  9 Jul 2021 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BTg+iWUtl9PaISNkGsQE083X9Z9Omu0H9yTM48SmE1w=; b=Abw+n3/tRSfOlse7dHWMl8Vadd
        EVWn5mEWd90ZHAmGKB+Fgba7Bk0m4w6eRaUcbaa5qujCJKH168jLpL3D1UptbJPo6ylWQo1ph5C5H
        QRdlEbeqB5/4qTm1+JJqvgKUyRsfUBQt8u5/5Mm+bxkFaUSHoquRDVicTU05Sjznt3vCy1+hJC1tO
        ES9XDfTQRTVAbNHqvYorlr/sXHVT0SxXXwRBAdaBvwxOxiUct1ZCi+n3kPxPkDubAQvxDzs9vcTYV
        25NkxqbgdIqyMj5J/E1iBLknkFC8pl7aSl0llU2SU57RcX/e5KU9VdsMpNaKIKEjP67WNVnjKjHjH
        f5+z83jg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64523 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1m1qwQ-0001kK-2W; Fri, 09 Jul 2021 15:53:18 +0200
Subject: Re: [PATCH] video: backlight: Drop maximum brightness override for
 brightness zero
To:     Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc:     linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Meghana Madhyastha <meghana.madhyastha@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Thierry Reding <treding@nvidia.com>
References: <20210709132600.5417-1-marex@denx.de>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0822c219-c1c6-0bb4-f379-e73f40adfa8e@tronnes.org>
Date:   Fri, 9 Jul 2021 15:53:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709132600.5417-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 09.07.2021 15.26, skrev Marek Vasut:
> The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
> in backlight.c") says that gpio-backlight uses brightness as power state.
> This has been fixed since in ec665b756e6f7 ("backlight: gpio-backlight:
> Correct initial power state handling") and other backlight drivers do not
> require this workaround. Drop the workaround.
> 
> This fixes the case where e.g. pwm-backlight can perfectly well be set to
> brightness 0 on boot in DT, which without this patch leads to the display
> brightness to be max instead of off.
> 
> Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")

I not sure about the rules, but if this is automatically picked up for
stable, maybe this is needed to avoid changing behaviour on 4.19:

Cc: <stable@vger.kernel.org> # 5.4+

of_find_backlight() was added in 4.17 and the gpio fix in 5.4.

Or perhaps there are other ways to signal this dependency.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>
