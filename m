Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A0C10505D
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 Nov 2019 11:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfKUKTB (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 21 Nov 2019 05:19:01 -0500
Received: from foss.arm.com ([217.140.110.172]:53936 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbfKUKTB (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 21 Nov 2019 05:19:01 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A89F6DA7;
        Thu, 21 Nov 2019 02:19:00 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF6833F52E;
        Thu, 21 Nov 2019 02:18:59 -0800 (PST)
Subject: Re: [PATCH v1 1/5] fbtft: Make sure string is NULL terminated
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        linux-fbdev@vger.kernel.org,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        devel@driverdev.osuosl.org
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
From:   Steven Price <steven.price@arm.com>
Message-ID: <da3a18a1-a5a1-52b5-20d6-c4ef2bf6a5fe@arm.com>
Date:   Thu, 21 Nov 2019 10:18:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 20/11/2019 09:57, Andy Shevchenko wrote:
> New GCC warns about inappropriate use of strncpy():
> 
> drivers/staging/fbtft/fbtft-core.c: In function ‘fbtft_framebuffer_alloc’:
> drivers/staging/fbtft/fbtft-core.c:665:2: warning: ‘strncpy’ specified bound 16 equals destination size [-Wstringop-truncation]
>   665 |  strncpy(info->fix.id, dev->driver->name, 16);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Later on the copy is being used with the assumption to be NULL terminated.
> Make sure string is NULL terminated by switching to snprintf().

Even better would be strscpy():

	strscpy(info->fix.id, dev->driver->name, sizeof(info->fix.id));

Steve

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index a0a67aa517f0..61f0286fb157 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -666,7 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  	fbdefio->deferred_io =     fbtft_deferred_io;
>  	fb_deferred_io_init(info);
>  
> -	strncpy(info->fix.id, dev->driver->name, 16);
> +	snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
>  	info->fix.type =           FB_TYPE_PACKED_PIXELS;
>  	info->fix.visual =         FB_VISUAL_TRUECOLOR;
>  	info->fix.xpanstep =	   0;
> 

