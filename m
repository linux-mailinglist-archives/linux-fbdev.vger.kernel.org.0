Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FE849C8A2
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Jan 2022 12:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240706AbiAZL1c (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Jan 2022 06:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240704AbiAZL1b (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Jan 2022 06:27:31 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D07C061744
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Jan 2022 03:27:31 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id b17-20020a9d4791000000b005a17fc2dfc1so1630882otf.1
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Jan 2022 03:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u5fcmue9JGNrEVQdtBVNPmwhwIAf9whpXHVpHXm1fCU=;
        b=SHtAmyZuexHqrBpkdQYeSiAPX3PE0nXKd+pvvyI8W89oj62lBtQlmtZoxceAaa6Dv+
         7kLLvdsuuoluD7C1zZw4yX0wbdmq9Ua3QwPKtHkcZVIm8J1QgQmeReb06gB50ellmHRw
         lse6y/lSQaLbcTyfPFfWw6P5QvC9HZkjVobUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u5fcmue9JGNrEVQdtBVNPmwhwIAf9whpXHVpHXm1fCU=;
        b=TYyVaD665PODzNbXCQuBwOhe6qLqogRtTYTOA1rEGamC80n8U4Sej5RGgt4eeyWhLB
         8DvnK7bk4N4JbdyLQYpKS//pJuTYCcdBUbNgGgbfNxtsb3O4Y1uYQnLyrO9MQfPmYo0K
         kLe4JcqLk0ravceKzB4Zc7aYUc1PePEoFzFaYEkU56gjdA47gVEDChuE/XpFxTzu5Z3s
         XWlYbz1h5BprWayCowcP5MzUGZwJs4xv+6y/hMz2LgnZScjrEeCdzif1rtOoMwMhItUr
         FHtkXpjima9PVj3omiwN2/t4WNsMOHCqdluQAwW1r60YfXX18RoMyWbIs3+mtMvwmmop
         sccg==
X-Gm-Message-State: AOAM530O4BsRYeUBCr1pzFmUZ4hVYb8DGPqV4RnGig5zhFIUwAb0hjlW
        fej1Il0RdIR/uKmguKkHwd3DHObGM6RemFQ9WdQRW5qeZpk=
X-Google-Smtp-Source: ABdhPJzxBwXr2/Lo6sUntBiprCyVHs6MlzSJluy1t2ZYT92MpqbH6loH8t5dyGrpDiZ9+sIH4Ever+tG43xhIM66Auk=
X-Received: by 2002:a05:6830:1e76:: with SMTP id m22mr12004649otr.75.1643196450752;
 Wed, 26 Jan 2022 03:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com> <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
In-Reply-To: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 26 Jan 2022 12:27:19 +0100
Message-ID: <CAKMK7uFhJPpiHqL-040ozbCM=QxiWNrFHp1gOEUvpEUjxbwAQQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To:     Helge Deller <deller@gmx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Phillip Potter <phil@philpotter.co.uk>,
        Carlis <zhangxuezhi1@yulong.com>,
        Lee Jones <lee.jones@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jan 26, 2022 at 12:18 PM Helge Deller <deller@gmx.de> wrote:
>
> On 1/26/22 11:31, Daniel Vetter wrote:
> > On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
> >>> Let's maintain occasional fixes to the fbtft driver.
> >>>
> >>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>> ---
> >>>  MAINTAINERS | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index ea3e6c914384..16e614606ac1 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -7372,9 +7372,11 @@ F:     Documentation/fault-injection/
> >>>  F:   lib/fault-inject.c
> >>>
> >>>  FBTFT Framebuffer drivers
> >>> +M:   Andy Shevchenko <andy@kernel.org>
> >>>  L:   dri-devel@lists.freedesktop.org
> >>>  L:   linux-fbdev@vger.kernel.org
> >>> -S:   Orphan
> >>> +S:   Maintained
> >>> +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
> >>
> >> I'm ok with the files moving if the dri developers agree with it.  It's
> >> up to them, not me.
> >
> > On one hand I'm happy anytime someone volunteers to help out.
> >
> > On the other hand ... why does it have to be resurrecting fbdev?
> > There's an entire community of people who really know graphics and
> > display and spent considerable amount of effort on creating useful and
> > documented helpers for pretty much anything you might ever want to do.
> > And somehow we have to go back to typing out things the hard way, with
> > full verbosity, for an uapi that distros are abandoning (e.g. even for
> > sdl the direction is to run it on top of drm with a compat layer,
> > afaiui fedora is completely ditching any userspace that still even
> > uses /dev/fb/0). And yes I know there's still some gaps in drm,
> > largely for display features which were really en vogue about 20 years
> > ago. And we're happy to add that support, if someone who still has
> > such hardware can put in the little bit of work needed ...
> >
> > I don't get this.
>
> You are describing a transitioning over to DRM - which is Ok.
> But on that way there is no need to ignore, deny or even kill usage scenarios
> which are different compared to your usage scenarios (e.g. embedded devices,
> old platforms, slow devices, slow busses, no 3D hardware features,
> low-color devices, ...).

This patchset isn't about killing existing support.

This is about adding new drivers to a subsystem where consensus the
past 6 years or so was that it's closed for new drivers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
