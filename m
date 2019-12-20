Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5211281F1
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Dec 2019 19:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfLTSJz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Dec 2019 13:09:55 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46023 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfLTSJz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Dec 2019 13:09:55 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so5609874pfg.12
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Dec 2019 10:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1NoYeCvzhEf2ThmFbvrz2tyjWvGOYahfq+FFDczVt3k=;
        b=G64k8noTQfo52NnZSStBp4byZlOS2XeDgJ4imbftROkrulALEygiIYb1pRSKCdbG1S
         8d0B7yLoYnzw/lHrZkSdQgbnutH+wIICxJliskMoYCqQJ0SZV6y7fW2FC9aY3vsXu8IH
         x0fBdXM7i8UDYPF1e+OYcSNx7D8v0wqQm3uHoOQ3swGp2LDEEZRsDK/xSJ/FSej6CDvr
         vewMxURaqh4vqbtLiC7rX/NZdaw8RaqsVUxY6T7+ll4e+fagxenkEwuCklykqXaIYCmC
         EI4m/qm6ESlDwz2EP+UT7a7d41VRkt4JiOQC8DQZcoKW7EPK67pJVWVUzoIQ7kGAHK6O
         Ok+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1NoYeCvzhEf2ThmFbvrz2tyjWvGOYahfq+FFDczVt3k=;
        b=PwVAs/Ttskr4WfPkrCxmg2EB3s+k5VmvOH0GlkupsEaQLvlE6z9fuV3pjQwqHiTwrK
         y3qV0wRSbxFSxYv9bj7FqrJzy8CuJFOKgT/BrCo+kEmQbKi4DzFYa+bl/iWykL3pSMi/
         5ptetxcy1oW9PZh3uis8TlpSCTdhoWvfyK7K3lAEfzzVeTlLn3kXB+B6JRqjEcWpiFZl
         QnCrL4J/6XK7wDsf8SCNeVwQaM3uDX+nfkw6bUGz7b4sZLqu7LuCcYblDXu/PlW8qv7E
         OWy+UNL+HdPI+OLWvHd1Go8Z4mBIWlZa0Cuut1au/rbNLH2ym50tXDBNGfZupR5zEosJ
         DuMw==
X-Gm-Message-State: APjAAAXWdVLvmrV9LwM70/LJYxRovTSEHcwT9FN0+yf3Of0Le8cktp/b
        h0sjT2LoltxSI34nmYhs2W94bQ2A+Mki3/VMZIj76w==
X-Google-Smtp-Source: APXvYqyQqxrvt9MqS1V+wSCAIwQ8mrA8vpt+5ti4yyobuNNh3cA/iDEG6Da1zNuN4ot+7zz3CDCWpMjliCcjY9zAJf0=
X-Received: by 2002:a63:590e:: with SMTP id n14mr15983487pgb.10.1576865394047;
 Fri, 20 Dec 2019 10:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20191218030025.10064-1-natechancellor@gmail.com>
In-Reply-To: <20191218030025.10064-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 20 Dec 2019 10:09:43 -0800
Message-ID: <CAKwvOdk0hz-Eu00yRwRT6MFDmxPWdgnuYZWxGxASicCq68NivQ@mail.gmail.com>
Subject: Re: [PATCH] fbmem: Adjust indentation in fb_prepare_logo and fb_blank
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Dec 17, 2019 at 7:00 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/video/fbdev/core/fbmem.c:665:3: warning: misleading
> indentation; statement is not part of the previous 'else'
> [-Wmisleading-indentation]
>         if (fb_logo.depth > 4 && depth > 4) {
>         ^
> ../drivers/video/fbdev/core/fbmem.c:661:2: note: previous statement is
> here
>         else
>         ^
> ../drivers/video/fbdev/core/fbmem.c:1075:3: warning: misleading
> indentation; statement is not part of the previous 'if'
> [-Wmisleading-indentation]
>         return ret;
>         ^
> ../drivers/video/fbdev/core/fbmem.c:1072:2: note: previous statement is
> here
>         if (!ret)
>         ^
> 2 warnings generated.
>
> This warning occurs because there are spaces before the tabs on these
> lines. Normalize the indentation in these functions so that it is
> consistent with the Linux kernel coding style and clang no longer warns.
>
> Fixes: 1692b37c99d5 ("fbdev: Fix logo if logo depth is less than framebuffer depth")
> Link: https://github.com/ClangBuiltLinux/linux/issues/825
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/video/fbdev/core/fbmem.c | 36 ++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 0662b61fdb50..bf63cc0e6b65 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -662,20 +662,20 @@ int fb_prepare_logo(struct fb_info *info, int rotate)
>                 fb_logo.depth = 1;
>
>
> -       if (fb_logo.depth > 4 && depth > 4) {
> -               switch (info->fix.visual) {
> -               case FB_VISUAL_TRUECOLOR:
> -                       fb_logo.needs_truepalette = 1;
> -                       break;
> -               case FB_VISUAL_DIRECTCOLOR:
> -                       fb_logo.needs_directpalette = 1;
> -                       fb_logo.needs_cmapreset = 1;
> -                       break;
> -               case FB_VISUAL_PSEUDOCOLOR:
> -                       fb_logo.needs_cmapreset = 1;
> -                       break;
> -               }
> -       }
> +       if (fb_logo.depth > 4 && depth > 4) {
> +               switch (info->fix.visual) {
> +               case FB_VISUAL_TRUECOLOR:
> +                       fb_logo.needs_truepalette = 1;
> +                       break;
> +               case FB_VISUAL_DIRECTCOLOR:
> +                       fb_logo.needs_directpalette = 1;
> +                       fb_logo.needs_cmapreset = 1;
> +                       break;
> +               case FB_VISUAL_PSEUDOCOLOR:
> +                       fb_logo.needs_cmapreset = 1;
> +                       break;
> +               }
> +       }
>
>         height = fb_logo.logo->height;
>         if (fb_center_logo)
> @@ -1060,19 +1060,19 @@ fb_blank(struct fb_info *info, int blank)
>         struct fb_event event;
>         int ret = -EINVAL;
>
> -       if (blank > FB_BLANK_POWERDOWN)
> -               blank = FB_BLANK_POWERDOWN;
> +       if (blank > FB_BLANK_POWERDOWN)
> +               blank = FB_BLANK_POWERDOWN;
>
>         event.info = info;
>         event.data = &blank;
>
>         if (info->fbops->fb_blank)
> -               ret = info->fbops->fb_blank(blank, info);
> +               ret = info->fbops->fb_blank(blank, info);
>
>         if (!ret)
>                 fb_notifier_call_chain(FB_EVENT_BLANK, &event);
>
> -       return ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL(fb_blank);
>
> --
> 2.24.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191218030025.10064-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
