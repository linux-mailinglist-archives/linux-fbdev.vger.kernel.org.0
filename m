Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF1C617BD54
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Mar 2020 13:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCFM4A (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 6 Mar 2020 07:56:00 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46058 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgCFMz7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 6 Mar 2020 07:55:59 -0500
Received: by mail-lf1-f68.google.com with SMTP id b13so1792680lfb.12
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Mar 2020 04:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APIC1Fz030U1YDyEpc6HSP/ud3+nGaKD+VywQcEvWPQ=;
        b=b39yXM3P5goM7b2EToMbF9ERcf1VcdLEapV+nwDFobIREKUyxLoakA4POzMJxqJ9wb
         /Hr0bZnlj3uFCizZsEsAlgRWx989gUSvYwLKw9/fRqeagQUXP+AZ3YaXqAq4PCh1SOXF
         aVJDPnNC7110sRh1e6E8p44l9iZN2LbDuSTMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APIC1Fz030U1YDyEpc6HSP/ud3+nGaKD+VywQcEvWPQ=;
        b=dWDtQFf2YG4sxpm4Iz0UrOoxlUtv0wphFvAwyO0lEvFh15htocbZdenZbErxUowM8T
         dm7axFYJ7LDzk//j7NGk+pboxkamAlR7G7k20RtIBMQSd0heUwzjWuhtc6sBvoMmqvd8
         x2dP8eyFaECS7nkX610W9Cj7y6oeJgOjV8dc86UTSLllG7K9ijKXW1jpsUIasb+UKHft
         zhrgxxY8D7dobJWuvGIKuFz+sB0Yu08RbyRxHLwP5dAmFJDqsQUX9ukPSf/u7VnwZcMy
         wsb5ccNHD1FhPXpSzzdGiKM3qE6uMLUWeDNnVragD6LgPPQqu30lzxJIZuq6wI8vHcV5
         4e6Q==
X-Gm-Message-State: ANhLgQ2/saylYChj7N8IVdljLLPArFRkZh/jpWkXSTCl8WDFIw6ulOEU
        zufiyxFt3w94Ybo4xSIX8lDE28IiwbFO1A==
X-Google-Smtp-Source: ADFU+vtOuYt2JXZwdG81IMMSYc8LXgNkPpAscmaM9Y8RFnDuk8e5/PCJemrgXjU4zO654wIGYSEMdw==
X-Received: by 2002:a05:6512:6c5:: with SMTP id u5mr1902837lff.130.1583499356865;
        Fri, 06 Mar 2020 04:55:56 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id s17sm13398558ljd.70.2020.03.06.04.55.22
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 04:55:26 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id a10so2068625ljp.11
        for <linux-fbdev@vger.kernel.org>; Fri, 06 Mar 2020 04:55:22 -0800 (PST)
X-Received: by 2002:a2e:6819:: with SMTP id c25mr2018904lja.16.1583499321417;
 Fri, 06 Mar 2020 04:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20200304022429.37738-1-zhangxiaoxu5@huawei.com> <20200306103846.GS2363188@phenom.ffwll.local>
In-Reply-To: <20200306103846.GS2363188@phenom.ffwll.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Mar 2020 06:55:05 -0600
X-Gmail-Original-Message-ID: <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
Message-ID: <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
Subject: Re: [v4] vgacon: Fix a UAF in vgacon_invert_region
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
        Dave Airlie <airlied@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        wangkefeng.wang@huawei.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@osdl.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        linux-fbdev@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Mar 6, 2020 at 4:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Linus, since this missed the -fixes pull from Dave maybe double check I'm
> not grossly wrong here and apply directly?

Hmm. I don't have the original email, mind just sending it to me (with
the proper added sign-off chain)?

It does strike me that there's nothing that seems to check for
overflow in the "(width << 1) * height" calculation. Hmm?

            Linus
