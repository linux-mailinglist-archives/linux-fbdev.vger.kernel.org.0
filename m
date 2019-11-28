Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E72810C659
	for <lists+linux-fbdev@lfdr.de>; Thu, 28 Nov 2019 11:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfK1KGD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 28 Nov 2019 05:06:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38077 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1KGD (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 28 Nov 2019 05:06:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id i12so30416196wro.5
        for <linux-fbdev@vger.kernel.org>; Thu, 28 Nov 2019 02:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kc/ijOFG0u4wJoRgIjnyxdmZMLLp73p11j8khKSsNF8=;
        b=NnABmv701j1F4FCuLGRKBMGXh392kT0TqNqrRWRnPfURWQfDlEh9UPLyBX+hoLPiVS
         6MPtyrH4gCfvP24KohW+U/dmCxGSOUy3poCaiGsPAP6XNJeABNfMnIvQhrf24bIzAdla
         Kxn8w5osNz9u5plCA9yq+Ia7ZgRXKGOTnVkQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kc/ijOFG0u4wJoRgIjnyxdmZMLLp73p11j8khKSsNF8=;
        b=UL8ZR4PtLrgGnbCuGYYG1vvqJ+EzvHkcD83maOEsu1tDyKdh0JW9GF5v4TAMZm60G0
         a1yPxmcKRzX3PS9LFp8FF2d8seWq29py/IqzKq48ZA9rc59Tk49H0ntqmz0El1Wx6BBM
         6NCidRR1toTC/T+8rt37izln3QJNTC0gTSF7eapj0wodwhxywRqtiRR5jjXs3en1Bn1f
         OhtFWHsKOrsJ9rhXEvNKsgawiyKI5x0e5DgZvGbmG4r71XzHoB6JeNOuQHGJDGSrb+8n
         ykFk/vJuv37GxOWjR6WXTORav8ROP5lRFy9mFGiLt/hTw/qhyeAcWbTm3aje64vlVtsQ
         rtwQ==
X-Gm-Message-State: APjAAAW4cgO5yxI2q2kYRs9usyepepvn1DCEm04LcFCQJbDMrGp1RnUV
        Mtuw/EXDwqKqhfC0y/co6Kc+k7CdiuA=
X-Google-Smtp-Source: APXvYqw1HGGMTgfFgg7dOWgkMCm8QKYv2sApIRSPVNY/6fwbH3U81hsnwBA76zuco5VLjSTvs6CSLQ==
X-Received: by 2002:adf:df0e:: with SMTP id y14mr44001051wrl.377.1574935560506;
        Thu, 28 Nov 2019 02:06:00 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id d8sm980827wre.13.2019.11.28.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 02:05:59 -0800 (PST)
Date:   Thu, 28 Nov 2019 11:05:57 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jaya Kumar <jayalk@intworks.biz>
Subject: Re: [Intel-gfx] [PATCH 01/13] video: fb_defio: preserve user fb_ops
Message-ID: <20191128100557.GO406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <448995ffd954e0cd2287089cb686e351cc095834.1574871797.git.jani.nikula@intel.com>
 <20191127181741.GG406127@phenom.ffwll.local>
 <20191127182105.GJ406127@phenom.ffwll.local>
 <87fti8nz8l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fti8nz8l.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Nov 28, 2019 at 11:09:46AM +0200, Jani Nikula wrote:
> On Wed, 27 Nov 2019, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Nov 27, 2019 at 07:17:41PM +0100, Daniel Vetter wrote:
> >> On Wed, Nov 27, 2019 at 06:31:57PM +0200, Jani Nikula wrote:
> >> > Modifying fb_ops directly to override fb_mmap with fb_deferred_io_mmap
> >> > and then resetting it to NULL afterwards causes problems all over the
> >> > place. First, it prevents making the fbops member of struct fb_info a
> >> > const pointer, which means we can't make struct fb_ops const
> >> > anywhere. Second, a few places have to go out of their way to restore
> >> > the original fb_mmap pointer that gets reset to NULL.
> >> > 
> >> > Preserve the passed in fb_ops by making a copy of it and modifying that
> >> > instead. Add a deferred_io_private member to struct fb_info to store the
> >> > pointer to the old fb_ops, and restore that at cleanup.
> >> > 
> >> > Cc: Jaya Kumar <jayalk@intworks.biz>
> >> > Cc: linux-fbdev@vger.kernel.org
> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> > 
> >> > ---
> >> > 
> >> > Note: If the approach is acceptable, we'll also need to handle the error
> >> > returns on memory allocation failures at fb_deferred_io_init() call
> >> > sites. There are 13.
> >> 
> >> it's fbdev defio, I think we can do worse with less effort. Just embed a
> >> copy of fb_ops into fb_info, and use that, and tada! no memory allocation
> >> needed :-)
> >> 
> >> I'd totally r-b that patch.
> >> 
> >> Or do what Ville suggested, add an fb_info->fbdefio.enabled, set that in
> >> the _init function and in fb_mmap call fb_deferred_io_mmap for that case
> >> instead of the driver's fb_ops->fb_mmap. There's only one caller of that
> >> in the entire tree, in fbmem.c. Also, we could/should nuke the
> >> EXPORT_SYMBOL(fb_deferred_io_mmap) I think.
> >
> > I just realized that fb_info->fbdefio is a pointer, so this would be
> > really simple to pull off I think.
> 
> Heh, having a
> 
> 	int (*fb_deferred_io_mmap)(struct fb_info *, struct vm_area_struct *);
> 
> member in struct fb_info, and using that in fbmem.c if non-NULL, was
> actually my first idea. I didn't think it was particularly pretty, but
> if we don't care about aesthetics...
> 
> Would you like that instead of the patch at hand?


diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 82c20c6047b0..9275c6bd71da 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -206,13 +206,11 @@ void fb_deferred_io_init(struct fb_info *info)
 
 	BUG_ON(!fbdefio);
 	mutex_init(&fbdefio->lock);
-	info->fbops->fb_mmap = fb_deferred_io_mmap;
 	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
 	INIT_LIST_HEAD(&fbdefio->pagelist);
 	if (fbdefio->delay == 0) /* set a default of 1 s */
 		fbdefio->delay = HZ;
 }
-EXPORT_SYMBOL_GPL(fb_deferred_io_init);
 
 void fb_deferred_io_open(struct fb_info *info,
 			 struct inode *inode,
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 86b06a599f96..6af627f281c3 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1341,7 +1341,16 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
 		return -ENODEV;
 	fb = info->fbops;
 	mutex_lock(&info->mm_lock);
-	if (fb->fb_mmap) {
+	if (fb->fbdefio) {
+		/*
+		 * The framebuffer needs to be accessed decrypted, be sure
+		 * SME protection is removed ahead of the call
+		 */
+		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+		res = fb_deferred_io_mmap(info, vma);
+		mutex_unlock(&info->mm_lock);
+		return res;
+	} else if (fb->fb_mmap) {
 		int res;
 
 		/*

Is what I was thinking off as the pretty solution. Add an explicit
fb_info->fbdefio_enabled boolean if you don't feel like auditing all the
drivers for whether they really call defio_init() every time they assign
something to that pointer. A quick scan brought some nasties to light in
that area.

I think a function pointer here is pointless because we clearly don't need
it, and with all the panic around function pointers a direct call feels
much better :-)
-Daniel

> 
> BR,
> Jani.
> 
> 
> > -Daniel
> >
> >> 
> >> That version would also get my r-b stamp. So up to you what you prefer.
> >> -Daniel
> >> 
> >> > ---
> >> >  drivers/video/fbdev/core/fb_defio.c | 25 ++++++++++++++++++++++---
> >> >  include/linux/fb.h                  |  3 ++-
> >> >  2 files changed, 24 insertions(+), 4 deletions(-)
> >> > 
> >> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> >> > index 82c20c6047b0..36697844c1e0 100644
> >> > --- a/drivers/video/fbdev/core/fb_defio.c
> >> > +++ b/drivers/video/fbdev/core/fb_defio.c
> >> > @@ -200,13 +200,23 @@ static void fb_deferred_io_work(struct work_struct *work)
> >> >  	mutex_unlock(&fbdefio->lock);
> >> >  }
> >> >  
> >> > -void fb_deferred_io_init(struct fb_info *info)
> >> > +int fb_deferred_io_init(struct fb_info *info)
> >> >  {
> >> >  	struct fb_deferred_io *fbdefio = info->fbdefio;
> >> > +	struct fb_ops *fbops;
> >> >  
> >> >  	BUG_ON(!fbdefio);
> >> > +
> >> > +	fbops = kmemdup(info->fbops, sizeof(*fbops), GFP_KERNEL);
> >> > +	if (!fbops)
> >> > +		return -ENOMEM;
> >> > +
> >> > +	fbops->fb_mmap = fb_deferred_io_mmap;
> >> > +	info->deferred_io_private = info->fbops;
> >> > +	info->fbops = fbops;
> >> > +
> >> >  	mutex_init(&fbdefio->lock);
> >> > -	info->fbops->fb_mmap = fb_deferred_io_mmap;
> >> > +
> >> >  	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
> >> >  	INIT_LIST_HEAD(&fbdefio->pagelist);
> >> >  	if (fbdefio->delay == 0) /* set a default of 1 s */
> >> > @@ -229,6 +239,12 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> >> >  	int i;
> >> >  
> >> >  	BUG_ON(!fbdefio);
> >> > +
> >> > +	/* sanity check against misuse */
> >> > +	if (WARN_ON(!info->deferred_io_private ||
> >> > +		    info->fbops->fb_mmap != fb_deferred_io_mmap))
> >> > +		return;
> >> > +
> >> >  	cancel_delayed_work_sync(&info->deferred_work);
> >> >  
> >> >  	/* clear out the mapping that we setup */
> >> > @@ -237,7 +253,10 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> >> >  		page->mapping = NULL;
> >> >  	}
> >> >  
> >> > -	info->fbops->fb_mmap = NULL;
> >> > +	kfree(info->fbops);
> >> > +	info->fbops = info->deferred_io_private;
> >> > +	info->deferred_io_private = NULL;
> >> > +
> >> >  	mutex_destroy(&fbdefio->lock);
> >> >  }
> >> >  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> >> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> >> > index a6ad528990de..65f2abd47745 100644
> >> > --- a/include/linux/fb.h
> >> > +++ b/include/linux/fb.h
> >> > @@ -470,6 +470,7 @@ struct fb_info {
> >> >  #ifdef CONFIG_FB_DEFERRED_IO
> >> >  	struct delayed_work deferred_work;
> >> >  	struct fb_deferred_io *fbdefio;
> >> > +	void *deferred_io_private;
> >> >  #endif
> >> >  
> >> >  	struct fb_ops *fbops;
> >> > @@ -658,7 +659,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
> >> >  
> >> >  /* drivers/video/fb_defio.c */
> >> >  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
> >> > -extern void fb_deferred_io_init(struct fb_info *info);
> >> > +extern int fb_deferred_io_init(struct fb_info *info);
> >> >  extern void fb_deferred_io_open(struct fb_info *info,
> >> >  				struct inode *inode,
> >> >  				struct file *file);
> >> > -- 
> >> > 2.20.1
> >> > 
> >> > _______________________________________________
> >> > Intel-gfx mailing list
> >> > Intel-gfx@lists.freedesktop.org
> >> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >> 
> >> -- 
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
