Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D9A81725
	for <lists+linux-fbdev@lfdr.de>; Mon,  5 Aug 2019 12:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfHEKgF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 5 Aug 2019 06:36:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41734 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKgF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 5 Aug 2019 06:36:05 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so80652788wrm.8
        for <linux-fbdev@vger.kernel.org>; Mon, 05 Aug 2019 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+eM6Lk3UMptX6p2/MzlUI3lYSYvFMWs9PeIsI7SO8CI=;
        b=DvajJlUhF3ySaZpQGKCuofjs0AMiwxxLZTgjjTvja7QYzHxi++d0ZOjxSO5xkfgXdd
         +Mo1OqrHQqTYpKMQL6x/4hh3OHOn3C/wi618a2jXZSk+/8lCL9/8ooPfE9bFoxBhyPoh
         FkG3QgJ/AAYwn13KLrczURE2S52Gs2poBqH7DX+9V89+/2WuCo/7u063WZJoR4YZyec8
         qFJxalbreEenv9qEatqdT6I9txAkwHa2+qoM8pvLhw3o9OjW0u/ciXF/mYqtDcHMhKx0
         co1iqqSGZ31pUlriLaO2VYf4Y2d578QMBoNre3kk8a53Uj2eCDnXZ8iyMYOffEJ+ENkn
         hb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+eM6Lk3UMptX6p2/MzlUI3lYSYvFMWs9PeIsI7SO8CI=;
        b=cOPam9Xu1na99fdgC6OkljVI3FELYzokvxH2xtX0MTpyHflPpCUsBundIj9XwNmXM/
         XkiLAWEWcPh87om397XwXmXu6a895xhfSdVix5Jetg15kx5LX5HiT+t0NOw1PmDhR8h2
         IOgYGnMIEUqqzERoWxi8nIpuRDnWql+VMCuW3dX6AfTtwe/JLWMHYNTdy8kvvcDOUMOC
         cMyOfucPiIQOk5NSwmcNMy8pcy3Iiq9841/pMq7pq7UKW3pxZsgkseHyTNsY8AFACbd/
         tisbMRcbv0b7AbJmttvLZunVrsdSe6Uw2T/Opkjb4HQ/I8Lw0ZAGwkldFqCX4J1iGl3O
         6ToA==
X-Gm-Message-State: APjAAAXGYsNY4maFzuj/bQVqn8Rq9RD2VWNUkCK5ukAWyXusRj7odYUI
        oefHux/LwYun+c3NIXaJRN/DMsqHLx0=
X-Google-Smtp-Source: APXvYqxDrni8WZSr39UI+8KlO8PLDdJJjaXonfDDcmHH8YqIkyzKvvAtQWXsTdXATIKSsH8AONwlnA==
X-Received: by 2002:adf:eac4:: with SMTP id o4mr157480823wrn.290.1565001362970;
        Mon, 05 Aug 2019 03:36:02 -0700 (PDT)
Received: from dell ([109.180.115.177])
        by smtp.gmail.com with ESMTPSA id e6sm83831227wrw.23.2019.08.05.03.36.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 03:36:02 -0700 (PDT)
Date:   Mon, 5 Aug 2019 11:36:00 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190805103600.GF4739@dell>
References: <20190725143224.GB31803@ravnborg.org>
 <20190726095016.wsj7jnni5zdh37dl@holly.lan>
 <20190726112724.GB20065@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190726112724.GB20065@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 26 Jul 2019, Sam Ravnborg wrote:

> Hi Daniel.
> 
> On Fri, Jul 26, 2019 at 10:50:16AM +0100, Daniel Thompson wrote:
> > On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> > > There was no users left - so drop the code to support EARLY_FB_BLANK.
> > 
> > Why are we using a different noun for the subject and description?
> I fat-fingered the description.

> Will fix when I apply - or send out a v2 if requested.

Okay, just apply it then:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
