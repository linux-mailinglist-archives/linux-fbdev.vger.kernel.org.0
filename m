Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECAA23B482
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Aug 2020 07:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgHDFiT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 4 Aug 2020 01:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgHDFiT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 4 Aug 2020 01:38:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD286C061756
        for <linux-fbdev@vger.kernel.org>; Mon,  3 Aug 2020 22:38:18 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c19so1388613wmd.1
        for <linux-fbdev@vger.kernel.org>; Mon, 03 Aug 2020 22:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cv9dwVi/Wv30ZWHkdUpxmHaYyxiCbxozjhCWMQldsSA=;
        b=hid86rnu5RdeUriBzIBEf2/tA0fNBYdk6DhoKMlhiCAMpSXUwfxj3XLOQYGYor+YKh
         obVBT6XDDh/nIOP/LLJHUDkolrw4gukhJtqws5Ae8PJmgsBp4SXJvioc/neeKpv+QxUx
         OCjfoxlE59A4ZzmPaytbEqYfW9PwqrL1k/rk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Cv9dwVi/Wv30ZWHkdUpxmHaYyxiCbxozjhCWMQldsSA=;
        b=pzbMbW81V5P0auPMcs9UEAwLG8GvhTDOGyoq2mjPsr2LEZ2ML05UlzhOZZDq+W8L79
         c2b5mFIM0bIbP7ZyMEBtuT5PGyhM3WPocqiON3yUAc0Qrk9SOPvksDVPho81mPzyQ4bS
         G2txfZojEOxqsDrncvkbg/ukF+kSBbQa5m2nWepphgqghsK3kxUW8nwqn7pe7NEdC1mz
         VbN/VyP2NY9ejGGR/WbA5VVfS3uBAOSLeS41NpUDUHgzMBWycs7mTPoQIAEWUfw4YINE
         R97GeVngj7S0b//sPvRvMtVtOCpvR8lRP7bU3Hg1peqPRgGFp6MgnAhHhot3gu6Cwvqe
         kw/A==
X-Gm-Message-State: AOAM532Nbv047sl+VPnjPXyNnJO74wG2aBJBGZ+O6Y1eTWvdNJKXpJR0
        Q40E1F/EIlDTFYOBWwoLqqWjzGaNDwg=
X-Google-Smtp-Source: ABdhPJwNiZT+/GhP9T5Q5Ir4jlWN4SHDiYp7jXO8IwDtD5pgMdueTFiD3HJLFoEgCPNyMnmX+I4egQ==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr2251985wmj.164.1596519497267;
        Mon, 03 Aug 2020 22:38:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f63sm3156762wmf.9.2020.08.03.22.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 22:38:16 -0700 (PDT)
Date:   Tue, 4 Aug 2020 07:38:14 +0200
From:   daniel@ffwll.ch
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
Subject: Re: [PATCH v2] fbmem: pull fbcon_update_vcs() out of fb_set_var()
Message-ID: <20200804053814.GG6419@phenom.ffwll.local>
Mail-Followup-To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
References: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAKMK7uHeteS2+rKrZKrAM+zQO==hAX0XaVc9JfHPsdLTCtzKOw@mail.gmail.com>
 <a3bb6544-064d-54a1-1215-d92188cb4209@i-love.sakura.ne.jp>
 <075b7e37-3278-cd7d-31ab-c5073cfa8e92@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <075b7e37-3278-cd7d-31ab-c5073cfa8e92@i-love.sakura.ne.jp>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jul 30, 2020 at 07:47:14PM +0900, Tetsuo Handa wrote:
> syzbot is reporting OOB read bug in vc_do_resize() [1] caused by memcpy()
> based on outdated old_{rows,row_size} values, for resize_screen() can
> recurse into vc_do_resize() which changes vc->vc_{cols,rows} that outdates
> old_{rows,row_size} values which were saved before calling resize_screen().
> 
> Daniel Vetter explained that resize_screen() should not recurse into
> fbcon_update_vcs() path due to FBINFO_MISC_USEREVENT being still set
> when calling resize_screen().
> 
> Instead of masking FBINFO_MISC_USEREVENT before calling fbcon_update_vcs(),
> we can remove FBINFO_MISC_USEREVENT by calling fbcon_update_vcs() only if
> fb_set_var() returned 0. This change assumes that it is harmless to call
> fbcon_update_vcs() when fb_set_var() returned 0 without reaching
> fb_notifier_call_chain().
> 
> [1] https://syzkaller.appspot.com/bug?id=c70c88cfd16dcf6e1d3c7f0ab8648b3144b5b25e
> 
> Reported-and-tested-by: syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reported-by: kernel test robot <lkp@intel.com> for missing #include

Thanks a lot for your patch, queued up to hopefully still make it for
5.9-rc1.

Cheers, Daniel

> ---
>  drivers/video/fbdev/core/fbmem.c   | 8 ++------
>  drivers/video/fbdev/core/fbsysfs.c | 4 ++--
>  drivers/video/fbdev/ps3fb.c        | 5 +++--
>  include/linux/fb.h                 | 2 --
>  4 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 30e73ec..da7c88f 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -957,7 +957,6 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
>  int
>  fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>  {
> -	int flags = info->flags;
>  	int ret = 0;
>  	u32 activate;
>  	struct fb_var_screeninfo old_var;
> @@ -1052,9 +1051,6 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
>  	event.data = &mode;
>  	fb_notifier_call_chain(FB_EVENT_MODE_CHANGE, &event);
>  
> -	if (flags & FBINFO_MISC_USEREVENT)
> -		fbcon_update_vcs(info, activate & FB_ACTIVATE_ALL);
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL(fb_set_var);
> @@ -1105,9 +1101,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  			return -EFAULT;
>  		console_lock();
>  		lock_fb_info(info);
> -		info->flags |= FBINFO_MISC_USEREVENT;
>  		ret = fb_set_var(info, &var);
> -		info->flags &= ~FBINFO_MISC_USEREVENT;
> +		if (!ret)
> +			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>  		unlock_fb_info(info);
>  		console_unlock();
>  		if (!ret && copy_to_user(argp, &var, sizeof(var)))
> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
> index d54c88f..65dae05 100644
> --- a/drivers/video/fbdev/core/fbsysfs.c
> +++ b/drivers/video/fbdev/core/fbsysfs.c
> @@ -91,9 +91,9 @@ static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
>  
>  	var->activate |= FB_ACTIVATE_FORCE;
>  	console_lock();
> -	fb_info->flags |= FBINFO_MISC_USEREVENT;
>  	err = fb_set_var(fb_info, var);
> -	fb_info->flags &= ~FBINFO_MISC_USEREVENT;
> +	if (!err)
> +		fbcon_update_vcs(fb_info, var->activate & FB_ACTIVATE_ALL);
>  	console_unlock();
>  	if (err)
>  		return err;
> diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
> index 9df78fb..203c254 100644
> --- a/drivers/video/fbdev/ps3fb.c
> +++ b/drivers/video/fbdev/ps3fb.c
> @@ -29,6 +29,7 @@
>  #include <linux/freezer.h>
>  #include <linux/uaccess.h>
>  #include <linux/fb.h>
> +#include <linux/fbcon.h>
>  #include <linux/init.h>
>  
>  #include <asm/cell-regs.h>
> @@ -824,12 +825,12 @@ static int ps3fb_ioctl(struct fb_info *info, unsigned int cmd,
>  				var = info->var;
>  				fb_videomode_to_var(&var, vmode);
>  				console_lock();
> -				info->flags |= FBINFO_MISC_USEREVENT;
>  				/* Force, in case only special bits changed */
>  				var.activate |= FB_ACTIVATE_FORCE;
>  				par->new_mode_id = val;
>  				retval = fb_set_var(info, &var);
> -				info->flags &= ~FBINFO_MISC_USEREVENT;
> +				if (!retval)
> +					fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>  				console_unlock();
>  			}
>  			break;
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 3b4b2f0..b11eb02 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -400,8 +400,6 @@ struct fb_tile_ops {
>  #define FBINFO_HWACCEL_YPAN		0x2000 /* optional */
>  #define FBINFO_HWACCEL_YWRAP		0x4000 /* optional */
>  
> -#define FBINFO_MISC_USEREVENT          0x10000 /* event request
> -						  from userspace */
>  #define FBINFO_MISC_TILEBLITTING       0x20000 /* use tile blitting */
>  
>  /* A driver may set this flag to indicate that it does want a set_par to be
> -- 
> 1.8.3.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
