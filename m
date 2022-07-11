Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462D55701AF
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Jul 2022 14:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbiGKMIZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 11 Jul 2022 08:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbiGKMIX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 11 Jul 2022 08:08:23 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E72A422DA;
        Mon, 11 Jul 2022 05:08:20 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id l2so195822qvt.2;
        Mon, 11 Jul 2022 05:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=autvjFUd9BwlA5CMi8F4/VEnOxd5KyEX6z2vFI+rQes=;
        b=oqI0iuaF2H2wGh4NeYKOXQJur/+z7Kurz6FeQt10e7AzhB6y5YDkhTdH5Pq6jqFp8z
         DjB/2Gue8X4XPKi0mY1cLspXoQhrCQScUynXJ67mrJ5Hl0qWsBbXQyJVXvyrDhy4jQza
         Jzhs31nCeQZBSPDn1t4GyiesWVUapN9/5gkcCsTxs2sTWwdqL03IhfDTe90wjAMoixId
         WXnOnKfk+eHnacx8ikS7WyJOLcoBGhf62HVLMc9ok2yVHG6FxAvaNhGPrprGgEfj7Tdq
         wLfRCDs6kgM0hebuUCZ1j22XeofETq62UXQDBJkFmi4NrJP65ViCD7dcd6YZR+oxTa0w
         r7/g==
X-Gm-Message-State: AJIora8wcDxzAS2UmthzPHMu9+b0ky6Rfrl4l+gBdHKqRDUoGOExDXbS
        cRCCAKpCJ+o5ULPWdT0w8xrDlIUF05H7EA==
X-Google-Smtp-Source: AGRyM1vnORJM/tw2Zoj0iuIU/ZNQnkpGgvGguYGN/eEUpUKb38yF55p1zcQBUWdZLnFzo7s1yM3bPw==
X-Received: by 2002:a05:6214:e87:b0:473:129e:224a with SMTP id hf7-20020a0562140e8700b00473129e224amr13093540qvb.29.1657541298877;
        Mon, 11 Jul 2022 05:08:18 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id h129-20020a379e87000000b006b55df40976sm5911999qke.27.2022.07.11.05.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 05:08:18 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31bf3656517so46180487b3.12;
        Mon, 11 Jul 2022 05:08:18 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr19178774ywg.383.1657541298151; Mon, 11
 Jul 2022 05:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301107.git.geert@linux-m68k.org> <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de> <20220711093513.wilv6e6aqcuyg52w@houat>
 <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de> <20220711114206.sawqdl54ibuxsxp4@houat>
 <CAMuHMdXbFHWWQoryXihVsSrC5ZzHEV-YYR_eLvNmSAw8Y61TQg@mail.gmail.com> <20220711120243.v6lwoynqigle2aot@houat>
In-Reply-To: <20220711120243.v6lwoynqigle2aot@houat>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Jul 2022 14:08:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhmf5TudQ6a1PUVV8KXff6JjgMmZOmOWVb2qW6eXF7Ow@mail.gmail.com>
Message-ID: <CAMuHMdXhmf5TudQ6a1PUVV8KXff6JjgMmZOmOWVb2qW6eXF7Ow@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Maxime,

On Mon, Jul 11, 2022 at 2:02 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Mon, Jul 11, 2022 at 01:59:28PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jul 11, 2022 at 1:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Mon, Jul 11, 2022 at 01:11:14PM +0200, Thomas Zimmermann wrote:
> > > > Am 11.07.22 um 11:35 schrieb Maxime Ripard:
> > > > > On Mon, Jul 11, 2022 at 11:03:38AM +0200, Thomas Zimmermann wrote:
> > > > > > Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > > > > > > The mode parsing code recognizes named modes only if they are explicitly
> > > > > > > listed in the internal whitelist, which is currently limited to "NTSC"
> > > > > > > and "PAL".
> > > > > > >
> > > > > > > Provide a mechanism for drivers to override this list to support custom
> > > > > > > mode names.
> > > > > > >
> > > > > > > Ideally, this list should just come from the driver's actual list of
> > > > > > > modes, but connector->probed_modes is not yet populated at the time of
> > > > > > > parsing.
> > > > > >
> > > > > > I've looked for code that uses these names, couldn't find any. How is this
> > > > > > being used in practice? For example, if I say "PAL" on the command line, is
> > > > > > there DRM code that fills in the PAL mode parameters?
> > > > >
> > > > > We have some code to deal with this in sun4i:
> > > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_tv.c#L292
> > > > >
> > > > > It's a bit off topic, but for TV standards, I'm still not sure what the
> > > > > best course of action is. There's several interactions that make this a
> > > > > bit troublesome:
> > > > >
> > > > >    * Some TV standards differ by their mode (ie, PAL vs NSTC), but some
> > > > >      other differ by parameters that are not part of drm_display_mode
> > > > >      (NTSC vs NSTC-J where the only difference is the black and blanking
> > > > >      signal levels for example).
> > > > >
> > > > >    * The mode names allow to provide a fairly convenient way to add that
> > > > >      extra information, but the userspace is free to create its own mode
> > > > >      and might omit the mode name entirely.
> > > > >
> > > > > So in the code above, if the name has been preserved we match by name,
> > > > > but we fall back to matching by mode if it hasn't been, which in this
> > > > > case means that we have no way to differentiate between NTSC, NTSC-J,
> > > > > PAL-M in this case.
> > > > >
> > > > > We have some patches downstream for the RaspberryPi that has the TV
> > > > > standard as a property. There's a few extra logic required for the
> > > > > userspace (like setting the PAL property, with the NTSC mode) so I'm not
> > > > > sure it's preferable.
> > > > >
> > > > > Or we could do something like a property to try that standard, and
> > > > > another that reports the one we actually chose.
> > > > >
> > > > > > And another question I have is whether this whitelist belongs into the
> > > > > > driver at all. Standard modes exist independent from drivers or hardware.
> > > > > > Shouldn't there simply be a global list of all possible mode names? Drivers
> > > > > > would filter out the unsupported modes anyway.
> > > > >
> > > > > We should totally do something like that, yeah
> > > >
> > > > That sun code already looks like sometihng the DRM core/helpers should be
> > > > doing. And if we want to support named modes well, there's a long list of
> > > > modes in Wikipedia.
> > > >
> > > > https://en.wikipedia.org/wiki/Video_Graphics_Array#/media/File:Vector_Video_Standards2.svg
> > >
> > > Yeah, and NTSC is missing :)
> >
> > And that diagram is about the "digital" variant of PAL.
> > If you go the analog route, the only fixed parts are vfreq/hfreq,
> > number of lines, and synchronization. Other parameters like overscan
> > can vary.  The actual dot clock can vary wildly: while there is an
> > upper limit due to bandwidth limitations, you can come up with an
> > almost infinite number of video modes that can be called PAL, which
> > is one of the reasons why I don't want hardware-specific variants to
> > end up in a global video mode database.
>
> Do you have an example of what that would look like?

You mean a PAL mode that does not use 768x576?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/video/fbdev/amifb.c#n834
(TAG_HIRES is replaced by the actual dot clock at runtime, as it
 depends on the crystal present on the mainboard).
Amifb also supports 320x256, by doubling the dot clock, but that mode
is not part of the database.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
