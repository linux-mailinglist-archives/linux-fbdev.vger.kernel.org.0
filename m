Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C364D103E72
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Nov 2019 16:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbfKTP2z (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Nov 2019 10:28:55 -0500
Received: from mga12.intel.com ([192.55.52.136]:64631 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbfKTP2y (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Nov 2019 10:28:54 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 07:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; 
   d="scan'208";a="209568358"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 20 Nov 2019 07:28:51 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iXRuU-0006qT-KF; Wed, 20 Nov 2019 17:28:50 +0200
Date:   Wed, 20 Nov 2019 17:28:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH v1 3/5] fbtft: Drop useless #ifdef CONFIG_OF and dead code
Message-ID: <20191120152850.GQ32742@smile.fi.intel.com>
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
 <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
 <37435de0-873d-d20c-ac66-420ba91356fd@tronnes.org>
 <676c3f0e-81b7-d9be-8b37-a38eb3d762fb@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <676c3f0e-81b7-d9be-8b37-a38eb3d762fb@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Nov 20, 2019 at 04:04:17PM +0100, Noralf Trønnes wrote:
> Den 20.11.2019 15.43, skrev Noralf Trønnes:
> > Den 20.11.2019 10.57, skrev Andy Shevchenko:

> >> First of all there is no need to guard GPIO request by CONFIG_OF.
> >> It works for everybody independently on resource provider. While here,
> >> rename the function to reflect the above.
> >>
> >> Moreover, since we have a global dependency to OF, the rest of
> >> conditional compilation is no-op, i.e. it's always be true.
> >>
> >> Due to above drop useless #ifdef CONFIG_OF and therefore dead code.
> >>
> >> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> ---
> >>  drivers/staging/fbtft/fbtft-core.c | 19 ++-----------------
> >>  1 file changed, 2 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> > 
> > <snip>
> > 
> >> @@ -1184,17 +1176,10 @@ static struct fbtft_platform_data *fbtft_probe_dt(struct device *dev)
> >>  		pdata->display.backlight = 1;
> >>  	if (of_find_property(node, "init", NULL))
> >>  		pdata->display.fbtftops.init_display = fbtft_init_display_dt;
> >> -	pdata->display.fbtftops.request_gpios = fbtft_request_gpios_dt;
> >> +	pdata->display.fbtftops.request_gpios = fbtft_request_gpios;
> > 
> > You can ditch the .request_gpios callback and call fbtft_request_gpios()
> > directly in fbtft_register_framebuffer(). That will make it safe to drop
> > the OF dependency, otherwise .request_gpios will be NULL in the non-DT
> > case. This is one of the bugs that follwed the gpio refactoring.
> 
> Really difficult to read this fbtft code (that I wrote...).
> The NULL deref can only happen when dev->platform_data is set. That
> can't happen, in mainline at least, now that fbtft_device is gone.

Hmm... If I read code correctly this patch doesn't change this logic. We have
non-NULL ->request_gpios() in case of pdata != NULL if and only if supplier
gives it to us.

The above assignment happens only for DT case (fbtft_properties_read() is
guarded against non-DT, okay non-fwnode, cases).

> > You can also ditch the .request_gpios_match callback if you want, it
> > isn't called anymore (it is set in fb_agm1264k-fl).

I guess both improvements can be done later since they are not affecting the
logic in this series.

-- 
With Best Regards,
Andy Shevchenko


