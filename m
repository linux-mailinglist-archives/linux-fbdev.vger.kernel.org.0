Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A0F14A21E
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Jan 2020 11:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgA0Kkg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 27 Jan 2020 05:40:36 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34893 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgA0Kkg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 27 Jan 2020 05:40:36 -0500
Received: by mail-ot1-f67.google.com with SMTP id r16so7891192otd.2
        for <linux-fbdev@vger.kernel.org>; Mon, 27 Jan 2020 02:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AW+LBaeT8gOjm/Wt8re4LDAAGI/aZNJ9jt+vsl49tb4=;
        b=r3tFHyGB/FXvz2BXLqinspv844NeSdWFvtAN+EIbD7zNm+a71Q7lhZwyGLk/ZW9fEj
         c6mxq7X6bWYDFD9wz1vk5Zrm4dLPxNoW+7ULIEg54KsoeyIteVmJKQ4Itoy8XoR66ciY
         +S6P5lU6wqzjTnIs10wfc7HA09lpFyMb15RKLq0iXWmDS+D24ruzt8f9hjs1lu/fYhSs
         STJZLnLNGyT46y4L1MAQ95LqZjTWvuWwT6Oc4M5p1apoZQmwXn19O2TS6h0+tb9zmmWl
         rNcjZ8hq643QhniEP0g+0LoTOO++0yOHe3hGLy4c+N3rJZXzBid+XhKWiacCitkuI7k2
         /Xwg==
X-Gm-Message-State: APjAAAWz5d5RKDmeEKHpWvKF2EKDXo3WihLINGToYCpFglUh2NihqjJE
        PJ69rKGDwNcM4giXjIu8rpHY8wuf+UWm2Pb5td8=
X-Google-Smtp-Source: APXvYqyZJ7snfwIF9VhtGo0junMx6187m3dBMp5u/yhu7QVejoz7fioQfLRaBYU4XdKKGp9DEtface7gHN7kLtf167I=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr12336553otm.297.1580121635811;
 Mon, 27 Jan 2020 02:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20200125195506.GA16638@brightrain.aerifal.cx> <20200126071724.GA3520745@kroah.com>
In-Reply-To: <20200126071724.GA3520745@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Jan 2020 11:40:24 +0100
Message-ID: <CAMuHMdU32gF89zz86WH3AqkoPK7hdSjWMexJ1aLU9woe0qF0YA@mail.gmail.com>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rich Felker <dalias@libc.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Greg,

On Sun, Jan 26, 2020 at 8:44 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jan 25, 2020 at 02:55:06PM -0500, Rich Felker wrote:
> > Signed-off-by: Rich Felker <dalias@libc.org>
> > --
>
> I know I don't accept patches without any changelog text, don't know
> about other subsystem maintainers...

FTR, I do, iff the one-line summary says everything that needs to be said.

What's the point in writing a full paragraph like:

   Currently the foo driver does not support the bar device.
   As users may want to use the bar device, it makes perfect sense
   to add support for the bar device to the foo driver.
   Hence add support for the bar device to the foo driver.

if this doesn't add any value on top of the one-line summary?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
