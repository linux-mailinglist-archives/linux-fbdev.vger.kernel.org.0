Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 663BC50D37
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2019 16:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfFXOD1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jun 2019 10:03:27 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37189 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfFXOD1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jun 2019 10:03:27 -0400
Received: by mail-ed1-f68.google.com with SMTP id w13so21998362eds.4
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jun 2019 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ITIVfyYdGLQXsQvACad1IFSWadYciq4Nhq18ht4mzp8=;
        b=GVbX59gh6iy7o+C5nPPlIE/LbjCrsbO20/xPgdgUid3EX3iVB1ATYvod6UXq5IdYjl
         xFkozHJPQrl8no4swm5Og7ZhVw+sKYJz76lYX582qJSoLLlxW4pIpSDmAw62XHLUPc/o
         Bt5HsEgErqrC+PJu1Xps6eK4obRHOB3SR8y0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ITIVfyYdGLQXsQvACad1IFSWadYciq4Nhq18ht4mzp8=;
        b=fnQAo9K4sB50Nwy7g9q4Ztv+uc5Wk/tOSa3/bBYo0Una1Z+Otd5ZhoB09VdieZ7lOn
         4TPSgecX3ljWqCpCHeFOLdFNWPDvK8p5wQIUZB4iQE0mmh8k91MrybXDUanwg7Xu6cuO
         fFfNdnq9+GTZA6nTKNP8L2aS7HUh0kRG7cdz3g5mLAZkDfDIwnvcidiawUIu2nzjURIg
         qU9bDuGW0FOhG6sQHiGk9d0HwhOExZAFqH9CtbO3yhBkCQDwSDxSI2/GkQXW7snHrN4+
         04whP4b/h3W8s2t+1hG4oZxP1VOlVRIapSESO9o2NuZ0vMCtzayMC4ss9T2DukjNwfXJ
         oBuQ==
X-Gm-Message-State: APjAAAV4fttqgwFrbN8hEqWDNX+FMR/v1PgRaWP0oemUO84B+pdYgBFJ
        FcKu4TTAfWQ8PCbvZFwvZrWxeg==
X-Google-Smtp-Source: APXvYqzxnL+Xl5reAeH+rUJdFFyoVEW/siq8vuMybwR21YiIOsAWJv2ACm362HpRylywlELzH96R8A==
X-Received: by 2002:a50:86dc:: with SMTP id 28mr137404229edu.132.1561385005419;
        Mon, 24 Jun 2019 07:03:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id d44sm3824802eda.75.2019.06.24.07.03.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 07:03:24 -0700 (PDT)
Date:   Mon, 24 Jun 2019 16:03:21 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>, linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
Message-ID: <20190624140321.GP12905@phenom.ffwll.local>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
 <8cb8c728-3ace-04e0-f6d5-215ffd7879c9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cb8c728-3ace-04e0-f6d5-215ffd7879c9@linux.intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jun 24, 2019 at 03:07:26PM +0200, Maarten Lankhorst wrote:
> Op 24-06-2019 om 11:21 schreef Daniel Vetter:
> > Fixes linking fail when fbcon/fbdev is modular and vgaswitcheroo is
> > enabled:
> >
> > x86_64-linux-gnu-ld: drivers/gpu/vga/vga_switcheroo.o: in function `vga_switchto_stage2':
> > vga_switcheroo.c:(.text+0x997): undefined reference to `fbcon_remap_all'
> >
> > v2: I first tried to fix this with an EXPORT_SYMBOL, but vga_switcheroo is
> > never a module, so this doesn't work.
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Fixes: 1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Cc: Lukas Wunner <lukas@wunner.de>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Yisheng Xie <ysxie@foxmail.com>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > --
> > wrt merging probably best if Maarten adds this to the topic branch we
> > have already and sends out an updated pull request.
> >
> > Apologies for the mess.
> > -Daniel
> > ---
> >  drivers/gpu/vga/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
> > index 84ab482d0db6..c8c770b05ed9 100644
> > --- a/drivers/gpu/vga/Kconfig
> > +++ b/drivers/gpu/vga/Kconfig
> > @@ -23,6 +23,7 @@ config VGA_SWITCHEROO
> >  	depends on X86
> >  	depends on ACPI
> >  	depends on PCI
> > +	depends on (FRAMEBUFFER_CONSOLE=n || FB=y)
> >  	select VGA_ARB
> >  	help
> >  	  Many laptops released in 2008/9/10 have two GPUs with a multiplexer
> 
> In a default allmodconfig we disable vgaswitcheroo then. Not sure it's an issue. Just worth noting. :)

If you haven't applied yet, might be good to add that note to the commit
message when you merge.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
