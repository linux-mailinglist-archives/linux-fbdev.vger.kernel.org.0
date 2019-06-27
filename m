Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C0358145
	for <lists+linux-fbdev@lfdr.de>; Thu, 27 Jun 2019 13:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0LRI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 27 Jun 2019 07:17:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33524 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfF0LRI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 27 Jun 2019 07:17:08 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so1950432ljg.0
        for <linux-fbdev@vger.kernel.org>; Thu, 27 Jun 2019 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+M32KORGemVLrEhCU+mugrqZ6KHhAjcB7ktP25bgUw=;
        b=JATFfirzIRvl4Bn0MzZWqLXi3Ey2itUpvEWgha059qAjA3IR4c2e1wMYo0c8Z9yL/L
         WyGOxZrDK3Wnpu+UNfnPJmkwU9xOdh+bOAd5U+upstomSDHtE62P4UarRnshyBxTZwJC
         GXuAX0YXnoWrBeA4RM3Qn1INmR+BJS6DN+IzO5VbLtp3T6R99ZjdyYG6rtknT6+hXXwJ
         DPoPboHY7TP74z5yaajm17KS0cWKWMGHFArJHx42qzxQyRY1KKg7LMdAMfkwaPbuyatE
         kXX7rKx4ZmsGCoeVQpyujljI9AIVkuBs6ld7AtEB4hCOp/+cjbUg8oBHYZu0nmkh8mI7
         CsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+M32KORGemVLrEhCU+mugrqZ6KHhAjcB7ktP25bgUw=;
        b=dPbq2ILZstRx6UwliEjT1+Pq7tcaF2J7YUzOcS5u8xO5uR1nfAw2Lz34KgKmQ9AiZN
         VGT0gVKj6kNYOM2k3d+ObjC+7e4Bu00IUAe5S6pFXGXUKknFdu07B+3PgJhWV6vzN0WG
         aJBw27muoCp/l9nbSlDnhCVETtOirPOq5cjF+pR8j/TSmOs5671gz1Kcr6ietOULq0Lw
         17YoQryXFppybJUpfHAHL7hprL3RBg+7Z2M8GVPp0JypDKH+0DHOxv3l2L5VCdK5njj9
         wIVBPEiQFgvwspHmmXQe+t9ehdmg9MFXspTxmPRyzovGvYxaFbiEvGihc7zmroW9rjcd
         8/sA==
X-Gm-Message-State: APjAAAUehCwlBkLyGlt+jAFumJkFrggYpMLbWLGeRnRpulSEPLRvidKJ
        GmaaZk2AiNVsxAtwhctCBwYgpbRywqz+L6UW/XqoFg==
X-Google-Smtp-Source: APXvYqwhIrf7JDRO2BMtKtOJvp54agYbc9d0DQAtQ0T63qMEcpkYpkkimqLDdz3gA69lWL5g0fktxZUtlvgv/RN7KDI=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr2370304ljj.108.1561634226615;
 Thu, 27 Jun 2019 04:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190625163434.13620-1-brgl@bgdev.pl> <20190625163434.13620-7-brgl@bgdev.pl>
In-Reply-To: <20190625163434.13620-7-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 12:16:55 +0100
Message-ID: <CACRpkdZdKigQ08bf5P9sYf-EhWFn5LmMRPQoMS2O5ouB9h6=MQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] ARM: davinci: da850-evm: model the backlight GPIO
 as an actual device
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
> Instead of enabling the panel backlight in a callback defined in board
> file using deprecated legacy GPIO API calls, model the line as a GPIO
> backlight device.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
