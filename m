Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC4074A348
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Jul 2023 19:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbjGFRl1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Jul 2023 13:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbjGFRl0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Jul 2023 13:41:26 -0400
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0F1119
        for <linux-fbdev@vger.kernel.org>; Thu,  6 Jul 2023 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=gbW6gVUtqEDhrplZuNriGt0DcDjAaAYbbMTkKzTuEww=;
        b=pPuLnhn0ELrr+4P0dErZhr2c3dwlOf7sntZqo6sOtYKD1pNe5addOGjXQVzx3vnMPKsd2rMxkh7Fc
         uvbxGuUN3aIHVaUfFBSvziMjPEi8lV5k5EIL0TCqwjgg5Xmk/J1i1fsN7PEGZMsyFoLN7lMrjIdzVD
         eZ+K3O9s7BinYQQnJXCtrKLsvAJcIdJK2lXxInnm7HvZ1Jiixmz5TPf1mxr4bHdgX50MGs/IheIs21
         9axyYHkxDgLQd7ln8aychFYsnGBY9mnNzzPaR4nxYYrrc2be0HPb7FTVJCDrRO479j3/lNMh8IXRBL
         wfcM85uDy4w8a102nuNpm4aroKF+0Jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=gbW6gVUtqEDhrplZuNriGt0DcDjAaAYbbMTkKzTuEww=;
        b=JZ8zeMWNXI5pKW7iQ+ig85yCFkSJTBCXwNzOOG9mV2Bm37tw0i2L4ZJLHRqi2rPXscCOR6rjExB0R
         tILIc9VDQ==
X-HalOne-ID: 51ccfb9d-1c24-11ee-b2aa-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay6 (Halon) with ESMTPSA
        id 51ccfb9d-1c24-11ee-b2aa-6f01c1d0a443;
        Thu, 06 Jul 2023 17:41:22 +0000 (UTC)
Date:   Thu, 6 Jul 2023 19:41:21 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     javierm@redhat.com, deller@gmx.de, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 08/10] fbdev/ssd1307fb: Generate deferred I/O ops
Message-ID: <20230706174121.GA226645@ravnborg.org>
References: <20230706151432.20674-1-tzimmermann@suse.de>
 <20230706151432.20674-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706151432.20674-9-tzimmermann@suse.de>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jul 06, 2023 at 05:08:51PM +0200, Thomas Zimmermann wrote:
> Use the existing generator macros to create deferred-I/O helpers
> for ssd1307fb and set them in the fb_ops structure. Functions
> for damage handling on memory ranges and areas are provided by
> the driver.
> 
> Ssd1307fb's implementation of fb_write writes to system memory,
> so the generated code can use the respective helper internally.
> This also fixes a long-standing bug where fb_write returned an
> errno code instead of the number of written bytes. See the commit
> message of commit 921b7383f348 ("fbdev: Return number of bytes
> read or written") for more details.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/ssd1307fb.c | 69 ++++++---------------------------
>  1 file changed, 11 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 11c373798279..a2b939342a4f 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -292,43 +292,6 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
>  	return ssd1307fb_update_rect(par, 0, 0, par->width, par->height);
>  }
>  
> -static ssize_t ssd1307fb_write(struct fb_info *info, const char __user *buf,
> -		size_t count, loff_t *ppos)
> -{
> -	struct ssd1307fb_par *par = info->par;
> -	unsigned long total_size;
> -	unsigned long p = *ppos;
> -	void *dst;
> -	int ret;
> -
> -	if (!info->screen_buffer)
> -		return -ENODEV;
> -
> -	total_size = info->fix.smem_len;
> -
> -	if (p > total_size)
> -		return -EINVAL;
> -
> -	if (count + p > total_size)
> -		count = total_size - p;
> -
> -	if (!count)
> -		return -EINVAL;
> -
> -	dst = info->screen_buffer + p;
> -
> -	if (copy_from_user(dst, buf, count))
> -		return -EFAULT;
> -
> -	ret = ssd1307fb_update_display(par);
> -	if (ret < 0)
> -		return ret;
> -
> -	*ppos += count;
> -
> -	return count;
> -}
> -
>  static int ssd1307fb_blank(int blank_mode, struct fb_info *info)
>  {
>  	struct ssd1307fb_par *par = info->par;
> @@ -339,39 +302,29 @@ static int ssd1307fb_blank(int blank_mode, struct fb_info *info)
>  		return ssd1307fb_write_cmd(par->client, SSD1307FB_DISPLAY_ON);
>  }
>  
> -static void ssd1307fb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
> +static void ssd1307fb_defio_damage_range(struct fb_info *info, off_t off, size_t len)
>  {
>  	struct ssd1307fb_par *par = info->par;
> -	sys_fillrect(info, rect);
> -	ssd1307fb_update_rect(par, rect->dx, rect->dy, rect->width,
> -			      rect->height);
> -}
>  
> -static void ssd1307fb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
> -{
> -	struct ssd1307fb_par *par = info->par;
> -	sys_copyarea(info, area);
> -	ssd1307fb_update_rect(par, area->dx, area->dy, area->width,
> -			      area->height);
> +	ssd1307fb_update_display(par);
>  }
>  
> -static void ssd1307fb_imageblit(struct fb_info *info, const struct fb_image *image)
> +static void ssd1307fb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
> +					u32 width, u32 height)
>  {
>  	struct ssd1307fb_par *par = info->par;
> -	sys_imageblit(info, image);
> -	ssd1307fb_update_rect(par, image->dx, image->dy, image->width,
> -			      image->height);
> +
> +	ssd1307fb_update_rect(par, x, y, width, height);
>  }
>  
> +FB_GEN_DEFAULT_DEFERRED_SYS_OPS(ssd1307fb,
> +				ssd1307fb_defio_damage_range,
> +				ssd1307fb_defio_damage_area)
> +
>  static const struct fb_ops ssd1307fb_ops = {
>  	.owner		= THIS_MODULE,

Nitpick..
In other patches the tab after the equal sign is replaced by a single
space.

	Sam

> -	.fb_read	= fb_sys_read,
> -	.fb_write	= ssd1307fb_write,
> +	FB_DEFAULT_DEFERRED_OPS(ssd1307fb),
>  	.fb_blank	= ssd1307fb_blank,
> -	.fb_fillrect	= ssd1307fb_fillrect,
> -	.fb_copyarea	= ssd1307fb_copyarea,
> -	.fb_imageblit	= ssd1307fb_imageblit,
> -	.fb_mmap	= fb_deferred_io_mmap,
>  };
>  
>  static void ssd1307fb_deferred_io(struct fb_info *info, struct list_head *pagereflist)
> -- 
> 2.41.0
