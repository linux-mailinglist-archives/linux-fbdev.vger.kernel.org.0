Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BEF4A9B16
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Feb 2022 15:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359354AbiBDOh3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 4 Feb 2022 09:37:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37827 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233084AbiBDOh2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 4 Feb 2022 09:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643985448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YjU7W9LODb2lvWvbKWQ9iW4O2+zTIEYm3yk17PblSiY=;
        b=ehpr7zw2HdOr1dhp424V9c+8erpRjCIZr1kiIR1X69YM0liYg60eUJkLK9BEe8y/ptY3rf
        R0CM16rYjahREvPJBjWw4tjOgzNNWkUotpCgYSZ4FlFzvSF4gJ2dkYPWg/2ZKDWCTIs6a5
        2U+6UCIAQHIKTLUdQ8nuYqDn66y8IWg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-B8nzrPZ_Mx2yMpgr4j4YvA-1; Fri, 04 Feb 2022 09:37:27 -0500
X-MC-Unique: B8nzrPZ_Mx2yMpgr4j4YvA-1
Received: by mail-wr1-f70.google.com with SMTP id d25-20020adf9b99000000b001e298eecb85so2003572wrc.19
        for <linux-fbdev@vger.kernel.org>; Fri, 04 Feb 2022 06:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YjU7W9LODb2lvWvbKWQ9iW4O2+zTIEYm3yk17PblSiY=;
        b=z7vN1A/XH78mlEZaMJETZ4Ivviao8XTdYvs21l5BXYM5U6b+VfxPoRwHViYrqLSJqP
         DXsdk2rOMnNO0pTygP+mm/U+rT9MZxoVUBIMR21bAj01wecUYZuCwgVuMw2J0ZoQNrVO
         WUJr2lfMUVVp4P/EEVN+ngrj6NSP8qYG/m3DO438Dr2iduv0VBBHol9T0SebEgxT41eO
         u+Fxc1FGn1IwcNaaKBhw2sb1d81HgSoUDiDqBoOxsZVB2YxrHsaBLTyKYry1P051/PqY
         u5tl/EbOpeD09w4HdAYJYJp5b340Gs+Wm1OCW5ZhXk6lFeD0L23icoXPZPdzkh7Q4TTe
         M3/A==
X-Gm-Message-State: AOAM531aFAgLdNkHWIwxXdsXIi6jAQYL5G/CQ0s9Miubx+GtwOw9Kq/S
        242hEJM1IUIzu4s2TnNIp/7AVDY2REod6BL09D8BYuOVvFSk30CUUuohLyqrn6JF+lZuMUDa7jO
        nyCvoop7lKOW7d255GV0OPBo=
X-Received: by 2002:a05:600c:434c:: with SMTP id r12mr2489888wme.140.1643985446208;
        Fri, 04 Feb 2022 06:37:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkGFdJ6hDsKtVrBob4zscnjoipPqd5Nz/eKLnnFx09MVW96jWfTBPMl2XcPzkr/EqQQfzppA==
X-Received: by 2002:a05:600c:434c:: with SMTP id r12mr2489866wme.140.1643985446002;
        Fri, 04 Feb 2022 06:37:26 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c8sm2004710wmq.34.2022.02.04.06.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 06:37:25 -0800 (PST)
Message-ID: <f81d3d89-c892-9397-71d0-3d0ab99dd479@redhat.com>
Date:   Fri, 4 Feb 2022 15:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdWoBc8amsg009oQGqUST8bN=8WqPM96SkUzcv=P1uRbfA@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWoBc8amsg009oQGqUST8bN=8WqPM96SkUzcv=P1uRbfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Geert,

On 2/4/22 15:31, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
>> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
> 
> [...]
> 
>> This is a v2 that addresses all the issues pointed in v1, thanks a lot
>> to everyone that gave me feedback and reviews. I tried to not miss any
>> comment, but there were a lot so forgive me if something is not there.
> 
> Thanks for the update!
>

You are welcome!
 
>> Changes in v2:
> 
> [...]
> 
> Note that the individual patches say "(no changes since v1)"?
> 

That's due patman (the tool I use to post patches) not being that smart.

I only added the v2 changelog in the cover letter and not the individual
patches to avoid adding noise, since there are a lot of changes since v1.

But patman then thought that means individual patches had no changes...

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

