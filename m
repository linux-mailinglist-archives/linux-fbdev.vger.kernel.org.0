Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39E132F1A
	for <lists+linux-fbdev@lfdr.de>; Mon,  3 Jun 2019 13:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfFCL51 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Jun 2019 07:57:27 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46474 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFCL51 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 3 Jun 2019 07:57:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id z23so809674ote.13
        for <linux-fbdev@vger.kernel.org>; Mon, 03 Jun 2019 04:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s8IrT+ZVUu/ua1eJGDjSCYHjA3EdBkhtlk4Nvg1NcZI=;
        b=S0iQT53OoEwbSlmtp0XF9zyumwGa5rj4sGGGP41DPu+Sjy49aJPx4fYL/hiMFPZKJc
         ACVnDSncsy/k3RC+loaVRjX/Si0qWGNvfMMszOSVH05mDkB1Cdf2Cw0gGhaqrojlnbHZ
         g1Lm8r7NeIQeNQ9Az2ASXdu0BObeHA92U4fM8RE1r5FDAzDwpbCv74QLY1mj8X5E1+2o
         dvQTvt4kpPEgY1sHQI99Ic7amm4ShujgHQ2jxM7sMwJZJW73xL0fJ2M8LK9hHNgVJBBg
         9RAipPTKc6+uZ1jaOvVOkMwhDRhS8XZIKPYvegQCvfOeGoKCMgTCQTz9VPLkrJ7L7UuL
         9KVw==
X-Gm-Message-State: APjAAAUR4t2DAnXxnjDyNVGqvSCNqFxLOWsvTer1wzMBGoc0Kki618/Q
        xyLjlGu2CZJ/Xmp8T/Ayp5bu2tlsLuqZO77OLFA=
X-Google-Smtp-Source: APXvYqyLGMR9eX3q7uVsJJpJKv/kzwezOPp0H91F9vHs+NwF7iG+KvgbNZf2f3fdLFx9TbtDOTz65UlzBbXFgWuKqE8=
X-Received: by 2002:a9d:68c2:: with SMTP id i2mr852060oto.59.1559563046881;
 Mon, 03 Jun 2019 04:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
 <1559560752-12314-1-git-send-email-shobhitkukreti@gmail.com>
In-Reply-To: <1559560752-12314-1-git-send-email-shobhitkukreti@gmail.com>
From:   Mathieu Malaterre <malat@debian.org>
Date:   Mon, 3 Jun 2019 13:57:13 +0200
Message-ID: <CA+7wUswkGyBrnbAZrA57PcxTb1jB=dLkv9SYXT05A2fX8Mb0jw@mail.gmail.com>
Subject: Re: [PATCH v2] video: fbdev: Fix Warning comparing pointer to 0
 reported by coccicheck
To:     Shobhit Kukreti <shobhitkukreti@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jun 3, 2019 at 1:21 PM <shobhitkukreti@gmail.com> wrote:
>
> From: Shobhit Kukreti <shobhitkukreti@gmail.com>
>
> Fixed Warning Comparing Pointer to 0. Changed return value to -ENOMEM to
> report kzalloc failure
>
> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
> drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
>
> Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
> ---
> Changes in v2:
>  - Modified commit message to report change in return type
>
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

nit: I would have use `!p` (same for the others above). Maybe
checkpatch with --strict would warn for those (can't remember from top
of my head).

Anyway:

Reviewed-by: Mathieu Malaterre <malat@debian.org>

> +               return -ENOMEM;
>         control_fb = p; /* save it for cleanups */
>
>         /* Map in frame buffer and registers */
> --
> 2.7.4
>
