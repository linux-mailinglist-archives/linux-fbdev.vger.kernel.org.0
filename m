Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D3E23E78
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 May 2019 19:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390133AbfETRZk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 May 2019 13:25:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46276 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388639AbfETRZk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 May 2019 13:25:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id j49so13671673otc.13
        for <linux-fbdev@vger.kernel.org>; Mon, 20 May 2019 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p+IGewVPK/3sUNtWjN0J1v9qG0o9ZctDOQFJRjZs3v4=;
        b=MxkyDNPTF+GcBwtvga785KdKzkeJok9neVtLb0YWhEJFqdZvQ3jCn1KUbxAtA/EC7e
         ikhd2kpZAoHjIzLMMH9EWQ3PMGbYb4S8mIo2pyOdOdW338UMv3Ze/uuBHSwaQNk49O6k
         CaXpO9mH/y6qSHuYZ+HZtmDe2Tw/P5rQssSV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p+IGewVPK/3sUNtWjN0J1v9qG0o9ZctDOQFJRjZs3v4=;
        b=fIg2ZrKwjQz4w1FhmTnng95Ef5YniSVHm+qODOHNRBwVFMqP1N57n0GcdF1itUieEb
         JTBPSI6t82kueQ2H/mb0AXZAsekcLtnJ9scwjTQb+uN/KBfo/MpJcBMXqBp7wQw1XO3V
         12Vs0D6Lck/2DSwuCEj0JibiPWXYrzNvFV+6/N3eocbBA60Fz3752LqyNG6EuLLiJN1K
         kMqedIKU4xR5ESRJ6gMpI4A1QiYMbpTmGtXX02a7dMkg1sbHcYCiFH4VUy+ZQpsDNNRw
         G3ncdoWrGvBDs8U5G46Brcdj27lq3H00CvtiDyWiLepe4n8HktWngwj1/+MKFl97qNKc
         j3+Q==
X-Gm-Message-State: APjAAAXb0jfjx2KI1+3bSu+yPLr/5NfuBR0BrawUC4uiWaUNe4hkh/XI
        WVSK6ilPUxUOopv044F735p0gb3tPC7H+i870XyCOw==
X-Google-Smtp-Source: APXvYqzVxIgdQlO/YdvYOV5mGXBZTR4aGXDhff4jSmBlpuQLUW6acY4OVOfHwYJiTVqpqlqr4sTv4zfSpLMjUvn/RH0=
X-Received: by 2002:a9d:7414:: with SMTP id n20mr18557548otk.106.1558373139972;
 Mon, 20 May 2019 10:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-11-daniel.vetter@ffwll.ch> <20190520170820.GA27230@ravnborg.org>
In-Reply-To: <20190520170820.GA27230@ravnborg.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 20 May 2019 19:25:28 +0200
Message-ID: <CAKMK7uHQo83UZmkV=gd3hHCMpusSdK_6O_UQnnHdSm+kLMgmmA@mail.gmail.com>
Subject: Re: [PATCH 10/33] fbcon: call fbcon_fb_(un)registered directly
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Yisheng Xie <ysxie@foxmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, May 20, 2019 at 7:08 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel.
>
> While browsing this nice patch series I stumbled upon a detail.
>
> On Mon, May 20, 2019 at 10:21:53AM +0200, Daniel Vetter wrote:
> > With
> >
> > commit 6104c37094e729f3d4ce65797002112735d49cd1
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date:   Tue Aug 1 17:32:07 2017 +0200
> >
> >     fbcon: Make fbcon a built-time depency for fbdev
> >
> > we have a static dependency between fbcon and fbdev, and we can
> > replace the indirection through the notifier chain with a function
> > call.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> > Cc: Yisheng Xie <ysxie@foxmail.com>
> > Cc: Peter Rosin <peda@axentia.se>
> > Cc: "Micha=C5=82 Miros=C5=82aw" <mirq-linux@rere.qmqm.pl>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: linux-fbdev@vger.kernel.org
> > ---
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index f52ef0ad6781..701abaf79c87 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -136,10 +136,6 @@ struct fb_cursor_user {
> >  #define FB_EVENT_RESUME                      0x03
> >  /*      An entry from the modelist was removed */
> >  #define FB_EVENT_MODE_DELETE            0x04
> > -/*      A driver registered itself */
> > -#define FB_EVENT_FB_REGISTERED          0x05
> > -/*      A driver unregistered itself */
> > -#define FB_EVENT_FB_UNREGISTERED        0x06
> >  /*      CONSOLE-SPECIFIC: get console to framebuffer mapping */
> >  #define FB_EVENT_GET_CONSOLE_MAP        0x07
> >  /*      CONSOLE-SPECIFIC: set console to framebuffer mapping */
>
> This breaks build of arch/arm/mach-pxa/am200epd.c thats uses
> FB_EVENT_FB_*REGISTERED:
>
>
>        if (event =3D=3D FB_EVENT_FB_REGISTERED)
>                 return am200_share_video_mem(info);
>         else if (event =3D=3D FB_EVENT_FB_UNREGISTERED)
>                 return am200_unshare_video_mem(info);
>
>
> Found while grepping for "FB_EVENT" so this is not a build
> error I triggered.

Oh this is glorious :-/

Thanks a lot for spotting this, I guess I need to hack around on
metronomefb a bit ...
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
