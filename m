Return-Path: <linux-fbdev+bounces-7733-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TLlQAdg3PWo2zQgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7733-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 16:14:48 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F16AD6C67BC
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 16:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=d3qQK7m5;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7733-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7733-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E16B530615C5
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 14:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A025B37B413;
	Thu, 25 Jun 2026 14:08:18 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7D364024;
	Thu, 25 Jun 2026 14:08:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396498; cv=none; b=f3Y9vhzOYdp57J5OTDTNQhLB0CEsw6tUltJUWi3+yhllHHJZ0XyGi8n/nAraQ0tpQLfdS/fjUMnFxUGspg4d4gAovhjjjpU89/Zuz6R365/sZjvMAlW4gslY12zQaLAyZinagmxdHcdXRt9kLBzkT40L4a85IDKPWQpgqbYPfCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396498; c=relaxed/simple;
	bh=G4bOlvhhdVwBaq8kCvvh+9q6vDkJkXVzE3VkYXm/UN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1Iv6DufNitDHo3FX1CmGUsW99vyXNmOZk3A1fbLCUh/odU5y0RctaYnAu74lrRU8Y31recSmdg/+9ticj8pwF/b7DVojjUyHGZqDOLhFTZoyZEH7PH/9RkXg1/jSH/3u2EdGqnOJcvtOwsqbwb0vpC/qetsYUuiUYaj1gjde0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3qQK7m5; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782396497; x=1813932497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4bOlvhhdVwBaq8kCvvh+9q6vDkJkXVzE3VkYXm/UN0=;
  b=d3qQK7m5HkPq7LmbK2cF3gLuj47S1TUrLY8eglMaD8jSjtVbSrJfExVa
   7fZdwvfnae93mdqSGs/oJyCjkWaHPwIZ2uybRGEist3cfJKOgEsDrtVhT
   x1M63/NLba0bGJF5Ss9NZtMarsnc3w1l6wHq1UfFM6LBrfhcKr9tCe/DY
   5Z3310+VUGxHOei38g3qXu/Kp7sn3iDeH6wO3oMbdanbld1qxTirxCHbU
   wrZtk7zVeRXtPEAmk1ibIgup/uxA/AMOUkhkq+LU/OuNmnMaX4tv5TeRL
   ZVaH/GhvsZbzb+V97vUaHKfCFFyW9k0ToSa2hiMMROzCkjix57C2YTioo
   Q==;
X-CSE-ConnectionGUID: 4TdTTSCGTlOLpTb8rT9zmg==
X-CSE-MsgGUID: dFcG7eouS9ickorF05HVsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94569710"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="94569710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 07:08:16 -0700
X-CSE-ConnectionGUID: O6ZI7uD3TeG2GgYuKgT3ZQ==
X-CSE-MsgGUID: shf94d8NTFWU0aUritrzjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="244368609"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 07:08:15 -0700
Date: Thu, 25 Jun 2026 17:08:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix unaligned access and buffer size
 when startbyte is used
Message-ID: <aj02TPm9nawLC18g@ashevche-desk.local>
References: <20260625103041.281190-1-suryasaimadhu369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625103041.281190-1-suryasaimadhu369@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suryasaimadhu369@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7733-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F16AD6C67BC

On Thu, Jun 25, 2026 at 06:30:41PM +0800, suryasaimadhu wrote:
> When par->startbyte is non-zero, buf is advanced by one byte creating
> an unaligned pointer for 16-bit types (u16, __be16). Dereferencing this
> unaligned pointer can cause a kernel panic on strict-alignment
> architectures.
> 
> Fix by using put_unaligned() instead of direct pointer dereference.
> 
> Also fix incorrect buffer size calculation in fbtft_write_buf_dc() call:
>   len * (sizeof(data_type) + offset)  /* wrong: multiplies offset by len */
>   len * sizeof(data_type) + offset    /* correct: one startbyte +
>                                          len items */

Same comments as per your other patch contributions. Make it cleaner next time.
So it seem a v2 should be a mini-series with fixes for different
issues/drivers/et cetera.

-- 
With Best Regards,
Andy Shevchenko



