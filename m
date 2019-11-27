Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBDC10B56D
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 19:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfK0SSp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 13:18:45 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35229 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfK0SSo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 13:18:44 -0500
Received: by mail-wm1-f65.google.com with SMTP id n5so8709335wmc.0
        for <linux-fbdev@vger.kernel.org>; Wed, 27 Nov 2019 10:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SBNQoh/xgW120nGDFrCv0dhzQRuYp91+EinwJay67WM=;
        b=RAcBu0UH5YqDFU4oiOk9cPoUTS7+8GHZQTWSn0Ly/FBH0obKw7Vv5td/PFuGsh/clF
         kIoF/lkVCmst+ANoG0pim+ZgHZcKR8IEYKmIat8Wxb82Kj3nOhwqWAOeq/bm57VxTkuN
         0d4wDvZGwKpd/3B1hJ/mAtlJQG12Y8g5S38ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SBNQoh/xgW120nGDFrCv0dhzQRuYp91+EinwJay67WM=;
        b=PprDovZTaPxun44MU4Pk3Da8IFnPCqbnoAhVoLDvY5o20GkJvx2NyuAHbmqtAYRC47
         CY3H0X+oCxE6EXd4xcyJAS6ENzGXkGgNCqO6qsBBzeKjwwws8vbvk/x31JLtOa1eSUjG
         0qc2B4CaAm+2jRCuTZq8k2Rs0uM5RqSfXpViKWCv+AfNd33rq7l0lOAKMe0nkzIQ22dW
         jKShqMb3Nm0XAzU4Ypg6B6rxCPMTnVMmphPXQkRYgnyPX4mDUmJ45a6m5oZgKCLcbUYP
         dUADmKOvK4FYeblAqEyIR3J/7VBtHEvex75a5O0FgtvciGucZs2gSTSSCC558jXPn8YT
         faAQ==
X-Gm-Message-State: APjAAAUz/AAMxp8q9uQdG+D//WqdHn48oZVMJnbdsFoYgdc0x3cXiRUR
        6JHD6pI9M57innf3v+Eb3Wu11A==
X-Google-Smtp-Source: APXvYqwSG5srzXOK+HpSRTs84mj7Hk8tRD94Qh8zDyJ2micrmjkRgyaiGXEBTlX5SES5lDBpvcxGkA==
X-Received: by 2002:a1c:8153:: with SMTP id c80mr5832881wmd.58.1574878723088;
        Wed, 27 Nov 2019 10:18:43 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id a64sm8669003wmc.18.2019.11.27.10.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 10:18:42 -0800 (PST)
Date:   Wed, 27 Nov 2019 19:18:40 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [Intel-gfx] [PATCH 02/13] drm/fb-helper: don't preserve fb_ops
 across deferred IO use
Message-ID: <20191127181840.GH406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 27, 2019 at 06:31:58PM +0200, Jani Nikula wrote:
> Deferred IO now preserves the fb_ops.
> 
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
>  			return -ENOMEM;
>  		}
>  
> -		*fbops = *fbi->fbops;
> -		fbi->fbops = fbops;
>  		fbi->screen_buffer = shadow;
>  		fbi->fbdefio = &drm_fbdev_defio;
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
