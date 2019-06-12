Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D365F41BFD
	for <lists+linux-fbdev@lfdr.de>; Wed, 12 Jun 2019 08:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbfFLGJe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 12 Jun 2019 02:09:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32816 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfFLGJd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 12 Jun 2019 02:09:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so15507541wru.0
        for <linux-fbdev@vger.kernel.org>; Tue, 11 Jun 2019 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jNHpo9jnwtLQwuoRcj9Ch+fhiSgA7li7+xLd+t9vX0c=;
        b=m8hJ2c0e3XNePvN0CW1AiuPtb6Tsm06LSMqOrEr8m/J+EAR2QK9ql0ebHsCP92aYtm
         6mqLiXGOBxsAgcaVMen9cmq1ZpkUojqFwNGKIwtxFMW7WyZKtUN5lpGdRMe0Gas16jpj
         LAT07r46pjG8q0yGqgzQizG+DFkTulNQjXqCIVy7uFbfJvOqkXl0LUGpPnKAlJyZ69qZ
         ukRc/AgAIoYDjFv5PLPBWCkh0YO8NkXsGen4B1A4NvEPVvnuVFSFyNnX14GS+Aa3aiBB
         tkgCuX8/fXozn76HmTNJ00VbrHdXvIAdJJGEGk3lkGLF5stuCF/piv6JjYoIPvT2lIhL
         Mw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jNHpo9jnwtLQwuoRcj9Ch+fhiSgA7li7+xLd+t9vX0c=;
        b=p19r8qRN4BfBK5K6tU+9Fz8aNKlTyewEXIib8XrHAezHjWGLgtf2Pgywc03WixsOFV
         qMxBZsyltXu0lqCz3qnlDM8TSkqoB97IbAeZUWgwuMi3awUO0Q6QDyjRtVI+G5Zz2qup
         nKvUnIzPmbbUmJkZZfAf3dIl8g/utzq9Mhtn/E85LfMR5R3WwkuyVLQvP6KKVfRGkd5l
         Ws2BOG+ZeoevxOYZD3CcjpFXwvZxQGgJABT0JVYAz2vTvdAprXuYIFtWLpHbolo26N9m
         me3UH2yla4XXzxiYlF05QRCr+wqqypbspkDO/6Ob6vkJVKAiQr/OxF98WXywHDT6Mlmn
         h0IQ==
X-Gm-Message-State: APjAAAVnomw+UKDX0ijR69e5XWuGFnSOdPhP0Bt5Mj3ZkrXGDJ5LhEdV
        qpV+9b7vHu0t77lqXbO5e6arDw==
X-Google-Smtp-Source: APXvYqyfYkZe1DnheBkxB3YZco+J1bRcMmIGxS+HOyR0Pfaq+SvAfBz+F8jQnAiX9kHfVifedeh39g==
X-Received: by 2002:adf:db02:: with SMTP id s2mr17167183wri.326.1560319771955;
        Tue, 11 Jun 2019 23:09:31 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id x16sm4926192wmj.4.2019.06.11.23.09.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 23:09:31 -0700 (PDT)
Date:   Wed, 12 Jun 2019 07:09:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 00/33] fbcon notifier begone v3!
Message-ID: <20190612060929.GR4797@dell>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
 <CGME20190606073852epcas2p27b586b93869a30e4658581c290960fee@epcas2p2.samsung.com>
 <CAKMK7uHneUFYPiRr10X9xfWTkGtaoQBB=niDMGkAgJ-fgo5=mA@mail.gmail.com>
 <f848b4de-abab-116f-ad68-23348f1a4b76@samsung.com>
 <20190611141635.rowolr37vhalophr@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190611141635.rowolr37vhalophr@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 11 Jun 2019, Daniel Thompson wrote:
> On Fri, Jun 07, 2019 at 12:07:55PM +0200, Bartlomiej Zolnierkiewicz wrote:
> > On 6/6/19 9:38 AM, Daniel Vetter wrote:
> > 
> > >> - Hash out actual merge plan.
> > > 
> > > I'd like to stuff this into drm.git somehow, I guess topic branch works
> > > too.
> > 
> > I would like to have topic branch for this patchset.
> 
> From a backlight perspective its Lee Jones who hoovers up the patches
> and worries about hiding merge conflicts from Linus.
> 
> I'll let him follow up if needed but I suspect he'd like an immutable
> branch to work from also.

Yes please.  Happy to either create one, or receive one.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
