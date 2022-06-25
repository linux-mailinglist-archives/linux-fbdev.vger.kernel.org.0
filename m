Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B64F55AA22
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Jun 2022 14:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiFYMzO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Jun 2022 08:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbiFYMzO (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Jun 2022 08:55:14 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C3711A0F
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 05:55:13 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id ej4so6932951edb.7
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lliJXY1bIhf6tNh9k0MSZsr/P3hPS0gmh3V8TeTr4J0=;
        b=LFMs/2iwzzVJLkMm4/bXiJcSz9g54zFvYPSIbjJsjaDuwKjALwxScV+hXUasPQafXT
         hKy4TzEu3ZCIEbSEvgkWP+bNep4yLmiTWOOEe0SH1HDDWO7JcRD7/tXvMyIyjsCP60Ux
         ZEcP/msI4hHxm/IA/3ZB8neVmeDXx195WDA5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lliJXY1bIhf6tNh9k0MSZsr/P3hPS0gmh3V8TeTr4J0=;
        b=Fmxyun55x767WRbfrB3ohIzdObKINosghWvK2ngMOOtTsxvBnWE6PW+AiLi0wUWPny
         zoroP4BERCCbdJDq6oO8piHMWPAZkMYbVih8Wff4yxwdxRIC+Ch7hIly8jgbIGwYg1vM
         S2OlBoG/VVdKnTWESW5uyL6Q71ZhSInCs7vqxygEQoJairZu24osSMUszTb4Mf3hJZuc
         jJXe2DFddJbcbSxu3Mzla1Osf1eBH6Pc8X+q0L3mo3F7acl+znTl4SH/5bpY1A4rFaRA
         iQ9viOb1ofrWBNiJwTG+4qI4Kz60pWsEL5e2m8X74wHrvB7CzpKc0vVgAsxh6xJnsofV
         twXg==
X-Gm-Message-State: AJIora8lAF7DvD0G6gb4sEyMZvGYZUihfH06SIrUSVmA6xHYw3Z8a6i7
        nNiVG+120S9o4+c6Xe55WJsekS42OELBDA==
X-Google-Smtp-Source: AGRyM1ttbi/Wo/rqL1dyB/uQVJT45o07CP6yDIY5JhqxrdiZZPQTQIxtcjSqgtaayWeMmyFttdSnkQ==
X-Received: by 2002:a05:6402:2750:b0:435:ab9f:1235 with SMTP id z16-20020a056402275000b00435ab9f1235mr5004882edd.188.1656161711503;
        Sat, 25 Jun 2022 05:55:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id kg27-20020a17090776fb00b00721d8e5beeesm2536714ejc.60.2022.06.25.05.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 05:55:11 -0700 (PDT)
Date:   Sat, 25 Jun 2022 14:55:09 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] fbcon: Add fbcon_modechange_possible() check
Message-ID: <YrcFrYfmOqT7WNyR@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-3-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625122502.68095-3-deller@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Jun 25, 2022 at 02:25:00PM +0200, Helge Deller wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
> 
> This patch adds a new function fbcon_modechange_possible() which implements
> this check and which may be extended with other checks later if necessary.  The
> new function will be called from the FBIOPUT_VSCREENINFO ioctl handler in
> fbmem.c, which will then return -EINVAL to the user if the new screen size is
> too small.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+
> ---
>  drivers/video/fbdev/core/fbcon.c | 26 ++++++++++++++++++++++++++
>  include/linux/fbcon.h            |  4 ++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index e162d5e753e5..e4cc4841ed7f 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2736,6 +2736,32 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
>  }
>  EXPORT_SYMBOL(fbcon_update_vcs);
> 
> +/* let fbcon check if it supports a new screen resolution */
> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
> +{
> +	struct fbcon_ops *ops = info->fbcon_par;
> +	struct vc_data *vc;
> +	int i;

	WARN_CONSOLE_UNLOCKED();

here please.

> +
> +	if (!ops || ops->currcon < 0)
> +		return -EINVAL;
> +
> +	/* prevent setting a screen size which is smaller than font size */
> +	for (i = first_fb_vc; i <= last_fb_vc; i++) {

Maybe a follow up patch to make this an interator? Kinda like what I've
done for fbcon_for_each_registered_fb, maybe call it fbcon_for_each_fb_vc
or so.

> +		vc = vc_cons[i].d;
> +		if (!vc || vc->vc_mode != KD_TEXT ||

I don't think it's good to filter for !KD_TEXT here, because then we'd
need to recheck fonts when Xorg would try to switch back to text mode, and
if that then fails we kinda broke the system.

I can't think of a use-case where you'd want to upload a font which breaks
your console that Xorg is using right now, so best to just drop this
check.

> +		    fbcon_info_from_console(i) != info)

So I think, but not 100% sure, that with my recent rework for
fbcon_info_from_console this should be impossible, since the races are
gone. I guess it doesn't hurt to cargo-cult this, but a follow up patch to
roll out fbcon_for_each_fb_vc and then delete this check from all of the
loop iterations would be really good to make this clear.

If you're not sure this is safe we could add this consistency check in a
if (WARN_ON(fbcon_info_from_console(i))!= info) continue; into the loop
iterator itself.

> +			continue;
> +
> +		if (FBCON_SWAP(var->rotate, var->xres, var->yres) < vc->vc_font.width ||
> +		    FBCON_SWAP(var->rotate, var->yres, var->xres) < vc->vc_font.height)

Bit a bikeshed, but please do the check the same way around as in the
other place. Maybe even extract a helper that you pass the vc and the var
struct too and it checks that it fits, and then use it here and in the
previous patch.

Cheers, Daniel

> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(fbcon_modechange_possible);
> +
>  int fbcon_mode_deleted(struct fb_info *info,
>  		       struct fb_videomode *mode)
>  {
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index ff5596dd30f8..2382dec6d6ab 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -15,6 +15,8 @@ void fbcon_new_modelist(struct fb_info *info);
>  void fbcon_get_requirement(struct fb_info *info,
>  			   struct fb_blit_caps *caps);
>  void fbcon_fb_blanked(struct fb_info *info, int blank);
> +int  fbcon_modechange_possible(struct fb_info *info,
> +			       struct fb_var_screeninfo *var);
>  void fbcon_update_vcs(struct fb_info *info, bool all);
>  void fbcon_remap_all(struct fb_info *info);
>  int fbcon_set_con2fb_map_ioctl(void __user *argp);
> @@ -33,6 +35,8 @@ static inline void fbcon_new_modelist(struct fb_info *info) {}
>  static inline void fbcon_get_requirement(struct fb_info *info,
>  					 struct fb_blit_caps *caps) {}
>  static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {}
> +static inline int  fbcon_modechange_possible(struct fb_info *info,
> +				struct fb_var_screeninfo *var) { return 0; }
>  static inline void fbcon_update_vcs(struct fb_info *info, bool all) {}
>  static inline void fbcon_remap_all(struct fb_info *info) {}
>  static inline int fbcon_set_con2fb_map_ioctl(void __user *argp) { return 0; }
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
