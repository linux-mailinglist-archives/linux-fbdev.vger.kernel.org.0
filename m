Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F62317BDDC
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Mar 2020 14:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgCFNMa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Mar 2020 08:12:30 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37085 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFNMa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Mar 2020 08:12:30 -0500
Received: by mail-oi1-f195.google.com with SMTP id q65so2474374oif.4
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Mar 2020 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xpK8kATRR5IULu5Ty4ktaaz9fInoLK6h5kiSCEaAQTA=;
        b=ifDG7eRGJBVsY9yZe/ywT9alzJa4ksSVsVCGQqLR6WBSkpMnT4HSkSBA3xrfUdFmFO
         UzM/83G++1TH566fmbVYh/OiqK6e1xYg14RAQx94tKmtH+SLFn58f930OX0CaFQFKV/8
         1W/bhc4lizG6PrmZkA+dn+WFkfJQsDo8lkjG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xpK8kATRR5IULu5Ty4ktaaz9fInoLK6h5kiSCEaAQTA=;
        b=jVqMewQId30FPAj+opz+O93u8qrn6Z4eo1iOi5vnGiPbW8xrMruLTy/fELLdULUKGS
         8PaXz6/khX3MqLu18D30RgHAdtV/e4es/q0Gxv1aXajqhCKeZN5GpxSIE4aZKfBhIkkN
         wEnNtjmUJq93E4ahaWkrVbuwXbXW6hv7nNACn7ugNhBhWwiN+4TpuArWTtfkiBnSeHa2
         szfAv0im5yJVcyCAH54tKLQrosTqYaHEsZZ2UIlJaHvS1vMCSnl/EygwIHQGde9oiWNJ
         mlkAyiBoLFp9tvHUkHgJ9Tb1DhiOzQKaFYwWShC4F3ncsQLo7cja294xWCeknEJaAvCz
         riYg==
X-Gm-Message-State: ANhLgQ1zet7HlHW8yNDG25+cnJnwpuxivx6w1gh6Gtp91D28W35zOcPu
        YvkXvcsMqZPHZNhBAKHkaKZOx/WHvO5V1VwmLxGkJw==
X-Google-Smtp-Source: ADFU+vvx+RoFcv01sd8hhwIAyMC0qgoTEasKLc0LumZuFhVm1ZkRdTTdO5QpApNyGa9g7p18SMulX6mrBlc9tgc0kAo=
X-Received: by 2002:aca:d985:: with SMTP id q127mr2404605oig.132.1583500347682;
 Fri, 06 Mar 2020 05:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
 <20200306103846.GS2363188@phenom.ffwll.local> <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
In-Reply-To: <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 6 Mar 2020 14:12:16 +0100
Message-ID: <CAKMK7uF_JnyWi+2QUG9OscC9DUA+4wh4dZGAXXAyYeXMTzXFyw@mail.gmail.com>
Subject: Re: [v4] vgacon: Fix a UAF in vgacon_invert_region
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
        Dave Airlie <airlied@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        wangkefeng.wang@huawei.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@osdl.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Mar 6, 2020 at 1:55 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Mar 6, 2020 at 4:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Linus, since this missed the -fixes pull from Dave maybe double check I'm
> > not grossly wrong here and apply directly?
>
> Hmm. I don't have the original email, mind just sending it to me (with
> the proper added sign-off chain)?

I'll stuff it into a pull and throw that your way, that's simplest.
btw we did add dri-devel to lore a while back, so should be there:

Message-ID: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
https://lore.kernel.org/dri-devel/20200304022429.37738-1-zhangxiaoxu5@huawei.com/

> It does strike me that there's nothing that seems to check for
> overflow in the "(width << 1) * height" calculation. Hmm?

Indeed I failed to hunt for that :-/ But I think we're good, in
vc_do_resize() we have

    if (cols > VC_RESIZE_MAXCOL || lines > VC_RESIZE_MAXROW)
        return -EINVAL;

And they're both (1<<15)-1 so I think should be good enough even on
32bit - I quickly checked and we're short of UINT_MAX:

$ echo $(((((1<<15)-1) << 1)*((1<<15)-1)))
2147352578

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
