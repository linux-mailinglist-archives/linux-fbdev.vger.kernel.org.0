Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2FA4B20C4
	for <lists+linux-fbdev@lfdr.de>; Fri, 11 Feb 2022 09:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245691AbiBKIzC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 11 Feb 2022 03:55:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240922AbiBKIzC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 11 Feb 2022 03:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4CEFFF57
        for <linux-fbdev@vger.kernel.org>; Fri, 11 Feb 2022 00:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644569700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WAVrdasKBTmSKo6xAnwq3AFAS48lB2tsIo4HhkkN4rE=;
        b=d5Rl/rvYu174IcQ/yFA8kORot3DGkMvom9aqjLeEdKnKOLWztlCbDq7sRii6DzqDJhob12
        wmNb6B3Zaxs3tsaCd5wbOAS2rG6DyYSyque1by+0aVRS8vvwN3h9Nx3e3quMxMhGvo57zZ
        3ro0ORX2mmQHb9d4FsJQx8cngVAMfgU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-8TC23iDtMCOYt73odXX-xA-1; Fri, 11 Feb 2022 03:54:58 -0500
X-MC-Unique: 8TC23iDtMCOYt73odXX-xA-1
Received: by mail-wm1-f69.google.com with SMTP id v185-20020a1cacc2000000b0034906580813so5603115wme.1
        for <linux-fbdev@vger.kernel.org>; Fri, 11 Feb 2022 00:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=WAVrdasKBTmSKo6xAnwq3AFAS48lB2tsIo4HhkkN4rE=;
        b=grdBTNNrTIqIf1nUJl/aP2YNvtjbpSVbY9QsaM/LN1khL/9ILzZHUFoF6DjBz9d+E8
         mQeilYKe3Y87A0PAA828GEeESQkVALcMcaCwmVElShXCR0uOgrCrwKFRRGbPBBQkRBLi
         hnxhJOBWIkNse/iBhPoCT3eewWAarzcMKQXz74LUj3tsvETex93ePRDxx8Z0uNkgtZ+x
         CEuxwdBnIYGvnnKV5mn5OzP3Ivs3d4BX2TwuOG8bOhutLNo9wg7B5oz00AETDzSU04QK
         ieT1nCobSlPqUAlLV+OwcflO0dKp1ysSXFSbBBj8RthOEYrwhSQbDDZxDCkYbTRJcvMi
         OhgA==
X-Gm-Message-State: AOAM5323BfQNGLQjzruiRJjiKnMHMNUxOSJ3cnGeEDEmZTcRNM4aZDjU
        3ThpHYsvUTxA4dtyAR9scbw9yy5kBgwX9B12BBWTeuxG96vUjFyiF1OP6lycpiT4wx9Sos6WC6L
        G/XfGCFgMTB6fULT8g5xOW4A=
X-Received: by 2002:a5d:6382:: with SMTP id p2mr510796wru.548.1644569697672;
        Fri, 11 Feb 2022 00:54:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7iG18nW2Fpgx5sq0P74kkf/bt73zc9m6iHNReHupDFVdcYSZKzYxuRDWV0Zwtdy4ny1OKIg==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr510770wru.548.1644569697477;
        Fri, 11 Feb 2022 00:54:57 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p2sm3454359wmc.33.2022.02.11.00.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 00:54:56 -0800 (PST)
Message-ID: <fb8d6519-2db0-3b94-61ca-2081a6b2e3a4@redhat.com>
Date:   Fri, 11 Feb 2022 09:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-pwm@vger.kernel.org
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
 <e29eaccc-863a-21d4-e669-0b708604d723@redhat.com>
 <YgPnE0yj0Y0OJxq6@smile.fi.intel.com>
 <406152d8-13e4-de8a-9542-bf1d96dbab0a@redhat.com>
In-Reply-To: <406152d8-13e4-de8a-9542-bf1d96dbab0a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 2/9/22 17:26, Javier Martinez Canillas wrote:
> On 2/9/22 17:08, Andy Shevchenko wrote:
> 
> [snip]
> 
>>> Agreed, as mentioned I'll give it a try to sending all the data as a
>>> bulk write with regmap.
>>
>> Ah, it might be that it should be noinc bulk op. Need to be checked anyway.
>>
> 
> Yeah, I'll give it a try for v4. Let's see how it goes.
> 

I tried to do bulk writes for the command, but the problem is that the
command stream has to be as follow (i.e: SSD130X_SET_COL_RANGE command):

SSD130X_COMMAND
SSD130X_SET_COL_RANGE
SSD130X_COMMAND
col_start
SSD130X_COMMAND
col_end

That is, a SSD130X_COMMAND has to be writtn for each command and command
option. This means that you need to either construct a command stream in
the ssd130x_write_cmd() function or pass multiple SSD130X_COMMAND as
variadic arguments.

Both cases lead to a less elegant implementation than just having a count
parameter in ssd130x_write_cmd() and doing multiple writes as it is done
in the current implementation.

After all, these are only for commands that are done once to setup the
device. The SSD130X_DATA writes that are to update the display pixels are
already done in bulk, which are more important to do it efficiently.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

