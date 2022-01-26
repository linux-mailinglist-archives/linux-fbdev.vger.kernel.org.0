Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D717A49C804
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Jan 2022 11:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240254AbiAZKw3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Jan 2022 05:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240288AbiAZKw2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Jan 2022 05:52:28 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D230C061747
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Jan 2022 02:52:28 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bb37so36714434oib.1
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Jan 2022 02:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNuGvUirpZLgviiUUWup/Or/h967yV7FWMRVHEHBy84=;
        b=XuQJ2QuaOAH1guMFs+7qJK7Usxs3OIJFOFUJh3Kg+W+9uVg8Ypcz+nzh+l6fpvZNNr
         WFfm2rMdpfX28Su8mn1xY2IpJUW6FmKhs4toEMVo5qSEu1Omchn0rkkbwdI5t9edO7yt
         BMwnEqCn0Ci7qjy9Yx8Fxa3ZoSb96QLGfI/nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNuGvUirpZLgviiUUWup/Or/h967yV7FWMRVHEHBy84=;
        b=YYNY8nAjQpCd0wx2dMS3f2Zk3ZiaxsPY3ztjuYhSnMrQbQg5vJIzA678bmrido2Bv4
         foc4WNuMIhQ2Qla0o9Y7AR/TSspBtlhNjZicAVG+4+cC/xx94PPa8MVK1Uu7CHvx9XdA
         XVEYw+LRBKOdtuOKr8/bkWLR516UWPsxuWsGWy27e6qNevZzvv3CbeNE2wumnmOChZGW
         CeNX7q+RXc/Mtf9VD8agmMb9VfUXrj0XuqgrMGBLAiTg5XOvtwKvPeXNMyvtlWz53D7+
         uBvS5KMkd7MVvgrO6zl2rrTlmHNkZfD3fSSxs0tMMxL1ObEBTR9jKLmi3Ak/iGJ2LQUh
         R/lg==
X-Gm-Message-State: AOAM533C5BR5xEGTCVh+CKC+r5Vsb1ICcuWucDHNQpdPEUF8A4cxsblt
        +SRGojjY7+eioeVzyO3HMldWLSgiQwaZKHXb1rVzdg==
X-Google-Smtp-Source: ABdhPJzPYkubRtpxhbQ9mgH5mK8ga1ADV0xj1R2SeDADNqICmknnx/N/28B3XxA4NLAA3/9nww800A/xqxovI/pIEAE=
X-Received: by 2002:aca:ab4a:: with SMTP id u71mr3195965oie.176.1643194347425;
 Wed, 26 Jan 2022 02:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de> <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <YfEmuGVQ+IlhdQDh@kroah.com>
In-Reply-To: <YfEmuGVQ+IlhdQDh@kroah.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 26 Jan 2022 11:52:16 +0100
Message-ID: <CAKMK7uEiUH8vD3jUCDPXFbF2YS5LygJLVOosbnUnvMP0MU2kTg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Phillip Potter <phil@philpotter.co.uk>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Carlis <zhangxuezhi1@yulong.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jan 26, 2022 at 11:47 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 26, 2022 at 12:02:36PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Hi
> > >
> > > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
> > > > Since we got a maintainer for fbdev, I would like to
> > > > unorphan fbtft (with the idea of sending PRs to Helge)
> > > > and move it out of staging since there is no more clean
> > > > up work expected and no more drivers either.
> > > >
> > > > Thoughts?
> >
> > Thanks for sharing yours, my answers below.
> >
> > > But why? We already have DRM drivers for some of these devices.
> >
> > No, we do not (only a few are available).
> >
> > > Porting
> > > the others to DRM is such a better long-term plan.  OTOH, as no one has
> > > shown up and converted them, maybe they should be left dead or removed
> > > entirely.
> >
> > As I mentioned above there are devices that nobody will take time to
> > port to a way too complex DRM subsystem. But the devices are cheap and
> > quite widespread in the embedded world. I'm in possession of 3 or 4
> > different models and only 1 is supported by tiny DRM.
>
> Great, then let's just move the 2 models that you do not have support
> for in DRM, not the whole lot.  When we have real users for the drivers,
> we can move them out of staging, but until then, dragging all of them
> out does not make sense.

Can't we create drm drivers for these 2-3 models? Like we have drivers
which are below 300 lines with all the helpers taking care of
everything, this shouldn't be too tricky.

And if no one cares enough for that, then imo let's just keep this in
staging and let it quietly&slowly pass away. At least from the people
who've been active in any kind of display development the past 6+
years (which is roughly when Tomi abandoned fbdev as last active
maintainer) the consensus _is_ that drm drivers are simpler, quicker
to type (once you got hold of the subsystem and all its helpers at
least), and adding new fbdev drivers just makes no sense at all.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
