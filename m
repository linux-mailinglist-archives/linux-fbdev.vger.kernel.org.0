Return-Path: <linux-fbdev+bounces-2553-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7054890AEB9
	for <lists+linux-fbdev@lfdr.de>; Mon, 17 Jun 2024 15:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18E1E1F28E71
	for <lists+linux-fbdev@lfdr.de>; Mon, 17 Jun 2024 13:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFCA197559;
	Mon, 17 Jun 2024 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g4A3PT0q"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AC19068C
	for <linux-fbdev@vger.kernel.org>; Mon, 17 Jun 2024 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629624; cv=none; b=jujsQEETKOdmJAegrY+aKnYeosnmizq8F1y6NB9QR6S+wTg0nzDlCmLSBM0A09BryMBvqtrsU0ds1YxVs+X4Jrlqw5lyys2VqACLaQjglgVJBB9DUQQtGaMx8rDPaiv6FUFNoZHFK+GPPYTsid21cnx6gBeOQ+X3tkIAS+hfIzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629624; c=relaxed/simple;
	bh=eOjpz+zFL2+6WO8cSaWf4BmSuGFNzfiJD3g20c/JtA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l96BqpxRZiOVHdPvRJQi5n6Gg3Dr5uHH7J4B72P94oOZ3TJUjw6j/uMCCCg7aHjQanyjgF1w8RMklV79rzqYbSJeaRG1tRbt2+VJ/0pfkv4DZ4rA9P8Xug4FaKUriOB6YDd/l8shqMsCxR1kkDBo+ygeSbJwy4WFJoJ5HByWhqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g4A3PT0q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718629621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j94IkIvUkn3DxicfEpyhPETY6R5+LL1pLlBJM7Hddc8=;
	b=g4A3PT0qha8nE4A5sVJMEdlvTPvtuFZWeYuCSo1A1U1R0KQcgNLtMwLNoaAddUxGi2QZiE
	sxUA6hqAca44YwuEQqXgyull0hS2qnrK11TSzzUkbrrlg5srob7ONB0Ee4jTXSxmqMSUK1
	bvkcQ3FOgbYWcwVnpFula7f/z7KoaJM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-IOAvNKuAPcygah1dOPTo2g-1; Mon, 17 Jun 2024 09:07:00 -0400
X-MC-Unique: IOAvNKuAPcygah1dOPTo2g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42120e123beso38109205e9.0
        for <linux-fbdev@vger.kernel.org>; Mon, 17 Jun 2024 06:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629619; x=1719234419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j94IkIvUkn3DxicfEpyhPETY6R5+LL1pLlBJM7Hddc8=;
        b=RKI6g1vxuwvujrPmZlx04LZ7T8JoTdo7lE0QIGoWrEVRdN3Tc0Ap2aRIK4ZmbOgDan
         oGXY9jsSfXiBQcKtwIzkzu/Uc/lB/et9ei1aqxtG03jnFQnrdpe5CoCz8CFyH6t0lt02
         Mi0o1xIRiO+QcK8KnjbmAUGp9peVwXqiWxkijS1Mmi0jx5I21G9QdtWbEz2yUD/5WKuq
         xNoGrp5DI0a5u7apPulzEmv6srHm4KBmoFAP9YzWRWUIGytB17MywNZhWL99i8ElpCvD
         nF8qpk2FvBsj2MzTrJ4dyUh0jU+UGbRogWOFgUeVDmynrV4ZqbWP1ooHyUThSaZUr5HB
         vHvA==
X-Forwarded-Encrypted: i=1; AJvYcCV9nkkmsz4uFbiwujaaOzuO1sgfzY6Q5oREZC9jfxw2523j85Sw7Z3UVya+v6PUTPJjVsjCzZgLS+RHyyX3054vipj7UYRTK/LdxKw=
X-Gm-Message-State: AOJu0YzhNFN5KjsWgaW0SPLxFwumN7JpJ03XtLrH37ZfvS7+YezxDhUa
	vA+Zcm/URnxbBTfsDtYtsxUN7TSDJpAV0M7fdzDzC7hq9AlJsqYuUHwGaQilNLp3OMHXJ9F4tSV
	soPWifZTSyY3gbM6q60zk3EQi8sKIRBVuLfr3YZVTMLeohZ4mr5yfh3Dm43OA
X-Received: by 2002:a05:600c:3589:b0:423:6b7:55de with SMTP id 5b1f17b1804b1-42306b75a55mr82866685e9.6.1718629618742;
        Mon, 17 Jun 2024 06:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOXYjkGkmJz4i2VzrPa1WEQ5ueU+NmDhVd11TfaL5C2XoJq5YGcoQ+Qdf446qEhALAmmNtSQ==
X-Received: by 2002:a05:600c:3589:b0:423:6b7:55de with SMTP id 5b1f17b1804b1-42306b75a55mr82866425e9.6.1718629618312;
        Mon, 17 Jun 2024 06:06:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe92c6sm196243565e9.18.2024.06.17.06.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 06:06:57 -0700 (PDT)
Message-ID: <7c502c16-198d-42de-921c-98507981da73@redhat.com>
Date: Mon, 17 Jun 2024 15:06:56 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
 <b20e8ee8-8cdb-464a-aa19-2fe1d39a7440@redhat.com>
 <CAMuHMdWNUhQqmbEELwbmSomLbwE-xgmVZ2Hv5WqDfw8Mku34+g@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdWNUhQqmbEELwbmSomLbwE-xgmVZ2Hv5WqDfw8Mku34+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/06/2024 14:49, Geert Uytterhoeven wrote:
> Hi Jocelyn,
> 
> On Mon, Jun 17, 2024 at 11:59 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 13/06/2024 21:18, Geert Uytterhoeven wrote:
>>> Re-use the existing support for boot-up logos to draw a monochrome
>>> graphical logo in the DRM panic handler.  When no suitable graphical
>>> logo is available, the code falls back to the ASCII art penguin logo.
>>>
>>> Note that all graphical boot-up logos are freed during late kernel
>>> initialization, hence a copy must be made for later use.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>>> --- a/drivers/gpu/drm/drm_panic.c
>>> +++ b/drivers/gpu/drm/drm_panic.c
> 
>>>        PANIC_LINE(" \\___)=(___/"),
>>>    };
>>>
>>> +#ifdef CONFIG_LOGO
>>> +static const struct linux_logo *logo_mono;
>>> +
>>> +static int drm_panic_setup_logo(void)
>>> +{
>>> +     const struct linux_logo *logo = fb_find_logo(1);
>>> +     const unsigned char *logo_data;
>>> +     struct linux_logo *logo_dup;
>>> +
>>> +     if (!logo || logo->type != LINUX_LOGO_MONO)
>>> +             return 0;
>>> +
>>> +     /* The logo is __init, so we must make a copy for later use */
>>> +     logo_data = kmemdup(logo->data,
>>> +                         size_mul(DIV_ROUND_UP(logo->width, BITS_PER_BYTE), logo->height),
>>> +                         GFP_KERNEL);
>>> +     if (!logo_data)
>>> +             return -ENOMEM;
>>> +
>>> +     logo_dup = kmemdup(logo, sizeof(*logo), GFP_KERNEL);
>>> +     if (!logo_dup) {
>>> +             kfree(logo_data);
>>> +             return -ENOMEM;
>>> +     }
>>> +
>>> +     logo_dup->data = logo_data;
>>> +     logo_mono = logo_dup;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +device_initcall(drm_panic_setup_logo);
>>> +#else
>>> +#define logo_mono    ((const struct linux_logo *)NULL)
>>> +#endif
>>
>> I didn't notice that the first time, but the core drm can be built as a
>> module.
>> That means this will leak memory each time the module is removed.
> 
> While I hadn't considered a modular DRM core, there is no memory leak:
> after the logos are freed (from late_initcall_sync()), fb_find_logo()
> returns NULL. This does mean there won't be a graphical logo on panic,
> though.

Yes, you're right, thanks for the precision.
> 
>> But to solve the circular dependency between drm_kms_helper and
>> drm_panic, one solution is to depends on drm core to be built-in.
>> In this case there won't be a leak.
>> So depending on how we solve the circular dependency, it can be acceptable.
> 
> So far there is no reason to select DRM_KMS_HELPER, right?

The current version doesn't need DRM_KMS_HELPER.
But for example, it uses struct drm_rect, and a few functions 
(drm_rect_width()) that are defined in .h, but other drm_rect_* 
functions are defined in DRM_KMS_HELPER.
And as you pointed out in your patch, it duplicates the 
drm_fb_clip_offset(). So I'm not sure if it can avoid the dependency on 
DRM_KMS_HELPER in the long term.


> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


