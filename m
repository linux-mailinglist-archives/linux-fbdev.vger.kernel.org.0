Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D66234259
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jul 2020 11:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731981AbgGaJUi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jul 2020 05:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731991AbgGaJUi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jul 2020 05:20:38 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE564C061574
        for <linux-fbdev@vger.kernel.org>; Fri, 31 Jul 2020 02:20:37 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c80so7975011wme.0
        for <linux-fbdev@vger.kernel.org>; Fri, 31 Jul 2020 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5jVocStywPD82+GfChijcoaUHvKqOvvxEriAfAxTW/4=;
        b=FZwnvAoUHl9Swt/48NE+25kn4/CWDumkoY76TkGTBQdRuD4Wzezel+zS41AiSzksQ1
         dCQT2iCpayeiVflf2HbyDJBqVk1GEdjM44/JR3XH7QywJZm1twNXXqWCYtEBYTpMQZzK
         44/y0hKbQuFxkqiE/j/Ka8Cnw50AFdhNLFiHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5jVocStywPD82+GfChijcoaUHvKqOvvxEriAfAxTW/4=;
        b=i3A8ReXup6OrRuooAttn/S6Puil2J7P6NMNIsj0yF02XWw9OJRAp3Kg5M1Q5obP09r
         ayTevn1jOm5L+oMlIOj+JpFgZ59oo8dsKkA4a07mvH9UnQThAA3dIu+bDW6DM1AV1zza
         Sd9nDK9atDJvpbSmpU+D1hYYjNLWuhhHD5+Hy5ZbjgjkhTiqKjAgYxV5trkHJbWau2ff
         XTiYfVWTJAyrYOiVfzhe9LmnscWiEuiTKkEXCmkMy1EMpMkgsPIWzGY8mplM/1v+B0E5
         KWA+5wifhUp8Ie57HSYwD0XKI1wxBFkd/y1y57GKbfasXIIwXBYevdoaqRJveB84hJUt
         D09A==
X-Gm-Message-State: AOAM531Rik3rErMTxjrzIjdw9Z9l8Hb1irqeoHqn8s5dLTjFf82VAZjL
        yL2iEHulLE4A+W+6aneeA7lMMQ==
X-Google-Smtp-Source: ABdhPJwp3j3w5sEDWYnF2pI7XaYPRcnKOh2er2/+NhLeiovwLxLzF2aTTPQP3K/VDueqbZmYSSVGgQ==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr2925615wmb.108.1596187236055;
        Fri, 31 Jul 2020 02:20:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p3sm11561537wma.44.2020.07.31.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 02:20:35 -0700 (PDT)
Date:   Fri, 31 Jul 2020 11:20:33 +0200
From:   daniel@ffwll.ch
Cc:     daniel@ffwll.ch, airlied@redhat.com, kraxel@redhat.com,
        b.zolnierkie@samsung.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, jani.nikula@intel.com, peda@axentia.se,
        dan.carpenter@oracle.com, natechancellor@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/5] fbdev/core: Export framebuffer read and write code
 as cfb_ function
Message-ID: <20200731092033.GV6419@phenom.ffwll.local>
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-3-tzimmermann@suse.de>
 <20200729135328.GP6419@phenom.ffwll.local>
 <20200729163603.GA1369638@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729163603.GA1369638@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jul 29, 2020 at 06:36:03PM +0200, Sam Ravnborg wrote:
> Hi Daniel.
> 
> On Wed, Jul 29, 2020 at 03:53:28PM +0200, daniel@ffwll.ch wrote:
> > On Wed, Jul 29, 2020 at 03:41:45PM +0200, Thomas Zimmermann wrote:
> > > DRM fb helpers require read and write functions for framebuffer
> > > memory. Export the existing code from fbdev.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > Hm I'm not super sure whether we want to actually reuse this stuff ... We
> > kinda don't care about the sparc special case, and just having an fbdev
> > implementation witch has the switch between memcpy and memcpy_to/from_io
> > in one single place sounds a lot simpler ...
> > 
> > This way we can have a clean split between the old horrors of real fbdev
> > drivers, and a much cleaner world in drm. It would mean a bit of
> > copypasting, but I think that's actually a good thing.
> > 
> > In general my idea for drm fbdev emulation is that for any area we have a
> > problem we just ignore the entire fbmem.c code and write our own: mmap,
> > backlight handling (still unsolved, and horrible), cfb vs sys here. This
> > entire fbmem.c stuff is pretty bad midlayer, trying to avoid code
> > duplication here doesn't seem worth it imo.
> > 
> > Thoughts?
> 
> 
> I can see that fbmem is a mix of ioctl support and other stuff.
> We could factor out all the ioctl parts of fbmem.c to a new file
> named fbioctl.c.
> 
> And then let the ioctl parts call down into drm stuff and avoid reusing
> the fbdev code when we first reach drm code.
> This would require local copies of:
> sys_read, sys_write, sys_fillrect, sys_copyarea, sys_imageblit
> and more I think which I missed.
> 
> With local copies we could avoid some of the special cases and trim the
> unctions to what is required by drm only.
> And then no more fbmem dependencies and no dependencies to several of
> the small helper functions. So less entanglement with fbdev core.
> 
> This all sounds simple so I am surely missing a lot a ugly details here.
> 
> And should we touch this anyway we need a test suite to verify not too
> much breaks. To the best of my knowledge there is not yet such a test
> suite :-( Maybe because people caring about fbdev are limited.

Well my idea was to not refactor anything, but just have drm copies of the
various fb_ops callbacks. Definitely not even more refactoring :-)
-Daniel

> 
> 	Sam
> 
> 
> 
> 
> 
> > -Daniel
> > 
> > > ---
> > >  drivers/video/fbdev/core/fbmem.c | 53 ++++++++++++++++++++++----------
> > >  include/linux/fb.h               |  5 +++
> > >  2 files changed, 41 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > > index dd0ccf35f7b7..b496ff90db3e 100644
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -759,25 +759,18 @@ static struct fb_info *file_fb_info(struct file *file)
> > >  	return info;
> > >  }
> > >  
> > > -static ssize_t
> > > -fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > > +ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
> > > +		    loff_t *ppos)
> > >  {
> > >  	unsigned long p = *ppos;
> > > -	struct fb_info *info = file_fb_info(file);
> > >  	u8 *buffer, *dst;
> > >  	u8 __iomem *src;
> > >  	int c, cnt = 0, err = 0;
> > >  	unsigned long total_size;
> > >  
> > > -	if (!info || ! info->screen_base)
> > > -		return -ENODEV;
> > > -
> > >  	if (info->state != FBINFO_STATE_RUNNING)
> > >  		return -EPERM;
> > >  
> > > -	if (info->fbops->fb_read)
> > > -		return info->fbops->fb_read(info, buf, count, ppos);
> > > -
> > >  	total_size = info->screen_size;
> > >  
> > >  	if (total_size == 0)
> > > @@ -823,16 +816,12 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > >  
> > >  	return (err) ? err : cnt;
> > >  }
> > > +EXPORT_SYMBOL(fb_cfb_read);
> > >  
> > >  static ssize_t
> > > -fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> > > +fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > >  {
> > > -	unsigned long p = *ppos;
> > >  	struct fb_info *info = file_fb_info(file);
> > > -	u8 *buffer, *src;
> > > -	u8 __iomem *dst;
> > > -	int c, cnt = 0, err = 0;
> > > -	unsigned long total_size;
> > >  
> > >  	if (!info || !info->screen_base)
> > >  		return -ENODEV;
> > > @@ -840,8 +829,20 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> > >  	if (info->state != FBINFO_STATE_RUNNING)
> > >  		return -EPERM;
> > >  
> > > -	if (info->fbops->fb_write)
> > > -		return info->fbops->fb_write(info, buf, count, ppos);
> > > +	if (info->fbops->fb_read)
> > > +		return info->fbops->fb_read(info, buf, count, ppos);
> > > +	else
> > > +		return fb_cfb_read(info, buf, count, ppos);
> > > +}
> > > +
> > > +ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> > > +		     size_t count, loff_t *ppos)
> > > +{
> > > +	unsigned long p = *ppos;
> > > +	u8 *buffer, *src;
> > > +	u8 __iomem *dst;
> > > +	int c, cnt = 0, err = 0;
> > > +	unsigned long total_size;
> > >  
> > >  	total_size = info->screen_size;
> > >  
> > > @@ -895,6 +896,24 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> > >  
> > >  	return (cnt) ? cnt : err;
> > >  }
> > > +EXPORT_SYMBOL(fb_cfb_write);
> > > +
> > > +static ssize_t
> > > +fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> > > +{
> > > +	struct fb_info *info = file_fb_info(file);
> > > +
> > > +	if (!info || !info->screen_base)
> > > +		return -ENODEV;
> > > +
> > > +	if (info->state != FBINFO_STATE_RUNNING)
> > > +		return -EPERM;
> > > +
> > > +	if (info->fbops->fb_write)
> > > +		return info->fbops->fb_write(info, buf, count, ppos);
> > > +	else
> > > +		return fb_cfb_write(info, buf, count, ppos);
> > > +}
> > >  
> > >  int
> > >  fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
> > > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > > index 714187bc13ac..12ad83963db5 100644
> > > --- a/include/linux/fb.h
> > > +++ b/include/linux/fb.h
> > > @@ -593,6 +593,11 @@ extern int fb_blank(struct fb_info *info, int blank);
> > >  extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
> > >  extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
> > >  extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
> > > +extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf,
> > > +			   size_t count, loff_t *ppos);
> > > +extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> > > +			    size_t count, loff_t *ppos);
> > > +
> > >  /*
> > >   * Drawing operations where framebuffer is in system RAM
> > >   */
> > > -- 
> > > 2.27.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
