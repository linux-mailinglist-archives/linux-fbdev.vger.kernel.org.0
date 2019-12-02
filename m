Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77A310E678
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Dec 2019 08:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfLBHpt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 2 Dec 2019 02:45:49 -0500
Received: from protonic.xs4all.nl ([83.163.252.89]:37694 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726010AbfLBHpt (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 2 Dec 2019 02:45:49 -0500
X-Greylist: delayed 524 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Dec 2019 02:45:49 EST
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
        by sparta (Postfix) with ESMTP id 523FF44A0022;
        Mon,  2 Dec 2019 08:37:02 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Dec 2019 08:37:02 +0100
From:   robin <robin@protonic.nl>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
In-Reply-To: <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
Message-ID: <7644533f18ad010366bd27baaf915082@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 2019-11-29 11:29, Jani Nikula wrote:
> Now that the fbops member of struct fb_info is const, we can start
> making the ops const as well.
> 
> Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
> Cc: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/auxdisplay/cfag12864bfb.c | 2 +-
>  drivers/auxdisplay/ht16k33.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/auxdisplay/cfag12864bfb.c
> b/drivers/auxdisplay/cfag12864bfb.c
> index 4074886b7bc8..2002291ab338 100644
> --- a/drivers/auxdisplay/cfag12864bfb.c
> +++ b/drivers/auxdisplay/cfag12864bfb.c
> @@ -57,7 +57,7 @@ static int cfag12864bfb_mmap(struct fb_info *info,
> struct vm_area_struct *vma)
>  	return vm_map_pages_zero(vma, &pages, 1);
>  }
> 
> -static struct fb_ops cfag12864bfb_ops = {
> +static const struct fb_ops cfag12864bfb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_read = fb_sys_read,
>  	.fb_write = fb_sys_write,
> diff --git a/drivers/auxdisplay/ht16k33.c 
> b/drivers/auxdisplay/ht16k33.c
> index a2fcde582e2a..d951d54b26f5 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -228,7 +228,7 @@ static int ht16k33_mmap(struct fb_info *info,
> struct vm_area_struct *vma)
>  	return vm_map_pages_zero(vma, &pages, 1);
>  }
> 
> -static struct fb_ops ht16k33_fb_ops = {
> +static const struct fb_ops ht16k33_fb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_read = fb_sys_read,
>  	.fb_write = fb_sys_write,

Acked-by: Robin van der Gracht <robin@protonic.nl>
