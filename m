Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057AC2603F2
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Sep 2020 19:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgIGR5c (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 7 Sep 2020 13:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbgIGR5a (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 7 Sep 2020 13:57:30 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F343C061573
        for <linux-fbdev@vger.kernel.org>; Mon,  7 Sep 2020 10:57:30 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a65so15056979wme.5
        for <linux-fbdev@vger.kernel.org>; Mon, 07 Sep 2020 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=RsFG54GV+NP4F+IIVMuYkYvf7gdGYuBHjlNkFLPcIoM=;
        b=jXFW2vpqo0B1JyOT5VBIuG9gyefyLdQ0ycGwHcTHninipd8+5VtxLgb8IkgYYvMt+v
         8W+GI4P2cd8TxlUpDDrsjBQnd8tqBCLuASSa1+xYojW+R0KHtDvEovie75S1Z6YMzFju
         JSavVRhxpqkmcQ+s4OQk1bVYh4yKB5g9BqEvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=RsFG54GV+NP4F+IIVMuYkYvf7gdGYuBHjlNkFLPcIoM=;
        b=hXVBRLkiTUAYL2o3bpvrGzWRZ78QUIFSlQGT90NZ2qE7KftbBaoKN0GW5OHQCdldez
         5Y/hL8hkBELhRojz6eQi8kn0Mm43hvIEOmY8O7st1NG6By3nvp/HBw/YnQTYhaj55BR6
         IDUik711ld9oKHCebl2+tithq6IRARdMd64oWVX5vFiaCWs3Us6UZOny7u2fUFUmbO2t
         BJ+tuOea43gNUscocYECdWS72OtCA1LOaMalYpGKPLMsNSFcy7KwmvMilE8Hq0oAY6At
         E2QdekvwJDxFQ7N7xpVAawhODwW4LH7TiRyWoQq+DDakDuq7kd/MFxOrdpoTk2djJcty
         0oFw==
X-Gm-Message-State: AOAM531nKwCsudkhTylP4mjTOGuSbW0ulLmd1ymS6Ag5UVNtUGDhOexX
        cXzYt9C1QUXbORd/5Mf2ROcsRg==
X-Google-Smtp-Source: ABdhPJwkSG6w/oKeAR2zEQQ1pJGVVVgYfJ7bv5Pg1nyA4WyBR3gTj1fQsBdjbM44Fhl2fJnj9VpuFQ==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr423949wmj.171.1599501448675;
        Mon, 07 Sep 2020 10:57:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 71sm30404303wrm.23.2020.09.07.10.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:57:27 -0700 (PDT)
Date:   Mon, 7 Sep 2020 19:57:25 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v1 0/2] video: fbdev: radeonfb: PCI PM framework upgrade
 and fix-ups.
Message-ID: <20200907175725.GX2352366@phenom.ffwll.local>
Mail-Followup-To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
 <20200907091621.GA30377@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907091621.GA30377@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Sep 07, 2020 at 02:46:21PM +0530, Vaibhav Gupta wrote:
> On Mon, Sep 07, 2020 at 09:55:59AM +0200, Daniel Vetter wrote:
> > On Thu, Aug 06, 2020 at 12:52:54PM +0530, Vaibhav Gupta wrote:
> > > Linux Kernel Mentee: Remove Legacy Power Management. 
> > > 
> > > The original goal of the patch series is to upgrade the power management
> > > framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
> > > and .resume() callbacks.
> > > 
> > > The upgrade makes sure that the involvement of PCI Core does not change the
> > > order of operations executed in a driver. Thus, does not change its behavior.
> > > 
> > > During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
> > > redundant. This was introduced in the commit
> > > 42ddb453a0cd ("radeon: Conditionally compile PM code").
> > 
> > I do wonder whether it wouldn't be better to just outright delete these,
> > we have the drm radeon driver for pretty much all the same hardware ...
> > -Daniel
> > 
> Hello Daniel,
> I don't have any problem in either way. My priority is to get rid of the
> legacy .suspend and .resume pointers from "struct pci_driver" . Hence, modifying
> every driver that is using them.

Ok, also sounds like we can't just ditch it outright and merging your
patches makes sense.

Please note that Bart (he's usually picking up the fbdev patches) is on
vacations until next week, I guess he'll then go and vacuum up everything
for 5.10 as he usually does.

Cheers, Daniel

> 
> Vaibhav Gupta
> > > 
> > > ------------
> > > 
> > > Before 42ddb453a0cd:
> > > $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > > 
> > > Based on output in terminal:
> > > 
> > > 547:#ifdef CONFIG_PM
> > >        |-- 959:#ifdef CONFIG_PPC_PMAC
> > >        |-- 972:#endif
> > >        |-- 1291:#ifdef CONFIG_PPC_OF
> > >        |-- 1301:#endif /* CONFIG_PPC_OF */
> > >        |-- 1943:#ifdef CONFIG_PPC_OF
> > >                    |-- 2206:#if 0 /* Not ready yet */
> > >                    |-- 2508:#endif /* 0 */
> > >        |-- 2510:#endif /* CONFIG_PPC_OF */
> > >        |-- 2648:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2654:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2768:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2774:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2791:#ifdef CONFIG_PPC_OF__disabled
> > >        |-- 2801:#endif /* CONFIG_PPC_OF */
> > > 2803:#endif /* CONFIG_PM */
> > > 
> > > ------------
> > > 
> > > After 42ddb453a0cd:
> > > $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > > 
> > > Based on output in terminal:
> > > 
> > > 547:#ifdef CONFIG_PM
> > >        |-- 959:#ifdef CONFIG_PPC_PMAC
> > >        |-- 972:#endif
> > >        |-- 1291:#ifdef CONFIG_PPC_OF
> > >        |-- 1301:#endif /* CONFIG_PPC_OF */
> > >        |-- 1430:#if defined(CONFIG_PM)
> > >                    |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
> > >                    |-- 1944:#endif
> > >                    |-- 1946:#ifdef CONFIG_PPC_OF
> > >                                |-- 1947:#ifdef CONFIG_PPC_PMAC
> > >                                |-- 2208:#endif
> > >                    |-- 2209:#endif
> > >                    |-- 2211:#if 0 /* Not ready yet */
> > >                    |-- 2513:#endif /* 0 */
> > >        |-- 2515:#endif /* CONFIG_PPC_OF */
> > >        |-- 2653:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2659:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2773:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2779:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2796:#ifdef CONFIG_PPC_OF__disabled
> > >        |-- 2806:#endif /* CONFIG_PPC_OF */
> > > 2808:#endif /* CONFIG_PM */
> > > 
> > > ------------
> > > 
> > > This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)
> > > 
> > > The patch-series fixes it along with PM upgrade.
> > > 
> > > All patches are compile-tested only.
> > > 
> > > Test tools:
> > >     - Compiler: gcc (GCC) 10.1.0
> > >     - allmodconfig build: make -j$(nproc) W=1 all
> > > 
> > > Vaibhav Gupta (2):
> > >   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
> > >   fbdev: radeonfb:use generic power management
> > > 
> > >  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
> > >  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
> > >  drivers/video/fbdev/aty/radeonfb.h    |  3 +--
> > >  3 files changed, 35 insertions(+), 16 deletions(-)
> > > 
> > > -- 
> > > 2.27.0
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
