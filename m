Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F872322C4
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jul 2020 18:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgG2QgM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 Jul 2020 12:36:12 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:40062 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2QgL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 Jul 2020 12:36:11 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 0494980694;
        Wed, 29 Jul 2020 18:36:04 +0200 (CEST)
Date:   Wed, 29 Jul 2020 18:36:03 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     daniel@ffwll.ch
Cc:     airlied@redhat.com, kraxel@redhat.com, b.zolnierkie@samsung.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        jani.nikula@intel.com, peda@axentia.se, dan.carpenter@oracle.com,
        natechancellor@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/5] fbdev/core: Export framebuffer read and write code
 as cfb_ function
Message-ID: <20200729163603.GA1369638@ravnborg.org>
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-3-tzimmermann@suse.de>
 <20200729135328.GP6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729135328.GP6419@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=25-AhOLfAAAA:8 a=gONR9GUwNXr2Ybgs0f4A:9
        a=CjuIK1q_8ugA:10 a=dnuY3_Gu-P7Vi9ynLKQe:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Daniel.

On Wed, Jul 29, 2020 at 03:53:28PM +0200, daniel@ffwll.ch wrote:
> On Wed, Jul 29, 2020 at 03:41:45PM +0200, Thomas Zimmermann wrote:
> > DRM fb helpers require read and write functions for framebuffer
> > memory. Export the existing code from fbdev.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Hm I'm not super sure whether we want to actually reuse this stuff ... We
> kinda don't care about the sparc special case, and just having an fbdev
> implementation witch has the switch between memcpy and memcpy_to/from_io
> in one single place sounds a lot simpler ...
> 
> This way we can have a clean split between the old horrors of real fbdev
> drivers, and a much cleaner world in drm. It would mean a bit of
> copypasting, but I think that's actually a good thing.
> 
> In general my idea for drm fbdev emulation is that for any area we have a
> problem we just ignore the entire fbmem.c code and write our own: mmap,
> backlight handling (still unsolved, and horrible), cfb vs sys here. This
> entire fbmem.c stuff is pretty bad midlayer, trying to avoid code
> duplication here doesn't seem worth it imo.
> 
> Thoughts?


I can see that fbmem is a mix of ioctl support and other stuff.
We could factor out all the ioctl parts of fbmem.c to a new file
named fbioctl.c.

And then let the ioctl parts call down into drm stuff and avoid reusing
the fbdev code when we first reach drm code.
This would require local copies of:
sys_read, sys_write, sys_fillrect, sys_copyarea, sys_imageblit
and more I think which I missed.

With local copies we could avoid some of the special cases and trim the
unctions to what is required by drm only.
And then no more fbmem dependencies and no dependencies to several of
the small helper functions. So less entanglement with fbdev core.

This all sounds simple so I am surely missing a lot a ugly details here.

And should we touch this anyway we need a test suite to verify not too
much breaks. To the best of my knowledge there is not yet such a test
suite :-( Maybe because people caring about fbdev are limited.

	Sam





> -Daniel
> 
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 53 ++++++++++++++++++++++----------
> >  include/linux/fb.h               |  5 +++
> >  2 files changed, 41 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index dd0ccf35f7b7..b496ff90db3e 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -759,25 +759,18 @@ static struct fb_info *file_fb_info(struct file *file)
> >  	return info;
> >  }
> >  
> > -static ssize_t
> > -fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > +ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
> > +		    loff_t *ppos)
> >  {
> >  	unsigned long p = *ppos;
> > -	struct fb_info *info = file_fb_info(file);
> >  	u8 *buffer, *dst;
> >  	u8 __iomem *src;
> >  	int c, cnt = 0, err = 0;
> >  	unsigned long total_size;
> >  
> > -	if (!info || ! info->screen_base)
> > -		return -ENODEV;
> > -
> >  	if (info->state != FBINFO_STATE_RUNNING)
> >  		return -EPERM;
> >  
> > -	if (info->fbops->fb_read)
> > -		return info->fbops->fb_read(info, buf, count, ppos);
> > -
> >  	total_size = info->screen_size;
> >  
> >  	if (total_size == 0)
> > @@ -823,16 +816,12 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> >  
> >  	return (err) ? err : cnt;
> >  }
> > +EXPORT_SYMBOL(fb_cfb_read);
> >  
> >  static ssize_t
> > -fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> > +fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> >  {
> > -	unsigned long p = *ppos;
> >  	struct fb_info *info = file_fb_info(file);
> > -	u8 *buffer, *src;
> > -	u8 __iomem *dst;
> > -	int c, cnt = 0, err = 0;
> > -	unsigned long total_size;
> >  
> >  	if (!info || !info->screen_base)
> >  		return -ENODEV;
> > @@ -840,8 +829,20 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> >  	if (info->state != FBINFO_STATE_RUNNING)
> >  		return -EPERM;
> >  
> > -	if (info->fbops->fb_write)
> > -		return info->fbops->fb_write(info, buf, count, ppos);
> > +	if (info->fbops->fb_read)
> > +		return info->fbops->fb_read(info, buf, count, ppos);
> > +	else
> > +		return fb_cfb_read(info, buf, count, ppos);
> > +}
> > +
> > +ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> > +		     size_t count, loff_t *ppos)
> > +{
> > +	unsigned long p = *ppos;
> > +	u8 *buffer, *src;
> > +	u8 __iomem *dst;
> > +	int c, cnt = 0, err = 0;
> > +	unsigned long total_size;
> >  
> >  	total_size = info->screen_size;
> >  
> > @@ -895,6 +896,24 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> >  
> >  	return (cnt) ? cnt : err;
> >  }
> > +EXPORT_SYMBOL(fb_cfb_write);
> > +
> > +static ssize_t
> > +fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> > +{
> > +	struct fb_info *info = file_fb_info(file);
> > +
> > +	if (!info || !info->screen_base)
> > +		return -ENODEV;
> > +
> > +	if (info->state != FBINFO_STATE_RUNNING)
> > +		return -EPERM;
> > +
> > +	if (info->fbops->fb_write)
> > +		return info->fbops->fb_write(info, buf, count, ppos);
> > +	else
> > +		return fb_cfb_write(info, buf, count, ppos);
> > +}
> >  
> >  int
> >  fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index 714187bc13ac..12ad83963db5 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -593,6 +593,11 @@ extern int fb_blank(struct fb_info *info, int blank);
> >  extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
> >  extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
> >  extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
> > +extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf,
> > +			   size_t count, loff_t *ppos);
> > +extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> > +			    size_t count, loff_t *ppos);
> > +
> >  /*
> >   * Drawing operations where framebuffer is in system RAM
> >   */
> > -- 
> > 2.27.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
