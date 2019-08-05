Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560F981722
	for <lists+linux-fbdev@lfdr.de>; Mon,  5 Aug 2019 12:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfHEKfI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 5 Aug 2019 06:35:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39723 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKfI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 5 Aug 2019 06:35:08 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so30696107wrt.6
        for <linux-fbdev@vger.kernel.org>; Mon, 05 Aug 2019 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Kjh2wZD+C5G0lFzQPAaduu/KloJy49QwHv2GdQc5xdw=;
        b=xfSd/bUlN5TMq9AoknFn8PgFc2Kuli+KjdAgRwgGW3D+pISqRyWFVcyzO42ubAEEoS
         KDNOuKC9vBHR90CH2XDfoin9lqeLLnGE83gsOnWdBetcq9DDhEM/482kPreFKvuFNKXm
         8STwWX2zwFomZlPq1nCZys1no4/ODSSCs0nnBxBQm3Eb900E7NxDthEdDJ4aUxM+1Qtw
         H1cZDJjJ1thU55RoDA8K8dK0o84jUJCA9jyQ3GB4J0gFigx3uXtdwftmhO9uSYDByPhW
         i7IBLBSZ4Dy1qhyZsHn+YQdksf+wwuQ6w2buoKoOWybscM1IWTdml70k4PbxM08TaVTz
         AUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Kjh2wZD+C5G0lFzQPAaduu/KloJy49QwHv2GdQc5xdw=;
        b=smd1QCKD6nCWUErs7SSJmZBobFnpSXI1XB3nyDBaPkoqBdnsMDmIRn1y+4oQHvjpCf
         ig3BAJsa2YCM68IIzgKjeyZm3OTqyeGzQ4nM7GGuWZNIfHz9r5DhfjBlx69TM1nWqxvg
         mPtoEaIIPDvH0nt2arRlQSCIPwq5H14Svx7D21K5xvKoPQoK7hOy/zLi7W8OX6CxdohI
         QIplG84nwMFzUvW6k8I1IlUdzmUfVcGFATE28kETdyDRHRprqNuMhQdakYY5XZd99sdM
         +tuEwxCDCqgamG9EmzI+I/95XxCWf6MOwlRm+j/SU10rERJVqPwiCgkxALA8zoUpzqgi
         l/YA==
X-Gm-Message-State: APjAAAU1nxXXdbkzjfEkNBB/RssmF+f2TRRreKubYXGeMTcsau+/bePt
        iololVooywSNYx7JCPXcGuBuBw==
X-Google-Smtp-Source: APXvYqya7YAbfocEu6BT3YDWjdV9SNGo/EMhSMjnZMgc3BZIrZDW3ID7mxna1ILKFm2MHMM70QjwNw==
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr85475933wrw.8.1565001306538;
        Mon, 05 Aug 2019 03:35:06 -0700 (PDT)
Received: from dell ([109.180.115.177])
        by smtp.gmail.com with ESMTPSA id g19sm153371030wrb.52.2019.08.05.03.35.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 03:35:05 -0700 (PDT)
Date:   Mon, 5 Aug 2019 11:35:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190805103504.GE4739@dell>
References: <20190725143224.GB31803@ravnborg.org>
 <20190725143934.GH15868@phenom.ffwll.local>
 <20190725150629.GN23883@dell>
 <20190726160953.GA25708@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190726160953.GA25708@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 26 Jul 2019, Sam Ravnborg wrote:

> Hi Lee.
> 
> On Thu, Jul 25, 2019 at 04:06:29PM +0100, Lee Jones wrote:
> > On Thu, 25 Jul 2019, Daniel Vetter wrote:
> > 
> > > On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> > > > There was no users left - so drop the code to support EARLY_FB_BLANK.
> > > > This patch removes the support in backlight,
> > > > and drop the notifier in fbmem.
> > > > 
> > > > That EARLY_FB_BLANK is not used can be verified that no driver set any of:
> > > > 
> > > >     lcd_ops.early_set_power()
> > > >     lcd_ops.r_early_set_power()
> > > > 
> > > > Noticed while browsing backlight code for other reasons.
> > > 
> > > Ah I didn't grep hard enough, I didn't realize that no one sets the
> > > lcd_ops->(r_)early_set_power hooks. Nice find!
> > > 
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > 
> > > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Lee Jones <lee.jones@linaro.org>
> > > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
> > > > Cc: Peter Rosin <peda@axentia.se>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: linux-fbdev@vger.kernel.org
> > > > ---
> > > > 
> > > > Build tested with various architectures, configs.
> > > > 
> > > > Lee, Daniel - OK to commit to drm-misc-next where fbdev stuff is
> > > > maintained today?
> > > 
> > > backlight is separate from fbdev in Lee's own tree, not in drm-misc. I
> > > think at least.
> > 
> > That's correct.  We'll sort that once we have all the Acks.
> 
> We have acks all around now.

I am still missing Daniel T's Ack.

> OK that I commit this to drm-misc-next?
> 
> This is where we maintain fbdev these days. Or you could apply it to
> your backlight tree.
> 
> Both solutins would be fine as the risk of introducing merge conflicts
> in these code paths are minimal.

If that's the case, then I'd be happy to apply it to the Backlight
tree.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
