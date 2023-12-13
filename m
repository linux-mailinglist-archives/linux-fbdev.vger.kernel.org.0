Return-Path: <linux-fbdev+bounces-373-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE680CAA8
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Dec 2023 14:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24D41F21185
	for <lists+linux-fbdev@lfdr.de>; Mon, 11 Dec 2023 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8749F3D973;
	Mon, 11 Dec 2023 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jp+58FL2"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BB8C3
	for <linux-fbdev@vger.kernel.org>; Mon, 11 Dec 2023 05:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702300755; x=1733836755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GiUC+6GxE7v6b4XlFqOh/BgHFaaXV4kpSR5s/1hCnsg=;
  b=Jp+58FL2pWB3Jo/zxyDnedGIO1dGsxrKTAurCdto+PmDi42x6AYyehQE
   RhqmoFhS38kGw+N/7PRfVhGHj0rlr/o1IKZSli1p3L1VePdUwMW5k2FnS
   85Z+vte+j1j0rMnv/LWF0YTPQftjpU9YqV78JpYfplM6PjHByoP/+04C6
   pj9wYg7AR3uyHAvzT1U2uPhSM/Z+K9aeV4Se+urx9LJeCspYnyawgxadh
   sXypnodQBgizbSRKnM0kZ/edBu/YPTVqVHzsh+XFaSe5ek6wyRWxriuTf
   eis4wrhyrA4T050o+rXjJUuW0JtkbMXompVxy0OA5Djk+K4042JpLnZEg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="461124859"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="461124859"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 05:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="896463575"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="896463575"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 05:19:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rCgBg-00000004mu8-1UPe;
	Mon, 11 Dec 2023 15:19:08 +0200
Date: Mon, 11 Dec 2023 15:19:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Priit Laes <plaes@plaes.org>, Dillon Min <dillon.minfei@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: State of affairs with Ilitek 9341 support
Message-ID: <ZXcMTBKbHiuTLAfR@smile.fi.intel.com>
References: <ZXM9pG-53V4S8E2H@smile.fi.intel.com>
 <7c848801-cf7f-4293-8a29-084dd20efb8e@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c848801-cf7f-4293-8a29-084dd20efb8e@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 08, 2023 at 09:18:20PM +0100, Noralf Tr�nnes wrote:
> On 12/8/23 17:00, Andy Shevchenko wrote:
> > Included authors and latest (non-white-space) contributors to the drivers
> > in question along with relevant mailing list and respective (active in the
> > area) maintainers.
> > 
> > I already had risen the question in times when 4th (sic!) driver for the same
> > hardware was about to be pulled into upstream that we have to somehow reduce
> > the code base and unify device properties.
> > 
> > So, the main question here "What is the plan and where are we now?"
> > 
> > I admit that fbtft case is special as it supports, in particular, platform
> > device (parallel interface) and also well established in the embedded world.
> > What about the rest?
> > 
> > N.B. Besides the fact that panel drivers are too OF-centric, which is bad
> > practice for the new kernel code in general and has to be stopped. I.o.w.
> > seeing of_property_*() or alike in the driver after ca. 2020 should be
> > immediate NAK unless it's very well justified why it may not be used on
> > non-OF systems.

Noralf, thanks for your response, my comments below.

TBH I would also like to hear from maintainers, because it seems they got
an additional burden for no benefit.

> Last year drivers/gpu/drm/tiny/panel-mipi-dbi.c was added to support all
> MIPI DBI compatible (ili9341) SPI displays.
> It loads the initialisation commands from a firmware file. For more info
> see https://github.com/notro/panel-mipi-dbi/wiki.
> 
> When I started on fbtft in 2013 I didn't know about MIPI DBI so I made
> some common bus access functions and one driver per controller and that
> driver had an initialisation sequence to match the panel I had. Then I
> discovered that displays using the same controller could have different
> init sequences so I added a Device Tree <init> property that could
> override the driver init.
> 
> In 2015 fbtft was added to drivers/staging, but later that year fbdev
> was closed for new drivers so it was a dead end.
> 
> I started to work on porting fbtft to DRM and almost 2 years later
> support for the MI0283QT panel (ILI9341) was added.
> I had now learned about MIPI DBI so a library to handle that was added.
> I had asked on the Device Tree ML about the <init> property and I was
> told that I couldn't have that which meant that I couldn't get away with
> having just one driver for the MIPI DBI compatible display panels as I
> was first hoping for.
> 
> I was aware that there was a challenge going from fbtft to DRM because
> in fbtft there is support for all panel setups using the <init>
> property, but in DRM every panel needed support in a driver. So I
> started to look at adding Device Tree properties to describe the setup
> for one controller. This would make it easy to describe a new panel in
> Device Tree for a supported controller. Maxime Ripard came up with the
> idea to have the controller initialisation commands in a firmware file
> which meant that we could get away with having just one driver for all
> MIPI DBI SPI panels (which is the vast majority of these SPI pixel
> upload panels).
> 
> This meant that SPI support could be removed from all the MIPI DBI
> compatible controllers in fbtft

I believe it can't. Otherwise we _must_ provide the DT (device property)
parser that uses what is provided for fbtft SPI to be enabled in the other
driver.

> since there's now a solution for them in
> DRM. The drivers themselves must stay since they also have parallel bus
> support which is lacking in DRM. My plan was to wait for panel-mipi-dbi
> to hit an LTS and then either prepare patches to remove MIPI DBI SPI
> support from fbtft or at least send an email to staging about the new
> driver.

> Unfortunately my health problems got worse and many plans went
> out the window.

Oh, sad to hear this, hope you will get better sooner than later!

> ILI9341 DRM drivers
> 
> - drivers/gpu/drm/tiny/mi0283qt.c
>   This was the first driver added for the MI0283QT panel series
> 
> - drivers/gpu/drm/tiny/ili9341.c
>   Later ili9341 based panels was decided to be added to a controller
>   specific driver.

Why was it appeared in the first place? :-(

> - drivers/gpu/drm/tiny/panel-mipi-dbi.c
>   Generic MIPI DBI SPI driver that loads init commands from a firmware
>   file. It uses of_property_read_string_index() and
>   of_get_drm_panel_display_mode(). I don't know if it's possible to make
>   device_property_*() versions of those.

Everything like this is possible, just somebody needs to fulfill that.
And as I said, new OF-centric code, has to be NAKed by default.

> - drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>   This driver supports the MIPI DPI (RGB) interface on the controller.
>   Controller init is done over MIPI DBI SPI. The driver does also for
>   some reason support the same panel as the ili9341.c driver does.
>   So 2 drivers for the same panel...
>   Sidenote: It is possible to make a generic panel-mipi-dpi.c driver for
>   panels that use DPI for pixels and DBI for init loaded from a firmware
>   file.

I wonder who has enough experience and time to at least point out or do
something about this...

At least we can start combining the two in tinydrm, to reduce the variety.

-- 
With Best Regards,
Andy Shevchenko



