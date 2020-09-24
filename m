Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B12277AD3
	for <lists+linux-fbdev@lfdr.de>; Thu, 24 Sep 2020 22:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgIXUyl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 24 Sep 2020 16:54:41 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:57194 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIXUyk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 24 Sep 2020 16:54:40 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 6B97720079;
        Thu, 24 Sep 2020 22:54:37 +0200 (CEST)
Date:   Thu, 24 Sep 2020 22:54:36 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "David S . Miller" <davem@davemloft.net>, hch@lst.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
Message-ID: <20200924205436.GP1223313@ravnborg.org>
References: <20200918100812.1447443-1-arnd@arndb.de>
 <20200918124808.GD438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918124808.GD438822@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=25-AhOLfAAAA:8
        a=ocQuWhCnBm-ropBlqfgA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
        a=dnuY3_Gu-P7Vi9ynLKQe:22
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Daniel/Arnd.

On Fri, Sep 18, 2020 at 02:48:08PM +0200, Daniel Vetter wrote:
> On Fri, Sep 18, 2020 at 12:08:10PM +0200, Arnd Bergmann wrote:
> > The fbdev code uses compat_alloc_user_space in a few of its
> > compat_ioctl handlers, which tends to be a bit more complicated
> > and error-prone than calling the underlying handlers directly,
> > so I would like to remove it completely.
> > 
> > This modifies two such functions in fbdev, and removes another
> > one that is completely unused.
> > 
> >     Arnd
> > 
> > Arnd Bergmann (3):
> >   fbdev: simplify fb_getput_cmap()
> >   fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
> >   fbdev: sbuslib: remove compat_alloc_user_space usage
> 
> Looks all good, but we're also kinda looking for a new volunteer for
> handling fbdev patches ... drm-misc commit rights, still not interested?

Hi Daniel - I read the above as an a-b. And Arnd did not take the bait
it seems.

Hi Arnd. checkpatch complained about some whitespace, which I fixed
while applying.
Will push to drm-misc-next tomorrow unless I hear anything else.

	Sam


> -Daniel
> 
> > 
> >  drivers/video/fbdev/core/fbmem.c |  44 +++++------
> >  drivers/video/fbdev/sbuslib.c    | 124 ++++++++++++++++++-------------
> >  2 files changed, 90 insertions(+), 78 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
