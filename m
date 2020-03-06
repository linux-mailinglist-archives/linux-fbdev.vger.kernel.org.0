Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8446117BE34
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Mar 2020 14:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgCFNY0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Mar 2020 08:24:26 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42161 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgCFNY0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Mar 2020 08:24:26 -0500
Received: by mail-lj1-f194.google.com with SMTP id q19so2184852ljp.9
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Mar 2020 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDYKc7DCCCP8IsrCVczT6C88EXaizXrCTGtH/4pFS+M=;
        b=VTpKH3Biqo5cU85DKD5haoqo18n+/RQoz9ihmzUmZ5B0M2R0YjtQfJed8PR6zrMRO1
         2ea9U1wJXWVScHhHE2o5+2OgNGtj5WyMDW8J/uT9Wf53EI7cz7Zz3lxHDzbK5mwn+zgv
         ePnqCnmrM06Mn9VuTwcgknPZ9VlTxFNxMm7BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDYKc7DCCCP8IsrCVczT6C88EXaizXrCTGtH/4pFS+M=;
        b=pVP6EIyQjzDB0ScMgtrPCigt+Nu5amdiEZYdto6xyQZw5A2frUBjE4s+tKuKg2vUJS
         fkdRNhQj0LK1dqRM9/xU9jsJe3dQk1uC2gvaxuXQJO3rNFJeywkvFAKhBEkw5aLGgTYL
         3Dt0fYNNea87BHeMDsklHdp39VG9H/OjSZL8QpPSfsDIrHuedRnCGGiRAUTo9Af+KANC
         STLE0CNyl5d5LA6zI9W11OKCry6S8etw5z7pM+kGolpZu/LdRiNRvhrFFtiIsDNY/K/Q
         aLGj7G2+Sdtf/CuKNB75Jih5f+4eEzrVSQTTCcn3ny5cgKPUN0gDvIBq2ggrv2CX/yUi
         s4Gg==
X-Gm-Message-State: ANhLgQ0YX1rwx/OxQVxwfNo7RmBqvF7J9Nn+sHqsQp0481/z7F3A+tXd
        e5hZdTXiQ0S88YaYoUS9AsTC8xVRbabpLA==
X-Google-Smtp-Source: ADFU+vttErePtW7VvXcukDP0K4aPzLqG3zTrNZYXHlSuTCj3jYTxw3zCksCDg2Pz60Hdxj48HzkDgg==
X-Received: by 2002:a2e:3011:: with SMTP id w17mr1781921ljw.124.1583501063494;
        Fri, 06 Mar 2020 05:24:23 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id q24sm150344lfa.2.2020.03.06.05.24.22
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 05:24:22 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id h18so2154934ljl.13
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Mar 2020 05:24:22 -0800 (PST)
X-Received: by 2002:a2e:9356:: with SMTP id m22mr1274250ljh.201.1583501061710;
 Fri, 06 Mar 2020 05:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
 <20200306103846.GS2363188@phenom.ffwll.local> <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
 <CAKMK7uF_JnyWi+2QUG9OscC9DUA+4wh4dZGAXXAyYeXMTzXFyw@mail.gmail.com>
In-Reply-To: <CAKMK7uF_JnyWi+2QUG9OscC9DUA+4wh4dZGAXXAyYeXMTzXFyw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Mar 2020 07:24:05 -0600
X-Gmail-Original-Message-ID: <CAHk-=wi-vJ9-snUQeotBD0Zmb-Y=ggPQcY3yP=M2qjsXttvCOQ@mail.gmail.com>
Message-ID: <CAHk-=wi-vJ9-snUQeotBD0Zmb-Y=ggPQcY3yP=M2qjsXttvCOQ@mail.gmail.com>
Subject: Re: [v4] vgacon: Fix a UAF in vgacon_invert_region
To:     Daniel Vetter <daniel@ffwll.ch>
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

On Fri, Mar 6, 2020 at 7:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> I'll stuff it into a pull and throw that your way, that's simplest.

Thanks.

> btw we did add dri-devel to lore a while back, so should be there:

Indeed. I tried (incompetently) to look up your message ID, but I
didn't put the dri-devel part and saw the 404, and assumed it wasn't
there.

My bad.

> > It does strike me that there's nothing that seems to check for
> > overflow in the "(width << 1) * height" calculation. Hmm?
>
> Indeed I failed to hunt for that :-/ But I think we're good, in
> vc_do_resize() we have
>
>     if (cols > VC_RESIZE_MAXCOL || lines > VC_RESIZE_MAXROW)
>         return -EINVAL;

Perfect. I just looked at the quoted patch itself.

            Linus
