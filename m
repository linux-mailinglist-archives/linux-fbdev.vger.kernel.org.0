Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D5F2CA14E
	for <lists+linux-fbdev@lfdr.de>; Tue,  1 Dec 2020 12:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbgLAL1t (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 1 Dec 2020 06:27:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32379 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730537AbgLAL1s (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 1 Dec 2020 06:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606821981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FmX+0EgNk69VrCAc4gBk8rq/Vqs5TSfgvcUMIDfLNnU=;
        b=CjQWD4De3eTtPiqB7uTN496MHhSbtZplBkwXKWAA0VWIX1l0z5seMA1iQLadFiNBz/Gl0K
        V0CrNEhjdbztDPHx4DAeljfxD9X5AbAtVjreCVncYBkAYf1BgFXGc0K3APZoF7anUUTMD6
        OSEYhum7PFkjYSV366UuDkN7+kC1zYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-YqU-KFLGOSeI5RJcYEyVeA-1; Tue, 01 Dec 2020 06:26:17 -0500
X-MC-Unique: YqU-KFLGOSeI5RJcYEyVeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E383C1084423;
        Tue,  1 Dec 2020 11:26:15 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BDD6519C44;
        Tue,  1 Dec 2020 11:26:15 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 0B1BQFtW003694;
        Tue, 1 Dec 2020 06:26:15 -0500
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 0B1BQFHb003683;
        Tue, 1 Dec 2020 06:26:15 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Tue, 1 Dec 2020 06:26:15 -0500 (EST)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Daniel Vetter <daniel@ffwll.ch>
cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-fbdev@vger.kernel.org, geert+renesas@glider.be,
        corbet@lwn.net, daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org,
        bernie@plugable.com, dri-devel@lists.freedesktop.org,
        sam@ravnborg.org
Subject: Re: [PATCH] fbdev: Remove udlfb driver
In-Reply-To: <20201130210629.GY401619@phenom.ffwll.local>
Message-ID: <alpine.LRH.2.02.2012010621100.1371@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201130125200.10416-1-tzimmermann@suse.de> <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com> <20201130154147.GT401619@phenom.ffwll.local> <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130210629.GY401619@phenom.ffwll.local>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



On Mon, 30 Nov 2020, Daniel Vetter wrote:

> On Mon, Nov 30, 2020 at 01:39:17PM -0500, Mikulas Patocka wrote:
> > 
> > 
> > On Mon, 30 Nov 2020, Daniel Vetter wrote:
> > 
> > > On Mon, Nov 30, 2020 at 09:31:15AM -0500, Mikulas Patocka wrote:
> > > > 
> > > > The framebuffer driver supports programs running full-screen directly on 
> > > > the framebuffer console, such as web browser "links -g", image viewer 
> > > > "fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sdl", 
> > > > movie player "mplayer -vo fbdev". The DRM driver doesn't run them.
> > > 
> > > Hm this should in general work on drm drivers. Without that it's clear the
> > > switch-over isn't really ready yet.
> > 
> > I fixed it with this patch two years ago: 
> > https://lists.freedesktop.org/archives/dri-devel/2018-June/179023.html
> > 
> > But the patch never went through and the fb_defio feature was removed in 
> > the kernel 5.6 (commit d0c4fc5a4814e431c15272935c8dc973c18073aa).
> 
> The generic fbdev emulation still has a defio implementation. We could try
> to make it more efficient maybe, but it should be all there. The module
> option disappeared since you now should always get it by default.

Yes, it's there. I've tried to run links on the current DRM UDL driver and 
it displays correctly - except, that the page list gets sometimes 
corrupted and a crash happens.

> > Without fb_defio, the only other possibility how to update the screen is 
> > the ioctl DRM_IOCTL_MODE_DIRTYFB. But this ioctl requires master mode, so 
> > user programs like "links -g" can't issue it.
> 
> Now I'm confused, I thought you wanted to use fbdev /dev/fb* nodes? Those
> should support defio. And if you want your applications to use drm
> modesetting natively, they have to be drm master anyway. You can't use the
> DIRTYFB ioctl to upload fbdev contents. So I'm a bit confused.
> -Daniel

Yes. I was confused about it too. You can't use DRM ioctls on /dev/fb.

Mikulas

