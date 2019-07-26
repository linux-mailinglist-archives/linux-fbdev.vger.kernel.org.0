Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D51762A0
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 11:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfGZJuX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 05:50:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33342 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfGZJuW (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 05:50:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so53849153wru.0
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jul 2019 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Pa9lr2R5NHPDkmMrYenMmW9cbXku8rIcCGJIRJ4Qev8=;
        b=T7J9EZrd2+FoX2ZV/qg1urnsfuSIA+WJxW9z6/+TrD4inNkxPfpTLuFmgBPvkHQhKL
         GSPpzQ0iGTEnIUYMrTYQUGa8XvEsUycKYa7EIny+MGyuVnfiuIGdUdikjaELL2MEWWw9
         OIII2sCVpCl6ppkZ5EQLZdOpvno360M5z1RP7874SyWIKMJRSpuUIXzURP8dTUzaazJC
         SzfT1W1vnwEjrOjXpT98fHWru2zOyxv44OdragCAbT+mmYB865pj5pY64XMXbPsj2tqR
         ve5Nt1z665t7X+Ruk6InaOqpVfrOpOY0b9YBAO6f1dk4hmwWVoAp/DKXkLomHpELbglE
         L69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Pa9lr2R5NHPDkmMrYenMmW9cbXku8rIcCGJIRJ4Qev8=;
        b=FV6L4vK9q+tug4S+uGNbjVs4lldmU/LB1VI7g84PEVNuJSZPNrijReJ6TH+ghVtpSw
         sM16jEB6OuKpe2jdJG5MQ6Qe6mG54cMR1jUYqL1NDD7NpB5ueU/Bd+D3mT+VZuPhJL69
         l2CU7ezluP007lweMPee4fRayJA9wm48kE12tQOqptqEXLZXUjciNIvyigi+81ciW484
         qNSu796tBJuRghElhKbcYJNomTSJTUwcapN+YybWdqatREleWveWZbQq6DNeq8Mu50no
         hqqdZoKEqQ/54Cx1Y/y32F9yLJR0E/sB+aNnakCtB/x/gVr44kOcYgLRFfG/bGvOhpXs
         JjOg==
X-Gm-Message-State: APjAAAURBX2lkBM6YgEfpR+0Rq5UaMieQi6y53SLymBAkW6s6gMuCwf6
        P3zOsykJRJ4CnWZAImj99lAR6e7o0LOd3w==
X-Google-Smtp-Source: APXvYqzbI1wbLGOPb4ZI1MN+xaml5TrCl23OS+5iwqJAIVWua4yx85GOU0pb5qYmubWUxWVBr7AZgA==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr43510442wru.156.1564134619802;
        Fri, 26 Jul 2019 02:50:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c65sm50569372wma.44.2019.07.26.02.50.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 02:50:18 -0700 (PDT)
Date:   Fri, 26 Jul 2019 10:50:16 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190726095016.wsj7jnni5zdh37dl@holly.lan>
References: <20190725143224.GB31803@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190725143224.GB31803@ravnborg.org>
User-Agent: NeoMutt/20180716
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> There was no users left - so drop the code to support EARLY_FB_BLANK.

Why are we using a different noun for the subject and description?

> This patch removes the support in backlight,
> and drop the notifier in fbmem.
> 
> That EARLY_FB_BLANK is not used can be verified that no driver set any of:
> 
>     lcd_ops.early_set_power()
>     lcd_ops.r_early_set_power()
> 
> Noticed while browsing backlight code for other reasons.
> 
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

Other than the quibble about the description...

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> 
> Build tested with various architectures, configs.
> 
> Lee, Daniel - OK to commit to drm-misc-next where fbdev stuff is
> maintained today?
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
