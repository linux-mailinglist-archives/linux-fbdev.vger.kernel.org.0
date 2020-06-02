Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152581EBCE7
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jun 2020 15:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgFBNQc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 2 Jun 2020 09:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgFBNQa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 2 Jun 2020 09:16:30 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D550FC05BD43
        for <linux-fbdev@vger.kernel.org>; Tue,  2 Jun 2020 06:16:29 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g10so2887815wmh.4
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jun 2020 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=OpasVMisglYsuLwIdyOtQK0A81fANkOyysqk8CVIvx0=;
        b=kuDotpuhsY+MXpsr9Oy5OHDubwIUR/t6up0ak/ePcy2RYYIQAcRwYchPhLrdrqQ8ZC
         jDK8O0tZ+vCJrTENfDjEGHWnjEKoRkrWEcPXw3RXThiLDdTS0t0w+q1PM/ZIlowe3v6E
         wt0jXrNZ+k5dqoWCCoe7cAQEnilSIKZTVdFlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=OpasVMisglYsuLwIdyOtQK0A81fANkOyysqk8CVIvx0=;
        b=XtKnbYSLL5mqHkrG7Ox7dWx8KQM7F4ioEOy1HtBQjax96GNAlQ0VydEdf/ECygkF0N
         nscbhvaJVfE0XXHk1/qZQfYrXtZRMVaL7glKSR/gm26gC8zspvVO1Uft3Y73smLhuIfL
         VtDxeyZa0CEl2HQAaAF3Eqv32ReIG6s1iUq53e+j3mJ1By9uOKMYIn9/ySC76ajRtefI
         n6xCsrBrs37vLW6b5jQQfkaQZUCgaqsmaV/fbDayfS8Aoyf0tbQxuoV+IG/vudrGufEY
         4qI4FFjaE+ePNViRmpgf2MvoIjoYYrIjueq9FZ9dxeF0qR3KpbXMFWuzqIk6TvL56Cb3
         B6tQ==
X-Gm-Message-State: AOAM532DTePKVGZCX8J4igMPPMcUUKamCibIEZ237aGy0t/w+Fxu7vbP
        dRx8cviAnAk5eZ2J49hLBPpDlQ==
X-Google-Smtp-Source: ABdhPJyKXdTRZdaW33eS+W0IooJHz/fLbQxnKFQHG78T5To3m81jjbqdvxTgllHwNEE6P7CX/B+JFA==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr3955987wms.109.1591103758685;
        Tue, 02 Jun 2020 06:15:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t8sm2591537wmi.46.2020.06.02.06.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 06:15:58 -0700 (PDT)
Date:   Tue, 2 Jun 2020 15:15:51 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-fbdev@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] video: fbdev: pxafb: Use correct return value for
 pxafb_probe()
Message-ID: <20200602131551.GD20149@phenom.ffwll.local>
Mail-Followup-To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>, linux-fbdev@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <CGME20200525071149eucas1p271b0c64a9d44429978e2099257681b70@eucas1p2.samsung.com>
 <1590390705-22898-1-git-send-email-yangtiezhu@loongson.cn>
 <be2f65ba-e26c-fe3f-82d9-d9532db496eb@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be2f65ba-e26c-fe3f-82d9-d9532db496eb@samsung.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Bart,

On Mon, Jun 01, 2020 at 03:25:25PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> On 5/25/20 9:11 AM, Tiezhu Yang wrote:
> > When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> > to check the return value and return PTR_ERR() if failed.
> > 
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> 
> Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Thanks for going through all the backlog of patches in the fbdev area
every once in a while! That kind of housekeeping work is often
underappreciated, but rather important to keep the ship going.

Cheers, Daniel

PS: Of course also holds for everyone else doing this in other areas.
fbdev simply stuck out just now catching up on mails.


> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> > ---
> >  drivers/video/fbdev/pxafb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> > index 00b96a7..423331c 100644
> > --- a/drivers/video/fbdev/pxafb.c
> > +++ b/drivers/video/fbdev/pxafb.c
> > @@ -2305,7 +2305,7 @@ static int pxafb_probe(struct platform_device *dev)
> >  	fbi->mmio_base = devm_platform_ioremap_resource(dev, 0);
> >  	if (IS_ERR(fbi->mmio_base)) {
> >  		dev_err(&dev->dev, "failed to get I/O memory\n");
> > -		ret = -EBUSY;
> > +		ret = PTR_ERR(fbi->mmio_base);
> >  		goto failed;
> >  	}
> >  
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
