Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6684AF446
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Feb 2022 15:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbiBIOmT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 9 Feb 2022 09:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbiBIOmS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 9 Feb 2022 09:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4CB1CC06157B
        for <linux-fbdev@vger.kernel.org>; Wed,  9 Feb 2022 06:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644417740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=95z5lgZr6N4bdneKS1w58+DkU3M+JrAsHlwainwdryQ=;
        b=bb2sPRCv2xd1Kk9NV5IWeGi3Aod15ryVM2WvAHqy4MwKMN8ECD6RXj3qCt3j24cWCnN6rd
        zVvACsPWBCpfrjgjcICed9WizQSsD/BMIcYWoeycnlcOCjL3JAEZDGg46eUStmipdufi2G
        Q0VDT71/xEb9i8GOajJ76pdgBMrqrEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-pODyunoINbq2th9WfXBlwA-1; Wed, 09 Feb 2022 09:42:19 -0500
X-MC-Unique: pODyunoINbq2th9WfXBlwA-1
Received: by mail-wr1-f69.google.com with SMTP id r2-20020adfa142000000b001e176ac1ec3so1199931wrr.3
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Feb 2022 06:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=95z5lgZr6N4bdneKS1w58+DkU3M+JrAsHlwainwdryQ=;
        b=I/4YIRfDmT/hswPwxS6Ve99if50ACtdE5Q6O6ne6Hz5n//c+wfHXuJjZckIvqlMHbD
         L+mwk+z58v07Yg1YZqjuqmM/3m1aMYkr8dfFgseWWHAmOE9uq2UaoH8iMW9fFPFIqav7
         O6G3vfWyPvu0AO05xx+5/jcuN4WeHBzLppTvrsvQhYhhxczzFq03LTJn+XcNIBVzBMKK
         b4ntRXhDjbBC2SxnM6b/Q7siTeRAyuCoJr7B0MyQVAOQ7J/l0AIBQRWjcICo49gx+OIn
         hV3+AlWSSMi/PrTsN9xSTEbQGLOWPTQyOXU6brvlZEnTLTHl3YPa+UQ9XgmkY3NUUQI1
         HHSQ==
X-Gm-Message-State: AOAM533uJ+pdVEW357wl373uQPz6Ljw8Dlrm47ahp4oTSNJSy0oPE7NC
        dRZX7CuNUczkb5rdrO5ig4dpBnmJy1bjxYhQ6AMaBRnkj2TvKESyGv0VyYeGOx0taNIZueVNJP2
        gM0GBwlcdCdygzmHLo52tlF4=
X-Received: by 2002:a5d:4d08:: with SMTP id z8mr2429648wrt.492.1644417738151;
        Wed, 09 Feb 2022 06:42:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwDcWgtBVsSADPkjwSIWKeWh2bWga0pSclgXkPHoPRyoxL4yRrB6nhG18lTOECvpK/yDGbwA==
X-Received: by 2002:a5d:4d08:: with SMTP id z8mr2429623wrt.492.1644417737881;
        Wed, 09 Feb 2022 06:42:17 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o14sm4978570wmr.3.2022.02.09.06.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 06:42:17 -0800 (PST)
Message-ID: <f58b2608-0d51-3209-ae11-18bdac19dd66@redhat.com>
Date:   Wed, 9 Feb 2022 15:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
 <YgPF1cBMsd9973Dx@smile.fi.intel.com>
 <CAMuHMdXQdL_Do8Hjay1egfmd9H05R7BjNeKfLGq67mU4bQNVZA@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdXQdL_Do8Hjay1egfmd9H05R7BjNeKfLGq67mU4bQNVZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Geert,

On 2/9/22 15:27, Geert Uytterhoeven wrote:
> Hi Andy,
> 
> On Wed, Feb 9, 2022 at 2:48 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Tue, Feb 08, 2022 at 04:10:49PM +0100, Javier Martinez Canillas wrote:
>>> On 2/8/22 15:19, Geert Uytterhoeven wrote:
>>>> On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
>>>> <javierm@redhat.com> wrote:
>>>>   - Kernel size increased by 349 KiB,
>>>>   - The "Memory:" line reports 412 KiB less memory,
>>>>   - On top of that, "free" shows ca. 92 KiB more memory in use after
>>>>     bootup.
>>
>> The memory consumption should really be taken seriously, because these kind of
>> displays are for embedded platforms with limited amount of resources.
> 
> Thanks for your concern!
> 
> Looking at the options that are auto-enabled, a few stand out that
> look like they're not needed on systems witch such small displays,
> or on legacy systems predating DDC:

Thanks for your analysis.

Since drivers are replacing the {simple,efi}fb drivers and others with the
simpledrm driver, the DRM subsystem is now built into the kernel and no
longer a loadable module.

So there has been some effort to make it more modular and smaller, as an
example the following patch-set from Thomas:

https://www.spinics.net/lists/dri-devel/msg329120.html

But there are still a lot of room to reduce this and certainly enabling
CONFIG_DRM will be noticeable for such memory constrainted systems.

This is outside the scope of this patch series though, that is only about
adding a new DRM driver :)

Now, this is a reason why I mentioned that the old fbdev driver shouldn't
be removed yet.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

