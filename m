Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF46498274
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jan 2022 15:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240041AbiAXObb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jan 2022 09:31:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46649 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240162AbiAXObS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jan 2022 09:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643034677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zxE7EvkvbZeBgieiSQDMIGsZ0T4S1HBB7kM1x7CeSqM=;
        b=PGPqBtXhHaXaYgAF+Q33SRBEUbAH24BA5k9YVRjKMUje+ra+0PdCdQbibSPjciUCQcC8i8
        dEJHG08n2oj8o8RBg8W44ntyeops4QVKpLSPIrie9Z2Xf3FOpa3L6193je3zd8xigmTQuM
        +mevsOkuSGmvLbfB9Mh2vuneykaglDw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-cpk3bwY6OyOk222gIsYaZw-1; Mon, 24 Jan 2022 09:31:16 -0500
X-MC-Unique: cpk3bwY6OyOk222gIsYaZw-1
Received: by mail-wm1-f72.google.com with SMTP id o193-20020a1ca5ca000000b0034d78423625so13776418wme.3
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jan 2022 06:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zxE7EvkvbZeBgieiSQDMIGsZ0T4S1HBB7kM1x7CeSqM=;
        b=Tiz3sn160YCvnPzNBrpXEUVczWrCLZcoWpylZZg2iCmlD3/AajPitxqUqMy0ZBaJAJ
         ZzsJOgP1FyF8mb1Xj4p8LDZ+MFEKPzfmo6tHBTb8yG7tmnF80kUGW3dankt07/6HxT2T
         8e/w4RDUiklsQxj6UxP8cxETJANVOFPRJo3+61J0BOfFhukwlHyGblYiJmzKY7dtAnq/
         2C1QRFlv+u47s6g0yRkarcH5m5mPJIR0+s722RIXKQHR7lmahpeBN5Ev5Qivb3beO4OZ
         O8u1sEFjusvpft0wm1KM4uCtDB+Uzv6yBQZNnAjYYw9a3Y9AWuuChKVq6X3OLpyde+z7
         RqEw==
X-Gm-Message-State: AOAM530X53HAOuKLdF9UDliKfQpMBxqlaQE1zc2Uum32mtMbjDifIubC
        BLbDb+oSirCeGGNW031BLmjzXsk0BtbV85lw31hKiSdYh5menG1K6tw3e0iNN0N+pnpR5J9b5hm
        qRvRVupBJS3KtTZ5MzXDoee8=
X-Received: by 2002:a05:600c:220f:: with SMTP id z15mr2034794wml.145.1643034675428;
        Mon, 24 Jan 2022 06:31:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNP4ZAtPsdcV8SnRzGwBs1899+aHYQ2TZybxbvsvLRSnQQQ+MXblK00rIvHsobSdQm9xgCoQ==
X-Received: by 2002:a05:600c:220f:: with SMTP id z15mr2034772wml.145.1643034675247;
        Mon, 24 Jan 2022 06:31:15 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m17sm19337448wmq.35.2022.01.24.06.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 06:31:14 -0800 (PST)
Message-ID: <410efcd1-c104-313b-aee8-950c4f499405@redhat.com>
Date:   Mon, 24 Jan 2022 15:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/5] fbdev: Hot-unplug firmware fb devices on forced
 removal
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
        hdegoede@redhat.com
Cc:     linux-fbdev@vger.kernel.org, stable@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-2-tzimmermann@suse.de>
 <508e6735-d5f0-610c-d4ca-b1abc093f63c@redhat.com>
 <77e52472-4af7-c03f-f6e4-45ec820f2778@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <77e52472-4af7-c03f-f6e4-45ec820f2778@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 1/24/22 15:19, Thomas Zimmermann wrote:

[snip]

>>> +			if (dev_is_platform(dev)) {
>>
>> In do_register_framebuffer() creating the fb%d is not a fatal error. It would
>> be safer to do if (!IS_ERR_OR_NULL(dev) && dev_is_platform(dev)) instead here.
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/fbmem.c#L1605
> 
> 'dev' here refers to 'fb_info->device', which is the underlying device 
> created by the sysfb code.  fb_info->dev is something different.
>

oh, indeed. I conflated the two.

Maybe the local variable could be renamed to 'device' just to avoid confusion ?

[snip]

>> I'm not sure to follow the logic here. The forced_out bool is set when the
>> platform device is unregistered in do_remove_conflicting_framebuffers(),
>> but shouldn't the struct platform_driver .remove callback be executed even
>> in this case ?
>>
>> That is, the platform_device_unregister() will trigger the call to the
>> .remove callback that in turn will call unregister_framebuffer().
>>
>> Shouldn't we always hold the mutex when calling do_unregister_framebuffer() ?
> 
> Doing the hot-unplug will end up in unregister_framebuffer(), but we 
> already hold the lock from the do_remove_conflicting_framebuffer() code.
>

Yes, I realized that just after sending the first email. Sorry for the noise.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

