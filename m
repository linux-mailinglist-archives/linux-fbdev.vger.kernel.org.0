Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F009C10C5AE
	for <lists+linux-fbdev@lfdr.de>; Thu, 28 Nov 2019 10:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfK1JJw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 28 Nov 2019 04:09:52 -0500
Received: from mga03.intel.com ([134.134.136.65]:6459 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbfK1JJw (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 28 Nov 2019 04:09:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Nov 2019 01:09:52 -0800
X-IronPort-AV: E=Sophos;i="5.69,252,1571727600"; 
   d="scan'208";a="203377727"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Nov 2019 01:09:49 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Subject: Re: [Intel-gfx] [PATCH 01/13] video: fb_defio: preserve user fb_ops
In-Reply-To: <20191127182105.GJ406127@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1574871797.git.jani.nikula@intel.com> <448995ffd954e0cd2287089cb686e351cc095834.1574871797.git.jani.nikula@intel.com> <20191127181741.GG406127@phenom.ffwll.local> <20191127182105.GJ406127@phenom.ffwll.local>
Date:   Thu, 28 Nov 2019 11:09:46 +0200
Message-ID: <87fti8nz8l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 27 Nov 2019, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Nov 27, 2019 at 07:17:41PM +0100, Daniel Vetter wrote:
>> On Wed, Nov 27, 2019 at 06:31:57PM +0200, Jani Nikula wrote:
>> > Modifying fb_ops directly to override fb_mmap with fb_deferred_io_mmap
>> > and then resetting it to NULL afterwards causes problems all over the
>> > place. First, it prevents making the fbops member of struct fb_info a
>> > const pointer, which means we can't make struct fb_ops const
>> > anywhere. Second, a few places have to go out of their way to restore
>> > the original fb_mmap pointer that gets reset to NULL.
>> > 
>> > Preserve the passed in fb_ops by making a copy of it and modifying that
>> > instead. Add a deferred_io_private member to struct fb_info to store the
>> > pointer to the old fb_ops, and restore that at cleanup.
>> > 
>> > Cc: Jaya Kumar <jayalk@intworks.biz>
>> > Cc: linux-fbdev@vger.kernel.org
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > 
>> > ---
>> > 
>> > Note: If the approach is acceptable, we'll also need to handle the error
>> > returns on memory allocation failures at fb_deferred_io_init() call
>> > sites. There are 13.
>> 
>> it's fbdev defio, I think we can do worse with less effort. Just embed a
>> copy of fb_ops into fb_info, and use that, and tada! no memory allocation
>> needed :-)
>> 
>> I'd totally r-b that patch.
>> 
>> Or do what Ville suggested, add an fb_info->fbdefio.enabled, set that in
>> the _init function and in fb_mmap call fb_deferred_io_mmap for that case
>> instead of the driver's fb_ops->fb_mmap. There's only one caller of that
>> in the entire tree, in fbmem.c. Also, we could/should nuke the
>> EXPORT_SYMBOL(fb_deferred_io_mmap) I think.
>
> I just realized that fb_info->fbdefio is a pointer, so this would be
> really simple to pull off I think.

Heh, having a

	int (*fb_deferred_io_mmap)(struct fb_info *, struct vm_area_struct *);

member in struct fb_info, and using that in fbmem.c if non-NULL, was
actually my first idea. I didn't think it was particularly pretty, but
if we don't care about aesthetics...

Would you like that instead of the patch at hand?


BR,
Jani.


> -Daniel
>
>> 
>> That version would also get my r-b stamp. So up to you what you prefer.
>> -Daniel
>> 
>> > ---
>> >  drivers/video/fbdev/core/fb_defio.c | 25 ++++++++++++++++++++++---
>> >  include/linux/fb.h                  |  3 ++-
>> >  2 files changed, 24 insertions(+), 4 deletions(-)
>> > 
>> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
>> > index 82c20c6047b0..36697844c1e0 100644
>> > --- a/drivers/video/fbdev/core/fb_defio.c
>> > +++ b/drivers/video/fbdev/core/fb_defio.c
>> > @@ -200,13 +200,23 @@ static void fb_deferred_io_work(struct work_struct *work)
>> >  	mutex_unlock(&fbdefio->lock);
>> >  }
>> >  
>> > -void fb_deferred_io_init(struct fb_info *info)
>> > +int fb_deferred_io_init(struct fb_info *info)
>> >  {
>> >  	struct fb_deferred_io *fbdefio = info->fbdefio;
>> > +	struct fb_ops *fbops;
>> >  
>> >  	BUG_ON(!fbdefio);
>> > +
>> > +	fbops = kmemdup(info->fbops, sizeof(*fbops), GFP_KERNEL);
>> > +	if (!fbops)
>> > +		return -ENOMEM;
>> > +
>> > +	fbops->fb_mmap = fb_deferred_io_mmap;
>> > +	info->deferred_io_private = info->fbops;
>> > +	info->fbops = fbops;
>> > +
>> >  	mutex_init(&fbdefio->lock);
>> > -	info->fbops->fb_mmap = fb_deferred_io_mmap;
>> > +
>> >  	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
>> >  	INIT_LIST_HEAD(&fbdefio->pagelist);
>> >  	if (fbdefio->delay == 0) /* set a default of 1 s */
>> > @@ -229,6 +239,12 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>> >  	int i;
>> >  
>> >  	BUG_ON(!fbdefio);
>> > +
>> > +	/* sanity check against misuse */
>> > +	if (WARN_ON(!info->deferred_io_private ||
>> > +		    info->fbops->fb_mmap != fb_deferred_io_mmap))
>> > +		return;
>> > +
>> >  	cancel_delayed_work_sync(&info->deferred_work);
>> >  
>> >  	/* clear out the mapping that we setup */
>> > @@ -237,7 +253,10 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>> >  		page->mapping = NULL;
>> >  	}
>> >  
>> > -	info->fbops->fb_mmap = NULL;
>> > +	kfree(info->fbops);
>> > +	info->fbops = info->deferred_io_private;
>> > +	info->deferred_io_private = NULL;
>> > +
>> >  	mutex_destroy(&fbdefio->lock);
>> >  }
>> >  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
>> > diff --git a/include/linux/fb.h b/include/linux/fb.h
>> > index a6ad528990de..65f2abd47745 100644
>> > --- a/include/linux/fb.h
>> > +++ b/include/linux/fb.h
>> > @@ -470,6 +470,7 @@ struct fb_info {
>> >  #ifdef CONFIG_FB_DEFERRED_IO
>> >  	struct delayed_work deferred_work;
>> >  	struct fb_deferred_io *fbdefio;
>> > +	void *deferred_io_private;
>> >  #endif
>> >  
>> >  	struct fb_ops *fbops;
>> > @@ -658,7 +659,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
>> >  
>> >  /* drivers/video/fb_defio.c */
>> >  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
>> > -extern void fb_deferred_io_init(struct fb_info *info);
>> > +extern int fb_deferred_io_init(struct fb_info *info);
>> >  extern void fb_deferred_io_open(struct fb_info *info,
>> >  				struct inode *inode,
>> >  				struct file *file);
>> > -- 
>> > 2.20.1
>> > 
>> > _______________________________________________
>> > Intel-gfx mailing list
>> > Intel-gfx@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>> 
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

-- 
Jani Nikula, Intel Open Source Graphics Center
