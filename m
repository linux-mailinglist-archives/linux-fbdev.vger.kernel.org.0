Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87EE175168
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jul 2019 16:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfGYOjk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 25 Jul 2019 10:39:40 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39071 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGYOjk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 25 Jul 2019 10:39:40 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so50449662edv.6
        for <linux-fbdev@vger.kernel.org>; Thu, 25 Jul 2019 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IoWdcCy317UU2ah+36AHI5/uGVGCun8JFHUg840QsSc=;
        b=FKLZLOoBOyYbaWVEp077phXXjrp1frMIM9eDHK8ngRTpqx7Tt34vKWaYjhFgmfbdpE
         K/ifOe3ovQRH+ZPPfFHr/T6yWAvVDzxRvSBV/LKzZVkNXkWAg0mMgA9LY7aX1+P3pqLx
         2MWVIbj+YWKbojdz/lTjj7QZECN8lt83AynEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=IoWdcCy317UU2ah+36AHI5/uGVGCun8JFHUg840QsSc=;
        b=K4iegIBvAfhmvEQrrlTDhtJoZ2cxJO7ddeQdM/7u7wgrc+2qOgEJ1W3iKIRqQmdUXg
         z6fn1SrUF1r88WFr5PK+u44qGLZU/j56xh6yjL4rokb2sJnuHnuX+mxn2egQHLFaA3+P
         i3B1tA/c0ns+Ur9BwJGxuDb0f0NEyHn1DhOBq5sVQR0OCdeOGBQsmBfDolQsQYsvkVYH
         95gZGfTyfnA/OouRJdu/rPxOw9bZ6dv/AIiF9nscVOWF928gwSwmmgE71OlTVz2iLc+h
         l4CSZ48EjfU2KzftzR6hGs8Uq2lXXr1B7MakiCArQEzQAnG71kEUFO4oCg6EFYQ6v7Qf
         myuw==
X-Gm-Message-State: APjAAAWDT8ANrEFd4okOEZ4mrnRKYDE+i8b6JPJT7dG66hIzFdjHgF8D
        WoHNUnCTOjKM3LueWHltJys=
X-Google-Smtp-Source: APXvYqwmTjleyCTIE9009iFsvy0TCFNCYa6OeaLu+fKkAdIy85n6qAtJc35n/QfDF41CUV1Lslmd+Q==
X-Received: by 2002:a50:a544:: with SMTP id z4mr76198596edb.71.1564065578320;
        Thu, 25 Jul 2019 07:39:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id j7sm13859812eda.97.2019.07.25.07.39.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 07:39:37 -0700 (PDT)
Date:   Thu, 25 Jul 2019 16:39:34 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190725143934.GH15868@phenom.ffwll.local>
References: <20190725143224.GB31803@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190725143224.GB31803@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> There was no users left - so drop the code to support EARLY_FB_BLANK.
> This patch removes the support in backlight,
> and drop the notifier in fbmem.
> 
> That EARLY_FB_BLANK is not used can be verified that no driver set any of:
> 
>     lcd_ops.early_set_power()
>     lcd_ops.r_early_set_power()
> 
> Noticed while browsing backlight code for other reasons.

Ah I didn't grep hard enough, I didn't realize that no one sets the
lcd_ops->(r_)early_set_power hooks. Nice find!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> ---
> 
> Build tested with various architectures, configs.
> 
> Lee, Daniel - OK to commit to drm-misc-next where fbdev stuff is
> maintained today?

backlight is separate from fbdev in Lee's own tree, not in drm-misc. I
think at least.
-Daniel

> 
> Patch needs ack from Bartlomiej first of course.
> 
> 	Sam
> 
>  drivers/video/backlight/lcd.c    |  8 --------
>  drivers/video/fbdev/core/fbmem.c | 12 +-----------
>  include/linux/fb.h               |  4 ----
>  include/linux/lcd.h              | 10 ----------
>  4 files changed, 1 insertion(+), 33 deletions(-)
> 
> diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
> index d6b653aa4ee9..78b033358625 100644
> --- a/drivers/video/backlight/lcd.c
> +++ b/drivers/video/backlight/lcd.c
> @@ -39,14 +39,6 @@ static int fb_notifier_callback(struct notifier_block *self,
>  		if (event == FB_EVENT_BLANK) {
>  			if (ld->ops->set_power)
>  				ld->ops->set_power(ld, *(int *)evdata->data);
> -		} else if (event == FB_EARLY_EVENT_BLANK) {
> -			if (ld->ops->early_set_power)
> -				ld->ops->early_set_power(ld,
> -						*(int *)evdata->data);
> -		} else if (event == FB_R_EARLY_EVENT_BLANK) {
> -			if (ld->ops->r_early_set_power)
> -				ld->ops->r_early_set_power(ld,
> -						*(int *)evdata->data);
>  		} else {
>  			if (ld->ops->set_mode)
>  				ld->ops->set_mode(ld, evdata->data);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 00fe0efeaee9..e6a1c805064f 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1058,7 +1058,7 @@ int
>  fb_blank(struct fb_info *info, int blank)
>  {	
>  	struct fb_event event;
> -	int ret = -EINVAL, early_ret;
> +	int ret = -EINVAL;
>  
>   	if (blank > FB_BLANK_POWERDOWN)
>   		blank = FB_BLANK_POWERDOWN;
> @@ -1066,21 +1066,11 @@ fb_blank(struct fb_info *info, int blank)
>  	event.info = info;
>  	event.data = &blank;
>  
> -	early_ret = fb_notifier_call_chain(FB_EARLY_EVENT_BLANK, &event);
> -
>  	if (info->fbops->fb_blank)
>   		ret = info->fbops->fb_blank(blank, info);
>  
>  	if (!ret)
>  		fb_notifier_call_chain(FB_EVENT_BLANK, &event);
> -	else {
> -		/*
> -		 * if fb_blank is failed then revert effects of
> -		 * the early blank event.
> -		 */
> -		if (!early_ret)
> -			fb_notifier_call_chain(FB_R_EARLY_EVENT_BLANK, &event);
> -	}
>  
>   	return ret;
>  }
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 50948e519897..756706b666a1 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -135,10 +135,6 @@ struct fb_cursor_user {
>  
>  /*      A display blank is requested       */
>  #define FB_EVENT_BLANK                  0x09
> -/*      A hardware display blank early change occurred */
> -#define FB_EARLY_EVENT_BLANK		0x10
> -/*      A hardware display blank revert early change occurred */
> -#define FB_R_EARLY_EVENT_BLANK		0x11
>  
>  struct fb_event {
>  	struct fb_info *info;
> diff --git a/include/linux/lcd.h b/include/linux/lcd.h
> index 851eee8fff25..238fb1dfed98 100644
> --- a/include/linux/lcd.h
> +++ b/include/linux/lcd.h
> @@ -41,16 +41,6 @@ struct lcd_ops {
>  	/* Get the LCD panel power status (0: full on, 1..3: controller
>  	   power on, flat panel power off, 4: full off), see FB_BLANK_XXX */
>  	int (*get_power)(struct lcd_device *);
> -	/*
> -	 * Enable or disable power to the LCD(0: on; 4: off, see FB_BLANK_XXX)
> -	 * and this callback would be called proir to fb driver's callback.
> -	 *
> -	 * P.S. note that if early_set_power is not NULL then early fb notifier
> -	 *	would be registered.
> -	 */
> -	int (*early_set_power)(struct lcd_device *, int power);
> -	/* revert the effects of the early blank event. */
> -	int (*r_early_set_power)(struct lcd_device *, int power);
>  	/* Enable or disable power to the LCD (0: on; 4: off, see FB_BLANK_XXX) */
>  	int (*set_power)(struct lcd_device *, int power);
>  	/* Get the current contrast setting (0-max_contrast) */
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
