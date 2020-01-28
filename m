Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD52314BE33
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Jan 2020 17:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgA1Q6k (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 Jan 2020 11:58:40 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35230 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgA1Q6k (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 Jan 2020 11:58:40 -0500
Received: by mail-oi1-f193.google.com with SMTP id b18so7041554oie.2
        for <linux-fbdev@vger.kernel.org>; Tue, 28 Jan 2020 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e6w0EQ8/BmrrZNaMjPQWOsM/wKn1DMIr1Vo+PTNNOYc=;
        b=RfxdQ+Uj2+lY9zUj2aBem67fQ1xytIgAIWkEf7AMH7H7rLMI7PcIzzY664j9JLZNbk
         idXD654T5isweS38a8KvuLIcEoEwjjRjoT5Rio8LE6cNZx4UKS+zCMnrumiq/Knt8+0U
         PBwvanyFSMyPveqlJE8YscVurLTENsoXNgDm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e6w0EQ8/BmrrZNaMjPQWOsM/wKn1DMIr1Vo+PTNNOYc=;
        b=UhC5d978wJsBo+eW+Ax4M/u/KtGh3i2NgYYWAcbISKpLIJy3bRH5vXqJx12lc2QDOv
         CCv/APnM3sH6PsKsEXyu1rmTtpguFRMkHWjlvqObEdT6U0VEgozmk8wRuLO9wE3AvOh9
         WZbVkHaip29BBeAWhQQZi4EfCizB2+VSfvhlYkztQp5Tgj2t4kdrEkfisofj1U70zbwc
         uqfsHx0jiFy7IZHEubSrA49wniecOkqED0fR7Mk7PbMC93B242yMKr+TPdnAXADL6lax
         rcLoLQ1kZK0cE9LIodf+0mgLiOmFmcPU0MALQJ+xXX9KlqReHtrkhK3a0494/w6oJ630
         7uPA==
X-Gm-Message-State: APjAAAWrXcipBtIaNQgwyje2d4zZICYy5L7b0b+OIni6p3kbJMmKJHG4
        w5WoYKwXeba2DCo5qd8eqbW4dTEQh7yTGipur03/8w==
X-Google-Smtp-Source: APXvYqy3mtHOBb80OIqD/M3tlAyz/2m6WX7Mn9G48YBkQT5FIMSzAceGDv6WICwLI4B0LCIXhD1OqVGW/EV5kz340xs=
X-Received: by 2002:aca:af09:: with SMTP id y9mr3276351oie.101.1580230719598;
 Tue, 28 Jan 2020 08:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20200120100014.23488-1-kraxel@redhat.com> <CAKMK7uGMTLoyMnfLmx3r9+qf6sMXcrKT_EgO78f=Gw0Oi51kWQ@mail.gmail.com>
 <CAKMK7uFgGQdd1V3-ux6dGhUXFNvsFJvCiA8eNW9RK=nNdsK3OA@mail.gmail.com>
In-Reply-To: <CAKMK7uFgGQdd1V3-ux6dGhUXFNvsFJvCiA8eNW9RK=nNdsK3OA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 28 Jan 2020 17:58:28 +0100
Message-ID: <CAKMK7uHBgnn3Pa9dx75DWugqi4nZ4QVTGfaDV86TdQjE2ukFQg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: wait for references go away
To:     Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        marmarek@invisiblethingslab.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jan 28, 2020 at 5:44 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jan 28, 2020 at 5:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jan 20, 2020 at 11:00 AM Gerd Hoffmann <kraxel@redhat.com> wrot=
e:
> > >
> > > Problem: do_unregister_framebuffer() might return before the device i=
s
> > > fully cleaned up, due to userspace having a file handle for /dev/fb0
> > > open.  Which can result in drm driver not being able to grab resource=
s
> > > (and fail initialization) because the firmware framebuffer still hold=
s
> > > them.  Reportedly plymouth can trigger this.
> > >
> > > Fix this by trying to wait until all references are gone.  Don't wait
> > > forever though given that userspace might keep the file handle open.
> > >
> > > Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >
> > (Missed this because lca, so a bit late)
> >
> > This isn't really how driver unload is supposed to happen. Instead:
> >
> > - Driver unload starts
> > - Driver calls the foo_unregister function, which stops new userspace
> > from getting at the driver. If you're subsystem is good (i.e. drm
> > since Noralf fixed it) this will also sufficiently synchronize with
> > any pending ioctl.
> > - Important: This does _not_ wait until userspace closes all
> > references. You can't force that.
> > - Driver releases all hw structures and mappings and everything else.
> > With fbdev this is currently not fully race free because no one is
> > synchronizing with userspace everywhere correctly.
> >
> > ... much time can pass ...
> >
> > - Userspace releases the last references, which triggers the final
> > destroy stuff and which releases the memory occupied by various
> > structures still (but not anything releated to hw or anything else
> > really).
> >
> > So there's two bits:
> >
> > 1. Synchronizing with pending ioctls. This is mostly there already
> > with lock_fb_info/unlock_fb_info. From a quick look the missing bit
> > seems to be that the unregister code is not taking that lock, and so
> > not sufficiently synchronizing against concurrent ioctl calls and
> > other stuff. Plus would need to audit all entry points.
>
> Correction: The check here is file_fb_info(), which checks for
> unregister. Except it's totally racy and misses the end marker (unlike
> drm_dev_enter/exit in drm). So bunch of work to do here too. The
> lock_fb_info is purely locking, not lifetime (and I think in a bunch
> of places way too late).

Oh and since your patch is full of races too I expect you'll be able
to get away with just adding the ->fb_remove hook, fix up drivers, and
leave fixing the various races to someone else.
-Daniel

>
> > 1a. fbcon works differently. Don't look too closely, but this is also
> > not the problem your facing here.
> >
> > 2. Refcounting of the fb structure and hw teardown. That's what's
> > tracked in fb_info->count. Most likely the fbdev driver you have has a
> > wrong split between the hw teardown code and what's in fb_destroy. If
> > you have any hw cleanup code in fb_destroy that driver is buggy. efifb
> > is very buggy in that area :-) Same for offb, simplefb, vesafb and
> > vesa16fb.
> >
> > We might need a new fb_unregister callback for these drivers to be
> > able to fix this properly. Because the unregister comes from the fbdev
> > core, and not the driver as usual, so the usual driver unload sequence
> > doesnt work:
> >
> > drm_dev_unregister();
> > ... release all hw resource ...
> >
> > drm_dev_put();
> >
> > Or in terms of fbdev:
> >
> > unregister_framebuffer(info);
> > ... release all hw resources ... <- everyone gets this wrong
> > framebuffer_release(info); <- also wrong because not refcounted,
> > hooray, this should be moved to to end of the ->fb_destroy callback
> >
> > So we need a callback to put the "release all hw resources" step into
> > the flow at the right place. Another option (slightly less midlayer)
> > would be to add a fb_takeover hook, for these platforms drivers, which
> > would then do the above sequence (like at driver unload).
> >
> > Also adding Noralf, since he's fixed up all the drm stuff in this area
> > in the past.
> >
> > Cheers, Daniel
> >
> > > ---
> > >  drivers/video/fbdev/core/fbmem.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/c=
ore/fbmem.c
> > > index d04554959ea7..2ea8ac05b065 100644
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -35,6 +35,7 @@
> > >  #include <linux/fbcon.h>
> > >  #include <linux/mem_encrypt.h>
> > >  #include <linux/pci.h>
> > > +#include <linux/delay.h>
> > >
> > >  #include <asm/fb.h>
> > >
> > > @@ -1707,6 +1708,8 @@ static void unlink_framebuffer(struct fb_info *=
fb_info)
> > >
> > >  static void do_unregister_framebuffer(struct fb_info *fb_info)
> > >  {
> > > +       int limit =3D 100;
> > > +
> > >         unlink_framebuffer(fb_info);
> > >         if (fb_info->pixmap.addr &&
> > >             (fb_info->pixmap.flags & FB_PIXMAP_DEFAULT))
> > > @@ -1726,6 +1729,10 @@ static void do_unregister_framebuffer(struct f=
b_info *fb_info)
> > >         fbcon_fb_unregistered(fb_info);
> > >         console_unlock();
> > >
> > > +       /* try wait until all references are gone */
> > > +       while (atomic_read(&fb_info->count) > 1 && --limit > 0)
> > > +               msleep(10);
> > > +
> > >         /* this may free fb info */
> > >         put_fb_info(fb_info);
> > >  }
> > > --
> > > 2.18.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
