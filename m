Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0514610B57D
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 Nov 2019 19:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfK0SUc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 27 Nov 2019 13:20:32 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37386 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfK0SUc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 27 Nov 2019 13:20:32 -0500
Received: by mail-wr1-f66.google.com with SMTP id g7so7148506wrw.4
        for <linux-fbdev@vger.kernel.org>; Wed, 27 Nov 2019 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eXTXSAUEbQk9IiSeFQa+bKrNSgH/hPW+P/zlbRoXNHg=;
        b=MlJM2o/jW8BZ6yhAcd/hDinX7nc4Fsi3NDOg241xx55lGHWVEU9aH/DoipxSzAM76f
         hzPdMq9bH7c/jURyU5DBBwuByOZtQ+8r7x7zKaitiGRmBRpb3F83VFcOtomEHDN8RJSZ
         uA2ZNLVE+Hwwi5SRgKGmBKo6+sD1MSNlYvuHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eXTXSAUEbQk9IiSeFQa+bKrNSgH/hPW+P/zlbRoXNHg=;
        b=J3MdEcl36ltFYS/4DPENBq0ow4cKzs5RNOb9lLIy0UCr3wO53lHOBQxnXDLX596PhW
         hV7V2qNdmIRWIiL5ZxQHz5tzK6+Rv9oPiI3OPkA6I2FZQNF00TgHqlLzFBfmqsNj9ZqC
         e1pOsDQrT0Qnk6wqpj+ta/4RyW0v+NukaWyoagqJayFMrAw7VLFc3a3mD6iBr4GjJt83
         iNu2THSojBgBK+uim1HE+dFilkjvPmYpZsETCHd2lKrScfgIkbmj9z6ofsz8sRkIIVV2
         xwfgGMaPbbL1qheF+Vlkp7+8J6nYEeX2KUm8s8dun3lHER7VuV/upka5omYFxwpyJH3C
         GTwQ==
X-Gm-Message-State: APjAAAXWzVJb2A2CqdNepq+Wal+07H7wAcdoMnEDFsWFJxKGtDn3c6Xm
        M7XWkHnO0MdAOylVfE+DD9HSNwj0Y3U=
X-Google-Smtp-Source: APXvYqzGv99B481epxis71lcp1CrYsoF2Wr9YAkZU7cTnOcFdRc927zUakh3cWaGdYzvUzguevXghw==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr26656161wrn.128.1574878830622;
        Wed, 27 Nov 2019 10:20:30 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id m15sm20002427wrq.97.2019.11.27.10.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 10:20:30 -0800 (PST)
Date:   Wed, 27 Nov 2019 19:20:28 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 03/13] video: smscufx: don't restore fb_mmap
 after deferred IO cleanup
Message-ID: <20191127182028.GI406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <5c25b31242a3ae2326ccf163e5be5ae401b04b49.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c25b31242a3ae2326ccf163e5be5ae401b04b49.1574871797.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 27, 2019 at 06:31:59PM +0200, Jani Nikula wrote:
> Deferred IO now preserves the fb_ops.
> 
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/video/fbdev/smscufx.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
> index 0e0f5bbfc5ef..e362d7da87fc 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -1170,7 +1170,6 @@ static int ufx_ops_release(struct fb_info *info, int user)
>  		fb_deferred_io_cleanup(info);
>  		kfree(info->fbdefio);
>  		info->fbdefio = NULL;
> -		info->fbops->fb_mmap = ufx_ops_mmap;

Also totally pointless to restore this here, since if you have indeed
loaded the driver twice shit has hit the fan already. I guess that was for
the module option .... wtf.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	}
>  
>  	pr_debug("released /dev/fb%d user=%d count=%d",
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
