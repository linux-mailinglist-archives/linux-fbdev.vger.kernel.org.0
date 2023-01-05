Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576AC65ECDE
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Jan 2023 14:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbjAENW7 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 Jan 2023 08:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbjAENWw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 5 Jan 2023 08:22:52 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBB1E0EB
        for <linux-fbdev@vger.kernel.org>; Thu,  5 Jan 2023 05:22:51 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso1292464wmq.1
        for <linux-fbdev@vger.kernel.org>; Thu, 05 Jan 2023 05:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMYXEk4lndOrw8goIICh9q2Q+fxdp6yIZD9WFVuj+yo=;
        b=V94j5uLsqkr1OjMTZXNgPq44eyqGmxT0IobSI51BRwh6FlTxLGJS6GlaplOQcu4J4i
         1UIi3lNu7W2NDMt/4LU1E8bedgzj4cvGalflGyH+QwXn6vqCCv77tVy6hqfjnwomUkDg
         eNuk2sGyaPx9pQFWucJgrkT8p7Q17PrwKmruQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMYXEk4lndOrw8goIICh9q2Q+fxdp6yIZD9WFVuj+yo=;
        b=VCzJ4HCRF0XPTbxsbQZrPNlSg0BvDwa5TTWIVK/6thAH12SYP1X9zV3WjV40K1GQzv
         N7ZfHy+7pT1EX73oSClbPngX3Mi7DkuJKbBLbsz3OuvrM/7pRSHlsCEogPDzbJESqUQ4
         4rOvMcunBPufWIpOvZYEHJDqdYXHWcTegVk/eHpsszupHkCLq1A4N3OzG21RB5Ub+s8o
         K85Yx26ZTgE2Tsr3o8ZF4LVPEQWJmOiUWz9x0ivtm5GlVu+WUl4JHOw8nVftDHo5fm1y
         oJAu4A7Ty0IQfAJ87+Veb4NrDD25bIZMxP3BcxGrMT8CM2L0RvbGvCk/+uZCGMSPaI5B
         ROPw==
X-Gm-Message-State: AFqh2kp5sNPHB94N0AbAHdn/80gatgQt5eD2I/fFaYh2Mfn3n2SnAS3M
        W5/SJiTCpVDM32nzAyoq5G4+dw==
X-Google-Smtp-Source: AMrXdXuJUO1wZOxW9brhdxg5XJCrqOxItwQjBkeG7zm48GS5EfrNaAp6aLdj5/qkbCI8xw+kWLLptw==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id p9-20020a05600c1d8900b003d35cd60781mr35560523wms.37.1672924970434;
        Thu, 05 Jan 2023 05:22:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003cfa80443a0sm2701132wms.35.2023.01.05.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:22:49 -0800 (PST)
Date:   Thu, 5 Jan 2023 14:22:47 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Alexander Potapenko <glider@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Helge Deller <deller@gmx.de>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] fbcon: Use kzalloc() in fbcon_prepare_logo()
Message-ID: <Y7bPJzyVpqTK+DMd@phenom.ffwll.local>
Mail-Followup-To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Alexander Potapenko <glider@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Helge Deller <deller@gmx.de>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
References: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
 <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
 <86bdfea2-7125-2e54-c2c0-920f28ff80ce@I-love.SAKURA.ne.jp>
 <CAG_fn=VJrJDNSea6DksLt5uBe_sDu0+8Ofg+ifscOyDdMKj3XQ@mail.gmail.com>
 <Y7a6XkCNTkxxGMNC@phenom.ffwll.local>
 <032386fc-fffb-1f17-8cfd-94b35b6947ee@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <032386fc-fffb-1f17-8cfd-94b35b6947ee@I-love.SAKURA.ne.jp>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jan 05, 2023 at 10:17:24PM +0900, Tetsuo Handa wrote:
> On 2023/01/05 20:54, Daniel Vetter wrote:
> >>> . Plain memset() in arch/x86/include/asm/string_64.h is redirected to __msan_memset()
> >>> but memsetXX() are not redirected to __msan_memsetXX(). That is, memory initialization
> >>> via memsetXX() results in KMSAN's shadow memory being not updated.
> >>>
> >>> KMSAN folks, how should we fix this problem?
> >>> Redirect assembly-implemented memset16(size) to memset(size*2) if KMSAN is enabled?
> >>>
> >>
> >> I think the easiest way to fix it would be disable memsetXX asm
> >> implementations by something like:
> >>
> >> -------------------------------------------------------------------------------------------------
> >> diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
> >> index 888731ccf1f67..5fb330150a7d1 100644
> >> --- a/arch/x86/include/asm/string_64.h
> >> +++ b/arch/x86/include/asm/string_64.h
> >> @@ -33,6 +33,7 @@ void *memset(void *s, int c, size_t n);
> >>  #endif
> >>  void *__memset(void *s, int c, size_t n);
> >>
> >> +#if !defined(__SANITIZE_MEMORY__)
> >>  #define __HAVE_ARCH_MEMSET16
> >>  static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
> >>  {
> >> @@ -68,6 +69,7 @@ static inline void *memset64(uint64_t *s, uint64_t
> >> v, size_t n)
> >>                      : "memory");
> >>         return s;
> >>  }
> >> +#endif
> > 
> > So ... what should I do here? Can someone please send me a revert or patch
> > to apply. I don't think I should do this, since I already tossed my credit
> > for not looking at stuff carefully enough into the wind :-)
> > -Daniel
> > 
> >>
> >>  #define __HAVE_ARCH_MEMMOVE
> >>  #if defined(__SANITIZE_MEMORY__) && defined(__NO_FORTIFY)
> >> -------------------------------------------------------------------------------------------------
> >>
> >> This way we'll just pick the existing C implementations instead of
> >> reinventing them.
> >>
> 
> I'd like to avoid touching per-arch asm/string.h files if possible.
> 
> Can't we do like below (i.e. keep asm implementations as-is, but
> automatically redirect to __msan_memset()) ? If yes, we could move all
> __msan_*() redirection from per-arch asm/string.h files to the common
> linux/string.h file?

Oh I was more asking about the fbdev patch. This here sounds a lot more
something that needs to be discussed with kmsan people, that's definitely
not my area.
-Daniel

> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index c062c581a98b..403813b04e00 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -360,4 +360,15 @@ static __always_inline size_t str_has_prefix(const char *str, const char *prefix
>  	return strncmp(str, prefix, len) == 0 ? len : 0;
>  }
>  
> +#if defined(__SANITIZE_MEMORY__) && defined(__NO_FORTIFY)
> +#undef memset
> +#define memset(dest, src, count) __msan_memset((dest), (src), (count))
> +#undef memset16
> +#define memset16(dest, src, count) __msan_memset((dest), (src), (count) << 1)
> +#undef memset32
> +#define memset32(dest, src, count) __msan_memset((dest), (src), (count) << 2)
> +#undef memset64
> +#define memset64(dest, src, count) __msan_memset((dest), (src), (count) << 3)
> +#endif
> +
>  #endif /* _LINUX_STRING_H_ */
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
