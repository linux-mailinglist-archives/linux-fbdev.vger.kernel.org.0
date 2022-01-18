Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046A0492262
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jan 2022 10:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345480AbiARJQg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jan 2022 04:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25293 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240550AbiARJQd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jan 2022 04:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642497393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7pHlcaTRiriHEO8haif3+Ixs0hQTPZKTCLrheKgj/Tw=;
        b=WFh/71k3qrrXpeB2j1IBldbjGIqcofPFpvOOpY7yUm+2u2N87+4PJxyu6Mfuo7d8aCyT6F
        N6QqFoFOPXr9S4pkFJ/Y70SBcvFIcHpVUpuWQs4CNvVeJfygbt34JC0k20oUbS2v5qmiMR
        CS4iVkhqIbkd1ZjxHoyLVc7k2fbWsek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-jWJRqNihNV-Jt4u4Ix0mnQ-1; Tue, 18 Jan 2022 04:16:27 -0500
X-MC-Unique: jWJRqNihNV-Jt4u4Ix0mnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD3E10151E0;
        Tue, 18 Jan 2022 09:16:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B71D84BC48;
        Tue, 18 Jan 2022 09:16:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id D309318000A6; Tue, 18 Jan 2022 10:16:15 +0100 (CET)
Date:   Tue, 18 Jan 2022 10:16:15 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Helge Deller <deller@gmx.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220118091615.3ih5n7vhd6tgmnku@sirius.home.kraxel.org>
References: <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <ebe9c076-e2a9-0cb7-eb6a-ae71c075975e@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebe9c076-e2a9-0cb7-eb6a-ae71c075975e@gmx.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Jan 18, 2022 at 09:20:43AM +0100, Helge Deller wrote:
> On 1/18/22 07:29, Gerd Hoffmann wrote:
> >> Please correct me if I'm wrong, but text-console emulation/scrolling on DRM is
> >> currently unaccelerated and bound to Truecolour modes only,
> >
> > Yes.  Adding support for formats beside argb8888 to the drm fbcon
> > emulation shouldn't be that much of a problem though.
> 
> Really? Assuming a graphic card which runs with only 256 colors framebuffer
> is easily supported by DRM, and you can use fbcon without using lots of memcpy()?

Driver: programming a fixed color cube palette, then use RGB332.

fbcon/fbdev emulation: RGB332 support must be added I think.  But both
argb888 and rgb565 are supported today, so it should not be hard to find
the places where you have to add some code to handle RGB332 too.

> > Acceleration is harder.  The scroll acceleration had issues nobody
> > addressed for years, and on modern hardware it is simply not used, which
> > is probably the reason nobody stepped up fixing things and it ended up
> > being dropped.
> 
> The DRM layer doesn't use scroll acceleration.
> More than 30 other existing fbdev drivers use it.

Yes.  The world shifted from 2d acceleration to 3d acceleration.  Modern
hardware simply has no classic blitter any more.  Which is a problem
when it comes to keeping scroll acceleration alive, it is already a very
niche use case and it will only become worse ...

> > Bringing it back is much more work than just reverting the commits removing it.
> 
> Reverting those commits have no effect on DRM's usage of fbcon.
> But reverting those commits bring back scroll acceleration for all others.
> I'm trying to find out which patches did apparently fixed such issues
> for the REDRAW case. If you have a pointer it would be helpful.

IIRC the code had a bunch of races and syzkaller flagged problems.
I didn't follow very closely though.

take care,
  Gerd

