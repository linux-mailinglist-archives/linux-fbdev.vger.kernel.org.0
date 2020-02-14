Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE3315D963
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Feb 2020 15:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgBNOZv (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Feb 2020 09:25:51 -0500
Received: from mga12.intel.com ([192.55.52.136]:25341 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729327AbgBNOZu (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Feb 2020 09:25:50 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Feb 2020 06:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,440,1574150400"; 
   d="scan'208";a="407009951"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 14 Feb 2020 06:25:48 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j2bug-001MzA-Hj; Fri, 14 Feb 2020 16:25:50 +0200
Date:   Fri, 14 Feb 2020 16:25:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1] fbdev: simplefb: Platform data shan't include kernel.h
Message-ID: <20200214142550.GL10400@smile.fi.intel.com>
References: <20200204162114.28937-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204162114.28937-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Feb 04, 2020 at 06:21:14PM +0200, Andy Shevchenko wrote:
> Replace with appropriate types.h.

Hans, any comment on this?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/platform_data/simplefb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
> index 4f733a411d18..ca8337695c2a 100644
> --- a/include/linux/platform_data/simplefb.h
> +++ b/include/linux/platform_data/simplefb.h
> @@ -10,7 +10,7 @@
>  
>  #include <drm/drm_fourcc.h>
>  #include <linux/fb.h>
> -#include <linux/kernel.h>
> +#include <linux/types.h>
>  
>  /* format array, use it to initialize a "struct simplefb_format" array */
>  #define SIMPLEFB_FORMATS \
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko


