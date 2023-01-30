Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D466807E0
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Jan 2023 09:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjA3Iwr (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Jan 2023 03:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbjA3Iwq (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Jan 2023 03:52:46 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DD3182;
        Mon, 30 Jan 2023 00:52:45 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C917B219A1;
        Mon, 30 Jan 2023 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1675068763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gtERE7s48p1BfGEWy7TorFnIVgEGUjG2LCDHyNZ2AiY=;
        b=PvdSQ9mC8jgSoT/MZO+0cNZHSLPMWG802vzSy9OdYlXqD+wyWYqLBaVw7Phs2YuXGxcWwW
        7bNOofiNdyPdX6eIr7AbWUBBZQHUEBEummS1Nv2XleZF8aNwkfJACAf1xrDJRPwteQljaX
        CgXxYcX2PVgC2qtEtAdAeg6xjQvdXDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1675068763;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gtERE7s48p1BfGEWy7TorFnIVgEGUjG2LCDHyNZ2AiY=;
        b=ijMuV7opWzVH8xa2skOEsBcOxykrBu1m+my55uWqChA7mXcKxO9j+vVbPX0FTqSaxYJQZn
        J+V2uEnV/Uab+BCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5FCD13A06;
        Mon, 30 Jan 2023 08:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ZM6yJ1uF12MGWgAAMHmgww
        (envelope-from <tiwai@suse.de>); Mon, 30 Jan 2023 08:52:43 +0000
Date:   Mon, 30 Jan 2023 09:52:43 +0100
Message-ID: <87y1pkqu90.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Patrik Jakobsson <pjakobsson@suse.de>
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred I/O devices
In-Reply-To: <2a5b5059-9f60-a5bc-cbb7-8267349b2eac@suse.de>
References: <20230129082856.22113-1-tiwai@suse.de>
        <2a5b5059-9f60-a5bc-cbb7-8267349b2eac@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 30 Jan 2023 09:28:36 +0100,
Thomas Zimmermann wrote:
> 
> Hi
> 
> Am 29.01.23 um 09:28 schrieb Takashi Iwai:
> > When a fbdev with deferred I/O is once opened and closed, the dirty
> > pages still remain queued in the pageref list, and eventually later
> > those may be processed in the delayed work.  This may lead to a
> > corruption of pages, hitting an Oops.
> 
> Do you have more information on this problem?

The details are in SUSE bugzilla, but that's an internal bug entry
(and you know the number :)  It happens at the following at least:

- A VM is started with VGA console, no fb, on the installer
- VM is switched to bochs drm
- Start fbiterm on VT1, switching to the graphics mode on VT
- Exit fbiterm, going back to the text mode on VT;
  at this moment, it gets Oops like:

[   42.338319][  T122] BUG: unable to handle page fault for address:
ffffe570c1000030
[   42.340063][  T122] #PF: supervisor read access in kernel mode
[   42.340519][  T122] #PF: error_code(0x0000) - not-present page
[   42.340979][  T122] PGD 34c38067 P4D 34c38067 PUD 34c37067 PMD 0 
[   42.341456][  T122] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   42.341853][  T122] CPU: 1 PID: 122 Comm: kworker/1:2 Not tainted
5.14.21-150500.5.g2ad24ee-default #1 SLE15-SP5 (unreleased)
b7a28d028376a517e888a7ff28c5e5dede93267c
[   42.343000][  T122] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
[   42.343929][  T122] Workqueue: events fb_deferred_io_work
[   42.344355][  T122] RIP: 0010:page_mapped+0x5e/0x90
[   42.344743][  T122] Code: a8 01 75 d7 8b 47 30 f7 d0 c1 e8 1f c3 cc cc cc cc
48 89 df e8 33 9c 05 00 89 c1 31 c0 85 c9 74 13 eb d3 48 c1 e2 06 48 01 da <8b>
42 30 85 c0 79 c0 83 c1 01 48 8b 33 48 63 d1 b8 01 00 00 00 f7
[   42.346285][  T122] RSP: 0018:ffffb68640207e08 EFLAGS: 00010286
[   42.346749][  T122] RAX: 00000000b3aea8f0 RBX: ffffe570c0f00000 RCX:
0000000000004000
[   42.347355][  T122] RDX: ffffe570c1000000 RSI: 000fffffc0010009 RDI:
ffffe570c0f00000
[   42.347960][  T122] RBP: ffffffffc0503050 R08: 0000000000000000 R09:
0000000000000001
[   42.348568][  T122] R10: 0000000000000000 R11: ffffb68640207c88 R12:
ffffffffc0503020
[   42.349180][  T122] R13: ffff921281dcdc00 R14: ffff9212bcf08000 R15:
ffffe570c0f00000
[   42.349789][  T122] FS:  0000000000000000(0000) GS:ffff9212b3b00000(0000)
knlGS:0000000000000000
[   42.350471][  T122] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   42.350975][  T122] CR2: ffffe570c1000030 CR3: 000000001b810000 CR4:
00000000000006e0
[   42.351588][  T122] Call Trace:
[   42.351845][  T122]  <TASK>
[   42.352069][  T122]  page_mkclean+0x6e/0xc0
[   42.352400][  T122]  ? page_referenced_one+0x190/0x190
[   42.353714][  T122]  ? pmdp_collapse_flush+0x60/0x60
[   42.354106][  T122]  fb_deferred_io_work+0x13d/0x190
[   42.354496][  T122]  process_one_work+0x267/0x440
[   42.354866][  T122]  ? process_one_work+0x440/0x440
[   42.355247][  T122]  worker_thread+0x2d/0x3d0
[   42.355590][  T122]  ? process_one_work+0x440/0x440
[   42.355972][  T122]  kthread+0x156/0x180
[   42.356281][  T122]  ? set_kthread_struct+0x50/0x50
[   42.356662][  T122]  ret_from_fork+0x22/0x30
[   42.357006][  T122]  </TASK>

The page info shows that it's a compound page but it's somehow
broken.  On VM, it's triggered reliably with the scenario above,
always at the same position.

FWIW, the Oops is hit even if there is no rewrite on the screen.
That is, another procedure is:
- Start VM, run fbiterm on VT1
- Switch to VT2, text mode
- On VT2, kill fbiterm; the crash still happens even if no screen
  change is performed

> The mmap'ed buffer of the fbdev device comes from a vmalloc call. That
> memory's location never changes; even across pairs of open/close on
> the device file. I'm surprised that a page entry becomes invalid.
> 
> In drm_fbdev_cleanup(), we first remove the fbdefio at [1] and then
> vfree() the shadow buffer. So the memory should still be around until
> fbdevio is gone.

Yes, that's the puzzling part, too.  Also, another thing is that the
bug couldn't be triggered easily when the fb is started in a different
way.  e.g. when you run fbiterm & exit on the VM that had efifb, it
didn't hit.

So, overall, it might be that I'm scratching a wrong surface.  But at
least it "fixes" the problem above apparently, and the deferred io
base code itself has certainly the potential problem in general as my
patch suggests.

> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helper.c#L2146
> 
> > 
> > This patch makes sure to cancel the delayed work and clean up the
> > pageref list at closing the device for addressing the bug.  A part of
> > the cleanup code is factored out as a new helper function that is
> > called from the common fb_release().
> 
> The delayed work is required to copy the framebuffer to the device
> output. So if it's just canceled, could this result in missing
> updates?
> 
> There's a call to cancel_delayed_work_sync() in the new helper
> fb_deferred_io_release(). Is this the right function? Maybe
> flush_delayed_work() is a better choice.

I thought of that, but took a shorter path.
OK, let's check whether this keeps working with that change.

> > Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> This could use a Fixes tag. It's not exactly clear to me when this
> problem got originally introduced, but the recent refactoring seems a
> candidate.
> 
> Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")

Hrm, this might be.  Maybe Patrik can test with the revert of this?

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
> Cc: Jaya Kumar <jayalk@intworks.biz>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> Cc: Bernie Thompson <bernie@plugable.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Stephen Kitt <steve@sk2.org>
> Cc: Peter Suti <peter.suti@streamunlimited.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: ye xingchen <ye.xingchen@zte.com.cn>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Tom Rix <trix@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-hyperv@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v5.19+

Nah, please don't.  Too many Cc's, literally a spam.

> > ---
> > v1->v2: Fix build error without CONFIG_FB_DEFERRED_IO
> > 
> >   drivers/video/fbdev/core/fb_defio.c | 10 +++++++++-
> >   drivers/video/fbdev/core/fbmem.c    |  4 ++++
> >   include/linux/fb.h                  |  1 +
> >   3 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > index c730253ab85c..583cbcf09446 100644
> > --- a/drivers/video/fbdev/core/fb_defio.c
> > +++ b/drivers/video/fbdev/core/fb_defio.c
> > @@ -313,7 +313,7 @@ void fb_deferred_io_open(struct fb_info *info,
> >   }
> >   EXPORT_SYMBOL_GPL(fb_deferred_io_open);
> >   -void fb_deferred_io_cleanup(struct fb_info *info)
> > +void fb_deferred_io_release(struct fb_info *info)
> >   {
> >   	struct fb_deferred_io *fbdefio = info->fbdefio;
> >   	struct page *page;
> > @@ -327,6 +327,14 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> >   		page = fb_deferred_io_page(info, i);
> >   		page->mapping = NULL;
> >   	}
> > +}
> > +EXPORT_SYMBOL_GPL(fb_deferred_io_release);
> 
> It's all in the same module. No need to export this symbol.

I noticed it, too, but just keep the same style as other functions :)
That said, the other exported symbols are also useless.  I can prepare
another patch to clean it up.


thanks,

Takashi
