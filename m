Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4B6D6ACD
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Oct 2019 22:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbfJNUaQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Oct 2019 16:30:16 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:56602 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729667AbfJNUaQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Oct 2019 16:30:16 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E064080575;
        Mon, 14 Oct 2019 22:30:08 +0200 (CEST)
Date:   Mon, 14 Oct 2019 22:30:07 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, b.zolnierkie@samsung.com, ajax@redhat.com,
        ville.syrjala@linux.intel.com, malat@debian.org,
        michel@daenzer.net, gregkh@linuxfoundation.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        corbet@lwn.net
Subject: Re: [PATCH v2 05/15] drm/fbconv: Add DRM <-> fbdev pixel-format
 conversion
Message-ID: <20191014203007.GA4373@ravnborg.org>
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014140416.28517-6-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=GqVph10vmseYxzeGbd0A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas.

On Mon, Oct 14, 2019 at 04:04:06PM +0200, Thomas Zimmermann wrote:
> DRM uses FOURCC constants to describe pixel formats, fbdev uses a
> per-component bitfield structure. The functions in this patch convert
> between the two.
> 

A few nits below.


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbconv_helper.c | 435 ++++++++++++++++++++++++++++
>  include/drm/drm_fbconv_helper.h     |  23 ++
>  2 files changed, 458 insertions(+)
>  create mode 100644 include/drm/drm_fbconv_helper.h
> 
> diff --git a/drivers/gpu/drm/drm_fbconv_helper.c b/drivers/gpu/drm/drm_fbconv_helper.c
> index 0cb46d2c98c3..af45358a156a 100644
> --- a/drivers/gpu/drm/drm_fbconv_helper.c
> +++ b/drivers/gpu/drm/drm_fbconv_helper.c
> @@ -1 +1,436 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <asm/byteorder.h>
> +
> +#include <linux/fb.h>

<asm/*> after <linux/*>
So we in this way pick the more general include file first.

> +
> +struct format_map {
> +	bool (*is_format)(const struct fb_var_screeninfo *fb_var);
> +	uint32_t format;
> +};
We are in the kernel - where I think u32 is preferred over the longer
uint32_t.
If I grep in drm/* then they seems be be equally popular, so feel free
to ignore this comment.


> +static void set_fb_bitfield(struct fb_bitfield *bits, __u32 offset,
> +			    __u32 length)

This is not uapi - so u32 is preferred.

Both comments apply to the whole file.

I did not see that this was wired into the kernel-doc in Documentation/
but maybe I just missed it.

With my comments considered you can add:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

All code looks sane, but as I have not grasped the bigger picture
this can hardly be a review.

	Sam
