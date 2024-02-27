Return-Path: <linux-fbdev+bounces-1255-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E5868D4B
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Feb 2024 11:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03B6E1F27709
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Feb 2024 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAB71386A6;
	Tue, 27 Feb 2024 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="FzQIWa/0"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D41386A5
	for <linux-fbdev@vger.kernel.org>; Tue, 27 Feb 2024 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709029204; cv=none; b=Y0sLzx4XUhIjQt4D3g8cGgqI+6OpgvY74/uGbY9tBScRGHJqyEAewlcet8LUFRHej7OdyjYmy+l4srkOxFi5cfptZui/5Ewaib1f+9c/W2qluKQW9WYuUJcJt0m9LxUinfe+nbmFer0CCTwlQZDh7J2AmIpHxjk2LcMznJbQ6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709029204; c=relaxed/simple;
	bh=LyAbhudhxSq3yLeTK1bjs5FR0ITxA277HoI8dQfVDHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9eRV4S463PpWmfJsR9pmNHhZ01ZPLb+nWxOUi6VNS6/5tOjcaG7pmGLPV2i128Axlb2XUym/sUGlkvzGLchhIE27YUk5Du2vBWkcuudK7IM5NI/KzRa/7+fD8UeUbA9TfmSQozvwHS20MbNo2WM1AXdHwKxB5sSiqHPbXoXnFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=FzQIWa/0; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id A843760449;
	Tue, 27 Feb 2024 10:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709029201;
	bh=LyAbhudhxSq3yLeTK1bjs5FR0ITxA277HoI8dQfVDHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzQIWa/0QMI6mN04+ST5VP548LMGjL6oRyM8Ax/v/MTR+mHrH5/9a+DlRDy6phGcD
	 laiFZXZue1Y+exdbh0v+QuUlo68/i2jXcYFwoPWhO3HfV255NUTFCbJtIWmhqn1vI4
	 wD2rbkGvqEJeGZuavOvNzO50mb+eTYiSRSnWF6tAkRIGbwjMfoW+6b1rRjXgSoNS8s
	 CNWguV29qaNxMRLzfwgdsv5Q/Md0iHFq4ZP0jwn8zTi0ZUJ325RUTgu/4FBpkYOAeM
	 LApL1P6s019FyXnlrftk6wA3bDloRkrRwuYkOlJplzxOLHO5MipAlDguf24oeJavpN
	 d1LJyv2yA11Sg==
Date: Tue, 27 Feb 2024 12:19:34 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/2] Fixes for omapdrm console
Message-ID: <20240227101934.GC52537@atomide.com>
References: <20240225064700.48035-1-tony@atomide.com>
 <43fc93f1-d602-47ae-98e5-ee6be4ea5192@ideasonboard.com>
 <42255362-4720-414e-b442-f98355e92968@ideasonboard.com>
 <ab0b8471-97a6-479a-88aa-9bb25e91fb8a@suse.de>
 <20240226112549.GU5299@atomide.com>
 <20240227070624.GB52537@atomide.com>
 <7d98a0cd-e6d5-460d-8b91-35fa340736dd@suse.de>
 <20240227080146.GW5299@atomide.com>
 <587d60ae-221b-4c02-9891-17dc608009d3@suse.de>
 <20240227094651.GX5299@atomide.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227094651.GX5299@atomide.com>

* Tony Lindgren <tony@atomide.com> [240227 11:47]:
> * Thomas Zimmermann <tzimmermann@suse.de> [240227 09:16]:
> > I just realized the fb_deferred_io_mmap() is already exported. So please use
> > it instead of duplicating the code in omapdrm.
> > 
> > [1] https://elixir.bootlin.com/linux/v6.7/source/drivers/video/fbdev/core/fb_defio.c#L237
> 
> Yeah I have now:
> 
> static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> {
> 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> 
> 	return fb_deferred_io_mmap(info, vma);
> }
> 
> > I also noticed that omapdrm does not yet select the correct Kconfig symbols.
> > That can be fixed by
> > 
> >  1) creating Kconfig FB_DMAMEM_HELPERS_DEFERRED that are similar to their
> > SYSMEM equivalent at [2]. The tokens should look like this
> > 
> > configFB_DMAMEM_HELPERS_DEFERRED  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS_DEFERRED>
> > bool
> > depends onFB_CORE  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_CORE>
> > selectFB_DEFERRED_IO  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_DEFERRED_IO>
> > selectFB_DMAMEM_HELPERS  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS>
> 
> OK
> 
> >   2) and selecting it instead of FB_DMAMEM_HELPERS under omapdrm's Kconfig
> > symbol.
> 
> OK

So here's what I have now, does that look OK?

Regards,

Tony

8< -------------------------
diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,7 +4,7 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
-	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
 	default n
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -51,6 +51,10 @@ static void pan_worker(struct work_struct *work)
 	omap_gem_roll(bo, fbi->var.yoffset * npages);
 }
 
+FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(omap_fbdev,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area)
+
 static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 		struct fb_info *fbi)
 {
@@ -78,11 +82,9 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 
 static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
-	struct drm_fb_helper *helper = info->par;
-	struct drm_framebuffer *fb = helper->fb;
-	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
+	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 
-	return drm_gem_mmap_obj(bo, omap_gem_mmap_size(bo), vma);
+	return fb_deferred_io_mmap(info, vma);
 }
 
 static void omap_fbdev_fb_destroy(struct fb_info *info)
@@ -94,6 +96,7 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 	DBG();
 
+	fb_deferred_io_cleanup(info);
 	drm_fb_helper_fini(helper);
 
 	omap_gem_unpin(bo);
@@ -104,15 +107,19 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 	kfree(fbdev);
 }
 
+/*
+ * For now, we cannot use FB_DEFAULT_DEFERRED_OPS and fb_deferred_io_mmap()
+ * because we use write-combine.
+ */
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-	__FB_DEFAULT_DMAMEM_OPS_RDWR,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(omap_fbdev),
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
-	__FB_DEFAULT_DMAMEM_OPS_DRAW,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(omap_fbdev),
 	.fb_ioctl	= drm_fb_helper_ioctl,
 	.fb_mmap	= omap_fbdev_fb_mmap,
 	.fb_destroy	= omap_fbdev_fb_destroy,
@@ -213,6 +220,15 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	fbi->fix.smem_start = dma_addr;
 	fbi->fix.smem_len = bo->size;
 
+	/* deferred I/O */
+	helper->fbdefio.delay = HZ / 20;
+	helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+	fbi->fbdefio = &helper->fbdefio;
+	ret = fb_deferred_io_init(fbi);
+	if (ret)
+		goto fail;
+
 	/* if we have DMM, then we can use it for scrolling by just
 	 * shuffling pages around in DMM rather than doing sw blit.
 	 */
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -144,6 +144,12 @@ config FB_DMAMEM_HELPERS
 	select FB_SYS_IMAGEBLIT
 	select FB_SYSMEM_FOPS
 
+config FB_DMAMEM_HELPERS_DEFERRED
+	bool
+	depends on FB_CORE
+	select FB_DEFERRED_IO
+	select FB_DMAMEM_HELPERS
+
 config FB_IOMEM_FOPS
 	tristate
 	depends on FB_CORE
diff --git a/include/linux/fb.h b/include/linux/fb.h
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -686,6 +686,10 @@ extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
 	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
 
+#define FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(__prefix, __damage_range, __damage_area) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
+
 /*
  * Initializes struct fb_ops for deferred I/O.
  */
-- 
2.43.1

