Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C174AF60B
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Feb 2022 17:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbiBIQHH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 9 Feb 2022 11:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236540AbiBIQHF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 9 Feb 2022 11:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A5D5C061355
        for <linux-fbdev@vger.kernel.org>; Wed,  9 Feb 2022 08:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644422827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9GmtaJHp/xTHNMpzFHAgFBMiYKYYWVV2IEV+4sk5uqg=;
        b=BaLjw1ZAJBsdZh+i7zjT4nOcKDwY6/ucTiVQbhKI9X1YNKubOYmc13EWduLcNLy3ppZifm
        QdiYCvSqewJFT7F+LsvMtXCc7tCtSeXWC5iJnpiyu7YC5mr9yJjJCfnxh+N3p2JLqfykCB
        L1EJVvwLBqeffO/YHLqQ0SnLPPPogLw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-yCHBbVNGOBKJ8ebcGRil2A-1; Wed, 09 Feb 2022 11:07:06 -0500
X-MC-Unique: yCHBbVNGOBKJ8ebcGRil2A-1
Received: by mail-wr1-f72.google.com with SMTP id h29-20020adfa4dd000000b001e498f51244so1191056wrb.14
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Feb 2022 08:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9GmtaJHp/xTHNMpzFHAgFBMiYKYYWVV2IEV+4sk5uqg=;
        b=QSiF8B/0qZc8WocNr4KO/VsFB/qQUyiBVDzEhl0ZHyrMw01H2MnV/xAfx17X+yOmw9
         8M9ai40Qif8N/BEOCRD+HGoyb+Qlq+VE3/uawUkSGg4FxuufZ5ZBaQS0qp2sNqIxs2pw
         I/aU/qSQCwyxzW/xmO4zNO23t5xFVpR8aHgy4LukfViJedXtbmaLw3wq5ALWHQTY6KwK
         AX+hSn/7r0cGFRstlgSIvd4pqrRMJi8CFS+EaZEP3WMc3lfN5pzMICdvmikivLXs/utV
         JP4AvAjPyjrWi9KyPPHM/xwT5LtJxR/LZZhRJwJecZjYTcr/RX+kYo2bXE1y7PlLgYZe
         khtQ==
X-Gm-Message-State: AOAM530uufDHOPLhtzKFaZqQEAg3q7f7KqA0qROMgOGrXFQQBsm190Ry
        /wmImY2/QCySIHgebJSQlVTBtKP/kXcxLG2Ow/fmyHSlrynf5wfpwBAPQ+7D9HQwg9/xSOCfbFq
        4nwBtarpsZtMquuLsoIWgN4U=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2694171wrz.518.1644422825079;
        Wed, 09 Feb 2022 08:07:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSOdYMsb8yEAJ80HG2zpe/vuSpys4t0RlhZKdpTZvQG5sQ5JJ8V2gZ2pWwI7Y/pRJze0jM/A==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2694154wrz.518.1644422824917;
        Wed, 09 Feb 2022 08:07:04 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f20sm7148775wmg.2.2022.02.09.08.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 08:07:04 -0800 (PST)
Message-ID: <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
Date:   Wed, 9 Feb 2022 17:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
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

On 2/9/22 16:17, Andy Shevchenko wrote:
> On Wed, Feb 09, 2022 at 01:25:46PM +0100, Geert Uytterhoeven wrote:
>> On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
> 
> ...
> 
>>> +               .compatible = "solomon,ssd1305fb-spi",
>>
>> This needs an update to the DT bindings.
>> Hence this may be a good time to deprecate the existing
>> "solomon,ssd130*fb-i2c" compatible values, and switch to
>> "solomon,ssd130*fb" instead, for both I2C and SPI.
> 
> Agree!
> 

Did you see my comment about automatic module loading ? I think
that would be an issue if we use the same compatible for both
I2C and SPI drivers.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

