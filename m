Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4E64C296B
	for <lists+linux-fbdev@lfdr.de>; Thu, 24 Feb 2022 11:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbiBXKad (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 24 Feb 2022 05:30:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiBXKac (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 24 Feb 2022 05:30:32 -0500
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FB728F45D
        for <linux-fbdev@vger.kernel.org>; Thu, 24 Feb 2022 02:30:00 -0800 (PST)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
        by mx2.smtp.larsendata.com (Halon) with ESMTPS
        id c30dee63-955c-11ec-b2df-0050568cd888;
        Thu, 24 Feb 2022 10:30:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sam@ravnborg.org)
        by mail01.mxhotel.dk (Postfix) with ESMTPSA id 48650194B49;
        Thu, 24 Feb 2022 11:30:02 +0100 (CET)
Date:   Thu, 24 Feb 2022 11:29:55 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        deller@gmx.de, geert@linux-m68k.org, kraxel@redhat.com,
        ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
Message-ID: <YhdeIz29aHrwXvi8@ravnborg.org>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de>
 <YhaYSeyYIwqur2hy@ravnborg.org>
 <02cd3c81-d937-eb2a-ebe1-3eb9d83f6adc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02cd3c81-d937-eb2a-ebe1-3eb9d83f6adc@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Javier,
On Thu, Feb 24, 2022 at 10:02:59AM +0100, Javier Martinez Canillas wrote:
> Hello Sam,
> 
> On 2/23/22 21:25, Sam Ravnborg wrote:
> 
> [snip]
> 
> > 
> > Question: What is cfb an abbreviation for anyway?
> > Not related to the patch - but if I have known the memory is lost..
> > 
> 
> I was curious so I dug on this. It seems CFB stands for Color Frame Buffer.
> Doing a `git grep "(CFB)"` in the linux history repo [0], I get this:
> 
>   Documentation/isdn/README.diversion:   (CFB). 
>   drivers/video/pmag-ba-fb.c: *   PMAG-BA TURBOchannel Color Frame Buffer (CFB) card support,
>   include/video/pmag-ba-fb.h: *   TURBOchannel PMAG-BA Color Frame Buffer (CFB) card support,
> 
> Probably the helpers are called like this because they were for any fbdev
> driver but assumed that the framebuffer was always in I/O memory. Later some
> drivers were allocating the framebuffer in system memory and still using the
> helpers, that were using I/O memory accessors and it's ilegal on some arches.
> 
> So the sys_* variants where introduced by commit 68648ed1f58d ("fbdev: add
> drawing functions for framebuffers in system RAM") to fix this. The old
> ones just kept their name, but probably it should had been renamed to io_*
> for the naming to be consistent with the sys_* functions.
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

Interesting - thanks for the history lesson and thanks for taking your
time to share your findings too.

	Sam
