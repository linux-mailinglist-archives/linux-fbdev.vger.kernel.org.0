Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F41A7A076C
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Aug 2019 18:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfH1Qbf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 28 Aug 2019 12:31:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35497 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfH1Qbd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 28 Aug 2019 12:31:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id l14so169720lje.2
        for <linux-fbdev@vger.kernel.org>; Wed, 28 Aug 2019 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NjXiz0jtJWGT4cEckFQPpVyw/lRnuMBErWmMi5AhrWA=;
        b=E5GgF7uEiUS4O03g81yoi6j0NmHdf4h5a677oc0l/9oNnv0vPvwDHY9bBDT7sfZWMO
         rtsogJ+CsbQsVUNcCCnRHsk9EWzhAL6ZAKvbAkIGd3LbnZ9GbTX5hpb5oa1NrfnQCDQD
         85jxjR9VZDrJIS3b4zWx5d3/+VcTuqraAY6MfUm0HRhJ88NUTZw3xDXtM5agrv/wXgTK
         4OEFhl9VwwKoRXdkm56/y0MiVOG/BysRAFp+oFrmld0FBfH7Wc6WzPLGLl/lz1dZz4pY
         cQR2OdKQ1dpLW+E67rY2iNc+/jXps0kUscsilbRR/9V3g+yKEWUcVcl6Q4w3/v7MaUkX
         iQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NjXiz0jtJWGT4cEckFQPpVyw/lRnuMBErWmMi5AhrWA=;
        b=BpZfMlhqTTW7jC06jmYi4KoyqCxHAs0QC1WXYrnrYb67hqNQF1z/kao0cmOTUOkwQf
         nlZ1IZfbCkk9tSFyBtxQ4i7YklyDiZx56ccu313Enj7Lm/ZBcpagf3gyHaYFQcss3f0j
         chkzs9hZ0ZTGf7AkAbtmIZwPgsXAwyc6vA7EcUdC0qj8tDPfAj6A1e+MmiyQ3VvI++cV
         KljGQDjbJ/WFbRarPRFrvJ5Pls4Gkrv5AX2C5ymm25fXr3PJu5XWR2ylsNsOy5zSJUOB
         vVsGWes6ik6qnkChy91MDsGkDl4caft6fa5JlJGKrd+bc8IkZtHuSUgExhN8eD0A+Dqk
         7GIQ==
X-Gm-Message-State: APjAAAUQLpXw08Nbml7FRuV7koJQBFtE9EenZoyrslK9KWVxmqr55vmK
        E1DoWoGBpq0pS+P/tS/gJxrOcQ/d7o/44B9nlejjbg==
X-Google-Smtp-Source: APXvYqxAHfxii1r8G4uA4TRksDr+gKgKoYBl4Hdl6wuwPpbFwpxiCpD0ZSA802wdhf0b6NWeu0VbqDNspGN9n84/Rjg=
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr2559887ljk.54.1567009891738;
 Wed, 28 Aug 2019 09:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl> <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
 <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
 <CAMRc=McUEgm6yH7enwHuHxVTL41dmb5KAY_pxTmSr3vctCs2xg@mail.gmail.com> <CAMuHMdV3obGtQ7qohNedQNgpvZvyL9xjH0HUiBKD6b8Ou5F+XA@mail.gmail.com>
In-Reply-To: <CAMuHMdV3obGtQ7qohNedQNgpvZvyL9xjH0HUiBKD6b8Ou5F+XA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Aug 2019 18:31:19 +0200
Message-ID: <CACRpkdbgZhgSvicq2XG0n2hiKA9K8VFmvCPn3W9oXgSLrZiw=w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Aug 28, 2019 at 10:36 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> CC the pour soul with the ecovec board.

With great power comes great responsibility ;)

Yours,
Linus Walleij
