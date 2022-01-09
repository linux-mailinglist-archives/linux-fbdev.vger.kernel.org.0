Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB13488C4E
	for <lists+linux-fbdev@lfdr.de>; Sun,  9 Jan 2022 21:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236938AbiAIUif (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 9 Jan 2022 15:38:35 -0500
Received: from hua.moonlit-rail.com ([45.79.167.250]:41422 "EHLO
        hua.moonlit-rail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiAIUie (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 9 Jan 2022 15:38:34 -0500
X-Greylist: delayed 1105 seconds by postgrey-1.27 at vger.kernel.org; Sun, 09 Jan 2022 15:38:34 EST
Received: from 209-6-248-230.s2276.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com ([209.6.248.230] helo=boston.moonlit-rail.com)
        by hua.moonlit-rail.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <bugs-a21@moonlit-rail.com>)
        id 1n6efg-0005L8-6P;
        Sun, 09 Jan 2022 15:20:08 -0500
Received: from springdale.mc.moonlit-rail.com ([192.168.71.36])
        by boston.moonlit-rail.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <bugs-a21@moonlit-rail.com>)
        id 1n6eff-0008P0-GV;
        Sun, 09 Jan 2022 15:20:07 -0500
Message-ID: <4fac9803-50d2-0c83-8b49-a1b2058d7da0@moonlit-rail.com>
Date:   Sun, 9 Jan 2022 15:20:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] video: vga16fb: Fix logic that checks for the display
 standard
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20220107110723.323276-1-javierm@redhat.com>
 <20220107110723.323276-2-javierm@redhat.com>
 <CAMuHMdXG3xOUrzOoRQVgpb4MmuQKJ1y3yPXv=p4AiNEohrzZug@mail.gmail.com>
From:   "Kris Karas (Bug reporting)" <bugs-a21@moonlit-rail.com>
In-Reply-To: <CAMuHMdXG3xOUrzOoRQVgpb4MmuQKJ1y3yPXv=p4AiNEohrzZug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Groetje, Geert,

Geert Uytterhoeven wrote:
>
>> -       par->isVGA = screen_info.orig_video_isVGA;
>> +       par->isVGA = screen_info.orig_video_isVGA == VIDEO_TYPE_VGAC;
> All non-x86 architectures (except for 2 MIPS platforms) treat
> orig_video_isVGA as a boolean flag, and just assign 1 to it.
> Hence this change would break them.

I see a bit of a conflict with using orig_video_isVGA as a boolean. All 
the modern architecture-agnostic driver code, such as sysfb, 
sysfb_simplefb, and efifb, all use and expect orig_video_isVGA to be an 
integer.  On the other hand, the VGA driver for XEN first sets 
orig_video_isVGA  = 1 (boolean), and then VIDEO_TYPE_VLFB or 
VIDEO_TYPE_EFI (integer).  Overloading the definition for 
orig_video_isVGA to be both boolean and integer - within the same file - 
seems like a recipe for bugs to me.

That said, I think that wrapping the par->isVGA code, above, within a 
check for CONFIG_X86 seems safe and expedient.  But I would be much 
happier if the non-x86 architectures would set it to a proper integer 
value (even if fake) that coincidentally satisfies boolean "true", say 
VIDEO_TYPE_VGAC; that way, there would be no confusion as to data type 
in all the more recent architecture-agnostic framebuffer code.

Kris
