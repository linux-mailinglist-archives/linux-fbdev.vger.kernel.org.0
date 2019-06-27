Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B948058136
	for <lists+linux-fbdev@lfdr.de>; Thu, 27 Jun 2019 13:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfF0LPM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 27 Jun 2019 07:15:12 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36016 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfF0LPL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 27 Jun 2019 07:15:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so1929717ljj.3
        for <linux-fbdev@vger.kernel.org>; Thu, 27 Jun 2019 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5TqvPz8DpORGx1+vi8ExXWSK0FXpNg/HXwHTY32b52w=;
        b=Oh8LTD8m7IDgDorBBc7V+VvCco9ShEfKtubYx65x1T5UADxUHneIwXm5D34fbeGt8A
         ixjCx/VH3pF/bQ6ZHMg9PHCQmjkpCAiXVk/t5qsh/Qqm5tx9SPGzVhjOT8gQTzjQQrfi
         lAGtQ9fEG9oF9K1v8oeREAXC0uuw/SL0BJN950l/xiDxO5+wGYpYmT+5VPl0QUp7nSue
         aAMKG7ngQmAlBgnfr7IMamGqNGSDVnT6ZsHyoFmoAYfgNHCqJ4qfQ4AxjZkWYV30/+vx
         p6K15ZkS7XsSbBvwsLCURk/PDZbWbvX4UVyTadC7wxBwmODusUKB4z9LZEZdJG1mVlPF
         JTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5TqvPz8DpORGx1+vi8ExXWSK0FXpNg/HXwHTY32b52w=;
        b=lwunVBDNEOcWkKoqdJOdM8GYYDEdUYxgmsf1dtMgedFgn+qr5zcBw0uEdEeMivkEA/
         jWqma/vATzgzyFAOivSEf/3vwSk4u7B5uYc0+JuY6RQIDDZnzoVLJTJNa4uUN1xy7j+P
         BSJWoYogKRQkCq9f8w8/cji10aiBGfSOCbhLJd+sOn7PNdi+3RM5audFA10nzWnR618D
         kwfmLKoLOyTqTemEUzs8GXGrpZjuiLWoB5wELhaCT4h1BbLkEA5mx/ErxMkMYy6Z50JY
         2BndVe+1MsT+5F4+WRtoHhQyXQkfhMSN51Fg6jvfFGfU0SNb8m1u6769utRYOxr51fX2
         zkZg==
X-Gm-Message-State: APjAAAUsm8R+ZVWiUy7CIRvF+LpQmYFc5CXcjvhulCXRI7Pgr3QbQV5e
        rYj1di6SCMce2nGtTrDBcEJXf72+BRE44T3IgttsUA==
X-Google-Smtp-Source: APXvYqyVA9C7Y1iH92FooDzDgEr3HQuytpfeJym/aOuE5hBX0/swTw0Rz9L0rgrDIJ1qob4Es/otbtAluqfU9XSMIXs=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr2303238ljm.180.1561634109728;
 Thu, 27 Jun 2019 04:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190625163434.13620-1-brgl@bgdev.pl> <20190625163434.13620-4-brgl@bgdev.pl>
In-Reply-To: <20190625163434.13620-4-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 12:14:58 +0100
Message-ID: <CACRpkdZm35HOxBqDN0dfAyiMPFAPOguPrzuPUwS14kZM-VJV4A@mail.gmail.com>
Subject: Re: [PATCH 03/12] backlight: gpio: pull the non-pdata device probing
 code into probe()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jun 25, 2019 at 5:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> There's no good reason to have the generic probing code in a separate
> routine. This function is short and is inlined by the compiler anyway.
> Move it into probe under the pdata-specific part.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
