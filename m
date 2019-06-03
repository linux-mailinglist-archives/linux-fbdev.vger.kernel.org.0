Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4D832938
	for <lists+linux-fbdev@lfdr.de>; Mon,  3 Jun 2019 09:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbfFCHU2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Jun 2019 03:20:28 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40193 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCHU1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 3 Jun 2019 03:20:27 -0400
Received: by mail-oi1-f195.google.com with SMTP id w196so2571530oie.7
        for <linux-fbdev@vger.kernel.org>; Mon, 03 Jun 2019 00:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GEVWM7tk2X0vIeVpBfbnjHTmUmzZq0YTfPqoCxhdB3k=;
        b=j9BEeVnVx9v3CxnJY73ZG6VO7DBjmeoXmlglL9K88JuaCz5qWZG9JPvY3BKT/ium63
         eLdNP4yv/O6nGGHh3yCx0u/PbaUPZl7huz6nkUZF929KaTZbJvuHbpw9e0mgDsI+tgGG
         sTtsDaSxDUaqyeXroOGEeyk6kbOPIfW/1rb54kTTtpvXY2dXqKDlNcmKWKMNXMQPOBDM
         fxDza0ERA49KczwqF/ZSfXhA/U0Z+TVpZRXiOOwT3LE5LYqfJ8uN81m+QJZS6ZZ0frin
         f2RWgLNcJOdTaW/NfMpO0yX0T4Q+pycZVRdEZiQ07fwEZF9Xu4qKZ9D6I1QLAFBPGj6R
         CPDw==
X-Gm-Message-State: APjAAAVDCDMM5pkRXxIfcUTTi5Q5GH551XLHxTf2Ll8c2KhnQ5WxZ/vh
        Ph62+bKGlCrIhEXDHdU/5hYv6km5kzmU0iwGmg0=
X-Google-Smtp-Source: APXvYqyBAyt5/cdoI5PEbnfHVPqUyMP8VDhGOtfD/l3kfmSAFiBdZRTjDIRci5k9coO2+u5V8bBCF8zMJanGbPRDOL4=
X-Received: by 2002:aca:418a:: with SMTP id o132mr122975oia.16.1559546427083;
 Mon, 03 Jun 2019 00:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190601153917.GA20765@t-1000>
In-Reply-To: <20190601153917.GA20765@t-1000>
From:   Mathieu Malaterre <malat@debian.org>
Date:   Mon, 3 Jun 2019 09:20:14 +0200
Message-ID: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: Fix Warning comparing pointer to 0 reported
 by coccicheck
To:     Shobhit Kukreti <shobhitkukreti@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Jun 1, 2019 at 5:39 PM Shobhit Kukreti <shobhitkukreti@gmail.com> wrote:
>
> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
>
> Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
> ---
>  drivers/video/fbdev/controlfb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
> index 7af8db2..07907c5 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -182,7 +182,7 @@ int init_module(void)
>         int ret = -ENXIO;
>
>         dp = of_find_node_by_name(NULL, "control");
> -       if (dp != 0 && !control_of_init(dp))
> +       if (dp != NULL && !control_of_init(dp))
>                 ret = 0;
>         of_node_put(dp);
>
> @@ -580,7 +580,7 @@ static int __init control_init(void)
>         control_setup(option);
>
>         dp = of_find_node_by_name(NULL, "control");
> -       if (dp != 0 && !control_of_init(dp))
> +       if (dp != NULL && !control_of_init(dp))
>                 ret = 0;
>         of_node_put(dp);
>
> @@ -683,8 +683,8 @@ static int __init control_of_init(struct device_node *dp)
>                 return -ENXIO;
>         }
>         p = kzalloc(sizeof(*p), GFP_KERNEL);
> -       if (p == 0)
> -               return -ENXIO;
> +       if (p == NULL)
> +               return -ENOMEM;

IMHO the above should be described in the commit message.

>         control_fb = p; /* save it for cleanups */
>
>         /* Map in frame buffer and registers */
> --
> 2.7.4
>
