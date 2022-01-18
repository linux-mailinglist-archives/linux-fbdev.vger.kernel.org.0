Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A703492894
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jan 2022 15:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240056AbiAROjU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jan 2022 09:39:20 -0500
Received: from mail-4022.proton.ch ([185.70.40.22]:61534 "EHLO
        mail-4022.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235722AbiAROjU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jan 2022 09:39:20 -0500
Date:   Tue, 18 Jan 2022 14:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1642516758;
        bh=pTGiM9Eqjwi0l/eloFZx82RA/+Eanez+YibOS4Y8RVY=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=qcKe/r6MWaQtqzD8hRMIUaR4NRtuHsQ2KoIqWAN2uDXjtROUcntz425JzbReKzcmV
         jcF4hrzH/xOqw6/0KSdh79fqWlolg+vUvLR0iW3QNc5L6OzeWlplPLyuinyFVtwXHN
         qN6wypuk36g/5RAqXqIQDC+CDOkpLDS6uMSDl5qJD+UqSx8VLiy5Ehc8/Vq8r//LNq
         M1H9Fy7UoavHbclldC6ubpFO7LH0PfRvGxAFCyAvLiQeAO+7uM7VS1vSCevuHFxiTF
         HcUHjWsZ6tATuEVvW46ZgiZbrJhrtvo7r+eCMCqrzStt21c874lg+V2Df34dE/CdHw
         MYJpS8FljcDCA==
To:     Thomas Zimmermann <tzimmermann@suse.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Helge Deller <deller@gmx.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Sven Schnelle <svens@stackframe.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <vUIPai73T-nuC9ppTs9iaxFwCLWyB3ip7A3zfbhJTyYBqlqJLbOU217hKMAjZNrSnSdeKJa_3cnsr3S7vsK1QuxH22ESAGN-iZXF0DigALU=@emersion.fr>
In-Reply-To: <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
References: <YeG8ydoJNWWkGrTb@ls3530> <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de> <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com> <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de> <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com> <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de> <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org> <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com> <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tuesday, January 18th, 2022 at 15:23, Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:

> Am 18.01.22 um 09:10 schrieb Geert Uytterhoeven:
> > Hi Gerd,
> >
> > On Tue, Jan 18, 2022 at 7:30 AM Gerd Hoffmann <kraxel@redhat.com> wrote=
:
> >> Also note that using a shadow framebuffer allows to decouple fbcon
> >> updates and scanout framebuffer updates.  Can be used to speed up
> >> things without depending on the 2d blitter.
> >
> > Assuming accesses to the shadow frame buffer are faster than accesses
> > to the scanout frame buffer. While this is true on modern hardware,
> > this is not the case on all hardware.  Especially if the shadow frame
> > buffer has a higher depth (XRGB8888) than the scanout frame buffer
> > (e.g. Cn)...
> >
> > The funny thing is that the systems we are interested in, once used
> > to be known for their graphics capabilities and/or performance...
>
> What I still don't understand: why are you so keen on maintaining an
> interface that only serves the console? Nothing else uses fbdev these
> days. Why not improve DRM/userspace to the point where it fits your
> requirements? Long-term, the latter would make a lot more sense.

+1

If you need any help with adapting user-space, feel free to ping me. I'd be
interested in discussing, providing feedback and potentially user-space
patches.
