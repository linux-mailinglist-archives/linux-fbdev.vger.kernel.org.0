Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2BB4A5D3E
	for <lists+linux-fbdev@lfdr.de>; Tue,  1 Feb 2022 14:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238621AbiBANKE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 1 Feb 2022 08:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39391 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238710AbiBANJQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 1 Feb 2022 08:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643720956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Swdbs0KGcPDJP8bHPLb5XLPBG6TEyMwLGc8obCIfC/8=;
        b=LEGsYCBg7TXAAfayGgTaQjj9Vzdj4ieCDTShYxGeR3lcaRXgrGEKNDhBXkPSKQa14zEFQl
        YTKGADDAU6zX18sAdMuO6OPgCfYxE+ppUvRFnZ/q4Zm67ZnQkiYv4YZeN1wQN69YMMW3SE
        FbZJ4y/TUFDJZApCGjb93w3Hj96rUdU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-ldCqAIrMMSG62LeXAhMZKA-1; Tue, 01 Feb 2022 08:09:15 -0500
X-MC-Unique: ldCqAIrMMSG62LeXAhMZKA-1
Received: by mail-wm1-f70.google.com with SMTP id m3-20020a7bcb83000000b0034f75d92f27so947283wmi.2
        for <linux-fbdev@vger.kernel.org>; Tue, 01 Feb 2022 05:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Swdbs0KGcPDJP8bHPLb5XLPBG6TEyMwLGc8obCIfC/8=;
        b=KZBysq+pwn8ZjNy03M4bTrZ4LRJfviiYXu0s70xFdxHI8TSzcGzc6mIAahx4TI3ICb
         owyy4rTz8KwWQaSDgGbsOHMQ1RQ1dOfLrzTZlXxwAnfTueoSW+Q0JsrNeqMca8nnIIVe
         cbeAY5lj9AmcroXugVoS0JWSiwdWqR9V/cFgMP/6EfLKS2NLQEydAxO785L5Jf0sOwPP
         cGMRvNLr1AL8J9ODQCKUuFB8izgvQn8kGl/9dqpTi2Hb/afKstfTWuNqbRqk5y/zvu54
         Wsg7wrC0K+UB7T04XZwbzKcz+9mj7jViKPTGJqV60cVkbuh/bTJbtYJsqYFbjtAJ4yKr
         NujQ==
X-Gm-Message-State: AOAM531FB0Vy7CmycoRmULCHF7iieq45s2TNRkEpSB7EEp5rJefZYZOO
        75sHyElIrrVN9I+EcBBBldrRtBRL40Rk6n7InAHLJrSxTM74CUW07pc1IirVO54ZCXJR7rBmTYO
        8EGyGKA03Fn788kAQgSdMN5g=
X-Received: by 2002:adf:e352:: with SMTP id n18mr21470515wrj.186.1643720954337;
        Tue, 01 Feb 2022 05:09:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOn1oxGJgGYrZTitNon0Jegeh+MsCQ2kZKpT+TAayFOqeP9U5cQ7Py9fW0vZeynCe+/FW0Dg==
X-Received: by 2002:adf:e352:: with SMTP id n18mr21470498wrj.186.1643720954131;
        Tue, 01 Feb 2022 05:09:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l29sm3177560wms.1.2022.02.01.05.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 05:09:13 -0800 (PST)
Message-ID: <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
Date:   Tue, 1 Feb 2022 14:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Mark Brown <broonie@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org> <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Geert,

On 2/1/22 12:38, Geert Uytterhoeven wrote:

[snip]

>>
>> Since the current binding has a compatible "ssd1305fb-i2c", we could make the
>> new one "ssd1305drm-i2c" or better, just "ssd1305-i2c".
> 
> DT describes hardware, not software policy.
> If the hardware is the same, the DT bindings should stay the same.
> 

Yes I know that but the thing is that the current binding don't describe
the hardware correctly. For instance, don't use a backlight DT node as a
property of the panel and have this "fb" suffix in the compatible strings.

Having said that, my opinion is that we should just keep with the existing
bindings and make compatible to that even if isn't completely correct.

Since that will ease adoption of the new DRM driver and allow users to use
it without the need to update their DTBs.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

