Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B484AF74D
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Feb 2022 17:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237549AbiBIQ4q (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 9 Feb 2022 11:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237545AbiBIQ4p (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 9 Feb 2022 11:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 20803C05CB82
        for <linux-fbdev@vger.kernel.org>; Wed,  9 Feb 2022 08:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644425807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NF4y/kDlFrpmc3X7z6yz1NwYmNGUE/++zNAflGm554Q=;
        b=IlGS460DWmSaz6z/y9PMFsHZdOORz8NERMD0H0LU4Few3Km70vq4xQ8uBLBlI/l8peBTxT
        FDn3XzHuOmhbONPHveMOHodOHmjAEpFXfsz8hDf6tyt4CXpWLBrf59j2t5W6aL8hwx/D/G
        C0P1Cwm7a7OWAsvOmDK0AIBx7JpfeIk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-SzmkZnnYN0S03HFkZdMhRQ-1; Wed, 09 Feb 2022 11:56:44 -0500
X-MC-Unique: SzmkZnnYN0S03HFkZdMhRQ-1
Received: by mail-wm1-f69.google.com with SMTP id bg16-20020a05600c3c9000b0034bea12c043so2930007wmb.7
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Feb 2022 08:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NF4y/kDlFrpmc3X7z6yz1NwYmNGUE/++zNAflGm554Q=;
        b=u1qP14p1F7HJ2pRSj3+wWg6rcfvsKD33FxpWPA9FUpZmaKNR+skY7knMXQRS1CigLA
         mZqzaKUwxJWyEOhXZRk/MBg77+VWR7CT8yJ5B6bep+bubhotT2ERcHeY7S92vQdqd0c+
         zfzZ/XIV5fB3qZwHRiOXY5waCmenS4BqF4KxAjIs3hiIWsDTj4AHPqii0zxMVmdEOrkF
         RIpttCsApTumwa8aqdSJG4oU5GqWTzC9Z8nmC7cg1XZCRaAmcsL+TY4OqiWY3K5+hv+3
         DWvKENNb3ZHoUmJcVKjmQ5gQScdDwZt6sOHuWGaOhou7a4yHWPsK2F53tt+MtijTOppX
         A+mg==
X-Gm-Message-State: AOAM531EkVqsHEFEku66bk94Pzu6yTeBqIqBNZuvbrMgGQIa66VQpWld
        g61pr+G1830j4nKLz3NID/n/jgw4nEg8TLS98DKlMaMItX2VcDpUqMAxcdSf/9Dnv+Xg/3yGVAn
        nqOP/q5BpnOLWJqdrPMAnTuY=
X-Received: by 2002:adf:eed0:: with SMTP id a16mr2962476wrp.111.1644425802938;
        Wed, 09 Feb 2022 08:56:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzinGZKjDeX2e13vtBZIJDB6Ck7kPmvDuXfLhGPTUgL7ZxsGDbolfCOb1HhpSRjf+ktdR1Trw==
X-Received: by 2002:adf:eed0:: with SMTP id a16mr2962461wrp.111.1644425802702;
        Wed, 09 Feb 2022 08:56:42 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o16sm4822975wrn.87.2022.02.09.08.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 08:56:42 -0800 (PST)
Message-ID: <b8ec21bc-91d4-0f41-2500-db712819fae3@redhat.com>
Date:   Wed, 9 Feb 2022 17:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
 <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
 <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
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

Sorry for the long reply but I don't really know how to make it shorter.

On 2/9/22 17:25, Geert Uytterhoeven wrote:
> Hi Javier,

[snip]

>> Did you see my comment about automatic module loading ? I think
>> that would be an issue if we use the same compatible for both
>> I2C and SPI drivers.
> 
> We have several drivers that have a core and separate i2c and spi
> wrappers, see e.g.
> 
> $ git grep -w ltc2947_of_match
> drivers/hwmon/ltc2947-core.c:const struct of_device_id ltc2947_of_match[] = {
> drivers/hwmon/ltc2947-core.c:EXPORT_SYMBOL_GPL(ltc2947_of_match);
> drivers/hwmon/ltc2947-core.c:MODULE_DEVICE_TABLE(of, ltc2947_of_match);
> drivers/hwmon/ltc2947-i2c.c:            .of_match_table = ltc2947_of_match,
> drivers/hwmon/ltc2947-spi.c:            .of_match_table = ltc2947_of_match,
> drivers/hwmon/ltc2947.h:extern const struct of_device_id ltc2947_of_match[];
> 
> Are they all broken?
>

It doesn't have an easy answer. It depends on what device ID tables have to
match, what modalias are present in the kernel modules and for what buses
are since not all subsystem reports the modalias uevent in the same manner.

Let's take this particular driver for example, the module aliases are the
following for each kernel module:

$ modinfo drivers/hwmon/ltc2947-core.ko | grep alias
alias:          of:N*T*Cadi,ltc2947C*
alias:          of:N*T*Cadi,ltc2947

$ modinfo drivers/hwmon/ltc2947-i2c.ko | grep alias
alias:          i2c:ltc2947

$ modinfo drivers/hwmon/ltc2947-spi.ko | grep alias
alias:          spi:ltc2947

The DT node will just contain a node with compatible = "adi,ltc2947", and
depending if the device is on a I2C or SPI bus, the OF subsystem will do
a device registration with the proper bus_type.

If is SPI, the subsystem always report a modalias uevent of the type
"spi:ltc2947", even if the device was registered by OF. So for SPI the
proper module will be loaded since it contains an alias "spi:ltc2947".

But I2C does report a proper OF modalias, so it will report instead
"of:N*T*Cadi,ltc2947" which will match the core module but not the I2C.

The I2C ltc2947-i2c.ko module is missing a "of:N*T*Cadi,ltc2947" alias
and the module loading likely isn't working and needs to be done manually.

Conversely, if ltc2947-spi.ko only add "of:N*T*Cadi,ltc2947", then the
automatic module loading wouldn't work because the modalias uevent will
be "spi:ltc2947" which won't match "of:N*T*Cadi,ltc2947". So everything
is really fragile.

Note also that the "T*" in the alias, that's to denote the device type
according to the ePAPR spec but that's only filled in the DT node has a
device_type DT property, and most DT nodes don't fill this.

So the driver module is greedy and will match any device type. And also
the modalias reported by the kernel won't set this, i.e:

$ cat /sys/bus/i2c/drivers/ssd130x-i2c/1-003c/modalias 
of:NoledT(null)Csolomon,ssd1306fb-i2c

The only way I found to make this robust and always working is with each
driver to define its own tables depending on what is used to match and
report the modalias to user-space. That means having an of_device_id and
spi_device_id (just for modalias reporting and alias table in module) for
SPI and a of_device_id table for I2C and platform devices.

And also having different compatible strings with a "-i2c" and "-spi" as
suffixes to allow kmod / udev to differentiate and match the modules.

Otherwise you will get "of:N(null)T(null)Cadi,ltc2947" in both cases and
user-space won't be able to figure out which module to match AFAICT.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

