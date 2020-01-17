Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA69141152
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Jan 2020 19:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgAQS6z (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Jan 2020 13:58:55 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:38084 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQS6z (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Jan 2020 13:58:55 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 7E5B120026;
        Fri, 17 Jan 2020 19:58:52 +0100 (CET)
Date:   Fri, 17 Jan 2020 19:58:51 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tony Prisk <linux@prisktech.co.nz>
Subject: Re: [PATCH 1/2] video: fbdev: wm8505fb: fix sparse warnings about
 using incorrect types
Message-ID: <20200117185851.GA24722@ravnborg.org>
References: <CGME20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5@eucas1p2.samsung.com>
 <567cba81-5fec-4d91-f711-c0bdbfe5b513@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <567cba81-5fec-4d91-f711-c0bdbfe5b513@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=xkr2CaO4GLJwJX6e1BkA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jan 16, 2020 at 03:56:50PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Use ->screen_buffer instead of ->screen_base to fix sparse warnings.
> 
> [ Please see commit 17a7b0b4d974 ("fb.h: Provide alternate screen_base
>   pointer") for details. ]
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Resend with Tony & linux-arm ML added to Cc:.
> 
>  drivers/video/fbdev/wm8505fb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: b/drivers/video/fbdev/wm8505fb.c
> ===================================================================
> --- a/drivers/video/fbdev/wm8505fb.c
> +++ b/drivers/video/fbdev/wm8505fb.c
> @@ -339,7 +339,7 @@ static int wm8505fb_probe(struct platfor
>  
>  	fbi->fb.fix.smem_start		= fb_mem_phys;
>  	fbi->fb.fix.smem_len		= fb_mem_len;
> -	fbi->fb.screen_base		= fb_mem_virt;
> +	fbi->fb.screen_buffer		= fb_mem_virt;
>  	fbi->fb.screen_size		= fb_mem_len;
>  
>  	fbi->contrast = 0x10;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
