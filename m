Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C426764B0
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 13:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfGZLga (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 07:36:30 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:58230 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfGZLg3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 07:36:29 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E894980435;
        Fri, 26 Jul 2019 13:36:26 +0200 (CEST)
Date:   Fri, 26 Jul 2019 13:36:25 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: Demote panel timing not found error message
Message-ID: <20190726113625.GC20065@ravnborg.org>
References: <20190726101849.27322-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726101849.27322-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8
        a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=5Qqih-qkqPENY-0g_TsA:9
        a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thierry.

On Fri, Jul 26, 2019 at 12:18:49PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Failing to find a panel-timing node is not an error in all cases, so do
> not output an error message in that case. Instead turn it into a debug
> message and make the drivers that care about it output an error message
> of their own.

This is more or less the same as already implmented by Douglas here:
https://patchwork.kernel.org/cover/11053243/

Doug's has an extra bug-fix that we shall not miss.

I am waiting for feedback from Bartlomiej before proceeding.
I guess he is on holiday somewhere and will return soon.

	Sam

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 4 +++-
>  drivers/video/fbdev/amba-clcd.c    | 4 +++-
>  drivers/video/of_display_timing.c  | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 1ec57d0806a8..7fcb3527c788 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -147,8 +147,10 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
>  	int ret;
>  
>  	ret = of_get_display_timing(np, "panel-timing", &timing);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dev_err(lvds->dev, "%pOF: could not find panel timing\n", np);
>  		return ret;
> +	}
>  
>  	videomode_from_timing(&timing, &lvds->video_mode);
>  
> diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
> index 89324e42a033..13df898a3481 100644
> --- a/drivers/video/fbdev/amba-clcd.c
> +++ b/drivers/video/fbdev/amba-clcd.c
> @@ -561,8 +561,10 @@ static int clcdfb_of_get_dpi_panel_mode(struct device_node *node,
>  	struct videomode video;
>  
>  	err = of_get_display_timing(node, "panel-timing", &timing);
> -	if (err)
> +	if (err) {
> +		pr_err("%pOF: could not find panel timing\n", node);
>  		return err;
> +	}
>  
>  	videomode_from_timing(&timing, &video);
>  
> diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
> index f5c1c469c0af..9385b518349f 100644
> --- a/drivers/video/of_display_timing.c
> +++ b/drivers/video/of_display_timing.c
> @@ -125,7 +125,7 @@ int of_get_display_timing(const struct device_node *np, const char *name,
>  
>  	timing_np = of_get_child_by_name(np, name);
>  	if (!timing_np) {
> -		pr_err("%pOF: could not find node '%s'\n", np, name);
> +		pr_debug("%pOF: could not find node '%s'\n", np, name);
>  		return -ENOENT;
>  	}
>  
> -- 
> 2.22.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
