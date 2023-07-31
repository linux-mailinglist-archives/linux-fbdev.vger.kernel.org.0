Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD12276931F
	for <lists+linux-fbdev@lfdr.de>; Mon, 31 Jul 2023 12:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjGaK3i (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 31 Jul 2023 06:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjGaK3h (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 31 Jul 2023 06:29:37 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC90EE;
        Mon, 31 Jul 2023 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690799376; x=1722335376;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=qrcUzGPc/mzEUo4ZLeC0gsRlzVMa/7ucsgNmiIe/YQQ=;
  b=ASn3gYEoYid8C1rUZnVmPZ6Sg+L0LHjpj1KyTTDvLQaz+pjRaFBKTYQm
   irTyZj2b5b3CiWHIdsAlW+7NYs45QOpufZRuRlOXHuzQJk/ztg8TdURav
   smKhj9cBBeaTqLmrWfppeqW2FpuJoYTkuVVKZqFJw4tTONGgXuFX3lVBF
   2t+ZI0sX7PtBRfMH6+EdKlzl40SyZMa64ygkcNqg72OAdOSw9j67HrjPx
   zie3FN08uC88kT+DUMVfFTEImx4QMzdlX3qQf7LG/kZ97Ay0CxI6qEh8V
   Vw5aMznR+/ErfEKHa+D2flgfOy1hMSJ23cA1MusI1qpL5l0pRkU0351cA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="455353616"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="455353616"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 03:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="818294474"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="818294474"
Received: from naikshri-mobl7.ger.corp.intel.com (HELO localhost) ([10.252.36.230])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 03:29:29 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ilpo =?utf-8?Q?J=C3=A4rv?= =?utf-8?Q?inen?= 
        <ilpo.jarvinen@linux.intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Helge Deller <deller@gmx.de>, Stephen Boyd <sboyd@kernel.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Nikita Shubin via B4 Relay 
        <devnull+nikita.shubin.maquefel.me@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v3 1/1] drm/i915: Move abs_diff() to math.h
In-Reply-To: <20230724082511.3225-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230724082511.3225-1-andriy.shevchenko@linux.intel.com>
Date:   Mon, 31 Jul 2023 13:29:26 +0300
Message-ID: <87ila0xtkp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 24 Jul 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> abs_diff() belongs to math.h. Move it there.
> This will allow others to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org> # tty/serial
> ---
> v3: added tag (Jiri), removed space after a cast (fdo CI)
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  1 +
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.h |  7 -------

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging the i915 parts via whichever tree is most convenient for
you.

>  drivers/gpu/ipu-v3/ipu-image-convert.c        | 15 +++++++--------
>  drivers/tty/serial/omap-serial.c              |  7 +------
>  drivers/video/fbdev/core/svgalib.c            |  7 +------
>  include/linux/math.h                          |  7 +++++++
>  6 files changed, 17 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index 6b2d8a1e2aa9..290e856fe9e9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -21,6 +21,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/math.h>
>  #include <linux/string_helpers.h>
>  
>  #include "i915_reg.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> index ba62eb5d7c51..04e6810954b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> @@ -29,13 +29,6 @@
>  
>  #include "intel_wakeref.h"
>  
> -/*FIXME: Move this to a more appropriate place. */
> -#define abs_diff(a, b) ({			\
> -	typeof(a) __a = (a);			\
> -	typeof(b) __b = (b);			\
> -	(void) (&__a == &__b);			\
> -	__a > __b ? (__a - __b) : (__b - __a); })
> -
>  enum tc_port;
>  struct drm_i915_private;
>  struct intel_atomic_state;
> diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
> index af1612044eef..841316582ea9 100644
> --- a/drivers/gpu/ipu-v3/ipu-image-convert.c
> +++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
> @@ -7,7 +7,10 @@
>  
>  #include <linux/interrupt.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/math.h>
> +
>  #include <video/imx-ipu-image-convert.h>
> +
>  #include "ipu-prv.h"
>  
>  /*
> @@ -543,7 +546,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
>  		unsigned int in_pos;
>  		unsigned int in_pos_aligned;
>  		unsigned int in_pos_rounded;
> -		unsigned int abs_diff;
> +		unsigned int diff;
>  
>  		/*
>  		 * Tiles in the right row / bottom column may not be allowed to
> @@ -575,15 +578,11 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
>  		    (in_edge - in_pos_rounded) % in_burst)
>  			continue;
>  
> -		if (in_pos < in_pos_aligned)
> -			abs_diff = in_pos_aligned - in_pos;
> -		else
> -			abs_diff = in_pos - in_pos_aligned;
> -
> -		if (abs_diff < min_diff) {
> +		diff = abs_diff(in_pos, in_pos_aligned);
> +		if (diff < min_diff) {
>  			in_seam = in_pos_rounded;
>  			out_seam = out_pos;
> -			min_diff = abs_diff;
> +			min_diff = diff;
>  		}
>  	}
>  
> diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
> index 82d35dbbfa6c..9be63a1f1f0c 100644
> --- a/drivers/tty/serial/omap-serial.c
> +++ b/drivers/tty/serial/omap-serial.c
> @@ -222,16 +222,11 @@ static inline int calculate_baud_abs_diff(struct uart_port *port,
>  				unsigned int baud, unsigned int mode)
>  {
>  	unsigned int n = port->uartclk / (mode * baud);
> -	int abs_diff;
>  
>  	if (n == 0)
>  		n = 1;
>  
> -	abs_diff = baud - (port->uartclk / (mode * n));
> -	if (abs_diff < 0)
> -		abs_diff = -abs_diff;
> -
> -	return abs_diff;
> +	return abs_diff(baud, port->uartclk / (mode * n));
>  }
>  
>  /*
> diff --git a/drivers/video/fbdev/core/svgalib.c b/drivers/video/fbdev/core/svgalib.c
> index 9e01322fabe3..2cba158888ea 100644
> --- a/drivers/video/fbdev/core/svgalib.c
> +++ b/drivers/video/fbdev/core/svgalib.c
> @@ -14,6 +14,7 @@
>  #include <linux/kernel.h>
>  #include <linux/string.h>
>  #include <linux/fb.h>
> +#include <linux/math.h>
>  #include <linux/svga.h>
>  #include <asm/types.h>
>  #include <asm/io.h>
> @@ -372,12 +373,6 @@ EXPORT_SYMBOL(svga_get_caps);
>   *  F_VCO = (F_BASE * M) / N
>   *  F_OUT = F_VCO / (2^R)
>   */
> -
> -static inline u32 abs_diff(u32 a, u32 b)
> -{
> -	return (a > b) ? (a - b) : (b - a);
> -}
> -
>  int svga_compute_pll(const struct svga_pll *pll, u32 f_wanted, u16 *m, u16 *n, u16 *r, int node)
>  {
>  	u16 am, an, ar;
> diff --git a/include/linux/math.h b/include/linux/math.h
> index 449a29b73f6d..4459d1786f77 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -157,6 +157,13 @@ __STRUCT_FRACT(u32)
>  	__builtin_types_compatible_p(typeof(x), unsigned type),		\
>  	({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
>  
> +#define abs_diff(a, b) ({			\
> +	typeof(a) __a = (a);			\
> +	typeof(b) __b = (b);			\
> +	(void)(&__a == &__b);			\
> +	__a > __b ? (__a - __b) : (__b - __a);	\
> +})
> +
>  /**
>   * reciprocal_scale - "scale" a value into range [0, ep_ro)
>   * @val: value

-- 
Jani Nikula, Intel Open Source Graphics Center
