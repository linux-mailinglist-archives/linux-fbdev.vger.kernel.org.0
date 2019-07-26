Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2AF76EA0
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 18:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfGZQJ6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 12:09:58 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:44626 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfGZQJ6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 12:09:58 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id ED4A0805B4;
        Fri, 26 Jul 2019 18:09:54 +0200 (CEST)
Date:   Fri, 26 Jul 2019 18:09:53 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190726160953.GA25708@ravnborg.org>
References: <20190725143224.GB31803@ravnborg.org>
 <20190725143934.GH15868@phenom.ffwll.local>
 <20190725150629.GN23883@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190725150629.GN23883@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8
        a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=QyXUC8HyAAAA:8
        a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=czWnBFgr41Ue61ZtJ1UA:9
        a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
        a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Lee.

On Thu, Jul 25, 2019 at 04:06:29PM +0100, Lee Jones wrote:
> On Thu, 25 Jul 2019, Daniel Vetter wrote:
> 
> > On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> > > There was no users left - so drop the code to support EARLY_FB_BLANK.
> > > This patch removes the support in backlight,
> > > and drop the notifier in fbmem.
> > > 
> > > That EARLY_FB_BLANK is not used can be verified that no driver set any of:
> > > 
> > >     lcd_ops.early_set_power()
> > >     lcd_ops.r_early_set_power()
> > > 
> > > Noticed while browsing backlight code for other reasons.
> > 
> > Ah I didn't grep hard enough, I didn't realize that no one sets the
> > lcd_ops->(r_)early_set_power hooks. Nice find!
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
> > > Cc: Peter Rosin <peda@axentia.se>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-fbdev@vger.kernel.org
> > > ---
> > > 
> > > Build tested with various architectures, configs.
> > > 
> > > Lee, Daniel - OK to commit to drm-misc-next where fbdev stuff is
> > > maintained today?
> > 
> > backlight is separate from fbdev in Lee's own tree, not in drm-misc. I
> > think at least.
> 
> That's correct.  We'll sort that once we have all the Acks.

We have acks all around now.
OK that I commit this to drm-misc-next?

This is where we maintain fbdev these days. Or you could apply it to
your backlight tree.

Both solutins would be fine as the risk of introducing merge conflicts
in these code paths are minimal.

	Sam
