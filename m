Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C22B1281E2
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Dec 2019 19:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLTSHf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Dec 2019 13:07:35 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40153 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbfLTSHe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Dec 2019 13:07:34 -0500
Received: by mail-pj1-f66.google.com with SMTP id bg7so3964801pjb.5
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Dec 2019 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YKFFB/AVD056vw8BJkibNJy24oTN3cNpbKhBWFLueik=;
        b=YXxdYYsHPeXZxaiCzYGnLauWa+0ozccOSdjKc6ZWDKogGhczG8cIRtC/yR7RZkDXTV
         hnd9uegZGBrQvNcuB1D9abEAZPBXNCVhj/rGcRMS0mG/TzOUOYlbUT7vOh1j0uBlDZzx
         PwjceRNe/cmWgJsXXCH6zDEQBxfGshZryOH/kF44PkgfeOGjfiTNjjzVdr7tRy+O1Lsq
         PnUG4KTp9rxNQBb5UcV/X6nixB2x+bGgPUGcyhGce/grRDR6G/3oZoFJRWF2VTq4qL0/
         xWpgYqlwY1NLhWQBcy73W9E5mz5F08whCpUzOuGv2UPtQ3FGkGtv/VEMz0BqyiINyk5r
         jXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YKFFB/AVD056vw8BJkibNJy24oTN3cNpbKhBWFLueik=;
        b=pjYa49kkF3NJnhgmSOMfYOBule701+aMgckXJuPRMWJMZOX2eZcLlDhpZZ+iM5ZsiI
         wiqir2o79UmTOZqupsjveHDOwLb3YJ4eTal6b43P6kedT55yxZ9MXntiqAP2lZlhx4dB
         RNyhA7xWs9mzXlSreQMheoJTuVkW3MbZVAZqXeQN97thPUVeqwIpDfhuMp9WQN67D3uY
         awAuKrpq9E8q/aA/eFFy/zA+qO9SvxYnWlzUk8pO1f6yQwmjA/yGKd3uFLM3EVS2GNmV
         UIHgfphybxSl8gopKHk7U1tNYpoQRYkVeF6+oTDMfNK+YbDPfs/Y6TepqzYn8oU9oz+H
         FwkQ==
X-Gm-Message-State: APjAAAVO9o1IoaUImJ1474Av1KuKGahnFJLVTwYnZSUaJEmQPKuRACFw
        Z7oAtEYz1CFb0In06F5zvvjm015oKXphP+n3J71LUQ==
X-Google-Smtp-Source: APXvYqxtewd7lKFHyimpovcRyE9Nqu37rxqqsTdQfRW1THXeJxNAV0NLE0v9CssmdeGKJm0HBHOk+/nwcPntvS8i/PA=
X-Received: by 2002:a17:902:9f91:: with SMTP id g17mr16233371plq.179.1576865253685;
 Fri, 20 Dec 2019 10:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20191218025337.35044-1-natechancellor@gmail.com>
In-Reply-To: <20191218025337.35044-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 20 Dec 2019 10:07:22 -0800
Message-ID: <CAKwvOd=DcXiA5d07bS_3qhr4F-mbsGzZic=OgomuhZchGaXeoQ@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Adjust indentation in set_con2fb_map
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

On Tue, Dec 17, 2019 at 6:53 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/video/fbdev/core/fbcon.c:915:3: warning: misleading
> indentation; statement is not part of the previous 'if'
> [-Wmisleading-indentation]
>         return err;
>         ^
> ../drivers/video/fbdev/core/fbcon.c:912:2: note: previous statement is
> here
>         if (!search_fb_in_map(info_idx))
>         ^
> 1 warning generated.
>
> This warning occurs because there is a space before the tab on this
> line. This happens on several lines in this function; normalize them
> so that the indentation is consistent with the Linux kernel coding
> style and clang no longer warns.
>
> This warning was introduced before the beginning of git history so no
> fixes tab.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/824
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index c9235a2f42f8..9d2c43e345a4 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -866,7 +866,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
>         int oldidx = con2fb_map[unit];
>         struct fb_info *info = registered_fb[newidx];
>         struct fb_info *oldinfo = NULL;
> -       int found, err = 0;
> +       int found, err = 0;
>
>         WARN_CONSOLE_UNLOCKED();
>
> @@ -888,31 +888,30 @@ static int set_con2fb_map(int unit, int newidx, int user)
>
>         con2fb_map[unit] = newidx;
>         if (!err && !found)
> -               err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
> -
> +               err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
>
>         /*
>          * If old fb is not mapped to any of the consoles,
>          * fbcon should release it.
>          */
> -       if (!err && oldinfo && !search_fb_in_map(oldidx))
> -               err = con2fb_release_oldinfo(vc, oldinfo, info, unit, oldidx,
> -                                            found);
> +       if (!err && oldinfo && !search_fb_in_map(oldidx))
> +               err = con2fb_release_oldinfo(vc, oldinfo, info, unit, oldidx,
> +                                            found);
>
> -       if (!err) {
> -               int show_logo = (fg_console == 0 && !user &&
> -                                logo_shown != FBCON_LOGO_DONTSHOW);
> +       if (!err) {
> +               int show_logo = (fg_console == 0 && !user &&
> +                                logo_shown != FBCON_LOGO_DONTSHOW);
>
> -               if (!found)
> -                       fbcon_add_cursor_timer(info);
> -               con2fb_map_boot[unit] = newidx;
> -               con2fb_init_display(vc, info, unit, show_logo);
> +               if (!found)
> +                       fbcon_add_cursor_timer(info);
> +               con2fb_map_boot[unit] = newidx;
> +               con2fb_init_display(vc, info, unit, show_logo);
>         }
>
>         if (!search_fb_in_map(info_idx))
>                 info_idx = newidx;
>
> -       return err;
> +       return err;
>  }
>
>  /*
> --
> 2.24.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191218025337.35044-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
