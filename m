Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BE53C246E
	for <lists+linux-fbdev@lfdr.de>; Fri,  9 Jul 2021 15:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbhGINWn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 9 Jul 2021 09:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbhGINWg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 9 Jul 2021 09:22:36 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E57C0613E8
        for <linux-fbdev@vger.kernel.org>; Fri,  9 Jul 2021 06:19:53 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 90FB68326D;
        Fri,  9 Jul 2021 15:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1625836789;
        bh=/1tTQdqGBl6k/yOxU8Glqo/bpxh20lrV8ke+N08B9QU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ii2gRSNSf6DcNI2g4/V0SkcPmA3oFXsNZ3DKm0bHtjfzZywiqB37uBP8RS5C17DUX
         i/9GtIGwfaFCW7XDQ7SvshHqEwwG3DD74uF7hSf77DlOv2N0b8T2mid68P0s61XfNu
         +WrXlUBOHMx0yRNuPMGJKRVPPdg55fLCzV584OU5Yhv6ESNG69l6o6j4KXIK6Td2sg
         yFnDtIMYS+m4Kz+MbWrUrJcclYrnDo2gIITIXAyj8jiyjiEZgfs+qiQQoEnszs3pbf
         FR153wXqFbeqgqrIYjXN4pX+V0O/l63LZlemir1u/j/zU41dwddneC7jh8bQ8+5bD0
         1Wpn6URHgvG1w==
Subject: Re: [PATCH] video: backlight: Only set maximum brightness for
 gpio-backlight
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Meghana Madhyastha <meghana.madhyastha@gmail.com>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Sean Paul <seanpaul@chromium.org>,
        Thierry Reding <treding@nvidia.com>
References: <20210708091058.56317-1-marex@denx.de>
 <20210709110315.vv5hbngg26o4vj63@maple.lan>
From:   Marek Vasut <marex@denx.de>
Message-ID: <6330fc87-333e-f507-0a39-3ca1bfa6b39f@denx.de>
Date:   Fri, 9 Jul 2021 15:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709110315.vv5hbngg26o4vj63@maple.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 7/9/21 1:03 PM, Daniel Thompson wrote:
> On Thu, Jul 08, 2021 at 11:10:58AM +0200, Marek Vasut wrote:
>> The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
>> in backlight.c") says that gpio-backlight uses brightness as power state.
>> Other backlight drivers do not, so limit this workaround to gpio-backlight.
>>
>> This fixes the case where e.g. pwm-backlight can perfectly well be set to
>> brightness 0 on boot in DT, which without this patch leads to the display
>> brightness to be max instead of off.
>>
>> Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>> Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
>> Cc: Noralf Trønnes <noralf@tronnes.org>
>> Cc: Sean Paul <seanpaul@chromium.org>
>> Cc: Thierry Reding <treding@nvidia.com>
> 
> I have to admit that this patch really does makes it clear just how
> nasty the hack in of_find_backlight() currently is.
> 
> Moreover I think it is also be obsolete. gpio-backlight power mode
> handling was pretty broken when this code was introduced. It was fixed
> in 2019 by ec665b756e6f ("backlight: gpio backlight: Correct initial
> power state handling") by trying to match the behaviour of PWM
> backlight.  The new code always sets the brightness to 1 so I think we
> can just remove the hack from of_find_backlight() since I think it is
> unreachable.

I assume by "new code" you mean the fixed gpio-backlight driver ?

Dropping the whole code after the Note: is fine by me.
