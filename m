Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F461D7998
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2020 15:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgERNUK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 18 May 2020 09:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbgERNUK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 18 May 2020 09:20:10 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D712FC061A0C
        for <linux-fbdev@vger.kernel.org>; Mon, 18 May 2020 06:20:09 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e10so5493027vsp.12
        for <linux-fbdev@vger.kernel.org>; Mon, 18 May 2020 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=smFwrGW+2ZYyRm3yJx9TvCDHllY75XTU0ZDXk/besJY=;
        b=P/j+l4rloAGJ5+zOh7ldG3MH1MdKGjKsbOchWEgDz0r3TcptKxJ1Bp8HWPcC1S3fmm
         rX/Ml0ruOt+Zix5rJNR8BVurvVsN/K4gCUQfEm62amnKjAll6C/pestSxWW+iWgQY9jy
         tTWNTrDxkQrfrVc+lNfLeVJrBgZ7/vicsqJWKimsblBlPKhR/CVoKdlJ3NNCPiHj0qtI
         bJ6v+HqXqrmGR0xZPvzDg/uhV1AwqgA3sHXFT5MkuzYewlbMnfUAmm2kngveuxpuS8e+
         8bF+VeDJ1VAOdMMzqlMvEgvuvxO+HvNfpuR4H+ZPstuBIbaUn4xjW0RSWNyPxwHa3724
         uDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=smFwrGW+2ZYyRm3yJx9TvCDHllY75XTU0ZDXk/besJY=;
        b=YtkmyOwYj0+XnihefF9zLUOJjtfC48K/tz19Bl5AV6J1Er+d93lF2GZOi2jUxGyhQC
         4QsoD0mpoW+lMguXpZVbvPC0JJ73AVS9scdyNao3dRrAeSefdriDvO6NldXFf0AC6oNG
         fPWWdNaHfwoN4IiJvvdeYdShE39zITdH47Mk6Tw4m4PBZo7ARSlJPUcjEwaLc1SrlHwe
         IFu88MuogVa0SkTku9OvwXKzcpbE7ObY1Mu5lsv7ImWRhTVDSB5v9Id45yLmp5fpLhZi
         LTB0qCDRjVYdV4cngT8ublj4Ryt7wKyWbQD2mePExB51RoL8VaBhWuD0023uLyzXHlpx
         jgkQ==
X-Gm-Message-State: AOAM5338NLlpq+Wnda06nqgx9ijI3X5lSCYSKmLjmXLBjTQIA6pVhjzJ
        Tvz+pRNmeyBtEMB1ohSNubugIgPXGfc8z/26cH8=
X-Google-Smtp-Source: ABdhPJyB9j3yxm/3uct+3is6hkBldRsVNEHECFEnQ4z23rMWJaJ9Tdo/jYPHQ+KXggCqQyHhC6tZDoDIkFVYF/4KxZU=
X-Received: by 2002:a67:be19:: with SMTP id x25mr1506536vsq.37.1589808009106;
 Mon, 18 May 2020 06:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com> <87d071aedu.fsf@mpe.ellerman.id.au>
 <CGME20200518112226eucas1p1aa59db1e75cf0f91454b8714c828444c@eucas1p1.samsung.com>
 <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com> <3bd8fb59-2a91-64d7-bef9-d5f717c49bfb@samsung.com>
In-Reply-To: <3bd8fb59-2a91-64d7-bef9-d5f717c49bfb@samsung.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 18 May 2020 14:19:57 +0100
Message-ID: <CACvgo53=Vv7R-8BP32iQXwgvfxjJ8W5XCBmMq-tdUG-wUN6_4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Antonino Daplas <adaplas@gmail.com>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 18 May 2020 at 13:48, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
>
> On 5/18/20 1:19 PM, Emil Velikov wrote:
> > Hi Michael,
> >
> > On Mon, 18 May 2020 at 08:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>
> >> Emil Velikov <emil.l.velikov@gmail.com> writes:
> >>> As mentioned in earlier commit, the riva and nvidia fbdev drivers have
> >>> seen no love over the years, are short on features and overall below par
> >>>
> >>> Users are encouraged to switch to the nouveau drm driver instead.
> >>>
> >>> v2: Split configs to separate patch, enable nouveau (Bartlomiej)
> >>>
> >>> Cc: Antonino Daplas <adaplas@gmail.com>
> >>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >>> Cc: linux-fbdev@vger.kernel.org
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >>> Cc: Paul Mackerras <paulus@samba.org>
> >>> Cc: linuxppc-dev@lists.ozlabs.org
> >>> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> >>> ---
> >>> Hi all unless, there are objections I would prefer to merge this via
> >>> the drm tree.
> >>
> >> Have you tested that the resulting kernels work on the relevant
> >> hardware?
> >>
> > Sadly, no I haven't. I'm updating the defconfigs as requested by the
> > fbdev maintainer.
>
> I've just noticed that v1 (patch #1/1) & v2 (patch #1/2) lack
> Cc: to powerpc Maintainers so they cannot see the context of
> changes in this patch.
>
Haven't see any instances of fbdev/drm patches being Cc to arch/ developers.
As such I made sure the commit message illustrates 1/2 as clearly as possible.

> Also you've proposed v1 yourself and it has already contained
> modifications to defconfigs (removal of setting the config
> options for the old drivers) in addition to marking the old
> drivers as BROKEN.
>
> It now turns out that v1 has also never been tested. :(
>
> Please don't submit untested patches without marking them
> as such.
>
Does x86 box with nv34 GPU count as testing? I suspect not :-(
It was been using nouveau ever since I bought it 15+ years ago.

Will be more careful in the future.

-Emil
