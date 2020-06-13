Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E32D1F8220
	for <lists+linux-fbdev@lfdr.de>; Sat, 13 Jun 2020 10:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgFMIwP (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 13 Jun 2020 04:52:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58273 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgFMIwP (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 13 Jun 2020 04:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592038333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZTkpQBWO2xJZzSQBgavnIoRumPRgK7qK8HIzH/LNd0U=;
        b=P2jIXKSLfVaMYchr0zLqGlUoWBnT4RzJJ0CQfc00hcsrjQ88nJXKPtPlwDDnIUauHwqnP/
        8gZfmmwrdBZvQCSKodM+KDeE/v0fQqroGpPGyfnl70n6pgZoT91v2/sfn4X13hLGug9aJU
        I+jnSS1Qok/6T0HAEyila6LfUMtkVYI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-TkfnpdN3NMClW0rTkLjh5A-1; Sat, 13 Jun 2020 04:52:07 -0400
X-MC-Unique: TkfnpdN3NMClW0rTkLjh5A-1
Received: by mail-ej1-f71.google.com with SMTP id s4so5225650eju.3
        for <linux-fbdev@vger.kernel.org>; Sat, 13 Jun 2020 01:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZTkpQBWO2xJZzSQBgavnIoRumPRgK7qK8HIzH/LNd0U=;
        b=qYPgptEyrUTlCpW3XvsvrtGNzNZyIDezQD0Ri8bb767JjCYsXinbZkk4/BBm9P79l9
         FezVB8MxBBhGr/7kIM4pBNsqG3QyMuXQgRWzyp6H5OH74WxCfTJQMFNgRHuPULalIXH3
         rXtqUJN7xr241WDHIUBH7zbFG8uG6KwtrhN1Vjgqk2FMYBzUmOjuau6ZoJC7AKa3VlKm
         1IDt5wEuTl8gbNqodnVoOuMeqi+LTLsfpOtLDZhz0Eoo75tDkeMiGF7saK6T4UguR1B5
         gxrIw3OKCHRupBLnL2Ycw4nfhl9F3XRoZN9u8sqf7B0xbwoBk/48T/5jA/3LemRkUJHL
         A85g==
X-Gm-Message-State: AOAM532QBDs9QkWmghkJ53wKdvVv4+raN3RsllMHocvckPRHOm3Phmnj
        oj51ZUbCSm9JRqVX2xXzs5jVii7AgNBsqNUa2Ys/8nmbz0rQcXmF4+GSTncZkt6U2nDOdVyPqYl
        tTkGYpMKifEer0Kt+pLSVaCE=
X-Received: by 2002:a17:906:2e81:: with SMTP id o1mr16045404eji.362.1592038325568;
        Sat, 13 Jun 2020 01:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjAM9kuQ9EhfIXhtahpMdAZyolqXKj23Cqz7pEWKlH3j4is6I5W7nnlWLXWLfXJDwATD0Akw==
X-Received: by 2002:a17:906:2e81:: with SMTP id o1mr16045396eji.362.1592038325392;
        Sat, 13 Jun 2020 01:52:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id yw17sm5058372ejb.83.2020.06.13.01.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 01:52:04 -0700 (PDT)
Subject: Re: [PATCH] efifb: BGRT: Fix typo in *deferred* in comment
To:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Peter Jones <pjones@redhat.com>
Cc:     linux-fbdev@vger.kernel.org
References: <20200613081346.4532-1-pmenzel@molgen.mpg.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <56370257-9259-22c4-572f-13ce086157d2@redhat.com>
Date:   Sat, 13 Jun 2020 10:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200613081346.4532-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

On 6/13/20 10:13 AM, Paul Menzel wrote:
> Cc: linux-fbdev@vger.kernel.org
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

LGTM:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/video/fbdev/efifb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index 65491ae74808..42b4facc5e2b 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -91,7 +91,7 @@ static int efifb_setcolreg(unsigned regno, unsigned red, unsigned green,
>   }
>   
>   /*
> - * If fbcon deffered console takeover is configured, the intent is for the
> + * If fbcon deferred console takeover is configured, the intent is for the
>    * framebuffer to show the boot graphics (e.g. vendor logo) until there is some
>    * (error) message to display. But the boot graphics may have been destroyed by
>    * e.g. option ROM output, detect this and restore the boot graphics.
> 

