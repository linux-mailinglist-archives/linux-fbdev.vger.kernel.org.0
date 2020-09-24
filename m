Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C482770BE
	for <lists+linux-fbdev@lfdr.de>; Thu, 24 Sep 2020 14:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgIXMRn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 24 Sep 2020 08:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgIXMRn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 24 Sep 2020 08:17:43 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA018C0613CE
        for <linux-fbdev@vger.kernel.org>; Thu, 24 Sep 2020 05:17:42 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id y25so724454oog.4
        for <linux-fbdev@vger.kernel.org>; Thu, 24 Sep 2020 05:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7HN/HI4dwoGWhFGZaqsVrimFaGkQhy54n7OCWCnDDtM=;
        b=dSH8FEbIB4cFd19+AsZS6btZzKrYEzAmPhSb0WCqhiYF36qSv5h8pDfTJbFz+Qxp+j
         oxN6+UiHZtTkF9oWnbdvAlPloEM5oh9p5+GS7rqslhd3+YniZBsVzX8PaQ9Q2Sf4qVN6
         hhHA8TQUm1N2J//yMqennU0VH4XKduafoG0DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HN/HI4dwoGWhFGZaqsVrimFaGkQhy54n7OCWCnDDtM=;
        b=GCHIe9i2cNljy3hD/7nGgx43BhblOMOwKBV6NRH9Fk3Zt8Zix685fCP1vB5yCHf2Et
         KnYtwMRzYgyzhENYDf8wVpcN8Aa8w82ggzvAFgCm3nv6TzEXOqq1DvLWqdLnEAURc4je
         VwdtZaTT4b8eA5UAq7kiVh/z+cnePDaHEyjeM5jt5E9eegJYpg8zMnClQukr3WSqkPOh
         HCItM0hfilOenB/C2i8VhJtYBEZ1if2IDLqyjzdV3uQZNAn0KRoMUVRyf3SbJDIyJvOa
         mJjVuYX50Rg33asv2R2jnc6SBIXPUWOKsdeWbPHxOGy6e6821yH97lOGV0YAQSHvUq3y
         DlSw==
X-Gm-Message-State: AOAM531gVo5zIIg6c3vy5bmMYGJtoDJqgi9IJEg+dHpidH1lvDr/U3y+
        LlQPIgZ3kPuLS47ngSW3pbIRHgtHqUd4lPpwvhrrHA==
X-Google-Smtp-Source: ABdhPJz/V0WNYrr+r6E1miqNu5wyBbxnQTWKTNNcEVyvUVBoTyyd8eXv6ECanpkYGPZ/3EmRuPKhQ7KjKtsVRaMTFVA=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr3075813oov.28.1600949862219;
 Thu, 24 Sep 2020 05:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200924112530eucas1p13af17d649767ed51c619d303392fa1e1@eucas1p1.samsung.com>
 <7b709254-9412-8473-250c-0c4e006259b3@samsung.com>
In-Reply-To: <7b709254-9412-8473-250c-0c4e006259b3@samsung.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 24 Sep 2020 14:17:31 +0200
Message-ID: <CAKMK7uEMXdFQV3rO9fCMYbf52n3DOhyGi-9WBTreeHJkm1+n-Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mark FRAMEBUFFER LAYER as Orphan
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Sep 24, 2020 at 1:25 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> It has been a fun ride since 2017 but unfortunately I don't have
> enough time to look after it properly anymore.
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Thanks a lot for all the work you put in in picking up patches and
cleaning up drivers for compile testing! Very much appreciated.

I think for now we can just leave fbdev in drm-misc, with people
picking up patches ad-hoc (and maintainers serving as fallbacks).

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess you'll push this yourself as the last one, for closure and all :-)

Also drm-misc commit rights will stay around for you (except if you
want to hand that in) so if you have and display/gpu patches you can
still push them through the usual flow.

Cheers, Daniel
> ---
>  MAINTAINERS |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> Index: b/MAINTAINERS
> ===================================================================
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6894,10 +6894,9 @@ F:       drivers/net/wan/dlci.c
>  F:     drivers/net/wan/sdla.c
>
>  FRAMEBUFFER LAYER
> -M:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     linux-fbdev@vger.kernel.org
> -S:     Maintained
> +S:     Orphan
>  Q:     http://patchwork.kernel.org/project/linux-fbdev/list/
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     Documentation/fb/
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
