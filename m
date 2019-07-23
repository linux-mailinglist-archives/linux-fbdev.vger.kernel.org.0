Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8158713F6
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jul 2019 10:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbfGWI1n (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 23 Jul 2019 04:27:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36276 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfGWI1n (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 23 Jul 2019 04:27:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so40221789ljj.3
        for <linux-fbdev@vger.kernel.org>; Tue, 23 Jul 2019 01:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aQWbT+LvRZmTZPbHcNwKkhIKABtN7PWcJhZVigHFt6k=;
        b=J1lPzwkO9q3MgVFAKEgQWTdHzLfR0r4/dqf8Q19MSVI88smbj773m6rwndjcBQKakb
         IY8TIqOd4v8dpT+r3Dzzl0fLN7WxVaVXMhHOvd2xdMTAhKTMEVCBZ1KooyYMEu0GQ5RC
         H8/NZxL6bNh4KE4mf9JhUuy16amuG3/nCp9E+T1GdkmvywkuZ7yfWQgjJmfSQWUSHpSK
         O0GR3MGZ7OtRjtdDMEDcl5xVVwSdxCOo+MFnvtCXuxiSQM0HuG7Av917+OltWBpMC35D
         vXRLmwzCgBpd8r/+gDYK8xAM3oEzqExKtlZvmxleii2S+GXaKtYCsmH0nmLqEwhTgy0B
         /MGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aQWbT+LvRZmTZPbHcNwKkhIKABtN7PWcJhZVigHFt6k=;
        b=uMlhbaTC+CQXW9o/BmxygH5KCUT58YkXJkSThhfLZG2Ch1/8szClvnfqfzOMGw7IjN
         +JJfxd9Ty50jWFm7DqCQQ2nE+DTf4srozcYzl8pvBULWgiLvnKNvmjeCaPQbzdQUY+9F
         GDklEO8PYK4gNsC1NVdkakhOmuxxI4whjVE4/TgPlNKqIN+xv2aLyvV/w0DpSpJWKcfK
         u6Yq+nKW7RqHDvNzI2qF7Bd/+fEyFJmW9GCnXIXAPDcDCtnwqQWzhN7cdGQzUt24B6ST
         +nFkQWh/Vyq9Nvpl38B6s53bBKAYqaHS0cVvc4OFxDMa+t007xbJzPUKHLvsfs5GItOa
         HQZA==
X-Gm-Message-State: APjAAAW4vRqRFxb+oWIwMDqgzwhtG/oecXOyrz16uztme+Vbz70nQZxx
        EJlrDuqvKRbkC1ZVM7U8VZozdDdObbHe1scgUMbfwA==
X-Google-Smtp-Source: APXvYqz0HX8OQPx3GnS5yBtViFQ3wpO4poIOD2WGxx5DZxgrR64F2LQUSTYoiFWfPKuh/Y6BgHMP3tBxrfw7ADilUIk=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr21488965ljs.54.1563870461161;
 Tue, 23 Jul 2019 01:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190722182439.44844-1-dianders@chromium.org> <20190722182439.44844-5-dianders@chromium.org>
In-Reply-To: <20190722182439.44844-5-dianders@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Jul 2019 10:27:30 +0200
Message-ID: <CACRpkdazAx_5rxwYbKwMs_a7G2K5ETnxj0nUQ7TGarsv6bAv5A@mail.gmail.com>
Subject: Re: [PATCH 4/4] video: amba-clcd: Spout an error if
 of_get_display_timing() gives an error
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, linux-fbdev@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jul 22, 2019 at 8:25 PM Douglas Anderson <dianders@chromium.org> wrote:

> In the patch ("video: of: display_timing: Don't yell if no timing node
> is present") we'll stop spouting an error directly in
> of_get_display_timing() if no node is present.  Presumably amba-clcd
> should take charge of spouting its own error now.
>
> NOTE: we'll print two errors if the node was present but there were
> problems parsing the timing node (one in of_parse_display_timing() and
> this new one).  Since this is a fatal error for the driver's probe
> (and presumably someone will be debugging), this should be OK.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
