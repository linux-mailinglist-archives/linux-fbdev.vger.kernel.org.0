Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9192C50E778
	for <lists+linux-fbdev@lfdr.de>; Mon, 25 Apr 2022 19:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242750AbiDYRuE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 25 Apr 2022 13:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235684AbiDYRuE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 25 Apr 2022 13:50:04 -0400
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901881C901
        for <linux-fbdev@vger.kernel.org>; Mon, 25 Apr 2022 10:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=wLUmUeHVyJX9afsutX3xLdFQV+vAlD5FZapuJ+ZSqgI=;
        b=JmMQHZDt456dDRO3ht2PPyuSljzBpy4RYLU/ZUXX01/1lS1LPy/mkQGtsl8SM6PzEUzw3MVrED1di
         WA0RINPw7vZ0hH1RP/1OwKOLSsyuModUhEaWBnZUnwUFQ7+eJ7uTQub2naU2aV9BjoksQktzzPNt3H
         5W2zKNmFDIAwY2MAjS3QOdMjLDNmlte/DxFPvgO6irbM3WfSzc8gCeGLEdy+Mz+avxhMuYzSDnxNVr
         BxHGj8/C7kPNpjRpWZ+ulvXojtK6+LWTUFdqrh0IUn2PPeNhXvMlvCVhkiH79/M4VQ5uubDdyo5n1Z
         zd3RF/pEalj36qaYlVazJ/BweLj3KVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=wLUmUeHVyJX9afsutX3xLdFQV+vAlD5FZapuJ+ZSqgI=;
        b=VxDRTx3fkE5BJbSS846w6+epT06MYLAASTua0OfWOi7eiFwBVzY+42wcBt8c1MD67sVPWQOP6gHFA
         6t0e3SfDA==
X-HalOne-Cookie: aa683d150876407bc5e03b6084f90a79eaae35b0
X-HalOne-ID: b2a720be-c4bf-11ec-a907-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id b2a720be-c4bf-11ec-a907-d0431ea8a290;
        Mon, 25 Apr 2022 17:46:55 +0000 (UTC)
Date:   Mon, 25 Apr 2022 19:46:54 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de,
        javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] fbdev: Put mmap for deferred I/O into drivers
Message-ID: <Ymbejo2702tUUyNW@ravnborg.org>
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-2-tzimmermann@suse.de>
 <YmbZyI0kVzLo2gR6@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmbZyI0kVzLo2gR6@ravnborg.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas,

On Mon, Apr 25, 2022 at 07:26:32PM +0200, Sam Ravnborg wrote:
> Hi Thomas,
> 
> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > index 6aaf6d0abf39..6924d489a289 100644
> > --- a/drivers/video/fbdev/core/fb_defio.c
> > +++ b/drivers/video/fbdev/core/fb_defio.c
> > @@ -181,6 +181,7 @@ int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
> >  	vma->vm_private_data = info;
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(fb_deferred_io_mmap);
> >  
> >  /* workqueue callback */
> >  static void fb_deferred_io_work(struct work_struct *work)
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index 84427470367b..52440e3f8f69 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1334,7 +1334,6 @@ static int
> >  fb_mmap(struct file *file, struct vm_area_struct * vma)
> >  {
> >  	struct fb_info *info = file_fb_info(file);
> > -	int (*fb_mmap_fn)(struct fb_info *info, struct vm_area_struct *vma);
> >  	unsigned long mmio_pgoff;
> >  	unsigned long start;
> >  	u32 len;
> > @@ -1343,14 +1342,7 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
> >  		return -ENODEV;
> >  	mutex_lock(&info->mm_lock);
> >  
> > -	fb_mmap_fn = info->fbops->fb_mmap;
> > -
> > -#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> > -	if (info->fbdefio)
> > -		fb_mmap_fn = fb_deferred_io_mmap;
> > -#endif
> > -
> > -	if (fb_mmap_fn) {
> > +	if (info->fbops->fb_mmap) {
> >  		int res;
> >  
> >  		/*
> > @@ -1358,11 +1350,18 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
> >  		 * SME protection is removed ahead of the call
> >  		 */
> >  		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> > -		res = fb_mmap_fn(info, vma);
> > +		res = info->fbops->fb_mmap(info, vma);
> >  		mutex_unlock(&info->mm_lock);
> >  		return res;
> >  	}
> >  
> > +	/*
> > +	 * FB deferred I/O wants you to handle mmap in your drivers. At a
> > +	 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
> > +	 */
> > +	if (dev_WARN_ONCE(info->dev, info->fbdefio, "fbdev mmap not set up for defered I/O.\n"))
> > +		return -ENODEV;
> > +
> 
> If not configured - then why not just call fb_deferred_io_mmap(), as
> this seems to be the default implementation anyway.
> Then drivers that needs it can override - and the rest fallback to the
> default.

Just to be clear - I already read:
"
Leave the mmap handling to drivers and expect them to call the
helper for deferred I/O by thmeselves.
"

But this does not help me understand why we need to explicit do what
could be a simple default implementation.
Chances are that I am stupid and it is obvious..

	Sam
