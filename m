Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2BA8D6AD5
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Oct 2019 22:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbfJNUgu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Oct 2019 16:36:50 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:57008 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730700AbfJNUgt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Oct 2019 16:36:49 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id F0C6A80502;
        Mon, 14 Oct 2019 22:36:45 +0200 (CEST)
Date:   Mon, 14 Oct 2019 22:36:44 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, b.zolnierkie@samsung.com, ajax@redhat.com,
        ville.syrjala@linux.intel.com, malat@debian.org,
        michel@daenzer.net, gregkh@linuxfoundation.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        corbet@lwn.net
Subject: Re: [PATCH v2 00/15] DRM fbconv helpers for converting fbdev drivers
Message-ID: <20191014203644.GB4373@ravnborg.org>
References: <20191014140416.28517-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014140416.28517-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=bN8cPZFSIqpSJMKVDr4A:9 a=cFs883x1dbQTDLxy:21 a=crvWfZD_59QS1UrX:21
        a=CjuIK1q_8ugA:10
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas.

On Mon, Oct 14, 2019 at 04:04:01PM +0200, Thomas Zimmermann wrote:
> (was: DRM driver for fbdev devices)
> 
> This is version 2 of the fbdev conversion helpers. It's more or less a
> rewrite of the original patchset.
> 
> The fbdev subsystem is considered legacy and will probably be removed at
> some point. This would mean the loss of a signifanct number of drivers.
> Some of the affected hardware is not in use any longer, but some hardware
> is still around and provides good(-enough) framebuffers.
> 
> The fbconv helpers allow for running the current DRM stack on top of fbdev
> drivers. It's a set of functions that convert between fbdev interfaces and
> DRM interfaces. Based on SHMEM and simple KMS helpers, it only offers the
> basic functionality of a framebuffer, but should be compatible with most
> existing fbdev drivers.
> 
> A DRM driver using fbconv helpers consists of
> 
>   * DRM stub code that calls into fbconv helpers, and
>   * the original fbdev driver code.
> 
> The fbdev driver code has to be modified to register itself with the
> stub driver instead of the fbdev core framework. A tutorial on how to use
> the helpers is part of this patchset. The resulting driver hybrid can be
> refactored into a first-class DRM driver. The fbconv helpers contain a
> number of comments, labeled 'DRM porting note', which explain the required
> steps.
> 
> I tested the current patchset with the following drivers: atyfb, aty128fb,
> matroxfb, pm2fb, pm3fb, rivafb, s3fb, savagefb, sisfb, tdfxfb and tridentfb.
> With each, I was able to successfully start with fbcon enabled, run weston and
> X11. The drivers are available at [1]. For reference, the patchset includes
> the Matrox stub driver.

In general I like the idea of modernizing the existing fbdev drivers.
What I fail to read in your intro above is if this allows us to phase
out the migrated fbdev drivers sooner?
Or do we end up with two drivers to maintain?

Obviously a full migration to a DRM driver was preferred - but this may
serve as a step in that direction.
But we should not end up with two drivers doing almost the same.

Another general question. Do we want the modernized DRM drivers to end
up in staging? Why should they not go direct into drm/*
I know they are not fully atomic but this is not new drivers so maybe
they can be excused.
Problem is that drm drivers in staging live a secret nonvisible life
where they are easy to forget when we change interfaces and such.

	Sam
