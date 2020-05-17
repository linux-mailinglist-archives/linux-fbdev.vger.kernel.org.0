Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEEA1D6D6E
	for <lists+linux-fbdev@lfdr.de>; Sun, 17 May 2020 23:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgEQVLd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 17 May 2020 17:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgEQVLd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 17 May 2020 17:11:33 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335B8C061A0C
        for <linux-fbdev@vger.kernel.org>; Sun, 17 May 2020 14:11:33 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id e10so4372194vsp.12
        for <linux-fbdev@vger.kernel.org>; Sun, 17 May 2020 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pS6rsKOx2NlgRMIkpuNZy1aWSRLDNax4OfYSZRKfBK4=;
        b=sRI2awQU1CCgH2QZGeVWlqfdWUktkqScKv3xetm+Xi3bETiLKZl/gRqnqgrANiHZ8o
         kYQeEV6tyEKSwqoBudxg21WBawsQO5Mjpe7Bv++v0FPDa/gg7dvIE8pR/Be9NqI/s/38
         o5PPzB7gGJpZZuwI03d4T8lNI0CwuTrwwrRbUx/UaTVTjeotO0VjVMjIn8P4TPhKhpN/
         unE4RY0viEJFRgLCT7DLwW+vUiKFvqVO4L6791+wgFCO2qh3z4kTr/TTWGw8tU1tfqEl
         3BxCZntyMjc+gdh5ieYUTgVMeSuIFXFhBetYhCwx2J1OtSIS3NB+Os+BnV6MMoJuNsf9
         LeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pS6rsKOx2NlgRMIkpuNZy1aWSRLDNax4OfYSZRKfBK4=;
        b=kP5LhjhG73rkylZcl3Q0W74/v97P0eIZ4/h6tGQL6nWCj+nhj4Muao/ndOJ/xBRsjC
         RcdUitZYOL92T2/EvMjIWtSLmtyPpWzvUnTkWmeLI0VXkS9RKQtgC6uwq4/xRlDp6QON
         v8s3P9WJUHOj1AtwGGyavYVulc7MsPMtnFrPUW+rsNsqUdBIY27Y4ixkXRb2cH+X5C/H
         hfnBKgCUF5ud4wRsfbZJT/x/NiVUFou5qIXnuHk1HeqJhFXkJIIbrVTuBfYmQcvHMS14
         8h6j+dLq3bNiR1YOGr9D40sBdZMCPDrCq9sWJAUvkC7lX7sT2XZE2RTpi6Yyq8jspiQx
         ed6A==
X-Gm-Message-State: AOAM530o4GFoJZgBTalJH33G0PqpskL2z0rXrKBecAy5i8YzpTGgPVbr
        rImlFQWzUqZFLeHbfkl/r0tjdXkXC7v1jQJZMgMtZ+aR
X-Google-Smtp-Source: ABdhPJxsotUSshgEqdsswCJgkh3hTeWWx0kLTasnyOGe6CvxTYAxGOIceX0CTXUHGLxmhfSj2EfI8mB4Yp99bcNUO+w=
X-Received: by 2002:a67:ecc2:: with SMTP id i2mr8496841vsp.85.1589749892414;
 Sun, 17 May 2020 14:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200513215627eucas1p1c919a6175b210c13fe7b920c455ebb62@eucas1p1.samsung.com>
 <20200513215342.2145495-1-emil.l.velikov@gmail.com> <178a203a-fc3e-0027-60c9-786c3e907407@samsung.com>
In-Reply-To: <178a203a-fc3e-0027-60c9-786c3e907407@samsung.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Sun, 17 May 2020 22:08:43 +0100
Message-ID: <CACvgo53YRogMB_Xh+=+gNLQ28beNJdhyECR0550hVqqtD0J8Bg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: annotate rivafb/nvidiafb as obsolete
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Antonino Daplas <adaplas@gmail.com>,
        linux-fbdev <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 14 May 2020 at 14:28, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:

> > diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > index 1b2f5f31fb6f..cad3e4bc5e52 100644
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@ -868,6 +868,7 @@ config FB_ATMEL
> >
> >  config FB_NVIDIA
> >       tristate "nVidia Framebuffer Support"
> > +     depends on BROKEN
>
> Please don't add new users of BROKEN config option.
>
> Either it is broken and should be removed right now (BROKEN config option
> predates git and with git nothing is ever lost), or it still works and
> should be left alone.
>
Seems like not everyone got that memo. BROKEN is still in use, with
dozen or so cases for last year.
See for example:

commit 9d60d93198c62ac3b3e59e8bba7079646c972a4c
Author: J. Bruce Fields <bfields@redhat.com>
Date:   Mon Aug 26 10:28:58 2019 -0400

    Deprecate nfsd fault injection


That said, your suggestions are pretty good. v2 coming in a moment.

-Emil
