Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8B482609
	for <lists+linux-fbdev@lfdr.de>; Mon,  5 Aug 2019 22:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbfHEU34 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 5 Aug 2019 16:29:56 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:44702 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbfHEU34 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 5 Aug 2019 16:29:56 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id BE1C78034E;
        Mon,  5 Aug 2019 22:29:52 +0200 (CEST)
Date:   Mon, 5 Aug 2019 22:29:51 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190805202951.GA18148@ravnborg.org>
References: <20190725143224.GB31803@ravnborg.org>
 <20190726095016.wsj7jnni5zdh37dl@holly.lan>
 <20190726112724.GB20065@ravnborg.org>
 <20190805103600.GF4739@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805103600.GF4739@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8
        a=gSw8uvwejDmJeGKncQQA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Lee.

On Mon, Aug 05, 2019 at 11:36:00AM +0100, Lee Jones wrote:
> On Fri, 26 Jul 2019, Sam Ravnborg wrote:
> 
> > Hi Daniel.
> > 
> > On Fri, Jul 26, 2019 at 10:50:16AM +0100, Daniel Thompson wrote:
> > > On Thu, Jul 25, 2019 at 04:32:24PM +0200, Sam Ravnborg wrote:
> > > > There was no users left - so drop the code to support EARLY_FB_BLANK.
> > > 
> > > Why are we using a different noun for the subject and description?
> > I fat-fingered the description.
> 
> > Will fix when I apply - or send out a v2 if requested.
> 
> Okay, just apply it then:
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>

Fixed changelog and applied to drm-misc-next.

	Sam
