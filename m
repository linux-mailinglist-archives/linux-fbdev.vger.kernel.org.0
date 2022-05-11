Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0288D5233F0
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 May 2022 15:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243355AbiEKNTU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 May 2022 09:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243530AbiEKNSy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 May 2022 09:18:54 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AAEC9EE5
        for <linux-fbdev@vger.kernel.org>; Wed, 11 May 2022 06:18:39 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id n10so4013543ejk.5
        for <linux-fbdev@vger.kernel.org>; Wed, 11 May 2022 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0ez9TXiKaOl72tEoV60FrlOBkHPwboHnppSug+gfkOo=;
        b=AZvGNJP2363v6TN8/GS5hENFTQ0BNKe+jWaNl89FHJLwTiyzJllczlQosgV/8gKSPl
         k/r0geg1iE4xe/6Vvft5LzRvVcwoMLpok5wnHUrkyJwMmp1MeSKatSjbreIyNyW12vH0
         VY7saVz4vb7tvLBfcWR1gPGEQ/TXeUGYUvTRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=0ez9TXiKaOl72tEoV60FrlOBkHPwboHnppSug+gfkOo=;
        b=pFgP803OLPS4+d/CeMajn3zqY8ew0u/ZT9+87VspiLkghp5ftICx189NEFCfpNj3L8
         7RgZjhBNMt+XA1nMVuHv3faLO1fHsGWrLEStdZ8iuWwCPXhRI+OXWknxHRR5k/VhiCHp
         +yEnzMvHaJdINCNhJccsYkEdTElqEazJj+hqoAeWeeBSMyrIn0etbsbJCs1peqcov2IU
         0kt4YKbKQwwLFOTj9/7f6Wf3W54hPjQfUeeiFD+XBdmFhTvjfmMEgF8s67OXebfSrkrf
         9Fh6xIfy0//StdLkWfaseF0SXW+SaVb3b8f2Yy0//747FSjx6itMKgNVEjmmhJtEov4n
         4iKg==
X-Gm-Message-State: AOAM530ssGzQhURQkxRMQ0CnXPZ3ot1yFUSsQBHCHRA3DYmv4yJnXnAv
        qTuItsKJPn74gRRvrgaT2XICGg==
X-Google-Smtp-Source: ABdhPJzAAytEOBJC9d8weQVKkGdTDHAUDyPw/j1hyXBhNoXuggtWfKEBCC0fJwT/f+TZszfW1UM2RA==
X-Received: by 2002:a17:907:2d24:b0:6f4:3152:3d1a with SMTP id gs36-20020a1709072d2400b006f431523d1amr23800536ejc.324.1652275117889;
        Wed, 11 May 2022 06:18:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g7-20020a170906c18700b006f3ef214e58sm1003731ejz.190.2022.05.11.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 06:18:37 -0700 (PDT)
Date:   Wed, 11 May 2022 15:18:35 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Message-ID: <Ynu3qy5DrSVHv1/U@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>
References: <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <8401c328-ed67-8d5e-4ba2-b487f256e139@intel.com>
 <42fe44ae-de02-5506-d1b4-059af0419366@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42fe44ae-de02-5506-d1b4-059af0419366@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, May 10, 2022 at 09:50:38AM +0200, Javier Martinez Canillas wrote:
> On 5/10/22 09:19, Andrzej Hajda wrote:
> > 
> > 
> > On 10.05.2022 00:42, Javier Martinez Canillas wrote:
> >> On 5/10/22 00:22, Andrzej Hajda wrote:
> >>
> >> [snip]
> >>
> >>>>    static void drm_fbdev_fb_destroy(struct fb_info *info)
> >>>>    {
> >>>> +       if (info->cmap.len)
> >>>> +               fb_dealloc_cmap(&info->cmap);
> >>>> +
> >>>>           drm_fbdev_release(info->par);
> >>>> +       framebuffer_release(info);
> >>> I would put drm_fbdev_release at the beginning - it cancels workers
> >>> which could expect cmap to be still valid.
> >>>
> >> Indeed, you are correct again. [0] is the final version of the patch I've
> >> but don't have an i915 test machine to give it a try. I'll test tomorrow
> >> on my test systems to verify that it doesn't cause any regressions since
> >> with other DRM drivers.
> >>
> >> I think that besides this patch, drivers shouldn't need to call to the
> >> drm_fb_helper_fini() function directly. Since that would be called during
> >> drm_fbdev_fb_destroy() anyways.
> >>
> >> We should probably remove that call in all drivers and make this helper
> >> function static and just private to drm_fb_helper functions.
> >>
> >> Or am I missing something here ?
> > 
> > This is question for experts :)
> 
> Fair. I'm definitely not one of them :)
> 
> > I do not know what are user API/ABI expectations regarding removal of 
> > fbdev driver, I wonder if they are documented somewhere :)
> 
> I don't know. At least I haven't found them.
> 
> > Apparently we have some process of 'zombification'  here - we need to 
> > remove the driver without waiting for userspace closing framebuffer(???) 
> > (to unbind ops-es and remove references to driver related things), but 
> > we need to leave some structures to fool userspace, 'info' seems to be 
> > one of them.
> 
> That's correct, yes. I think that any driver that provides a .mmap file
> operation would have the same issue. But drivers keep an internal state
> and just return -ENODEV or whatever on read/write/close after a removal.

Just commenting on the mmap part here. I think there's two options:

- shadow buffer for fbdev defio, and keep the shadow buffer around until
  fb_destroy

- redirect fbdev mmap fully to gem mmap, and make sure the gem mmap is
  hotunplug safe. The approach amd folks are pushing for that we discussed
  is to replace them all with a dummy r/w page, because removing the ptes
  means you can get a SIGBUS almost anywhere in application code, and that
  violates like all the assumptions behind gl/vk and would just crash your
  desktop. Reading/writing garbage otoh is generally much better.

So yeah hotunplug safe fbdev mmap is still quite a bit of work ...

Cheers, Daniel
> 
> The fbdev subsystem is different though since as you said it, the fbdev
> core unconditionally calls to the driver .fb_release() callback with a
> struct fb_info reference as argument.
> 
> I tried to prevent that with commit aafa025c76dc ("fbdev: Make fb_release()
> return -ENODEV if fbdev was unregistered") but Daniel pointed out that
> is was wrong since could leak memory allocated and was expected to be
> freed on release.
> 
> That's why I instead fixed the issue in the fbdev drivers and just added
> a warn on fb_release(), that is $SUBJECT.
> 
> > So I guess there should be something called on driver's _remove path, 
> > and sth on destroy path.
> >
> 
> That was my question actually, do we need something to be called in the
> destroy path ? Since that could just be internal to the DRM fb helpers.
> 
> In other words, drivers should only care about setting a generic fbdev
> by calling drm_fbdev_generic_setup(), and then do any HW cleanup in the
> removal path, but let the fb helpers to handle the SW cleanup in destroy.
>  
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
