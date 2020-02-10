Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35124157352
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Feb 2020 12:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbgBJLRS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 10 Feb 2020 06:17:18 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36848 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbgBJLRS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 10 Feb 2020 06:17:18 -0500
Received: by mail-oi1-f195.google.com with SMTP id c16so8854149oic.3;
        Mon, 10 Feb 2020 03:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uaCtQNIy6IQx3uNLs54ga0WpoB8S0EJs2n7XCZo4GWA=;
        b=HzQJBZlgEkUD9TMCbZdvfLlkgTuuxEVVSlXpNz/7pCXhl98GF4VkLIQIDvSOUcj1Iu
         oGrDRpGzT6lOuOs8MDfxpRYKh9LFoPFaN1d6xBfYLEz2b+Izhg1xQWbM1vx3gg/J0R5Q
         lSH034SkLxNS5CjGZbye9oHCI6m9IatShb0xCt5ZzloiSYaDdFJiJHCemrvkEMUvYIyc
         7MGjEy7TJuqCKoLFJSVVyDy24rpZz6vG2D8cnQPmkGPvZEKHURR6VZvht6oCyJYtWkJq
         O6g+aLU4EvI53MI/f8YsTyOo0URK+u14YbjY7wltsCs6jRL55R3rhJ6TxZKfUgXh848C
         VopQ==
X-Gm-Message-State: APjAAAXse2Tvo/ZtQW6gUh/iHSouJsaPXXN+vq/Jl9aL8pkVNlCyx/B8
        3bxvKW6zoZO53N1uInOO6ynApv65K3mixnQ0AqM33A==
X-Google-Smtp-Source: APXvYqwl6Yr5ge3Dx87NUUNYMHGwhpVcvytxUTMwUiHhtL+jKJ7CpOM8rysExxtcDzjVRZbRXYa4xnXuWppyfV+jWh0=
X-Received: by 2002:a54:4707:: with SMTP id k7mr461629oik.153.1581333437650;
 Mon, 10 Feb 2020 03:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20200112171521.22443-1-geert@linux-m68k.org>
In-Reply-To: <20200112171521.22443-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 12:16:56 +0100
Message-ID: <CAMuHMdX9M25O9MOQ5tb-cLs36E8qCf1M4YCbYN9BU+h1N3n0MQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: c2p: Use BUILD_BUG() instead of custom solution
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Jan 12, 2020 at 6:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Replace the call to the custom non-existing function by a standard
> BUILD_BUG() invocation.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, applied and queued for v5.7.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
