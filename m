Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C882E495C49
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Jan 2022 09:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349700AbiAUIra (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jan 2022 03:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349499AbiAUIrV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jan 2022 03:47:21 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267C2C061574
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jan 2022 00:47:21 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a10-20020a9d260a000000b005991bd6ae3eso10898859otb.11
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jan 2022 00:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTU29Vd39alUth1lv80uW9+OTVBlyJFtnlVs7XZ4g0U=;
        b=ZFu2SshhTOHKlkc/b+4TRfashMda7GnAW3h5UHdHgEqpU676K6+mNXoXBA2LdQ2I6i
         Uohcjg/m8sqM7DsAjG5pRUo3ZDOvVhnEaVLkjDecHFQzgvPZUUyOKGn82fPYSgIEaelI
         3CJdSa0m60uHDFC4uGviXk1TV/OlhWShMWVs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTU29Vd39alUth1lv80uW9+OTVBlyJFtnlVs7XZ4g0U=;
        b=Dp7eRvrIS+WZBtfxiP4Dqsmc9BscTjHPLP0Obm/r9QhQNYXs+2YivzjUkbNTfmQxKp
         WXPyQJhbss11sXgYGSvB8gdj5XIpgfCChbOcCsFNQM6eQiQe36YIL4VPC9mJx7RRPnzW
         YSZ7xvv3LsBkMsZ+y8BA1O90LplRIscZQcLRxPFCCTkQ6UQY93liFIkmrbJKKwt2P7Xr
         IeWtK5hH8sflJa0RkHBU6zFRFFkFQMitvwIUcqxZqgy7M0Zrf2kEhM9OBhehltgpkPAu
         2qGdfzUN3NkHmuV5/MkSMaV6H8UwhQJkbYz08E4CH1YrQl/vqXN3PSpg5lzO+r7Lktp/
         7Y8Q==
X-Gm-Message-State: AOAM5311719Qg5yuXTe48XIdFiEHnNUbwqHdYQjpVZAAE+J0b8Fys4nu
        IBacEyzMNT5nfxxT4yBctEORhGz0aMC79k+mRaFFYghfBmc=
X-Google-Smtp-Source: ABdhPJyp37Qj+oFvVhbsorkMGIDruzMkeIfPB0ZqbOaZMHPBpGWsl25ldzc2vCd3lW5DSHjdU4E82ZQloH0SZMkT8Ls=
X-Received: by 2002:a9d:685a:: with SMTP id c26mr2020145oto.239.1642754840485;
 Fri, 21 Jan 2022 00:47:20 -0800 (PST)
MIME-Version: 1.0
References: <Yeg11pHSqx29yg/T@ls3530>
In-Reply-To: <Yeg11pHSqx29yg/T@ls3530>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 21 Jan 2022 09:47:09 +0100
Message-ID: <CAKMK7uGeGBBvTGFyBxLwvTAxEWwXMS8U1rrYUb_7gbui-jV+KA@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.17-rc1
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Jan 19, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
>
> The following changes since commit 0c947b893d69231a9add855939da7c66237ab44f:
>
>   Merge tag '5.17-rc-part1-smb3-fixes' of git://git.samba.org/sfrench/cifs-2.6 (2022-01-17 09:53:21 +0200)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-5.17-2
>
> for you to fetch changes up to 842086bc7262a36f002e0361f9dc351556cae3f3:
>
>   video: fbdev: controlfb: Fix COMPILE_TEST build (2022-01-17 22:39:37 +0100)
>
> ----------------------------------------------------------------
> fbdev updates for v5.17-rc1
>
> A first bunch of updates and fixes for the following fbdev & backlight drivers:
> ocfb, aty128fb, mb862xx, omapfb, qcom-wled, dt-bindings, hyperv_fb,
> lm3630a_bl, omap2, controlfb, matroxfb
>
> Nothing really important, mostly cleanups, const conversions, added null
> pointer/boundary checks and build fixes.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

Not sure whether Linus missed this or just wanted to let the
discussion settle first. But since this is all random patches for
drivers that many distros don't even enable anymore there's no issues
here, and I very much welcome someone volunteering to pick these up.
I'd expect there's a pile more since it's been 1-2 years since Bart
took care of these and merged them consistently.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

>
> ----------------------------------------------------------------
> Chunyang Zhong (1):
>       video: ocfb: add const to of_device_id
>
> Colin Ian King (2):
>       fbdev: aty128fb: make some arrays static const
>       video: fbdev: mb862xx: remove redundant assignment to pointer ptr
>
> Greg Kroah-Hartman (1):
>       omapfb: use default_groups in kobj_type
>
> Jiasheng Jiang (1):
>       video: fbdev: Check for null res pointer
>
> Luca Weiss (2):
>       backlight: qcom-wled: Add PM6150L compatible
>       dt-bindings: simple-framebuffer: allow standalone compatible
>
> Michael Kelley (1):
>       video: hyperv_fb: Fix validation of screen resolution
>
> Minghao Chi (1):
>       drivers/video: remove redundant res variable
>
> Xu Wang (2):
>       backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
>       fbdev: omap2: omapfb: Remove redundant 'flush_workqueue()' calls
>
> Yang Guang (1):
>       video: fbdev: use swap() to make code cleaner
>
> YueHaibing (1):
>       video: fbdev: controlfb: Fix COMPILE_TEST build
>
> Z. Liu (1):
>       matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid black screen
>
>  .../devicetree/bindings/display/simple-framebuffer.yaml  | 12 +++++++-----
>  drivers/video/backlight/lm3630a_bl.c                     |  1 -
>  drivers/video/backlight/qcom-wled.c                      |  1 +
>  drivers/video/fbdev/aty/aty128fb.c                       | 10 ++++++----
>  drivers/video/fbdev/aty/mach64_ct.c                      |  4 +---
>  drivers/video/fbdev/controlfb.c                          |  2 ++
>  drivers/video/fbdev/hyperv_fb.c                          | 16 +++-------------
>  drivers/video/fbdev/imxfb.c                              |  2 ++
>  drivers/video/fbdev/matrox/matroxfb_base.c               |  2 +-
>  drivers/video/fbdev/mb862xx/mb862xxfb_accel.c            |  2 +-
>  drivers/video/fbdev/ocfb.c                               |  2 +-
>  drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c     |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c     |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c     |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/omapfb-main.c           |  1 -
>  drivers/video/fbdev/sis/sis_main.c                       |  2 +-
>  16 files changed, 32 insertions(+), 34 deletions(-)



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
