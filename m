Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94920158B74
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Feb 2020 09:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgBKItb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 11 Feb 2020 03:49:31 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39780 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgBKItb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 11 Feb 2020 03:49:31 -0500
Received: by mail-oi1-f195.google.com with SMTP id z2so12064565oih.6;
        Tue, 11 Feb 2020 00:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GapR/PP+nA57QMva7te9u2I4kGxmUQ4/mErgrZw1Y3c=;
        b=jPhCXCr3sqn1ZWc7pVhKGsCF1dqIguwBPiQ2IwUtLxhZBhESxFnStfGFLtPS3Qy0jS
         2Lf2o6XjHEU/bJgOaumNKkUJYPFbM9cGabodRjmB4t63v5a1/2j9iSHSyjd3tMzQDqXz
         JHXGAiXQ5lX6MuSqxk0L/4boYpMTPCeymi4+OtiBBNnq9RzEio7miF3qyQx5Fioi+5ma
         yvFnnJv5I50gceEwHBRnwmDgNGz1Ozq4v9iQj5yzGXqhQVF6lLEMIkVIZ6BF3P+79yd1
         kDYg7w3Z/DCPI2odt9Jxso5IlD+I/LE0CHd+sqYj1N2n1WYAf3IG9M/BBjoX7PzGQmoh
         IkOw==
X-Gm-Message-State: APjAAAXUkIEM2Ppoxw4bTo6BO8KWjnL1LoaPK2U7xSttQL9pbxGr6myy
        kNNRkf/2fHCXChtNHarzAMEH6LZu1C4L/i+IXapC5w==
X-Google-Smtp-Source: APXvYqwI8x1EVFSpPufodnIb84TVzRfFzMPy1rl88l3HOVrxiflNc2TdTktfiTeuW9WRs49ZFr98yn3bgYBAFEEe2qo=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr2235953oif.54.1581410971055;
 Tue, 11 Feb 2020 00:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20200112171521.22443-1-geert@linux-m68k.org> <CAMuHMdX9M25O9MOQ5tb-cLs36E8qCf1M4YCbYN9BU+h1N3n0MQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX9M25O9MOQ5tb-cLs36E8qCf1M4YCbYN9BU+h1N3n0MQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Feb 2020 09:49:20 +0100
Message-ID: <CAMuHMdWgGyt8w4zG-rf-b9uyfEx1aHV-CoLz4h_T3MpvzdniWQ@mail.gmail.com>
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

On Mon, Feb 10, 2020 at 12:16 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Jan 12, 2020 at 6:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Replace the call to the custom non-existing function by a standard
> > BUILD_BUG() invocation.
> >
> > Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Thanks, applied and queued for v5.7.

Sorry, this is fbdev-material, not m68k-material.
If you mind, I can drop it from the m68k for-v5.7 branch again.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
