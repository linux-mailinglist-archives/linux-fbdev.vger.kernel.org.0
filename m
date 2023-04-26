Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4376EF1DD
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Apr 2023 12:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240083AbjDZKZ2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Apr 2023 06:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240036AbjDZKZ1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Apr 2023 06:25:27 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4D92E3A94
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Apr 2023 03:25:25 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:58796.1837125814
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id AF5AB1002A7;
        Wed, 26 Apr 2023 18:25:22 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-85667d6c59-lhcrq with ESMTP id 44cd4de9876f483fa7b516e653635508 for tzimmermann@suse.de;
        Wed, 26 Apr 2023 18:25:24 CST
X-Transaction-ID: 44cd4de9876f483fa7b516e653635508
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <1f342c95-319b-f14f-f9aa-ed60976e214c@189.cn>
Date:   Wed, 26 Apr 2023 18:25:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [5/6] fbdev: Move CFB read and write code into helper functions
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
        deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230425142846.730-6-tzimmermann@suse.de>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

On 2023/4/25 22:28, Thomas Zimmermann wrote:
> Move the existing CFB read and write code for I/O memory into
> the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
> default fp_ops. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/video/fbdev/core/Makefile      |   2 +-
>   drivers/video/fbdev/core/fb_cfb_fops.c | 126 +++++++++++++++++++++++++
>   drivers/video/fbdev/core/fbmem.c       | 113 +---------------------
>   include/linux/fb.h                     |  10 ++
>   4 files changed, 139 insertions(+), 112 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c
>
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index 08fabce76b74..cb7534a80305 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -2,7 +2,7 @@
>   obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>   obj-$(CONFIG_FB)                  += fb.o
>   fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
> -                                     modedb.o fbcvt.o fb_cmdline.o
> +                                     modedb.o fbcvt.o fb_cmdline.o fb_cfb_fops.o
>   fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
>   
>   ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
> diff --git a/drivers/video/fbdev/core/fb_cfb_fops.c b/drivers/video/fbdev/core/fb_cfb_fops.c
> new file mode 100644
> index 000000000000..f6000166eda4
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_cfb_fops.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/fb.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +
> +ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *buffer, *dst;
> +	u8 __iomem *src;
> +	int c, cnt = 0, err = 0;
> +	unsigned long total_size;
> +
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p >= total_size)
> +		return 0;
> +
> +	if (count >= total_size)
> +		count = total_size;
> +
> +	if (count + p > total_size)
> +		count = total_size - p;
> +
> +	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	src = (u8 __iomem *)(info->screen_base + p);
> +
> +	if (info->fbops->fb_sync)
> +		info->fbops->fb_sync(info);
> +
> +	while (count) {
> +		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +		dst = buffer;
> +		fb_memcpy_fromfb(dst, src, c);
> +		dst += c;
> +		src += c;
> +
> +		if (copy_to_user(buf, buffer, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +		*ppos += c;
> +		buf += c;
> +		cnt += c;
> +		count -= c;
> +	}
> +
> +	kfree(buffer);
> +
> +	return cnt ? cnt : err;
> +}
> +EXPORT_SYMBOL(fb_cfb_read);
> +
> +ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *buffer, *src;
> +	u8 __iomem *dst;
> +	int c, cnt = 0, err = 0;
> +	unsigned long total_size;
> +
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p > total_size)
> +		return -EFBIG;
> +
> +	if (count > total_size) {
> +		err = -EFBIG;
> +		count = total_size;
> +	}
> +
> +	if (count + p > total_size) {
> +		if (!err)
> +			err = -ENOSPC;
> +
> +		count = total_size - p;
> +	}
> +
> +	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	dst = (u8 __iomem *)(info->screen_base + p);
> +
> +	if (info->fbops->fb_sync)
> +		info->fbops->fb_sync(info);
> +
> +	while (count) {
> +		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +		src = buffer;
> +
> +		if (copy_from_user(src, buf, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		fb_memcpy_tofb(dst, src, c);
> +		dst += c;
> +		src += c;
> +		*ppos += c;
> +		buf += c;
> +		cnt += c;
> +		count -= c;
> +	}
> +
> +	kfree(buffer);
> +
> +	return (cnt) ? cnt : err;
> +}
> +EXPORT_SYMBOL(fb_cfb_write);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index b993bb97058f..be6c75f3dfd0 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -761,12 +761,7 @@ static struct fb_info *file_fb_info(struct file *file)
>   static ssize_t
>   fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>   {
> -	unsigned long p = *ppos;
>   	struct fb_info *info = file_fb_info(file);
> -	u8 *buffer, *dst;
> -	u8 __iomem *src;
> -	int c, cnt = 0, err = 0;
> -	unsigned long total_size;
>   
>   	if (!info)
>   		return -ENODEV;
> @@ -777,64 +772,13 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>   	if (info->fbops->fb_read)
>   		return info->fbops->fb_read(info, buf, count, ppos);
>   
> -	if (!info->screen_base)
> -		return -ENODEV;
> -
> -	total_size = info->screen_size;
> -
> -	if (total_size == 0)
> -		total_size = info->fix.smem_len;
> -
> -	if (p >= total_size)
> -		return 0;
> -
> -	if (count >= total_size)
> -		count = total_size;
> -
> -	if (count + p > total_size)
> -		count = total_size - p;
> -
> -	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
> -			 GFP_KERNEL);
> -	if (!buffer)
> -		return -ENOMEM;
> -
> -	src = (u8 __iomem *) (info->screen_base + p);
> -
> -	if (info->fbops->fb_sync)
> -		info->fbops->fb_sync(info);
> -
> -	while (count) {
> -		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> -		dst = buffer;
> -		fb_memcpy_fromfb(dst, src, c);
> -		dst += c;
> -		src += c;
> -
> -		if (copy_to_user(buf, buffer, c)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		*ppos += c;
> -		buf += c;
> -		cnt += c;
> -		count -= c;
> -	}
> -
> -	kfree(buffer);
> -
> -	return cnt ? cnt : err;
> +	return fb_cfb_read(info, buf, count, ppos);
>   }
>   
>   static ssize_t
>   fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>   {
> -	unsigned long p = *ppos;
>   	struct fb_info *info = file_fb_info(file);
> -	u8 *buffer, *src;
> -	u8 __iomem *dst;
> -	int c, cnt = 0, err = 0;
> -	unsigned long total_size;
>   
>   	if (!info)
>   		return -ENODEV;
> @@ -845,60 +789,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>   	if (info->fbops->fb_write)
>   		return info->fbops->fb_write(info, buf, count, ppos);
>   
> -	if (!info->screen_base)
> -		return -ENODEV;
> -
> -	total_size = info->screen_size;
> -
> -	if (total_size == 0)
> -		total_size = info->fix.smem_len;
> -
> -	if (p > total_size)
> -		return -EFBIG;
> -
> -	if (count > total_size) {
> -		err = -EFBIG;
> -		count = total_size;
> -	}
> -
> -	if (count + p > total_size) {
> -		if (!err)
> -			err = -ENOSPC;
> -
> -		count = total_size - p;
> -	}
> -
> -	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
> -			 GFP_KERNEL);
> -	if (!buffer)
> -		return -ENOMEM;
> -
> -	dst = (u8 __iomem *) (info->screen_base + p);
> -
> -	if (info->fbops->fb_sync)
> -		info->fbops->fb_sync(info);
> -
> -	while (count) {
> -		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> -		src = buffer;
> -
> -		if (copy_from_user(src, buf, c)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -
> -		fb_memcpy_tofb(dst, src, c);
> -		dst += c;
> -		src += c;
> -		*ppos += c;
> -		buf += c;
> -		cnt += c;
> -		count -= c;
> -	}
> -
> -	kfree(buffer);
> -
> -	return (cnt) ? cnt : err;
> +	return fb_cfb_write(info, buf, count, ppos);
>   }
>   
>   int
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 08cb47da71f8..3b1644c79973 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -576,9 +576,19 @@ struct fb_info {
>   extern int fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var);
>   extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
>   extern int fb_blank(struct fb_info *info, int blank);
> +
> +/*
> + * Drawing operations where framebuffer is in video RAM
> + */
> +
>   extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
>   extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
>   extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
> +extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
> +			   loff_t *ppos);
> +extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> +			    size_t count, loff_t *ppos);
> +
>   /*
>    * Drawing operations where framebuffer is in system RAM
>    */
