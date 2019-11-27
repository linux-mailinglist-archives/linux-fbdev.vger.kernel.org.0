Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 249B010B543
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 19:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfK0SJj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 13:09:39 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40451 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfK0SJj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 13:09:39 -0500
Received: by mail-wm1-f66.google.com with SMTP id y5so8646714wmi.5
        for <linux-fbdev@vger.kernel.org>; Wed, 27 Nov 2019 10:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Y4woP2fc2CXC7vcMm1HivnjBNXU3sMD/LIEZJwKz60s=;
        b=hXoDQvvCcW7NgoMkcIyVTlFEQMPBbmsXFoREJ/vG6X6uuca8IumGHQwI1XMeZ28X0I
         Em6RA122m2AF6aPTxRoZ9EzW1p6zL2emdtN2oudBjwG1zTEuP5hJd0/59nJenuSd3XGz
         DAsgcm9gVITXKqbAQdA2ItqcI/WtmjBD2/g80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Y4woP2fc2CXC7vcMm1HivnjBNXU3sMD/LIEZJwKz60s=;
        b=fcVm2CO5P2wXGsuTvHQr83FQpZ2ZKUtG+d3/CoHQna7/9eDpfANHj/Ge7ouzpIusD7
         MQKOALw+cubbJjuVBb36be7WFJUTVCSMEgwHC5/CQEZu9b+CFAa1ki7J+8kkm3MOHE2h
         dV+0Z4iJSD4JmQYuv6cf9YqiU+V4eIK27Bjk+bWokJFeFkrqmk+QLcaUKUIqgBvdQjrP
         RiY/bppf1DMgnytN8ka4bORpJmbqtZVKPEVjTYaSb3Au5PzswsIAbMSGEmfs+FEAljOR
         klYtddacCjV8ra0CR2hC09oTJXlDhNCMCi4Eu84fe9KR7OBlrGz5uQ5qC1A7XzmPgAWJ
         TAuA==
X-Gm-Message-State: APjAAAU4r0EpubtDiGh7QNO0tTjtV0fdYs/T1i1yI/1XMY147nwyIFVo
        djb3esKW8LHjDsOZgT9zL/167Q==
X-Google-Smtp-Source: APXvYqw7AB87Y8tkHaJ5YyZYrlgs7DiZKfJZVcUDVbsVjz5sS7GJeLEEwSKWAobXFZewZ2Lpb+KOFQ==
X-Received: by 2002:a1c:9c82:: with SMTP id f124mr6014728wme.25.1574878175504;
        Wed, 27 Nov 2019 10:09:35 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id a15sm21414588wrx.81.2019.11.27.10.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 10:09:34 -0800 (PST)
Date:   Wed, 27 Nov 2019 19:09:32 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jaya Kumar <jayalk@intworks.biz>
Subject: Re: [Intel-gfx] [PATCH 01/13] video: fb_defio: preserve user fb_ops
Message-ID: <20191127180932.GE406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <448995ffd954e0cd2287089cb686e351cc095834.1574871797.git.jani.nikula@intel.com>
 <20191127170116.GK1208@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191127170116.GK1208@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 27, 2019 at 07:01:16PM +0200, Ville Syrjälä wrote:
> On Wed, Nov 27, 2019 at 06:31:57PM +0200, Jani Nikula wrote:
> > Modifying fb_ops directly to override fb_mmap with fb_deferred_io_mmap
> > and then resetting it to NULL afterwards causes problems all over the
> > place. First, it prevents making the fbops member of struct fb_info a
> > const pointer, which means we can't make struct fb_ops const
> > anywhere. Second, a few places have to go out of their way to restore
> > the original fb_mmap pointer that gets reset to NULL.
> > 
> > Preserve the passed in fb_ops by making a copy of it and modifying that
> > instead. Add a deferred_io_private member to struct fb_info to store the
> > pointer to the old fb_ops, and restore that at cleanup.
> 
> Quite the horror show. I wonder how hard it would be to just have each
> driver that can use defio provide a mmap hook that either dispatches
> to the defio one or the native one depending if defio is used or not...
> 
> A few drivers at least seem to always use defio so those should be
> trivial. Some others seem to make the decision dynamically, which
> would require custom .mmap(). Though I suppose all of them could just
> be of the form
> foo_mmap_wrap{)
> {
> 	if (info->defio)
> 		defio_mmap()
> 	else
> 		foo_mmap();
> }
> 
> Hmm. Actually is .fb_mmap() called from anywhere but fb_mmap()? If not
> we could just shove the defio check there? Or if it's called from
> several places we could try to wrap all calls in _fb_mmap() or somesuch.

While we're spinning this garn about fb_mmap improvements: My cunning
plan, documented in todo.rst even, is to have our own fb_mmap
implementation for the drm fbdev helper, which will handle all this
internally.

And then just quietly burn down the fbdev defio stuff to the ground,
because it's the stuff for nightmares.

https://dri.freedesktop.org/docs/drm/gpu/todo.html#generic-fbdev-defio-support

tldr; Imo no point investing too much in polishing the defio stuff.
-Daniel

> 
> > 
> > Cc: Jaya Kumar <jayalk@intworks.biz>
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > 
> > ---
> > 
> > Note: If the approach is acceptable, we'll also need to handle the error
> > returns on memory allocation failures at fb_deferred_io_init() call
> > sites. There are 13.
> > ---
> >  drivers/video/fbdev/core/fb_defio.c | 25 ++++++++++++++++++++++---
> >  include/linux/fb.h                  |  3 ++-
> >  2 files changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > index 82c20c6047b0..36697844c1e0 100644
> > --- a/drivers/video/fbdev/core/fb_defio.c
> > +++ b/drivers/video/fbdev/core/fb_defio.c
> > @@ -200,13 +200,23 @@ static void fb_deferred_io_work(struct work_struct *work)
> >  	mutex_unlock(&fbdefio->lock);
> >  }
> >  
> > -void fb_deferred_io_init(struct fb_info *info)
> > +int fb_deferred_io_init(struct fb_info *info)
> >  {
> >  	struct fb_deferred_io *fbdefio = info->fbdefio;
> > +	struct fb_ops *fbops;
> >  
> >  	BUG_ON(!fbdefio);
> > +
> > +	fbops = kmemdup(info->fbops, sizeof(*fbops), GFP_KERNEL);
> > +	if (!fbops)
> > +		return -ENOMEM;
> > +
> > +	fbops->fb_mmap = fb_deferred_io_mmap;
> > +	info->deferred_io_private = info->fbops;
> > +	info->fbops = fbops;
> > +
> >  	mutex_init(&fbdefio->lock);
> > -	info->fbops->fb_mmap = fb_deferred_io_mmap;
> > +
> >  	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
> >  	INIT_LIST_HEAD(&fbdefio->pagelist);
> >  	if (fbdefio->delay == 0) /* set a default of 1 s */
> > @@ -229,6 +239,12 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> >  	int i;
> >  
> >  	BUG_ON(!fbdefio);
> > +
> > +	/* sanity check against misuse */
> > +	if (WARN_ON(!info->deferred_io_private ||
> > +		    info->fbops->fb_mmap != fb_deferred_io_mmap))
> > +		return;
> > +
> >  	cancel_delayed_work_sync(&info->deferred_work);
> >  
> >  	/* clear out the mapping that we setup */
> > @@ -237,7 +253,10 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> >  		page->mapping = NULL;
> >  	}
> >  
> > -	info->fbops->fb_mmap = NULL;
> > +	kfree(info->fbops);
> > +	info->fbops = info->deferred_io_private;
> > +	info->deferred_io_private = NULL;
> > +
> >  	mutex_destroy(&fbdefio->lock);
> >  }
> >  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index a6ad528990de..65f2abd47745 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -470,6 +470,7 @@ struct fb_info {
> >  #ifdef CONFIG_FB_DEFERRED_IO
> >  	struct delayed_work deferred_work;
> >  	struct fb_deferred_io *fbdefio;
> > +	void *deferred_io_private;
> >  #endif
> >  
> >  	struct fb_ops *fbops;
> > @@ -658,7 +659,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
> >  
> >  /* drivers/video/fb_defio.c */
> >  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
> > -extern void fb_deferred_io_init(struct fb_info *info);
> > +extern int fb_deferred_io_init(struct fb_info *info);
> >  extern void fb_deferred_io_open(struct fb_info *info,
> >  				struct inode *inode,
> >  				struct file *file);
> > -- 
> > 2.20.1
> 
> -- 
> Ville Syrjälä
> Intel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
