Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8383A729679
	for <lists+linux-fbdev@lfdr.de>; Fri,  9 Jun 2023 12:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjFIKNF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 9 Jun 2023 06:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237810AbjFIKMi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 9 Jun 2023 06:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA008A5F
        for <linux-fbdev@vger.kernel.org>; Fri,  9 Jun 2023 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686304791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
        b=FH98xzgKJkRpFTu9S6g/KfdVu34q3ULBGJp6xPF76XLgnQCBTFsxxT6X4Qd3y5oIcdA5/F
        8Cf5WAqhCrakEWQnxOoLf7zq6HqBlK8gTqyjmfvF4hz+ey3/E1vP9+dGBoS4PAtT/4EHjR
        1riIk88dyhLQjZ0Hhcjrab59cJLnGCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-0-2ro89qMR2NauS8lZD3ZA-1; Fri, 09 Jun 2023 05:59:43 -0400
X-MC-Unique: 0-2ro89qMR2NauS8lZD3ZA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30af00323b0so679265f8f.2
        for <linux-fbdev@vger.kernel.org>; Fri, 09 Jun 2023 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304782; x=1688896782;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
        b=G+z4RGnxnGaSSN0msMDAzkjSe4YHzK3jHdllc1PFluCXNfD+eyoDdKXCwWpDVC4HEM
         blOAziq39XhVDeY7JJXc3L/ApXWX3YF5RLzVppNTVDw8KUy6f8KDu8IblZH3q5gRi2v6
         hbW9IMTy3G2wfhpBkWx4wOc6jv51mQQFFZRAZx0hk6uVnnC72yD1OwflpbyTQciUQOyX
         +Fyhf1Ma9YAlUkQDPpN3poBh8zxJxvNnrJt4vxxv0Rh5p0NehiPa+pFaL57Ycn/D2Gon
         rvsslHolbKWW0yTpxB+Y81Me9/lroOTV7zpCN/h6XbDjm+SgxP+g8FIAUT6FS3ET7TjS
         0mdQ==
X-Gm-Message-State: AC+VfDzEYwoVo0MSC9Xr+HUmq5p3sBjisi345qGVfzk+kScKfUcAaaQU
        PD8hUbEj5y7YMI0y2GG190NCg19Az70zaZfMi9fOv63bFFTTwRXAFV+FclIk1rShdnQaZk8SGWB
        yGSe0ufzF++PC/Tj4Vo6AplQ=
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id bf1-20020a0560001cc100b0030d981da049mr475566wrb.4.1686304782624;
        Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mbChq3eZ0n/KPDmx58FVgNTALqSeH3ETuPMsy/BuQZAfQWRgbheMcufPP8W0/LTSPFhyPxg==
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id bf1-20020a0560001cc100b0030d981da049mr475549wrb.4.1686304782266;
        Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6dd1000000b003095bd71159sm4029755wrz.7.2023.06.09.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 02:59:41 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
        linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        lee@kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Date:   Fri, 09 Jun 2023 11:59:41 +0200
Message-ID: <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>

[...]
 
>>> I'd also question the argument that there's even fbdev userspace out
>>> there. It was never popular in it's heyday and definitely hasn't
>>> improved since then. Even the 3 people who still ask for fbdev support
>> 
>> There's X.org, DirectFB, SDL, ...
>
> None of these examples has a dependency on fbdev. They can freely switch 
> backends and have moved to DRM. Anything program utilizing these 
> examples has no dependency on fbdev either.
>
> When I say "userspace" in this context, it's the one old program that 
> supports nothing but fbdev. TBH I'm having problems to come up with 
> examples.
>

I personally have two real world examples that can give to you :)

1) I've a IoT device at home that has a bunch of sensors (temperatury,
   humidity, etc) and a SSD1306 display panel to report that. It just
   has small fbdev program to print that info. I could probably port
   to KMS but didn't feel like it. Found a fbdev program that I could
   modify and got the job done.

2) I built a portable retro console for my kids, that uses a ST7735R
   LCD panel. The software I use is https://www.retroarch.com/ which
   uses fbdev by default (I believe that supports a KMS mode but out
   of the box it works with fbdev and that's better tested by them.
   
So even when I'm not interested and don't want to enable any of the
fbdev drivers, I want to use the ssd130x and st7735r DRM drivers and
the DRM fbdev emulation layer.

In other words, there's real use cases for supporting fbdev programs
with DRM drivers. Now, I agree with this patch-set and probably will
disable the user-space fbdev interface in Fedora, but on my embedded
projects I will probably keep it enabled.

That's why I think that we should support the following combinations:

* fbdev drivers + DRM fbdev emulation + fbdev user-space
* only DRM drivers without fbdev emulation nor fbdev user-space (your series)
* only DRM fbdev emulation + fbdev user-space enabled (FB_CORE)

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

