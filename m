Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C8F6E1DA7
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Apr 2023 09:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjDNH5E (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Apr 2023 03:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjDNH4y (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Apr 2023 03:56:54 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2877EC3
        for <linux-fbdev@vger.kernel.org>; Fri, 14 Apr 2023 00:56:52 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id e9so11468875oig.7
        for <linux-fbdev@vger.kernel.org>; Fri, 14 Apr 2023 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681459011; x=1684051011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX2r5dtqKV/2C2mwITf+tmDjaCFC07LGdrxM2/zq5mY=;
        b=ZcxcspjHZccEylJwyzfpxUmLL3EA2L9/WeFRA056Up8mdGav5ZoTcCmmQ6eAarn9ag
         pe2upzhypDiyWVk2sCONlU+Xl6U+m8pa4Y6bMsWEZGKOQ5u/j3TLLOGf0+2UgP14f3Gy
         QTAET00puVvPYfclpJRUwDZfag2GoxyCZmV4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681459011; x=1684051011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HX2r5dtqKV/2C2mwITf+tmDjaCFC07LGdrxM2/zq5mY=;
        b=O0J0YCZu/atXjsAAV84WuMtspqtCg+ZNJ3Kdd7gGPTd2gITCUydo0T0QXQbjawz2XX
         4HEcow5gUnVtHf3l6L6sKHI/8WaeFaeLTLhQ5x/qcFBSzf+ZMy+y1Cl0IqLIk9G91tIW
         Wv8s+CwCmluZZ7Ayvrd1Qv847pk+Kg30O5//Kg02g/kZRFBRnMrQ2zQI6siFJMNWx797
         iTs7UM8C1ZkTPuwdr01N/Q4uX2xUW160ueQtBbS5gHTaUOKjvj/Pbz0Tae4g8YqgQr5d
         yHoRD2u27XtdmYJf9UAP29+O7LvgpBIbTBtO3b2tnHf0zok/uiK487x+T/zcC3OralEB
         3RlQ==
X-Gm-Message-State: AAQBX9fSqHoj2TsePx660bGkxDagzSuT3q5dcwiOeF0FWR/l5ro489xK
        vJSOIxxQZBcQV6zHQkkn8XXD5D14BBxmDfRb0KcCYQ==
X-Google-Smtp-Source: AKy350YaMJe1bos4jzbbhk8jqfPq+EPub1ZufON7aoot0I84SKcLVYMJIb6cuzmQbedpGItE6baa9hoixryWZmN7llc=
X-Received: by 2002:aca:df06:0:b0:38c:319c:2f6f with SMTP id
 w6-20020acadf06000000b0038c319c2f6fmr529838oig.8.1681459011345; Fri, 14 Apr
 2023 00:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230409132110.494630-1-15330273260@189.cn> <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn> <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn> <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn> <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de> <ZDhfkq92hbGc630z@phenom.ffwll.local>
 <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn> <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>
 <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
In-Reply-To: <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 14 Apr 2023 09:56:39 +0200
Message-ID: <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Sui Jingfeng <15330273260@189.cn>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
        Helge Deller <deller@gmx.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 14 Apr 2023 at 09:34, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 14.04.23 um 07:36 schrieb Daniel Vetter:
> > On Fri, 14 Apr 2023 at 06:24, Sui Jingfeng <15330273260@189.cn> wrote:
> >>
> >> Hi,
> >>
> >> On 2023/4/14 04:01, Daniel Vetter wrote:
> >>> On Thu, Apr 13, 2023 at 09:20:23PM +0200, Thomas Zimmermann wrote:
> >>>> Hi
> >>>>
> >>>> Am 13.04.23 um 20:56 schrieb Daniel Vetter:
> >>>> [...]
> >>>>> This should switch the existing code over to using drm_framebuffer =
instead
> >>>>> of fbdev:
> >>>>>
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_=
fb_helper.c
> >>>>> index ef4eb8b12766..99ca69dd432f 100644
> >>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>>>> @@ -647,22 +647,26 @@ static void drm_fb_helper_damage(struct drm_f=
b_helper *helper, u32 x, u32 y,
> >>>>>     static void drm_fb_helper_memory_range_to_clip(struct fb_info *=
info, off_t off, size_t len,
> >>>>>                                             struct drm_rect *clip)
> >>>>>     {
> >>>>> +   struct drm_fb_helper *helper =3D info->par;
> >>>>> +
> >>>>>      off_t end =3D off + len;
> >>>>>      u32 x1 =3D 0;
> >>>>>      u32 y1 =3D off / info->fix.line_length;
> >>>>> -   u32 x2 =3D info->var.xres;
> >>>>> -   u32 y2 =3D DIV_ROUND_UP(end, info->fix.line_length);
> >>>>> +   u32 x2 =3D helper->fb->height;
> >>>>> +   unsigned stride =3D helper->fb->pitches[0];
> >>>>> +   u32 y2 =3D DIV_ROUND_UP(end, stride);
> >>>>> +   int bpp =3D drm_format_info_bpp(helper->fb->format, 0);
> >>>> Please DONT do that. The code here is fbdev code and shouldn't bothe=
r about
> >>>> DRM data structures. Actually, it shouldn't be here: a number of fbd=
ev
> >>>> drivers with deferred I/O contain similar code and the fbdev module =
should
> >>>> provide us with a helper. (I think I even had some patches somewhere=
.)
> >>> Well my thinking is that it's a drm driver,
> >>
> >> Yes, I actually agree with this, and the code looks quite good. And I
> >> really want to adopt it.
> >>
> >> Because here is DRM, we should emulate the fbdev in the DRM's way.
> >>
> >> The DRM is really the big brother on the behind of emulated fbdev,
> >>
> >> who provide the real displayable backing memory and scant out engine t=
o
> >> display such a buffer.
> >>
> >>
> >> But currently, the fact is,  drm_fb_helper.c still initializes lots of
> >> data structure come from fbdev world.
> >>
> >> For example, the drm_fb_helper_fill_fix() and drm_fb_helper_fill_var()
> >> in drm_fb_helper_fill_info() function.
> >>
> >> This saying implicitly that the fbdev-generic is a glue layer which co=
py
> >> damage frame buffer data
> >>
> >> from the front end(fbdev layer) to its drm backend.  It's not a 100%
> >> replacement its fbdev front end,
> >>
> >> rather, it relay on it.
> >>
> >>
> >>> so if we have issue with limit
> >>> checks blowing up it makes more sense to check them against drm limit=
s.
> >>> Plus a lot more people understand those than fbdev. They should all m=
atch
> >>> anyway, or if they dont, we have a bug.
> >>
> >> Yes, this is really what I'm worry about.
> >>
> >> I see that  members of struct fb_var_screeninfo can be changed by
> >> user-space. For example, xoffset and yoffset.
> >>
> >> There is no change about 'info->var.xres' and 'info->var.yres' from th=
e
> >> userspace,
> >>
> >> therefore, they should all match in practice.
> >>
> >>
> >> User-space can choose a use a smaller dispaly area than 'var.xres x
> >> var.yres',
> >>
> >> but that is implemented with 'var.xoffset' and 'var.xoffset'.
> >>
> >> But consider that the name 'var', which may stand for 'variation' or
> >> 'vary'. This is terrifying.
> >>
> >> I imagine, with a shadow buffer, the front end can do any modeset on t=
he
> >> runtime freely,
> >>
> >> including change the format of frame buffer on the runtime.  Just do n=
ot
> >> out-of-bound.
> >>
> >> The middle do the conversion on the fly.
> >>
> >>
> >> We might also create double shadow buffer size to allow the front end =
to
> >> pan?
> >
> > Yeah so the front should be able to pan. And the front-end can
> > actually make xres/yres smalle than drm_fb->height/width, so we _have_
> > to use the fb side of things. Otherwise it's a bug I just realized.
>
> What are you talking about?  The GEM buffer is a full fbdev framebuffer,
> which is screen resolution multiplied by the overall factor.  The shadow
> buffer is exactly the same size. You can already easily pan within these
> buffers.
>
> There's also no need/way to change video modes or formats in the shadow
> buffer. If we'd ever support that, it would be implemented in the DRM
> driver's modesetting.  The relationship between GEM buffer and shadow
> buffer remains unaffected by this.

Try it and be amazed :-) I've seen enough syzkaller bugs and screamed
at them that yes we do this. Also xres/yres is the wrong thing even if
you don't use fb ioctl to change things up in multi-monitor cases (we
allocate the drm_fb/fbdev virtual size to match the biggest
resolution, but then set fbinfo->var.x/yres to match the smallest to
make sure fbcon is fully visible everywhere).

I think you're confusion is the perfect case for why we really should
use fb->height/width/pitches[0] here.
-Daniel

>
> Best regards
> Thomas
>
> >
> > The xres_virtual/yres_virtual should always match drm_fb sizes (but
> > we've had bugs in the past for that, only recently fixed all in
> > linux-next), because that's supposed to be the max size. And since we
> > never reallocate the fbdev emulation fb (at least with the current
> > code) this should never change.
> >
> > But fundamentally you're bringing up a very good point, we've had
> > piles of bugs in the past with not properly validating the fbdev side
> > information in info->var, and a bunch of resulting bugs. So validating
> > against the drm side of things should be a bit more robust.
> >
> > It's kinda the same we do for legacy kms ioctls: We translate that to
> > atomic kms as fast as possible, and then do the entire subsequent
> > validation with atomic kms data structures.
> > -Daniel
> >
> >>> The thing is, if you change this
> >>> further to just pass the drm_framebuffer, then this 100% becomes a dr=
m
> >>> function, which could be used by anything in drm really.
> >>
> >> I agree with you.
> >>
> >> If I use fb_width/fb_height directly and bypassing 'info->var.xres" an=
d
> >> "info->var.yres",
> >>
> >> the code style diverged then. As far as I am understanding,  the clip
> >> happen on the front end,
> >>
> >> the actual damage update happen at back end.
> >>
> >> Using the data structure come with the front end is more reasonable fo=
r
> >> current implement.
> >>
> >>> But also *shrug*.
> >>
> >> I can convert this single function to 100% drm with another patch.
> >>
> >> But, maybe there also have other functions are not 100% drm
> >>
> >> I would like do something to help achieve this in the future,
> >>
> >> let me help to fix this bug first?
> >>
> >>> -Daniel
> >
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
