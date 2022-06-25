Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA82155ACEC
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jun 2022 00:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbiFYWb7 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Jun 2022 18:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiFYWb6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Jun 2022 18:31:58 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF6313E91
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 15:31:57 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e2so8127953edv.3
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n0+M/cnFiRGD4JANI7LrIgmeWPIopq0PCSR4wRCdPNE=;
        b=bXRxYflBKzDRCPc+ift51Icp8aoDo2ZywoLCBHE7+nTkvy6ysCcUNjI5pZ0m05G6tu
         OwUxx5BvW8kl8pRMP7arb7OPglWuU3lHQ624lchXa28ousquPr0n7bPi/Y7HjKQPEWSU
         AsweAmjaGGAMu/CT+haJlhXabHOe9IN187Jbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n0+M/cnFiRGD4JANI7LrIgmeWPIopq0PCSR4wRCdPNE=;
        b=xF0dJ5rM5Q33K5WrMZHdwT76GzFASp8/fsjh+6MLi/0mEd3qgvgKf0gsp7qtjLJ4Ft
         /TsHkRk39LKjSJky9A8lSpfHU62/u3ksLhLnhEwa+0VkCEoDtyxouHwh1EDTOhDL7OFv
         knYEpF7zJS9dQAVLEUcBkprX0LVo3Gy2rGnt0s0iggWRLOnL+AyctcVhNpdballdMMR9
         RxjBTDvGy9/7tLkAs/k+xcdfjrwQ1nrWc1nynFTlyrqWzsi6YDyGXNNTCn/ZkmXjxtEF
         c3vXgN1tFuesJZeAqOqYzLx3OM5KacEZTep4L+33gVG1BiR2Dk0z14ErBni3U+7jXwqO
         VAkQ==
X-Gm-Message-State: AJIora9Mmk9jcRfN/0xEMfPXkWt4ugZkLhu1b+UDRU+tIWCI9AEbNHAb
        dPG8w+aDSMEuJLAprcOvF1qlQD4Ix9n0rA==
X-Google-Smtp-Source: AGRyM1sEJ3S+FhiyUjG9aUmVD129Ouwev9yfcVaJ1fjhoeDDwQzoXacITo69J/U5XgEbpgRfp+BTjA==
X-Received: by 2002:a05:6402:388b:b0:42b:5f20:c616 with SMTP id fd11-20020a056402388b00b0042b5f20c616mr7414150edb.50.1656196315809;
        Sat, 25 Jun 2022 15:31:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z8-20020a170906434800b00722f2a0944fsm3050797ejm.107.2022.06.25.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 15:31:55 -0700 (PDT)
Date:   Sun, 26 Jun 2022 00:31:53 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Helge Deller <deller@gmx.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] fbcon: Add fbcon_modechange_possible() check
Message-ID: <YreM2RpquUq8ttYg@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-3-deller@gmx.de>
 <YrcFrYfmOqT7WNyR@phenom.ffwll.local>
 <d4fce87f-919b-0a44-f10f-b108f36ade09@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4fce87f-919b-0a44-f10f-b108f36ade09@gmx.de>
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

On Sat, Jun 25, 2022 at 05:14:15PM +0200, Helge Deller wrote:
> On 6/25/22 14:55, Daniel Vetter wrote:
> > On Sat, Jun 25, 2022 at 02:25:00PM +0200, Helge Deller wrote:
> >> We need to prevent that users configure a screen size which is smaller than the
> >> currently selected font size. Otherwise rendering chars on the screen will
> >> access memory outside the graphics memory region.
> >>
> >> This patch adds a new function fbcon_modechange_possible() which implements
> >> this check and which may be extended with other checks later if necessary.  The
> >> new function will be called from the FBIOPUT_VSCREENINFO ioctl handler in
> >> fbmem.c, which will then return -EINVAL to the user if the new screen size is
> >> too small.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> Cc: stable@vger.kernel.org # v5.4+
> >> ---
> >>  drivers/video/fbdev/core/fbcon.c | 26 ++++++++++++++++++++++++++
> >>  include/linux/fbcon.h            |  4 ++++
> >>  2 files changed, 30 insertions(+)
> >>
> >> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> >> index e162d5e753e5..e4cc4841ed7f 100644
> >> --- a/drivers/video/fbdev/core/fbcon.c
> >> +++ b/drivers/video/fbdev/core/fbcon.c
> >> @@ -2736,6 +2736,32 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
> >>  }
> >>  EXPORT_SYMBOL(fbcon_update_vcs);
> >>
> >> +/* let fbcon check if it supports a new screen resolution */
> >> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
> >> +{
> >> +	struct fbcon_ops *ops = info->fbcon_par;
> >> +	struct vc_data *vc;
> >> +	int i;
> >
> > 	WARN_CONSOLE_UNLOCKED();
> > here please.
> 
> Yes, good idea.
> 
> >> +
> >> +	if (!ops || ops->currcon < 0)
> >> +		return -EINVAL;
> >> +
> >> +	/* prevent setting a screen size which is smaller than font size */
> >> +	for (i = first_fb_vc; i <= last_fb_vc; i++) {
> >
> > Maybe a follow up patch to make this an interator? Kinda like what I've
> > done for fbcon_for_each_registered_fb, maybe call it fbcon_for_each_fb_vc
> > or so.
> 
> Yes, that would be possible later on.
> Right now I'd like to limit changes to minimum to make backporting easy.
> 
> 
> >> +		vc = vc_cons[i].d;
> >> +		if (!vc || vc->vc_mode != KD_TEXT ||
> >
> > I don't think it's good to filter for !KD_TEXT here, because then we'd
> > need to recheck fonts when Xorg would try to switch back to text mode, and
> > if that then fails we kinda broke the system.
> >
> > I can't think of a use-case where you'd want to upload a font which breaks
> > your console that Xorg is using right now, so best to just drop this
> > check.
> 
> Yes, probably right.
> Will drop that.
> 
> >> +		    fbcon_info_from_console(i) != info)
> >
> > So I think, but not 100% sure, that with my recent rework for
> > fbcon_info_from_console this should be impossible, since the races are
> > gone. I guess it doesn't hurt to cargo-cult this, but a follow up patch to
> > roll out fbcon_for_each_fb_vc and then delete this check from all of the
> > loop iterations would be really good to make this clear.
> >
> > If you're not sure this is safe we could add this consistency check in a
> > if (WARN_ON(fbcon_info_from_console(i))!= info) continue; into the loop
> > iterator itself.
> 
> Since we now added the WARN_CONSOLE_UNLOCKED() as suggested by you above
> I don't think more additional checks are needed.

These are orthogonal checks. The locking check is to make sure we hold the
right locks. The info consistency check here is to make sure we never
managed to make our data structures inconsistent, which should be
impossible after my recent locking changes. Before that lockig change you
need to make sure you are still operating on a valid fb_info struct, hence
this check.

tldr; Entirely separate things.
-Daniel

> 

> >
> >> +			continue;
> >> +
> >> +		if (FBCON_SWAP(var->rotate, var->xres, var->yres) < vc->vc_font.width ||
> >> +		    FBCON_SWAP(var->rotate, var->yres, var->xres) < vc->vc_font.height)
> >
> > Bit a bikeshed, but please do the check the same way around as in the
> > other place.
> 
> Fixed in upcoming series now.
> 
> Helge
> 
> > Maybe even extract a helper that you pass the vc and the var
> > struct too and it checks that it fits, and then use it here and in the
> > previous patch.
> >
> > Cheers, Daniel
> >
> >> +			return -EINVAL;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL(fbcon_modechange_possible);
> >> +
> >>  int fbcon_mode_deleted(struct fb_info *info,
> >>  		       struct fb_videomode *mode)
> >>  {
> >> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> >> index ff5596dd30f8..2382dec6d6ab 100644
> >> --- a/include/linux/fbcon.h
> >> +++ b/include/linux/fbcon.h
> >> @@ -15,6 +15,8 @@ void fbcon_new_modelist(struct fb_info *info);
> >>  void fbcon_get_requirement(struct fb_info *info,
> >>  			   struct fb_blit_caps *caps);
> >>  void fbcon_fb_blanked(struct fb_info *info, int blank);
> >> +int  fbcon_modechange_possible(struct fb_info *info,
> >> +			       struct fb_var_screeninfo *var);
> >>  void fbcon_update_vcs(struct fb_info *info, bool all);
> >>  void fbcon_remap_all(struct fb_info *info);
> >>  int fbcon_set_con2fb_map_ioctl(void __user *argp);
> >> @@ -33,6 +35,8 @@ static inline void fbcon_new_modelist(struct fb_info *info) {}
> >>  static inline void fbcon_get_requirement(struct fb_info *info,
> >>  					 struct fb_blit_caps *caps) {}
> >>  static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {}
> >> +static inline int  fbcon_modechange_possible(struct fb_info *info,
> >> +				struct fb_var_screeninfo *var) { return 0; }
> >>  static inline void fbcon_update_vcs(struct fb_info *info, bool all) {}
> >>  static inline void fbcon_remap_all(struct fb_info *info) {}
> >>  static inline int fbcon_set_con2fb_map_ioctl(void __user *argp) { return 0; }
> >> --
> >> 2.35.3
> >>
> >
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
