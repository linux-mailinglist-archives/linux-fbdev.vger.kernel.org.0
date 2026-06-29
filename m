Return-Path: <linux-fbdev+bounces-7760-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id twDBDpEOQmpDzgkAu9opvQ
	(envelope-from <linux-fbdev+bounces-7760-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 29 Jun 2026 08:20:01 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EF6D648D
	for <lists+linux-fbdev@lfdr.de>; Mon, 29 Jun 2026 08:20:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=WoKj80MP;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7760-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7760-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 479F83003D2F
	for <lists+linux-fbdev@lfdr.de>; Mon, 29 Jun 2026 06:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C00A3939C1;
	Mon, 29 Jun 2026 06:19:57 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114C38B7B4;
	Mon, 29 Jun 2026 06:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782713997; cv=none; b=aO2iiV9QPwhZP3NzIkxis63O7OegZzaXRHuMyOxVJJiG7/v/321uXKl3nvhzMTOqxfB9h6fGva6VekCpwV49JLxYVBgeblSXnujHL18pkkV6JCq1+DJ525YhC7lL3ihqlwmbjKaenI0OmYcDwiAzwSVi882hKenFSX6Eo57h81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782713997; c=relaxed/simple;
	bh=M+CVXNbFxnYVUHiLO8p1f8U/Oa8yWKHeFEwwNFbVCw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9RQ+jFdeGtoZnofVdvWtyGLxYOADZNh5IRkCgRjYtkHMQyVXN4po3p8kkOA5AZveXceNkq66XtU7A9OinE8i3jKy7Lm0TQbfr8EAuVe7abRRSYE9VNJJpr28F5hC9+0kjawypJ9irzWQe+hbECvHDkD7hO2aO9gKeHBOna8VyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoKj80MP; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782713995; x=1814249995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+CVXNbFxnYVUHiLO8p1f8U/Oa8yWKHeFEwwNFbVCw8=;
  b=WoKj80MPsCjuynuPYxwQfWg1HcpFMk+/4dryM/rOBrxPr3jNsIRzoLav
   JCxR/ZTc1PnX4R3nEBLH72Y+nH8i/ZxT0hsYTMGxzxUbml0nhD56T5ILf
   V1TYp8/uQW9x7IV+Bdd+m1+EzvCgGOxvvAl0R1GQE58W0Bl7H7Yv1Ot7J
   oOJeZe5lAQcBzEBObcvY4DFHwWQDPiVJSmhZVRK7BbRIFniHEDqHjlDtV
   P7ewzLVr2KwddTX7Q27yzOxgDV5a16IpmptJBFQVxTr7D0WIBXpkfKlBO
   /JVIQC+aqTVyTDE/gJArkYOAjj02SJR/FTfAIjyn/jUDDl/YCHGUzCuV6
   A==;
X-CSE-ConnectionGUID: /TN8zCo5TYW+qFv9e0c04w==
X-CSE-MsgGUID: /zE7r3VOQMe9p9BMKWfq9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94544382"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="94544382"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 23:19:55 -0700
X-CSE-ConnectionGUID: WCXRpK0OR/W1yR4qCMVJog==
X-CSE-MsgGUID: JolV0ZvlTbKLpzL6HNcWGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="256271508"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 23:19:50 -0700
Date: Mon, 29 Jun 2026 09:19:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: airlied@gmail.com, andy@kernel.org, azuddinadam@gmail.com,
	chintanlike@gmail.com, conor+dt@kernel.org, deller@gmx.de,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org, javierm@redhat.com, krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 3/4] drm/ssd130x: Add SSD135X_FAMILY and SSD1351
 support
Message-ID: <akIOhFZbATDY2vRf@ashevche-desk.local>
References: <ajpLyronl7a-yxh-@ashevche-desk.local>
 <20260628154312.46185-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628154312.46185-1-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7760-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amit.barzilai22@gmail.com,m:airlied@gmail.com,m:andy@kernel.org,m:azuddinadam@gmail.com,m:chintanlike@gmail.com,m:conor+dt@kernel.org,m:deller@gmx.de,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:gregkh@linuxfoundation.org,m:javierm@redhat.com,m:krzk+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:amitbarzilai22@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,gmx.de,vger.kernel.org,lists.freedesktop.org,linuxfoundation.org,redhat.com,lists.linux.dev,linux.intel.com,ffwll.ch,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC3EF6D648D

On Sun, Jun 28, 2026 at 06:43:12PM +0300, Amit Barzilai wrote:
> On Tue, 23 Jun 2026 12:37:31 +0300, Andy Shevchenko wrote:

...

> >> +	const u8 cmds[] = {
> >
> > Why not static?
> 
> This array can't be made static. It is initialised with runtime values
> (ssd130x->width - 1 and ssd130x->height - 1), so it is not a compile-time
> constant and a static/file-scope definition wouldn't compile.
> The other ssd13xx_init() functions are non-static for exactly the same
> reason.

Ah, I see. Thanks for pointing out.

> >> +		4, SSD135X_SET_CONTRAST, 0xc8, 0x80, 0xc8,
> >> +		2, SSD135X_SET_CONTRAST_MASTER, 0x0f,
> >> +		2, SSD135X_SET_PRECHARGE2, 0x01,
> >> +		1, SSD135X_SET_DISPLAY_NORMAL,
> >> +		2, SSD13XX_SET_SEG_REMAP, remap,
> >
> >> +		0,
> >
> > No trailing comma for the terminator entry.
> 
> Removing it in v3. The other init arrays in drm-misc-next still carry the
> terminator comma, but that's pre-existing code outside this series -- I've left
> it alone to avoid unrelated churn. Happy to send a separate cleanup if you'd
> prefer.

You can issue a separate cleanup patch for those.

> >> +	};

...

> >> +	/*
> >> +	 * ssd130x_power_on() issues a short reset pulse, but the SSD1351 is not
> >> +	 * ready to accept commands immediately afterwards. Give the controller
> >> +	 * time to settle before sending the init sequence.
> >> +	 */
> >
> > Any reference to the datasheet?
> 
> It's not a datasheet figure. fb_ssd1351 doesn't do it in init_display() either;
> it inherits it from the shared fbtft_reset() helper, which deasserts reset and
> then does msleep(120) before any command is sent. The 120 ms is a generic fbtft
> blanket value, not an SSD1351 number -- the SSD1351 datasheet's reset timing is
> microsecond-scale.
> 
> I removed the msleep() and retested this on the hardware. The panel still 
> initialises reliably.
> I'll drop the msleep() in v3.

Yeah, I truly believe that this long delay is for the parallel type of IO, where
data and control signals are usually connected to a quite low speed GPIOs.

But I suggest to leave some comment in the code.

-- 
With Best Regards,
Andy Shevchenko



