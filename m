Return-Path: <linux-fbdev+bounces-7683-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tKLsK9ZLOmoT5gcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7683-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 11:03:18 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B66B5897
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 11:03:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YZTPqk47;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7683-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7683-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEB8730262B9
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 09:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8802853F3;
	Tue, 23 Jun 2026 09:03:14 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683EB25393E;
	Tue, 23 Jun 2026 09:03:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205394; cv=none; b=SM0rcvFeBVn4zraQbC0GA9xd8nPF8vLEicW5Jm6hjYhYKrJELzXF5ZHiDDnRqNtgQ5prbUrCsBi95LzbHkSC3mM80Y9LUCPE6cz+qdItfKG/Tk9aH2/w9l0f6r0iI1vV7cwmpVd7wnCv3dy0BN01S3QAc65r/6/fQN5do/mldzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205394; c=relaxed/simple;
	bh=PPCpMq7lYRc/Iu6FOHaKbGMIYgwijB1RSueN/w0Qn5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8LOAp/+KBkOam58ETJG4Rj0+ZNES6NPM7MuTQ4eI+7H8a2w9gYa46rC3CR0dz7C8bK4x4I+VVQXaVGofMDEjTQWij3v6F0D4qNWKDCdDNIFWCsKyiUcYCixacbGq++TXgLKpz2g8/gjOamuaRutXDYPWzWc56kyDpgjrBFZjVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZTPqk47; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782205394; x=1813741394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PPCpMq7lYRc/Iu6FOHaKbGMIYgwijB1RSueN/w0Qn5M=;
  b=YZTPqk47brywJZQzIPjKthF0j58+ifHQAdNgNGI79qIH/Ff9g5TEsuyJ
   ORiyhMOzsFAQd6H/Mkd6nEtrnfs7V8p0AWkmeQXU3Xn5qTd7ROR6CHL9q
   Y8DADY2fwD4bmk9gD+U6t8J6FFP+mAy/9q3J9413uPz6N9yyYw5PNUKlq
   jbrEjo/GSbkEBH1ga0Tt79OncL0GBwoZA2/aE6zv+OoxJqpiOAUdMmdSH
   oyvVK4rGlOpqKhXRFC780XXaz28go/IqGeRIo04dnZ7NEspPNPxNaVQ8F
   LNSBaACw2SpvMg3uOfwv7fk54mcgBZ4K+iFAuCRIBxQSKW5ak9fdI4DrR
   g==;
X-CSE-ConnectionGUID: HPCO5SdCQtimfd6GE0cBMw==
X-CSE-MsgGUID: 7KDfMFnjSJ6cc4appWa+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93307765"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="93307765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:03:13 -0700
X-CSE-ConnectionGUID: NBgyK0lZRCGMzmoTmLttMQ==
X-CSE-MsgGUID: +5fEtc7WSbOdM/6RvOjruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="287598339"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:03:08 -0700
Date: Tue, 23 Jun 2026 12:03:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andy@kernel.org, gregkh@linuxfoundation.org,
	deller@gmx.de, azuddinadam@gmail.com, chintanlike@gmail.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
Message-ID: <ajpLyronl7a-yxh-@ashevche-desk.local>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
 <20260622152506.78627-3-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622152506.78627-3-amit.barzilai22@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-7683-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amit.barzilai22@gmail.com,m:javierm@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:azuddinadam@gmail.com,m:chintanlike@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:amitbarzilai22@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,gmx.de,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 464B66B5897

On Mon, Jun 22, 2026 at 06:25:04PM +0300, Amit Barzilai wrote:
> SSD133X screens were getting 8bpp (RGB332) instead of the 16bpp
> (RGB565) that they support. This change adds a boolean to the
> deviceinfo struct selecting whether the variant is driven at
> DRM_FORMAT_RGB565.
> 
> Changed SSD133X to now utilize 65k color (RGB565).

...

> -	 * Each Segment has a 8-bit pixel and each Common output has a
> -	 * row of pixels. When using the (default) horizontal address
> -	 * increment mode, each byte of data sent to the controller has
> -	 * a Segment (e.g: SEG0).
> +	 * Each Segment holds one pixel and each Common output has a row
> +	 * of pixels. A pixel is 8 bits (one byte) in the 256 color
> +	 * (RGB332) format or 16 bits (two bytes) in the 65k color
> +	 * (RGB565) format. When using the (default) horizontal address
> +	 * increment mode, the pixel data is sent Segment by Segment
> +	 * (e.g: SEG0 first).
>  	 *
>  	 * When using the 256 color depth format, each pixel contains 3
>  	 * sub-pixels for color A, B and C. These have 3 bit, 3 bit and
>  	 * 2 bits respectively.

Something wrong with the plural. There is a difference between "3-bit" and
"3 bits", but "3 bit" is odd.

> +	 *
> +	 * When using the 65k color depth format, each pixel contains 3
> +	 * sub-pixels for color A, B and C. These have 5 bit, 6 bit and
> +	 * 5 bits respectively.

Same mistake is repeated here.

...

> +	/*
> +	 * Per-variant output format selector for the SSD133X data path. The
> +	 * hardware can drive the panel in RGB332 (1 byte/pixel) or RGB565
> +	 * (2 bytes/pixel); this is a policy choice per variant, not a

In other comments it was spelled fully, be consistent "1 byte per pixel",
"2 bytes per pixel".

> +	 * capability probe. When set, the variant is driven at RGB565.
> +	 */

-- 
With Best Regards,
Andy Shevchenko



