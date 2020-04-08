Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26ED41A1EA5
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Apr 2020 12:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgDHKTb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Apr 2020 06:19:31 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:37496 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgDHKTb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Apr 2020 06:19:31 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id A011D20027;
        Wed,  8 Apr 2020 12:19:28 +0200 (CEST)
Date:   Wed, 8 Apr 2020 12:19:27 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: mb862xx: remove set but not used variable
 'mdr'
Message-ID: <20200408101927.GD20795@ravnborg.org>
References: <20200403022553.33320-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403022553.33320-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=i0EeH86SAAAA:8
        a=e5mUnYsNAAAA:8 a=fKMPv7tiX5XEn72-Iu4A:9 a=QEXdDO2ut3YA:10
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Jason.

On Fri, Apr 03, 2020 at 10:25:53AM +0800, Jason Yan wrote:
> Fix the following gcc warning:
> 
> drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:187:6: warning: variable
> ‘mdr’ set but not used [-Wunused-but-set-variable]
>   int mdr;
>       ^~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Thanks, committed to drm-misc-next.
The fix will show up durign the next merge window.

	Sam

> ---
>  drivers/video/fbdev/mb862xx/mb862xxfb_accel.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
> index 42569264801f..d40b806461ca 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
> @@ -184,7 +184,6 @@ static void mb86290fb_imageblit16(u32 *cmd, u16 step, u16 dx, u16 dy,
>  static void mb86290fb_imageblit(struct fb_info *info,
>  				const struct fb_image *image)
>  {
> -	int mdr;
>  	u32 *cmd = NULL;
>  	void (*cmdfn) (u32 *, u16, u16, u16, u16, u16, u32, u32,
>  		       const struct fb_image *, struct fb_info *) = NULL;
> @@ -196,7 +195,6 @@ static void mb86290fb_imageblit(struct fb_info *info,
>  	u16 dx = image->dx, dy = image->dy;
>  	int x2, y2, vxres, vyres;
>  
> -	mdr = (GDC_ROP_COPY << 9);
>  	x2 = image->dx + image->width;
>  	y2 = image->dy + image->height;
>  	vxres = info->var.xres_virtual;
> -- 
> 2.17.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
