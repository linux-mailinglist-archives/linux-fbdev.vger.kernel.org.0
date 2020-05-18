Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407FD1D75CD
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2020 13:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgERLCy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 18 May 2020 07:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgERLCx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 18 May 2020 07:02:53 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A03C061A0C
        for <linux-fbdev@vger.kernel.org>; Mon, 18 May 2020 04:02:53 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id 134so2288291vky.2
        for <linux-fbdev@vger.kernel.org>; Mon, 18 May 2020 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TnOYIJ1nfLcoOoATov1dQrgNfdtrmD6iK7NVPcue8aw=;
        b=gI8KKb5wg5v2qHES5+bGI2/rAEVGlQyfyhgnrzFvpj0QTqUU0jjur8KfbXqQxC3X0f
         Oj/NDuXfzLcdQd/Ky7f0T/JOKAJ8Vdp4Jp+v5J4MFuikS8hxIRQeSa6WLZPdXf/IvZvo
         aJax/8xpfJCVDt0reyd6pXnSQWAPWO4vhodo/7GrUhA3Wj1q4r9ICNUzfzr9dQ/9X5U8
         BGVDET7wIUJFycZ9kLSGcyKN/B78T3+YBK3P6gqxigN/jDwltMSv58jZGaYPu29V54Cq
         +HblOF0A+hSQXgwsedFi9JHkeOG9e2wBiDvPtaxeU9LaOfh/+XUHNKLwDfRtrMb23t6n
         oUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TnOYIJ1nfLcoOoATov1dQrgNfdtrmD6iK7NVPcue8aw=;
        b=o3GaBeRPiK26HMFGYywa/XjUPeO25qzvrdl7L0TxAhVl/d+hq490kX3LLRw2HAS1WE
         zhoDKYtna0jALs2yl11Qe9GSb5dU1QLi45cU48ZCdcyZm8viAIP0LMgBDGUyATwwpBZy
         FYBMO29Afyu3Psa8SUPmaiw+UwzzV7cVcrWzOa+rbY70j4lB2IPHGWeUE9CL5mwm5Hae
         nSwSawXZrKeE1fDcbg4KWvn4lYR50QZ2YZt72goey12OHqruU2ExZHfDUzbbjJRaJtVC
         VXNgSHzATUOZ2G2WJTuzzMtikPJEFHNUbiuPBLHJxcGG/lTD6+gz4vlD533eoXt4Zljz
         CeuA==
X-Gm-Message-State: AOAM530Fyk7NB02S9elPB7najMMptyg/0daFzcXqrdnmFbdhEA7/ErpO
        UIFM3Yq9+v1fLlePvIt4yc70+4fqN2VQ3tLEONs=
X-Google-Smtp-Source: ABdhPJwl3t0P8UBkzkdQpBdqsy7c2RThfeVs2tmdfCsbYsQ/Ug1eIUBiEG7XSaPXWJV0OnBR5xJ5kOPd74G5rKrixjc=
X-Received: by 2002:a1f:2bd7:: with SMTP id r206mr818859vkr.28.1589799772920;
 Mon, 18 May 2020 04:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com> <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
In-Reply-To: <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 18 May 2020 12:00:01 +0100
Message-ID: <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Antonino Daplas <adaplas@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Benjamin,

On Mon, 18 May 2020 at 01:45, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Sun, 2020-05-17 at 23:05 +0100, Emil Velikov wrote:
> > As mentioned in earlier commit, the riva and nvidia fbdev drivers
> > have
> > seen no love over the years, are short on features and overall below
> > par
> >
> > Users are encouraged to switch to the nouveau drm driver instead.
> >
> > v2: Split configs to separate patch, enable nouveau (Bartlomiej)
>
> Back when I still had these things to play with (years ago) nouveau
> didn't work properly on these ancient machines.
>
I believe you reported issues due to different page size for the CPU/GPU.
Have you tried nouveau recently, there has been a handful of patches
on the topic since your report.

Alternatively, it would make sense you rebase, cleanup and merge your patch.

-Emil
