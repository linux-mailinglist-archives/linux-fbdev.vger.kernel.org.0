Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1BBFAFD6
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Nov 2019 12:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfKMLlU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 Nov 2019 06:41:20 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43677 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfKMLlT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 Nov 2019 06:41:19 -0500
Received: by mail-wr1-f65.google.com with SMTP id n1so1955074wra.10
        for <linux-fbdev@vger.kernel.org>; Wed, 13 Nov 2019 03:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iljGY6f0j53SbIuiOVnWpdzhZnH2KtjRsjJiO1HtygQ=;
        b=XZEoikLSbiR9TGuJoXSBQ4HcOpIcv2DGMlDaHWVjspzS//F8mQ4ZoTK7OjAtLrmNHq
         E+dRZiP2R4yohSKpm6Kbg7xHVGvjby4INT5BuehM8Xf6w9q+OTzbjgmGgxXeAn+ai4AU
         apcXDzENV+9p6qHB+rrchbuhxEC7EjXxJwPYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=iljGY6f0j53SbIuiOVnWpdzhZnH2KtjRsjJiO1HtygQ=;
        b=j4sJQpy/4j+hOIVwPEF6yuZ3EaHzmDHRp6SsiLvdFc15CnJ8hQNzHC4wHFZHnzJKsr
         FyD+aRJYogC55byGPH13JJk2MsItR1sN2Spqy6gw+YuSZk3Qa33LzqsgPYlKB3zuHQ0K
         HsEUEKeBeaM6YE71DOfKsyCy3w9I4FJN3q4IMe5zhKFUZuOo7ECvOwtoHNAnnF8+3reG
         qs0qQPaxGAuivyAVyLZ9FxLJdwD5ONcd86wfp7RevwZJ9D87sUQtWsrwDJQSP815zj/b
         ZexlkaJnXzARiGqbgP7aE9An5CpKHPQNeNtmUFLC/LuA7DgQDHcUC1fEwTVUkpIeTLRR
         qROA==
X-Gm-Message-State: APjAAAWSFJcRQlW/VaYhbQ2aFVPGugSny09PyiKHyCn4m5Hz+DvHbsVK
        /eqnrIMPmAJau2oU/MMbs4BRoQ==
X-Google-Smtp-Source: APXvYqyXo7x6Xnmd4v9JYo+tXI70ldBfmYxAeDc8Da9Z0LGGGdRV3dRxhZL1Gq6W55wDdkzX5Iu/wA==
X-Received: by 2002:adf:b686:: with SMTP id j6mr2363186wre.186.1573645276467;
        Wed, 13 Nov 2019 03:41:16 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j22sm3106958wrd.41.2019.11.13.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 03:41:15 -0800 (PST)
Date:   Wed, 13 Nov 2019 12:41:13 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
        Emil Velikov <emil.velikov@collabora.com>
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
Message-ID: <20191113114113.GO23790@phenom.ffwll.local>
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
 <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
 <CAKMK7uF7M60NcPTGicQVJ=09pqf4ua4kWaCmdCcDaC13AgTFQw@mail.gmail.com>
 <6da6c49a-572a-343a-ddb1-103ca7080ccd@suse.de>
 <CAKMK7uHiXtg=FCpqv7ekpopd=2Hofrs7oR3qPNsf8e_E_Wv08w@mail.gmail.com>
 <052a2dd7-9a18-bf0b-7b7f-3396cc5c0dcf@suse.de>
 <CAKMK7uH_0KC5rh3YhHaoBK4xfK=GMqrs61mA6ZFzq0-EdM6BGw@mail.gmail.com>
 <4b330f8f-7baf-7b48-730b-c0d93eee4b81@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b330f8f-7baf-7b48-730b-c0d93eee4b81@suse.de>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 13, 2019 at 10:51:51AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.11.19 um 16:13 schrieb Daniel Vetter:
> > On Tue, Nov 12, 2019 at 3:51 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Hi
> >>
> >> Am 12.11.19 um 15:31 schrieb Daniel Vetter:
> >>> On Tue, Nov 12, 2019 at 3:03 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> Am 12.11.19 um 14:40 schrieb Daniel Vetter:
> >>>>> On Tue, Nov 12, 2019 at 12:55 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>>>>
> >>>>>> Hi
> >>>>>>
> >>>>>> Am 08.11.19 um 16:37 schrieb Noralf Trønnes:
> >>>>>>>
> >>>>>>>
> >>>>>>> Den 08.11.2019 13.33, skrev Thomas Zimmermann:
> >>>>>>>> The udl driver can use the generic fbdev implementation. Convert it.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>>> ---
> >>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> >>>>>>>> index 563cc5809e56..55c0f9dfee29 100644
> >>>>>>>> --- a/drivers/gpu/drm/udl/udl_drv.c
> >>>>>>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
> >>>>>>>
> >>>>>>>> @@ -47,6 +48,8 @@ static struct drm_driver driver = {
> >>>>>>>>      .driver_features = DRIVER_MODESET | DRIVER_GEM,
> >>>>>>>>      .release = udl_driver_release,
> >>>>>>>>
> >>>>>>>> +    .lastclose = drm_fb_helper_lastclose,
> >>>>>>>> +
> >>>>>>>
> >>>>>>> No need to set this, it's already wired up:
> >>>>>>>
> >>>>>>> drm_lastclose -> drm_client_dev_restore -> drm_fbdev_client_restore ->
> >>>>>>> drm_fb_helper_lastclose
> >>>>>>>
> >>>>>>>>      /* gem hooks */
> >>>>>>>>      .gem_create_object = udl_driver_gem_create_object,
> >>>>>>>>
> >>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
> >>>>>>>> index f8153b726343..afe74f892a2b 100644
> >>>>>>>> --- a/drivers/gpu/drm/udl/udl_fb.c
> >>>>>>>> +++ b/drivers/gpu/drm/udl/udl_fb.c
> >>>>>>>> @@ -20,19 +20,9 @@
> >>>>>>>>
> >>>>>>>>  #include "udl_drv.h"
> >>>>>>>>
> >>>>>>>> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in jiffies */
> >>>>>>>> -
> >>>>>>>> -static int fb_defio = 0;  /* Optionally enable experimental fb_defio mmap support */
> >>>>>>>>  static int fb_bpp = 16;
> >>>>>>>>
> >>>>>>>>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> >>>>>>>
> >>>>>>> Maybe fb_bpp can be dropped too?
> >>>>>>
> >>>>>> Sure, makes sense.
> >>>>>>
> >>>>>> The driver exposes a preferred color depth of 24 bpp, which we may want
> >>>>>> to change to 16 then. The internal framebuffer is only 16 bpp anyway.
> >>>>>
> >>>>> Just something that crossed my mind: Should we ensure that the
> >>>>> preferred format of the primary plane (should be the first in the
> >>>>> format array) matches up with the preferred bpp setting? Maybe even
> >>>>> enforce that for drivers with an explicit primary plane (i.e. atomic
> >>>>> drivers). I think tiny drivers get this right already.
> >>>>
> >>>> IMHO that makes if the userspace can handle it. The preferred bpp could
> >>>> also be retrieved from the formats array automatically. What about HW
> >>>> with multiple CRTCs with different format defaults (sounds weird, I know)?
> >>>
> >>> Ime I haven't seen such a case yet. What I have seen is that the most
> >>> preferred format might be some fancy compressed format, which not all
> >>> formats support. But which you can't render into without mesa anyway,
> >>> so really doesn't matter for preferred bpp.
> >>>
> >>>> WRT udl: For v3 of this patchset I've set the preferred color depth to
> >>>> 32 bpp; although the internal FB is always at 16 bpp. Because when I
> >>>> tested with a dual-screen setup (radeon + udl) X11 didn't support the 16
> >>>> bpp output on the second screen (the one driven by udl). Only setting
> >>>> both screen to 32 bpp worked out of the box. And the preferred 24 bpp
> >>>> are not even supported by udl.
> >>>
> >>> Uh, if we can only set preferred bpp to make X happy, and X can only
> >>> support one preferred bpp, then everyone needs to set 32bit. Which
> >>> defeats the point (and we'd need to hardcode it to 32bpp). Is this
> >>> really the case?
> >>
> >> I guess it would have worked if both screens preferred 16 bpp.
> > 
> > Just noticed that current depth is 24 bpp ... does that work with
> > current X? If not I think we should actually set it to 16 bpp, and fix
> > up X. Not as in "make it handle multi-bpp", that's too hard, but make
> > it pick a common format that works for all drivers (which usually
> > means go with 32bpp). Since if we just go with 32bpp to paper over X,
> > then the preferred bpp uapi becomes meaningless.
> 
> The good news is that it apparently works with planes correctly configured.
> 
> I tested with udl being converted to simple pipe and universal planes.
> It exposes RGB565, XRGB8888 and preferred_depth=16. X did the correct
> thing and choose a format the works with radeon and udl.

Awesome!

> For the next iteration of the fbdev conversion, I'll just keep the
> current values. And once converted to universal planes, we can set the
> optimal values instead.

Yeah sounds good. Worst case it should at least make it easier to undo the
bpp change.
-Daniel

> 
> Best regards
> Thomas
> 
> > -Daniel
> > 
> >>
> >> Best regards
> >> Thomas
> >>
> >>> -Daniel
> >>>
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> -Daniel
> >>>>>
> >>>>>>
> >>>>>> Best regards
> >>>>>> Thomas
> >>>>>>
> >>>>>>>
> >>>>>>> It's possible to set it on the command line:
> >>>>>>>
> >>>>>>> video=<xres>x<yres>-<bpp>
> >>>>>>>
> >>>>>>> I haven't tried it so I can't say for certain that it actually works>
> >>>>>>> Ref: Documentation/fb/modedb.rst and drm_fb_helper_single_fb_probe()
> >>>>>>>
> >>>>>>>> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
> >>>>>>>> -
> >>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> >>>>>>>> index bc1ab6060dc6..1517d5e881b8 100644
> >>>>>>>> --- a/drivers/gpu/drm/udl/udl_modeset.c
> >>>>>>>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> >>>>>>>
> >>>>>>>> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *dev)
> >>>>>>>>
> >>>>>>>>  static const struct drm_mode_config_funcs udl_mode_funcs = {
> >>>>>>>>      .fb_create = udl_fb_user_fb_create,
> >>>>>>>> -    .output_poll_changed = NULL,
> >>>>>>>> +    .output_poll_changed = drm_fb_helper_output_poll_changed,
> >>>>>>>
> >>>>>>> No need to set this, it's already wired up:
> >>>>>>>
> >>>>>>> drm_kms_helper_hotplug_event -> drm_client_dev_hotplug ->
> >>>>>>> drm_fbdev_client_hotplug -> drm_fb_helper_hotplug_event
> >>>>>>>
> >>>>>>> Noralf.
> >>>>>>>
> >>>>>>>>  };
> >>>>>>>>
> >>>>>>>>  int udl_modeset_init(struct drm_device *dev)
> >>>>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> Thomas Zimmermann
> >>>>>> Graphics Driver Developer
> >>>>>> SUSE Software Solutions Germany GmbH
> >>>>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
> >>>>>> (HRB 36809, AG Nürnberg)
> >>>>>> Geschäftsführer: Felix Imendörffer
> >>>>>>
> >>>>>
> >>>>>
> >>>>
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
> >>>> (HRB 36809, AG Nürnberg)
> >>>> Geschäftsführer: Felix Imendörffer
> >>>>
> >>>
> >>>
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 Nürnberg, Germany
> >> (HRB 36809, AG Nürnberg)
> >> Geschäftsführer: Felix Imendörffer
> >>
> > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
