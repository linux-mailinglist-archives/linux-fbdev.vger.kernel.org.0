Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9832610C7ED
	for <lists+linux-fbdev@lfdr.de>; Thu, 28 Nov 2019 12:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfK1LbI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 28 Nov 2019 06:31:08 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:50303 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfK1LbI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 28 Nov 2019 06:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=n5+3jFgydwIPK2sKKzq2ywdZJPQo2wAUTtaoNCsTRs8=; b=Ws6As29D3y2dShtkdhwXEYaQIu
        V36ctM3+1tJBBILgPG2XOL2tc+k4eUXrKbpZH6iFuRyzFOZ2I/y8kHHj0hAt8svqFtl/uLfkCyQe2
        Uak8BFGd7qwqJTQVFTSnXPincjyqCRyqVD9FlKG0m3pj2C4c06VZgpvy+zgYTB3HHGUT3jYkqh854
        X8HeM9HXi7k3iKbGnHSQeTg3i5k22g3pQvs33TLOTTE06HGvPMYsdg4xXV+AVkKW0y8FLlUm6bplk
        QWwlZ8RCofwiZqtJfb7QzopQrPvcaMhdUcFUPSzCw8lAEnUdOjSKj4w+Wx+6BTGL3q5jGrEAIEKRm
        +4LCNBbg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60676 helo=[192.168.10.174])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iaI0n-0001oM-Dd; Thu, 28 Nov 2019 12:31:05 +0100
Subject: Re: [PATCH 02/13] drm/fb-helper: don't preserve fb_ops across
 deferred IO use
To:     Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org
References: <cover.1574871797.git.jani.nikula@intel.com>
 <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f8292d00-5d62-cd3c-9d17-37a3feebd74b@tronnes.org>
Date:   Thu, 28 Nov 2019 12:31:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 27.11.2019 17.31, skrev Jani Nikula:
> Deferred IO now preserves the fb_ops.
> 
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 0c088ea70ad0..a5a2a538d085 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1954,7 +1954,6 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
>  static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
>  {
>  	struct fb_info *fbi = fb_helper->fbdev;
> -	struct fb_ops *fbops = NULL;
>  	void *shadow = NULL;
>  
>  	if (!fb_helper->dev)
> @@ -1963,15 +1962,11 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
>  	if (fbi && fbi->fbdefio) {
>  		fb_deferred_io_cleanup(fbi);
>  		shadow = fbi->screen_buffer;
> -		fbops = fbi->fbops;
>  	}
>  
>  	drm_fb_helper_fini(fb_helper);
>  
> -	if (shadow) {
> -		vfree(shadow);
> -		kfree(fbops);
> -	}
> +	vfree(shadow);
>  
>  	drm_client_framebuffer_delete(fb_helper->buffer);
>  }
> @@ -2062,23 +2057,14 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
>  
>  	if (drm_fbdev_use_shadow_fb(fb_helper)) {
> -		struct fb_ops *fbops;
>  		void *shadow;
>  
> -		/*
> -		 * fb_deferred_io_cleanup() clears &fbops->fb_mmap so a per
> -		 * instance version is necessary.
> -		 */
> -		fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
>  		shadow = vzalloc(fbi->screen_size);
> -		if (!fbops || !shadow) {
> -			kfree(fbops);
> +		if (!shadow) {
>  			vfree(shadow);

This vfree can is a no-op now and can be dropped. With that:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

>  			return -ENOMEM;
>  		}
>  
> -		*fbops = *fbi->fbops;
> -		fbi->fbops = fbops;
>  		fbi->screen_buffer = shadow;
>  		fbi->fbdefio = &drm_fbdev_defio;
>  
> 
