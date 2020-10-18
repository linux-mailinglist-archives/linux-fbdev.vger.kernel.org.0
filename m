Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABEC292059
	for <lists+linux-fbdev@lfdr.de>; Sun, 18 Oct 2020 23:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbgJRVvb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 18 Oct 2020 17:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730045AbgJRVvb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 18 Oct 2020 17:51:31 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4901C0613CE
        for <linux-fbdev@vger.kernel.org>; Sun, 18 Oct 2020 14:51:30 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 16so10265828oix.9
        for <linux-fbdev@vger.kernel.org>; Sun, 18 Oct 2020 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uOm0rH6s2Inn755KHRA5gyyrbT/Z7MN7Wu94ps17kzM=;
        b=PtP8AXVD5f+47NsKbqu4NiODWxLDn19lVbSVwxYhNGSh+fG5k9ev+in+zI5toF9YIl
         ziHwu7efYWqlJQiUKyfnHgOUIq/uWgYyDqbQ4Zoum18JyJRAPQ5AiXVZ6e1ns47ZRSPa
         HMDzHnJzmzzjLa/NxzqzidWBSY80KuAoUTXsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOm0rH6s2Inn755KHRA5gyyrbT/Z7MN7Wu94ps17kzM=;
        b=e5LB2lOkUGEYxPtEtPioTIT/Dk1vQnvbzwSTppGZYX4bvfsmjX8S+AMlj9NH334XPF
         +ZStJoTR6mVStCdZKB1yVE1fOCdFm1AAfUjjkupXq/7yuL2KzVx8bNCG8E4ce+F5I+i0
         4ukvTt4IEjIRY0kR+1Vf5/tdx0gzqck2c91NaMTSDAJglJO5qW/MzZgppEP1PmFqn8ys
         5madSYiW/CLoVByBBmDCoAF67y0JTBrS+3d7GZJT/qIF4A9yD7eVjuENUdIumzOcwlR9
         atcilgvWoTh+kyqV++DqYdYQQcHPSeZmJsqJW1UY/9f7/HS0OeX49D4JrLPmYuwNO5TB
         UNOg==
X-Gm-Message-State: AOAM5309Fph2FO5scL8ougVkH4Ot5qYwlUV+eN2jtLhRZLuvrULJlsl+
        BkV0GBgJptDzO6JBbLbFPxQNCw7XVZ02n8jsMbd5iw==
X-Google-Smtp-Source: ABdhPJzG61giwgOVJs6TJgWAxcPwMe72Rr1NDVTFtSLV5ouxvE6lsZ05+zjuB9xdjnjWFDbqTmfjkeBtCWPPXv0873w=
X-Received: by 2002:aca:52c4:: with SMTP id g187mr8709278oib.101.1603057890244;
 Sun, 18 Oct 2020 14:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200820082137.5907-1-s.hauer@pengutronix.de> <926453876c92caac34cba8545716a491754d04d5.1603037079.git.yepeilin.cs@gmail.com>
 <CAKMK7uF9E24P=vzKt28=1_iaFTYD7obHs+tEPwwZPNMhh7DBrg@mail.gmail.com>
 <20201018201811.GA697615@PWN> <CAKMK7uFEmNnBdpoHYqvCUYS=nxh99gKs6P1-1pgp-ouvTSioGw@mail.gmail.com>
 <20201018204456.GA697766@PWN>
In-Reply-To: <20201018204456.GA697766@PWN>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Sun, 18 Oct 2020 23:51:19 +0200
Message-ID: <CAKMK7uEoCqaPifM7CiaNwtSe8uZ9V-7joJfXSYLjy5pedAcjOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fonts: Support FONT_EXTRA_WORDS macros for font_6x8
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sven Schneider <s.schneider@arkona-technologies.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Oct 18, 2020 at 10:45 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Sun, Oct 18, 2020 at 10:33:11PM +0200, Daniel Vetter wrote:
> > On Sun, Oct 18, 2020 at 10:18 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > 2/2 is just updating the fb documentation:
> > >
> > > [PATCH 2/2] docs: fb: Add font_6x8 to available built-in fonts
> > > https://lore.kernel.org/lkml/717bb41dda8e2ed615f3faadfbc3e215de726d38.1603037079.git.yepeilin.cs@gmail.com/
> > >
> > > I did `git format-patch -2 --thread=deep`, did I do something wrong when
> > > sending it?
> >
> > No idea, it just didn't arrive anywhere I could find. And I did get
> > your previous patch series. Maybe just try again with dri-devel
> > included and hope it works then?
>
> I'm confused, I see it on LKML in the link above. Sure I'll resend soon.

My brain didn't work, sorry about the confusion.

I'll pick up the patches tomorrow, probably not a good idea I do
anything more today :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
