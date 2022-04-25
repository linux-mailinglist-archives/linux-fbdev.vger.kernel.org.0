Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7ED250E823
	for <lists+linux-fbdev@lfdr.de>; Mon, 25 Apr 2022 20:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244339AbiDYS2B (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 25 Apr 2022 14:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243533AbiDYS2A (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 25 Apr 2022 14:28:00 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD6011246C
        for <linux-fbdev@vger.kernel.org>; Mon, 25 Apr 2022 11:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=7kuXBnYKbene2Vy5ddL4QLJVZExSdzHjcyeztknIyk4=;
        b=g54t+7+cA0BilM+bYHzEsaEveTEyQJ+5dppgZAbR6Xo0XoUL+atLdfkhvy6JhRz93JqMZub0n31YJ
         GW9s7q0LnjHgW0uVlF3LM+b0UOxx49lF3FCZE1Sr9v85yF6ruQcIZInVxzqWJTp4BNAzIfa29/mZGi
         /nHCGu+PaACQ88NAi0zBNX0BNARy+uMe4dNU+ayQ1FKYmQ48aBvNCGmG0PI4ExVvl6BHO/msnK+V3d
         cPbC0oqAVyFud1OfkJhySO/YQYcF08pGIg/zj5z7Uzz/Tia6iW8zvci8V9QSsITqhOftMpJJ5cz6AM
         ehhxzgqp6Wa4BQME5zAfNGWRJlMG7AQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=7kuXBnYKbene2Vy5ddL4QLJVZExSdzHjcyeztknIyk4=;
        b=jXXrW02P8sqjJ8y8GvxFepLYXJmArqv5iYyQYwNR7yrBfFBE22owmPMu6GJwKlNjJW2r3b7/pQOUe
         53W7U0qCA==
X-HalOne-Cookie: fbc2a83891d50f0728fc12458d75734d1cf92e37
X-HalOne-ID: ff763677-c4c4-11ec-be69-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id ff763677-c4c4-11ec-be69-d0431ea8bb03;
        Mon, 25 Apr 2022 18:24:52 +0000 (UTC)
Date:   Mon, 25 Apr 2022 20:24:50 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de,
        airlied@linux.ie, maarten.lankhorst@linux.intel.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] fbdev: Refactor implementation of page_mkwrite
Message-ID: <YmbncpwerOQLB1cS@ravnborg.org>
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425112751.25985-4-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas.

On Mon, Apr 25, 2022 at 01:27:51PM +0200, Thomas Zimmermann wrote:
> Refactor the page-write handler for deferred I/O. Drivers use the
> function to let fbdev track written pages of mmap'ed framebuffer
> memory.

I like how the comments got a brush up and a little more info was added.
But I do not see the point of the refactoring - the code is equally
readable before and after - maybe even easier before (modulus the
improved comments).

But if you consider it better keep it. Again just my thoughts when
reading the code.

	Sam

> 
> v2:
> 	* don't export the helper until we have an external caller
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/video/fbdev/core/fb_defio.c | 68 ++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index a03b9c64fc61..214581ce5840 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -143,29 +143,18 @@ int fb_deferred_io_fsync(struct file *file, loff_t start, loff_t end, int datasy
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_fsync);
>  
> -/* vm_ops->page_mkwrite handler */
> -static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
> +/*
> + * Adds a page to the dirty list. Requires caller to hold
> + * struct fb_deferred_io.lock. Call this from struct
> + * vm_operations_struct.page_mkwrite.
> + */
> +static vm_fault_t __fb_deferred_io_track_page(struct fb_info *info, unsigned long offset,
> +					      struct page *page)
>  {
> -	struct page *page = vmf->page;
> -	struct fb_info *info = vmf->vma->vm_private_data;
>  	struct fb_deferred_io *fbdefio = info->fbdefio;
>  	struct fb_deferred_io_pageref *pageref;
> -	unsigned long offset;
>  	vm_fault_t ret;
>  
> -	offset = (vmf->address - vmf->vma->vm_start);
> -
> -	/* this is a callback we get when userspace first tries to
> -	write to the page. we schedule a workqueue. that workqueue
> -	will eventually mkclean the touched pages and execute the
> -	deferred framebuffer IO. then if userspace touches a page
> -	again, we repeat the same scheme */
> -
> -	file_update_time(vmf->vma->vm_file);
> -
> -	/* protect against the workqueue changing the page list */
> -	mutex_lock(&fbdefio->lock);
> -
>  	/* first write in this cycle, notify the driver */
>  	if (fbdefio->first_io && list_empty(&fbdefio->pagelist))
>  		fbdefio->first_io(info);
> @@ -186,8 +175,6 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
>  	 */
>  	lock_page(pageref->page);
>  
> -	mutex_unlock(&fbdefio->lock);
> -
>  	/* come back after delay to process the deferred IO */
>  	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
>  	return VM_FAULT_LOCKED;
> @@ -197,6 +184,47 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +/*
> + * fb_deferred_io_page_mkwrite - Mark a page as written for deferred I/O
> + * @fb_info: The fbdev info structure
> + * @vmf: The VM fault
> + *
> + * This is a callback we get when userspace first tries to
> + * write to the page. We schedule a workqueue. That workqueue
> + * will eventually mkclean the touched pages and execute the
> + * deferred framebuffer IO. Then if userspace touches a page
> + * again, we repeat the same scheme.
> + *
> + * Returns:
> + * VM_FAULT_LOCKED on success, or a VM_FAULT error otherwise.
> + */
> +static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
> +{
> +	struct page *page = vmf->page;
> +	struct fb_deferred_io *fbdefio = info->fbdefio;
> +	unsigned long offset;
> +	vm_fault_t ret;
> +
> +	offset = (vmf->address - vmf->vma->vm_start);
> +
> +	file_update_time(vmf->vma->vm_file);
> +
> +	/* protect against the workqueue changing the page list */
> +	mutex_lock(&fbdefio->lock);
> +	ret = __fb_deferred_io_track_page(info, offset, page);
> +	mutex_unlock(&fbdefio->lock);
> +
> +	return ret;
> +}
> +
> +/* vm_ops->page_mkwrite handler */
> +static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
> +{
> +	struct fb_info *info = vmf->vma->vm_private_data;
> +
> +	return fb_deferred_io_page_mkwrite(info, vmf);
> +}
> +
>  static const struct vm_operations_struct fb_deferred_io_vm_ops = {
>  	.fault		= fb_deferred_io_fault,
>  	.page_mkwrite	= fb_deferred_io_mkwrite,
> -- 
> 2.36.0
