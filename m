Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDCE48932C
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Jan 2022 09:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238370AbiAJIW7 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 10 Jan 2022 03:22:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50292 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231534AbiAJIW6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 10 Jan 2022 03:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641802977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RTtqqgqEgqdAKcrQmMy+dzzfB9vCY2HKmjeboto5lik=;
        b=GGgLPz+9YCCJzVMhAYruNoXQCDJ4SLlxx9rkuV657ZI7cPqFhGZaYdXaemFDgTiAviUUL3
        nMo2Pj6jmdRDua819V4f/XkzzX3g3wP0bR9T/yfTE9Mw4YNZWhMBcqQwn35XndC0lcvj4s
        WO2Pv0wS8TyW/vDyULoeE7sjE0tVxgQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-OIuZQCXpPW6SiFuCzFcvRA-1; Mon, 10 Jan 2022 03:22:56 -0500
X-MC-Unique: OIuZQCXpPW6SiFuCzFcvRA-1
Received: by mail-wr1-f70.google.com with SMTP id t28-20020adf97dc000000b001a5b98d2c81so2353997wrb.3
        for <linux-fbdev@vger.kernel.org>; Mon, 10 Jan 2022 00:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RTtqqgqEgqdAKcrQmMy+dzzfB9vCY2HKmjeboto5lik=;
        b=3rJVmG1fr8t6GMAgxrOb9k00HsWY5MIBdw9TIOmVPrHsLTymceGwpDubdSKK6bB5gs
         KKKRxLy3SFz8nxj79m62yPI0PwvD/c6ICvNfY43cWOczo5F+D6olzTCleMxAG3bLx9bp
         rbysUMErXdb21QWAG9Zhb1VBjS6IkEo6vPTVWvo+wQxzez14AkPv6NieMkeTQGxkePhH
         c/J8dXNbaBDN9flKi3oinwapKLn3dfc7pd/fQgS/QgP1idStSnpZ+mgFynFPe52STtDI
         ni787Xy1GtwW6UMEdFozd9ElLCr/9/CYj+iTOoOQzENGLFmk2ywgbCn1ueYZYq+IP6Ol
         TIdg==
X-Gm-Message-State: AOAM531d1zTeM5krpzooQt3UxIL06wSNvl/AaVXRvBLSPP0N9SnDJypZ
        ykEhu0T6qWBhBvcoL7Sz6Al+SAaxqB61iVfa4fldLtT6L9na3dZawY0szOEUiF/PcSxF94sqAVV
        sgl7AoV/30i4BUnWvZIKQyDU=
X-Received: by 2002:a05:600c:35cf:: with SMTP id r15mr21069723wmq.106.1641802974981;
        Mon, 10 Jan 2022 00:22:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqTRVHAzlE8gl4JuRggen+xQ8xv3xUsJdUs/ktUbxaGW2FHQEZBuwxWQJjglAEdtxgjuQAJw==
X-Received: by 2002:a05:600c:35cf:: with SMTP id r15mr21069711wmq.106.1641802974751;
        Mon, 10 Jan 2022 00:22:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p12sm1925227wms.43.2022.01.10.00.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 00:22:54 -0800 (PST)
Message-ID: <3355ac8b-fd59-068c-e40e-bf8c54e5abde@redhat.com>
Date:   Mon, 10 Jan 2022 09:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] video: vga16fb: Fix logic that checks for the display
 standard
Content-Language: en-US
To:     "Kris Karas (Bug reporting)" <bugs-a21@moonlit-rail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20220107110723.323276-1-javierm@redhat.com>
 <20220107110723.323276-2-javierm@redhat.com>
 <CAMuHMdXG3xOUrzOoRQVgpb4MmuQKJ1y3yPXv=p4AiNEohrzZug@mail.gmail.com>
 <4fac9803-50d2-0c83-8b49-a1b2058d7da0@moonlit-rail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <4fac9803-50d2-0c83-8b49-a1b2058d7da0@moonlit-rail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Geert and Kara,

On 1/9/22 21:20, Kris Karas (Bug reporting) wrote:
> Groetje, Geert,
> 
> Geert Uytterhoeven wrote:
>>
>>> -       par->isVGA = screen_info.orig_video_isVGA;
>>> +       par->isVGA = screen_info.orig_video_isVGA == VIDEO_TYPE_VGAC;
>> All non-x86 architectures (except for 2 MIPS platforms) treat
>> orig_video_isVGA as a boolean flag, and just assign 1 to it.
>> Hence this change would break them.
> 
> I see a bit of a conflict with using orig_video_isVGA as a boolean. All 
> the modern architecture-agnostic driver code, such as sysfb, 
> sysfb_simplefb, and efifb, all use and expect orig_video_isVGA to be an 
> integer.  On the other hand, the VGA driver for XEN first sets 
> orig_video_isVGA  = 1 (boolean), and then VIDEO_TYPE_VLFB or 
> VIDEO_TYPE_EFI (integer).  Overloading the definition for 
> orig_video_isVGA to be both boolean and integer - within the same file - 
> seems like a recipe for bugs to me.
>

Agreed with Kara on this. I believe the non-x86 arches should be fixed
to set it to the correct value.
 
> That said, I think that wrapping the par->isVGA code, above, within a 
> check for CONFIG_X86 seems safe and expedient.  But I would be much 
> happier if the non-x86 architectures would set it to a proper integer 
> value (even if fake) that coincidentally satisfies boolean "true", say 
> VIDEO_TYPE_VGAC; that way, there would be no confusion as to data type 
> in all the more recent architecture-agnostic framebuffer code.
> 

Yes, I'll post a v2 to do that but hopefully the CONFIG_X86 guard could
be dropped in the future once all the architectures are fixed.

> Kris
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

