Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9435A680D51
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Jan 2023 13:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjA3MOh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Jan 2023 07:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235634AbjA3MOX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Jan 2023 07:14:23 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149F02CC77;
        Mon, 30 Jan 2023 04:14:02 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5248021AB9;
        Mon, 30 Jan 2023 12:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1675080839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5PBmi9iZajlI+SrsQl2F2zMK0709ZtsW5dSNABazekA=;
        b=0YFVObqol1xS5t32SuY+HRdAHBTigck8+kLPfffvR3ybuynEw27GNKe5+HZntw42Ms0JOF
        JhQQ1smP9nb4gdr8oQsPtldWt0Rv9tN/MV4TJZsMHigUDGJsMsl0+JIcfWhZKoN/TNwfZk
        rJWM6PMqS4mUZIHTHK1SoVqUpDgzqe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1675080839;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5PBmi9iZajlI+SrsQl2F2zMK0709ZtsW5dSNABazekA=;
        b=W+WvJ5ge1fX+xrhLkRdW315bnFiYu+WIcrQvsp7/yriC82GFfvo4MY40Ep0KjO3dDyBCtp
        gmlfIaFTDdyFYsBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C56B13444;
        Mon, 30 Jan 2023 12:13:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id DWrZBYe012NFOgAAMHmgww
        (envelope-from <tiwai@suse.de>); Mon, 30 Jan 2023 12:13:59 +0000
Date:   Mon, 30 Jan 2023 13:13:58 +0100
Message-ID: <87k014qkxl.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Patrik Jakobsson <pjakobsson@suse.de>
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred I/O devices
In-Reply-To: <87y1pkqu90.wl-tiwai@suse.de>
References: <20230129082856.22113-1-tiwai@suse.de>
        <2a5b5059-9f60-a5bc-cbb7-8267349b2eac@suse.de>
        <87y1pkqu90.wl-tiwai@suse.de>
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

On Mon, 30 Jan 2023 09:52:43 +0100,
Takashi Iwai wrote:
> 
> > There's a call to cancel_delayed_work_sync() in the new helper
> > fb_deferred_io_release(). Is this the right function? Maybe
> > flush_delayed_work() is a better choice.
> 
> I thought of that, but took a shorter path.
> OK, let's check whether this keeps working with that change.

Interestingly, this still makes the bug happening at the very same
place.  (The tested patch is below.)
So, more looking and testing, more confusing the problem becomes :-<


Takashi

-- 8< --
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -313,20 +313,31 @@ void fb_deferred_io_open(struct fb_info *info,
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
-void fb_deferred_io_cleanup(struct fb_info *info)
+/* clear out the mapping that we setup */
+static void fb_deferred_io_clear_mapping(struct fb_info *info)
 {
-	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct page *page;
 	int i;
 
-	BUG_ON(!fbdefio);
-	cancel_delayed_work_sync(&info->deferred_work);
-
-	/* clear out the mapping that we setup */
 	for (i = 0 ; i < info->fix.smem_len; i += PAGE_SIZE) {
 		page = fb_deferred_io_page(info, i);
 		page->mapping = NULL;
 	}
+}
+
+void fb_deferred_io_release(struct fb_info *info)
+{
+	flush_delayed_work(&info->deferred_work);
+	fb_deferred_io_clear_mapping(info);
+}
+
+void fb_deferred_io_cleanup(struct fb_info *info)
+{
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+
+	BUG_ON(!fbdefio);
+	cancel_delayed_work_sync(&info->deferred_work);
+	fb_deferred_io_clear_mapping(info);
 
 	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1454,6 +1454,10 @@ __releases(&info->lock)
 	struct fb_info * const info = file->private_data;
 
 	lock_fb_info(info);
+#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
+	if (info->fbdefio)
+		fb_deferred_io_release(info);
+#endif
 	if (info->fbops->fb_release)
 		info->fbops->fb_release(info,1);
 	module_put(info->fbops->owner);
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -662,6 +662,7 @@ extern int  fb_deferred_io_init(struct fb_info *info);
 extern void fb_deferred_io_open(struct fb_info *info,
 				struct inode *inode,
 				struct file *file);
+extern void fb_deferred_io_release(struct fb_info *info);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
-- 
2.35.3



> 
> > > Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > 
> > This could use a Fixes tag. It's not exactly clear to me when this
> > problem got originally introduced, but the recent refactoring seems a
> > candidate.
> > 
> > Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
> 
> Hrm, this might be.  Maybe Patrik can test with the revert of this?
> 
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Zack Rusin <zackr@vmware.com>
> > Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
> > Cc: Jaya Kumar <jayalk@intworks.biz>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> > Cc: Haiyang Zhang <haiyangz@microsoft.com>
> > Cc: Wei Liu <wei.liu@kernel.org>
> > Cc: Dexuan Cui <decui@microsoft.com>
> > Cc: Steve Glendinning <steve.glendinning@shawell.net>
> > Cc: Bernie Thompson <bernie@plugable.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Stephen Kitt <steve@sk2.org>
> > Cc: Peter Suti <peter.suti@streamunlimited.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: ye xingchen <ye.xingchen@zte.com.cn>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: John Ogness <john.ogness@linutronix.de>
> > Cc: Tom Rix <trix@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: linux-hyperv@vger.kernel.org
> > Cc: <stable@vger.kernel.org> # v5.19+
> 
> Nah, please don't.  Too many Cc's, literally a spam.
> 
> > > ---
> > > v1->v2: Fix build error without CONFIG_FB_DEFERRED_IO
> > > 
> > >   drivers/video/fbdev/core/fb_defio.c | 10 +++++++++-
> > >   drivers/video/fbdev/core/fbmem.c    |  4 ++++
> > >   include/linux/fb.h                  |  1 +
> > >   3 files changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > > index c730253ab85c..583cbcf09446 100644
> > > --- a/drivers/video/fbdev/core/fb_defio.c
> > > +++ b/drivers/video/fbdev/core/fb_defio.c
> > > @@ -313,7 +313,7 @@ void fb_deferred_io_open(struct fb_info *info,
> > >   }
> > >   EXPORT_SYMBOL_GPL(fb_deferred_io_open);
> > >   -void fb_deferred_io_cleanup(struct fb_info *info)
> > > +void fb_deferred_io_release(struct fb_info *info)
> > >   {
> > >   	struct fb_deferred_io *fbdefio = info->fbdefio;
> > >   	struct page *page;
> > > @@ -327,6 +327,14 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> > >   		page = fb_deferred_io_page(info, i);
> > >   		page->mapping = NULL;
> > >   	}
> > > +}
> > > +EXPORT_SYMBOL_GPL(fb_deferred_io_release);
> > 
> > It's all in the same module. No need to export this symbol.
> 
> I noticed it, too, but just keep the same style as other functions :)
> That said, the other exported symbols are also useless.  I can prepare
> another patch to clean it up.
> 
> 
> thanks,
> 
> Takashi
