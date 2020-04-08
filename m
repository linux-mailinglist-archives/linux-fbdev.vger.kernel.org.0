Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528F01A1EA2
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Apr 2020 12:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgDHKS4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Apr 2020 06:18:56 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:37444 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgDHKS4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Apr 2020 06:18:56 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 4F37920029;
        Wed,  8 Apr 2020 12:18:53 +0200 (CEST)
Date:   Wed, 8 Apr 2020 12:18:52 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: matroxfb: remove dead code and set but not
 used variable
Message-ID: <20200408101852.GC20795@ravnborg.org>
References: <20200403021609.20968-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403021609.20968-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=i0EeH86SAAAA:8
        a=e5mUnYsNAAAA:8 a=I71sJGB1j8iV39tR8JAA:9 a=QEXdDO2ut3YA:10
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Jason.

On Fri, Apr 03, 2020 at 10:16:09AM +0800, Jason Yan wrote:
> Fix the following gcc warning:
> 
> drivers/video/fbdev/matrox/g450_pll.c:336:15: warning: variable
> ‘pixel_vco’ set but not used [-Wunused-but-set-variable]
>   unsigned int pixel_vco;
>                ^~~~~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Thanks, committed and pushed to drm-misc-next.
The fix will show up in upstream kernel at the next
merge window.

	Sam

> ---
>  drivers/video/fbdev/matrox/g450_pll.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/drivers/video/fbdev/matrox/g450_pll.c b/drivers/video/fbdev/matrox/g450_pll.c
> index c15f8a57498e..ff8e321a22ce 100644
> --- a/drivers/video/fbdev/matrox/g450_pll.c
> +++ b/drivers/video/fbdev/matrox/g450_pll.c
> @@ -333,11 +333,9 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
>  			 unsigned int *deltaarray)
>  {
>  	unsigned int mnpcount;
> -	unsigned int pixel_vco;
>  	const struct matrox_pll_limits* pi;
>  	struct matrox_pll_cache* ci;
>  
> -	pixel_vco = 0;
>  	switch (pll) {
>  		case M_PIXEL_PLL_A:
>  		case M_PIXEL_PLL_B:
> @@ -420,7 +418,6 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
>  				
>  				mnp = matroxfb_DAC_in(minfo, M1064_XPIXPLLCM) << 16;
>  				mnp |= matroxfb_DAC_in(minfo, M1064_XPIXPLLCN) << 8;
> -				pixel_vco = g450_mnp2vco(minfo, mnp);
>  				matroxfb_DAC_unlock_irqrestore(flags);
>  			}
>  			pi = &minfo->limits.video;
> @@ -441,25 +438,6 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
>  			unsigned int delta;
>  
>  			vco = g450_mnp2vco(minfo, mnp);
> -#if 0			
> -			if (pll == M_VIDEO_PLL) {
> -				unsigned int big, small;
> -
> -				if (vco < pixel_vco) {
> -					small = vco;
> -					big = pixel_vco;
> -				} else {
> -					small = pixel_vco;
> -					big = vco;
> -				}
> -				while (big > small) {
> -					big >>= 1;
> -				}
> -				if (big == small) {
> -					continue;
> -				}
> -			}
> -#endif			
>  			delta = pll_freq_delta(fout, g450_vco2f(mnp, vco));
>  			for (idx = mnpcount; idx > 0; idx--) {
>  				/* == is important; due to nextpll algorithm we get
> -- 
> 2.17.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
