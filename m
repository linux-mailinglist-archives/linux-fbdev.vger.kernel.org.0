Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838F24922C8
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jan 2022 10:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345703AbiARJdI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jan 2022 04:33:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344954AbiARJdF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jan 2022 04:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642498384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7q1/JTF0bIrRhpe4p1LKiRt1O+Dx86Uvdqb3h9Xsnk4=;
        b=iY9L35yIjoEMngGb0TnS5frdElujhbUUdk81odCpOUgMjKGt/K0qlvIEG8MfCIIFsgFwNr
        0DL6pNxtqiP2Kf1wJZ/IWsrtnBHOIhTFce4KU/Nept3blNlkmxEwSV4dJsWERc+Xw/ne6H
        jtAO/+ECE9viRfZJ2fU+jxFUhclIpjE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-Px5_dPTlOSGlB5sCJTQy0w-1; Tue, 18 Jan 2022 04:33:03 -0500
X-MC-Unique: Px5_dPTlOSGlB5sCJTQy0w-1
Received: by mail-wm1-f72.google.com with SMTP id p7-20020a05600c1d8700b0034a0c77dad6so1640514wms.7
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jan 2022 01:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7q1/JTF0bIrRhpe4p1LKiRt1O+Dx86Uvdqb3h9Xsnk4=;
        b=bh10doHlJWLOlyfpy8LW9+nVtwF8diPgwGfJ0OnJ9wcVkrf53wB40JGS5XIszYPDsw
         Vo4Ay3lG3gXmmPVTpMyZkXjk5FdQ9pAH1pO8rfeqvIJH5aL5LSjsQq/d0hPIXvuWMQO2
         BHgiBGHHz9JcjguBHbDxK4U8QjxH4kv/bDipCSA6kk9Xp9BmW+AYZkrXOTn7tFa04acU
         2BYpqMJxc0So9a5nNynRhnZtcBmzJBdEZXhFFu2hk3WlVfYeBGUqIp+KWF7j5JhrbBhh
         R8KhIrmvmVbQgtUyGhQtQhqEpU2dD7YL5CBuT4BxuE6dUiVNQ18sv9pWMJ9c4Z0tZegP
         AMDA==
X-Gm-Message-State: AOAM530wgkPMAjLjg0yB9gntoL3RJMxbkc7mo2KMPfgZUbRlQi4kvwDC
        BGT3IxWY7f5xt9cU9WbMpZ/SbDBqBEv/7wlqUgL6buIMFKn1rH5uSKhwdUidOxR+JxVYxZf6NKX
        QXThi75BNkaItedrOPGzjG6E=
X-Received: by 2002:a05:600c:19cd:: with SMTP id u13mr7607771wmq.24.1642498382096;
        Tue, 18 Jan 2022 01:33:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0xm3A9FgWG1QKX2erPVozLmLWCgsNizVAgneUsgNpyGHZ8poaU9GyV8Hmd2VZ1oz4dBL/rg==
X-Received: by 2002:a05:600c:19cd:: with SMTP id u13mr7607752wmq.24.1642498381856;
        Tue, 18 Jan 2022 01:33:01 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id u15sm1727658wml.17.2022.01.18.01.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 01:33:01 -0800 (PST)
Message-ID: <4f65fdd9-4b73-ca83-cf6e-c60c7ccd6558@redhat.com>
Date:   Tue, 18 Jan 2022 10:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-fbdev@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de> <87ee5659dt.fsf@intel.com>
 <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de> <87a6ft5thv.fsf@intel.com>
 <5ba33e10-7d75-9f9a-dfd6-c04608d230a4@gmx.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5ba33e10-7d75-9f9a-dfd6-c04608d230a4@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 1/18/22 09:54, Helge Deller wrote:
> On 1/18/22 09:38, Jani Nikula wrote:
>> On Mon, 17 Jan 2022, Helge Deller <deller@gmx.de> wrote:
>>> On 1/17/22 22:40, Jani Nikula wrote:
>>>> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>> Seems like few people read linux-fbdev these days.
>>>>
>>>> How much traffic is there to linux-fbdev that is *not* Cc'd to dri-devel
>>>> also?
>>>
>>> Doesn't seem like much traffic - which IMHO is OK for such a tree with
>>> mostly just maintenance patches.
>>>
>>>> Do we still need a separate linux-fbdev mailing list at all?
>>>
>>> Yes. I want to have it seperate of dri-devel.
>>> Actually I'd prefer to drop dri-devel from the list where patches
>>> for fbdev are sent...
>>
>> Disagreed. If anything, this thread shows we can't have fbdev and drm in
>> silos of their own.
> 
> Patches to fbdev usually don't affect DRM.

Patches for fbdev drivers don't usually affect DRM but that's not the
case for patches to fbdev core and fbcon as you and others mentioned.

> Patches which affect DRM needs to through to dri-devel.

And how would people know which ones need to go through dri-devel ? Are
you planning to add another entry to MAINTAINERS for fbdev core/fbcon ?

> In addition this would take the burden of the dri-developers to receive
> unrelated fbdev driver updates and patches.
>

In my opinion having fbdev patches in the dri-devel mailing list isn't
a big burden, but rather getting people to review and push say patches.

Since you are volunteering for the latter, that should improve things.

I still fail to see the benefit of doing that split, same for having a
separate fbdev tree. Using drm-misc only have advantages, among other
things providing redundancy in cases that a maintainer isn't available
for a period of time.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

