Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210A94983E4
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jan 2022 16:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238567AbiAXP6Y (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jan 2022 10:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbiAXP6Y (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jan 2022 10:58:24 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250FBC06173B
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jan 2022 07:58:24 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id n10so41788414edv.2
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jan 2022 07:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=4nWlje6hEWftLkmYh7UZghhd768mUQlCbDsNDXVtRqI=;
        b=J5y+pelekVRPrBjgpqHY48R3nd2xvpjQHruu5xm059Q4IG+KseEGv+JCWZC4DdyyQZ
         LOMCsaxnv/q3tb2Zkae3NmRqJATgzdqG+TVPOwyIbaWHDpQaBOeVjW5CAGIbzq7b8gz3
         ZtVZduChtO5k5JI2uY2dRDw3hqg5u/uERchW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=4nWlje6hEWftLkmYh7UZghhd768mUQlCbDsNDXVtRqI=;
        b=cta12pWrEyOz852R48QQlYKo7s7cO8V9FwJF3CjYWz80sjUi4TcdhuIzhf651VszZN
         vfJMuxvc0j0+PrJgs52SVtH687H4dbK7pf2a3KbMbyVGXDcVAotMCSn9cvjjkNoKcnP3
         UpzMLZTFopgzey/PfG/MyQ7X5tgL3cxHBfYVTtTj05nFJSkPIkw/xN6kvYPqgo9Mcfn2
         SMYTTE2J8PO4CBhdCE8b9CA+rPgYuYUpP2EjrR2uk9H3IVbXvYcnr/Y/MQ/NVwmJsX8x
         QFsA1eG9nV8J9wMHO/szglQa9cEJ0KL7fiikcdi9HE7gNlgud5yHB6FUevb11Mtaa2yM
         11lQ==
X-Gm-Message-State: AOAM531Fr8KskBrnoqER5Gl8pwV+CJyRSSSEZ+aKJlmASiM0mVzy0IRj
        4Jp5wySq3OSNGm09UDBFk1X6DA==
X-Google-Smtp-Source: ABdhPJxBcAp+wHHeVIPr1OYBq3V8XRus1POAoPs7MtC4E082B+GMR3KGFFoUO4WrJ2lRKdlRLfAa3w==
X-Received: by 2002:a05:6402:1764:: with SMTP id da4mr16458148edb.189.1643039902624;
        Mon, 24 Jan 2022 07:58:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h20sm6452616eds.9.2022.01.24.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 07:58:22 -0800 (PST)
Date:   Mon, 24 Jan 2022 16:58:20 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Helge Deller <deller@gmx.de>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Gerd Hoffmann <kraxel@redhat.com>, linux-fbdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sven Schnelle <svens@stackframe.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Claudio Suarez <cssk@net-c.es>, Pavel Machek <pavel@ucw.cz>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Message-ID: <Ye7MnI7v7hK5GXQW@phenom.ffwll.local>
Mail-Followup-To: Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Gerd Hoffmann <kraxel@redhat.com>, linux-fbdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sven Schnelle <svens@stackframe.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Claudio Suarez <cssk@net-c.es>, Pavel Machek <pavel@ucw.cz>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
 <2fc200bb-4b40-7833-31c9-90a78512b601@redhat.com>
 <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jan 24, 2022 at 04:29:34PM +0100, Helge Deller wrote:
> On 1/24/22 12:50, Javier Martinez Canillas wrote:
> > On 1/24/22 12:33, Thomas Zimmermann wrote:
> >
> > [snip]
> >
> >>> Thoughts?
> >>
> >> I can't say I approve keeping fbdev alive, but...
> >>
> >> With fbdev emulation, every DRM driver is an fbdev driver too. So
> >> CONFIG_FB_DRIVER is somewhat misleading. Better add an option like
> >> CONFIG_FBCON_HW_SCROLLING and have it selected by the fbdev drivers that
> >> absolutely need HW acceleration. That option would then protect the rsp
> >> code.
> 
> I'm not a fan of something like CONFIG_FBCON_HW_SCROLLING, but I'm not
> against it either.
> For me it sounds that this is not the real direction you want to go,
> which is to prevent that any other drivers take the framebuffer before
> you take it with simpledrm or similiar.
> CONFIG_FBCON_HW_SCROLLING IMHO just disables the (from your POV) neglectable accleration part.
> With an option like CONFIG_FB_DRIVER (maybe better: CONFIG_FB_LEGACY_DRIVERS)
> it's an easy option for distros to disable all of the legacy drivers
> from being built & shipped.
> 
> Instead of CONFIG_FBCON_HW_SCROLLING we could also choose
> CONFIG_FBCON_LEGACY_ACCELERATION, because it includes fillrect() as well...

+1 on that name, since on the lwn discussions I've also seen some noise
about resurrecting scrollback. And I guess we could do that too and then
just add it all behind that same option.
-Daniel

> > Agreed that this option would be better and allow distros
> > to disable the code that was reverted.
> 
> Yes, but IMHO it doesn't hurt either to leave it in.
> It doesn't break anything at least.
> Anyway...
> 
> Helge

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
