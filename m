Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC54549D9D
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jun 2022 21:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350427AbiFMTZY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 13 Jun 2022 15:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350512AbiFMTZI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 13 Jun 2022 15:25:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6FD4337A91
        for <linux-fbdev@vger.kernel.org>; Mon, 13 Jun 2022 10:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655142090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q9imHR0PldrK/4QqffqMQG4YlpeKi0rN5tf1tCAqvxI=;
        b=OfLxLKMmXh1S0JEAwuW9kESxX/WmvV01sGlNpabaDxngbFrcIEHSG/5Fkm581Wd2AvJodx
        IQVrUHuwGIKNdBkaL7D8xdVWIAU2Hq3X5lUoWk55A2iwasA5NQz3M4jTNc1hKEoqJopw8A
        xF1Ia0qB9fKRr0O0qyctqVGEdnh8MNc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-xCYIVd-GPiGUQ0Fv8qKEWA-1; Mon, 13 Jun 2022 13:41:29 -0400
X-MC-Unique: xCYIVd-GPiGUQ0Fv8qKEWA-1
Received: by mail-wm1-f69.google.com with SMTP id r126-20020a1c4484000000b0039c8f5804c4so2581312wma.3
        for <linux-fbdev@vger.kernel.org>; Mon, 13 Jun 2022 10:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q9imHR0PldrK/4QqffqMQG4YlpeKi0rN5tf1tCAqvxI=;
        b=ASj8qpsEVMaj5ggBn/H+vDY1fxpJmkp3ZaiRXBwk7iyLsvicZgMU0xFr8jWldgCXYM
         3iAighq0V1CT1GhLatJbECP3z+mt778gCPhoM9SgAg7lVb221E3azwsW7BQhqwjVBSID
         620TKwAYZT+4QxpQ0qtapZgdsNGSXnAHqZP2tkQFQwCgu1UuxT6JXfQe7+50ZzRgPZJp
         l3XPkj6ilJ46lGlVbdfVgoIvmzy2H0XcFI898jaaPyIh8p6wRKTs/nXDFRaxZcyfhq2Q
         1YwvsGaVIISHoXY9VuY0qxY0ZyuMzFV0kYo6dFnfmNsc/rORgSSVNMmqLYX1yXy1IlLC
         7FKg==
X-Gm-Message-State: AOAM532SfLAr+6hA/iS+Hp9X+Yk/EfssuNQ8MAc1D/X1m7sf8Dy0eTEA
        ro90NZX9mepL6S6L8ZXVtkzAu+9RtkZVbxiawtgzVAleLWZvTPArsBQ+LD1THV0VSQORLTdHzqf
        WWGpx9Pw0FQHDGDLlukn7cl4=
X-Received: by 2002:a7b:c389:0:b0:39c:49fe:25df with SMTP id s9-20020a7bc389000000b0039c49fe25dfmr648450wmj.164.1655142087966;
        Mon, 13 Jun 2022 10:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOHYbSdU3QvmmoWgh9ozEuOjCqKEtc/UugRXjsMVcbeHCAdcofLjg4QDbLTxfNrnseTW/13Q==
X-Received: by 2002:a7b:c389:0:b0:39c:49fe:25df with SMTP id s9-20020a7bc389000000b0039c49fe25dfmr648438wmj.164.1655142087759;
        Mon, 13 Jun 2022 10:41:27 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600010cc00b0020c5253d90asm9201616wrx.86.2022.06.13.10.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 10:41:27 -0700 (PDT)
Message-ID: <8cbfcc29-bc31-9bc8-2eaa-d873f7cf2d5f@redhat.com>
Date:   Mon, 13 Jun 2022 19:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
Content-Language: en-US
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        Dominik Kierner <dkierner@dh-electronics.com>
Cc:     "airlied@linux.ie" <airlied@linux.ie>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "maxime@cerno.tech" <maxime@cerno.tech>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
References: <7a78d57342754a5d9bd3ce7c7bf3fa47@dh-electronics.com>
 <YqdZN6mtEDF2CRtS@smile.fi.intel.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YqdZN6mtEDF2CRtS@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 6/13/22 17:35, andriy.shevchenko@linux.intel.com wrote:
> On Mon, Jun 13, 2022 at 11:39:30AM +0000, Dominik Kierner wrote:
>> On 5/25/2022 21:46, Javier Martinez Canillas wrote:
> 
> ...
> 
>>> Thanks, I looked at the code briefly and think that there are things there that we
>>> could use. I.e the 3-wire SPI support that's in panel-solomon-ssd130x-spi-3wire.c.
>>
>> When writing my driver code, I wasn't even considering using regmaps,
>> like You did in Your I2C-Code. If that's applicable for 3-wire-SPI,
>> it would likely be the better, more generic option. Your SPI-code
>> reuses these parts to some extent. For that case,
>> ssd130x_spi_regmap_config.reg_bits would need be changed to 1,
>> as the "register address" has a length of 1 bit and we are sending
>> 9 bits over the line and not 16.
>> Since we still have 2 bytes of host memory,
>> it should still be compatible with the 4-wire write, right?
>> Or would 3-wire SPI require a second regmap?
> 
> I believe the cleanest solution is to have different regmap configurations.
> 

I agree with this.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

