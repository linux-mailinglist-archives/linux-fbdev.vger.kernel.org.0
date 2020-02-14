Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3B4D15F249
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Feb 2020 19:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392609AbgBNSIf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Feb 2020 13:08:35 -0500
Received: from mga01.intel.com ([192.55.52.88]:15777 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392632AbgBNSIf (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Feb 2020 13:08:35 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Feb 2020 10:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; 
   d="scan'208";a="433097663"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2020 10:08:19 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j2fO1-001QhL-Ku; Fri, 14 Feb 2020 20:08:21 +0200
Date:   Fri, 14 Feb 2020 20:08:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1] fbdev: simplefb: Platform data shan't include kernel.h
Message-ID: <20200214180821.GO10400@smile.fi.intel.com>
References: <20200204162114.28937-1-andriy.shevchenko@linux.intel.com>
 <20200214142550.GL10400@smile.fi.intel.com>
 <f33a4921-2b73-66c1-3165-b2e23c9fb2a8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f33a4921-2b73-66c1-3165-b2e23c9fb2a8@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Feb 14, 2020 at 04:21:57PM +0100, Hans de Goede wrote:
> On 2/14/20 3:25 PM, Andy Shevchenko wrote:
> > On Tue, Feb 04, 2020 at 06:21:14PM +0200, Andy Shevchenko wrote:
> > > Replace with appropriate types.h.
> > 
> > Hans, any comment on this?
> 
> Not really, I've not touched that code in a while.
> 
> But I see I'm still listed as the maintainer, the change looks sensible
> to me, so:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Thanks!
Seems get_maintainer does not list Bart, so, Cc him here.

> 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >   include/linux/platform_data/simplefb.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
> > > index 4f733a411d18..ca8337695c2a 100644
> > > --- a/include/linux/platform_data/simplefb.h
> > > +++ b/include/linux/platform_data/simplefb.h
> > > @@ -10,7 +10,7 @@
> > >   #include <drm/drm_fourcc.h>
> > >   #include <linux/fb.h>
> > > -#include <linux/kernel.h>
> > > +#include <linux/types.h>
> > >   /* format array, use it to initialize a "struct simplefb_format" array */
> > >   #define SIMPLEFB_FORMATS \
> > > -- 
> > > 2.24.1
> > > 
> > 
> 

-- 
With Best Regards,
Andy Shevchenko


