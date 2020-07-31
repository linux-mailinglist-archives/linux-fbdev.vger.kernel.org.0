Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C7C234274
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jul 2020 11:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732311AbgGaJXA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 31 Jul 2020 05:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732300AbgGaJW6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 31 Jul 2020 05:22:58 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3727DC061574
        for <linux-fbdev@vger.kernel.org>; Fri, 31 Jul 2020 02:22:58 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c80so7980784wme.0
        for <linux-fbdev@vger.kernel.org>; Fri, 31 Jul 2020 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=F2PtALdqAvOKlHMouc/UHQg0AyIKMF6tOdHFxCR8C4o=;
        b=BUMlHQTuv8PxUPs0P2kDRzo0R4NtPJJs7OTIEu+LlfuKecw8i2CcAlny+lDQSG+TKs
         FewcJb+7D+mXfW6IPI5SUmwKWNosQ1r8cNGIk7J6LQdKFp0U4cUmE62fkhsj5BDim4mF
         qTsvvBvdJZkMS690+Bvw4/A2dWjpmgqrPPBOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F2PtALdqAvOKlHMouc/UHQg0AyIKMF6tOdHFxCR8C4o=;
        b=KRHXHOjXKQUrHprkMOvKd1ZgFubtk7elk46FyUH2P2RPQK5mkVlbf4DORCs2C1hWMt
         ID3reqVYkKiWY17Mgo6N/Q+xjpmtqFqmnQ5WkDFMUrla46sf0gXxG2N4PvPOCmIy8Q+9
         z3d5ea+IDP0UBr0oXPacQsl7GtQ4VjWD/8KlMjzb9LYNXxdlWGBpkShaMaX/5TFaeNJc
         Dp1z+m+kmjEVU/Qw84WxSvXlaD8jEaYhnt2LiMs8Jg/VmefpXESf6v5n14A2hsAiWdBh
         3DJn6y8ncY6oqZ7TOruxmhoTws7vN9bgoGSGPbcMjDWgpFjx5i77OTB48hLiRuagRoEW
         OKNg==
X-Gm-Message-State: AOAM532PGyH69fWFUzgohk+O3ys2sPUVn/1wAvHNkO/jId9jAA9BxdO7
        oYOpMC2OR6IUVISsaW+jIy6KWw==
X-Google-Smtp-Source: ABdhPJwJfLtNsdKly8AesJccVAPZnHfT7JVS6f8LUkjazzqTTyGG1tOH5GI9iz7vc70MgXIVCGd8Lg==
X-Received: by 2002:a1c:66c5:: with SMTP id a188mr2957618wmc.173.1596187376689;
        Fri, 31 Jul 2020 02:22:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v8sm11642914wmb.24.2020.07.31.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 02:22:56 -0700 (PDT)
Date:   Fri, 31 Jul 2020 11:22:54 +0200
From:   daniel@ffwll.ch
Cc:     daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
        kraxel@redhat.com, b.zolnierkie@samsung.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        jani.nikula@intel.com, peda@axentia.se, dan.carpenter@oracle.com,
        natechancellor@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/5] drm: Add infrastructure for vmap operations of I/O
 memory
Message-ID: <20200731092254.GW6419@phenom.ffwll.local>
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-4-tzimmermann@suse.de>
 <20200729135744.GQ6419@phenom.ffwll.local>
 <79a17df5-5654-ccf7-e3aa-5c74894b436f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79a17df5-5654-ccf7-e3aa-5c74894b436f@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jul 30, 2020 at 10:14:43AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 29.07.20 um 15:57 schrieb daniel@ffwll.ch:
> > On Wed, Jul 29, 2020 at 03:41:46PM +0200, Thomas Zimmermann wrote:
> >> Most platforms allow for accessing framebuffer I/O memory with regular
> >> load and store operations. Some platforms, such as sparc64, require
> >> the use of special instructions instead.
> >>
> >> This patch adds vmap_iomem to struct drm_gem_object_funcs. The new
> >> interface drm_client_buffer_vmap_iomem() gives DRM clients access to the
> >> I/O memory buffer. The semantics of struct drm_gem_objcet_funcs.vmap
> >> change slightly. It used to return system or I/O memory. Now it is
> >> expected to return memory addresses that can be accessed with regular
> >> load and store operations. So nothing changes for existing implementations
> >> of GEM objects. If the GEM object also implements vmap_iomem, a call
> >> to vmap shall only return system memory, even if I/O memory could be
> >> accessed with loads and stores.
> >>
> >> The existing interface drm_client_buffer_vmap() shall only return memory
> >> as given by drm_gem_vmap ((i.e., that is accessible via regular load and
> >> store). The new interface drm_client_buffer_vmap_iomem() shall only
> >> return I/O memory.
> >>
> >> DRM clients must map buffers by calling drm_client_buffer_vmap_iomem()
> >> and drm_client_buffer_vmap() to get the buffer in I/O or system memory.
> >> Each function returns NULL if the buffer is in the other memory area.
> >> Depending on the type of the returned memory, clients must access the
> >> framebuffer with the appropriate operations.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > Hm I don't think this works, since for more dynamic framebuffers (like
> > real big gpu ttm drivers) this is a dynamic thing, which can change every
> > time we do an mmap. So I think the ttm approach of having an is_iomem flag
> > is a lot better.
> > 
> > The trouble with that is that you don't have correct checking of sparse
> > mappings, but oh well :-/ The one idea I've had to address that is using
> > something like this
> > 
> > typedef dma_buf_addr_t {
> > 	bool is_iomem;
> > 	union {
> > 		void __iomem *vaddr_iomem;
> > 		void vaddr;
> > 	};
> > };
> > 
> > And then having a wrapper for memcpy_from_dma_buf_addr and
> > memcpy_to_dma_buf_addr, which switches between memcpy and memcpy_from/toio
> > depending upon the is_iomem flag.
> > 
> > But it's a lot more invasive unfortunately :-/
> 
> What do you think about introducing read and write callbacks for GEM
> objects? Like this:
> 
>   int drm_gem_read(struct drm_gem_object *gbo, size_t off, size_t len,
> void *buf);
> 
>   int drm_gem_write(struct drm_gem_object *gbo, size_t off, size_t len,
> const void *buf);
> 
> The common case would by memcpy, but GEM implementations could provide
> their own thing. The fbdev blit function would look like
> 
>   vaddr = drm_gem_vmap(gbo)
>   if (IS_ERR(vaddr))
>     return
> 
>   for (each line) {
>     drm_gem_write(gbo, gbo_line_offset, line_size, src)
>     gbo_line_offset = /* next line */
>     src = /* next line */
>   }
> 
>   drm_gem_vunmap(gbo);
> 
> The whole mess about I/O access would be self-contained.

Copying the irc discussion over: We've had that idea floating around years
ago, i915-gem even implemented in the form of pwrite/pread for usersapce.
But now all userspace moved over to mmap, so read/write has fallen out of
favour.

I'm also not sure whether we really need to fix more than just fbcon on
fbdev on drm emulation, and it feels a bit silly to add read/write just
for that. Also the is_iomem flag on the vmap (and maybe eventually on
mmap, no idea) might be able to let us fix this at least for real
eventually.

Cheers, Daniel

> 
> Best regards
> Thomas
> 
> > -Daniel
> > 
> >> ---
> >>  drivers/gpu/drm/drm_client.c   | 52 ++++++++++++++++++++++++++++++++--
> >>  drivers/gpu/drm/drm_gem.c      | 19 +++++++++++++
> >>  drivers/gpu/drm/drm_internal.h |  1 +
> >>  include/drm/drm_client.h       |  8 +++++-
> >>  include/drm/drm_gem.h          | 17 +++++++++--
> >>  5 files changed, 91 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> >> index 495f47d23d87..b5bbe089a41e 100644
> >> --- a/drivers/gpu/drm/drm_client.c
> >> +++ b/drivers/gpu/drm/drm_client.c
> >> @@ -327,6 +327,46 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
> >>  }
> >>  EXPORT_SYMBOL(drm_client_buffer_vmap);
> >>  
> >> +/**
> >> + * drm_client_buffer_vmap_iomem - Map DRM client buffer into address space
> >> + * @buffer: DRM client buffer
> >> + *
> >> + * This function maps a client buffer into kernel address space. If the
> >> + * buffer is already mapped, it returns the mapping's address.
> >> + *
> >> + * Client buffer mappings are not ref'counted. Each call to
> >> + * drm_client_buffer_vmap() should be followed by a call to
> >> + * drm_client_buffer_vunmap(); or the client buffer should be mapped
> >> + * throughout its lifetime.
> >> + *
> >> + * Returns:
> >> + *	The mapped memory's address
> >> + */
> >> +void __iomem *drm_client_buffer_vmap_iomem(struct drm_client_buffer *buffer)
> >> +{
> >> +	void __iomem *vaddr_iomem;
> >> +
> >> +	if (buffer->vaddr_iomem)
> >> +		return buffer->vaddr_iomem;
> >> +
> >> +	/*
> >> +	 * FIXME: The dependency on GEM here isn't required, we could
> >> +	 * convert the driver handle to a dma-buf instead and use the
> >> +	 * backend-agnostic dma-buf vmap support instead. This would
> >> +	 * require that the handle2fd prime ioctl is reworked to pull the
> >> +	 * fd_install step out of the driver backend hooks, to make that
> >> +	 * final step optional for internal users.
> >> +	 */
> >> +	vaddr_iomem = drm_gem_vmap_iomem(buffer->gem);
> >> +	if (IS_ERR(vaddr_iomem))
> >> +		return vaddr_iomem;
> >> +
> >> +	buffer->vaddr_iomem = vaddr_iomem;
> >> +
> >> +	return vaddr_iomem;
> >> +}
> >> +EXPORT_SYMBOL(drm_client_buffer_vmap_iomem);
> >> +
> >>  /**
> >>   * drm_client_buffer_vunmap - Unmap DRM client buffer
> >>   * @buffer: DRM client buffer
> >> @@ -337,8 +377,16 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
> >>   */
> >>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
> >>  {
> >> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> >> -	buffer->vaddr = NULL;
> >> +	drm_WARN_ON(buffer->client->dev, buffer->vaddr && buffer->vaddr_iomem);
> >> +
> >> +	if (buffer->vaddr) {
> >> +		drm_gem_vunmap(buffer->gem, buffer->vaddr);
> >> +		buffer->vaddr = NULL;
> >> +	}
> >> +	if (buffer->vaddr_iomem) {
> >> +		drm_gem_vunmap(buffer->gem, (void *)buffer->vaddr_iomem);
> >> +		buffer->vaddr_iomem = NULL;
> >> +	}
> >>  }
> >>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
> >>  
> >> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >> index a57f5379fc08..a001be8c0965 100644
> >> --- a/drivers/gpu/drm/drm_gem.c
> >> +++ b/drivers/gpu/drm/drm_gem.c
> >> @@ -1227,6 +1227,25 @@ void *drm_gem_vmap(struct drm_gem_object *obj)
> >>  		vaddr = obj->funcs->vmap(obj);
> >>  	else if (obj->dev->driver->gem_prime_vmap)
> >>  		vaddr = obj->dev->driver->gem_prime_vmap(obj);
> >> +	else if (obj->funcs && obj->funcs->vmap_iomem)
> >> +		vaddr = NULL; /* requires mapping as I/O memory */
> >> +	else
> >> +		vaddr = ERR_PTR(-EOPNOTSUPP);
> >> +
> >> +	if (!vaddr)
> >> +		vaddr = ERR_PTR(-ENOMEM);
> >> +
> >> +	return vaddr;
> >> +}
> >> +
> >> +void __iomem *drm_gem_vmap_iomem(struct drm_gem_object *obj)
> >> +{
> >> +	void __iomem *vaddr;
> >> +
> >> +	if (obj->funcs && obj->funcs->vmap_iomem)
> >> +		vaddr = obj->funcs->vmap_iomem(obj);
> >> +	else if (obj->funcs && obj->funcs->vmap)
> >> +		vaddr = NULL; /* requires mapping as system memory */
> >>  	else
> >>  		vaddr = ERR_PTR(-EOPNOTSUPP);
> >>  
> >> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> >> index 8e01caaf95cc..aa1a3d4f9223 100644
> >> --- a/drivers/gpu/drm/drm_internal.h
> >> +++ b/drivers/gpu/drm/drm_internal.h
> >> @@ -187,6 +187,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
> >>  int drm_gem_pin(struct drm_gem_object *obj);
> >>  void drm_gem_unpin(struct drm_gem_object *obj);
> >>  void *drm_gem_vmap(struct drm_gem_object *obj);
> >> +void __iomem *drm_gem_vmap_iomem(struct drm_gem_object *obj);
> >>  void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
> >>  
> >>  /* drm_debugfs.c drm_debugfs_crc.c */
> >> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> >> index 7aaea665bfc2..94aa075ee4b6 100644
> >> --- a/include/drm/drm_client.h
> >> +++ b/include/drm/drm_client.h
> >> @@ -141,10 +141,15 @@ struct drm_client_buffer {
> >>  	struct drm_gem_object *gem;
> >>  
> >>  	/**
> >> -	 * @vaddr: Virtual address for the buffer
> >> +	 * @vaddr: Virtual address for the buffer in system memory
> >>  	 */
> >>  	void *vaddr;
> >>  
> >> +	/**
> >> +	 * @vaddr: Virtual address for the buffer in I/O memory
> >> +	 */
> >> +	void *vaddr_iomem;
> >> +
> >>  	/**
> >>  	 * @fb: DRM framebuffer
> >>  	 */
> >> @@ -156,6 +161,7 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
> >>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> >>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
> >>  void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
> >> +void __iomem *drm_client_buffer_vmap_iomem(struct drm_client_buffer *buffer);
> >>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
> >>  
> >>  int drm_client_modeset_create(struct drm_client_dev *client);
> >> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> >> index 337a48321705..bc735ff522a8 100644
> >> --- a/include/drm/drm_gem.h
> >> +++ b/include/drm/drm_gem.h
> >> @@ -134,17 +134,28 @@ struct drm_gem_object_funcs {
> >>  	 * @vmap:
> >>  	 *
> >>  	 * Returns a virtual address for the buffer. Used by the
> >> -	 * drm_gem_dmabuf_vmap() helper.
> >> +	 * drm_gem_dmabuf_vmap() helper. If the buffer is not
> >> +	 * located in system memory, the function returns NULL.
> >>  	 *
> >>  	 * This callback is optional.
> >>  	 */
> >>  	void *(*vmap)(struct drm_gem_object *obj);
> >>  
> >> +	/**
> >> +	 * @vmap_iomem:
> >> +	 *
> >> +	 * Returns a virtual address for the buffer. If the buffer is not
> >> +	 * located in I/O memory, the function returns NULL.
> >> +	 *
> >> +	 * This callback is optional.
> >> +	 */
> >> +	void __iomem *(*vmap_iomem)(struct drm_gem_object *obj);
> >> +
> >>  	/**
> >>  	 * @vunmap:
> >>  	 *
> >> -	 * Releases the address previously returned by @vmap. Used by the
> >> -	 * drm_gem_dmabuf_vunmap() helper.
> >> +	 * Releases the address previously returned by @vmap or @vmap_iomem.
> >> +	 * Used by the drm_gem_dmabuf_vunmap() helper.
> >>  	 *
> >>  	 * This callback is optional.
> >>  	 */
> >> -- 
> >> 2.27.0
> >>
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Felix Imend�rffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
