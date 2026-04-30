Return-Path: <linux-fbdev+bounces-7134-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGkwHYNB82kGywEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7134-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 30 Apr 2026 13:48:19 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D54A2543
	for <lists+linux-fbdev@lfdr.de>; Thu, 30 Apr 2026 13:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FC41301F7A8
	for <lists+linux-fbdev@lfdr.de>; Thu, 30 Apr 2026 11:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967833D7D63;
	Thu, 30 Apr 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkgQDX5F"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163643A1686;
	Thu, 30 Apr 2026 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549613; cv=none; b=WkY9uCNMifydkax9NHfrR23pfZ8X5qMWzlyALuFUjwIUrMN+17HK1RcZLsLCwIb0jjeXyeVcq1hfUZg6FsOBWCKIIr8Lq2xlGomEeM3K96v7tsgfj/7HUvafv9nD0bnqElRpPdK39i7i+05SlswXT+7T/8jancowP3UpAcljGqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549613; c=relaxed/simple;
	bh=NTVYcIL/w1sQtMNYrrV2a74rDO7vqtiEkVH+wPMfvTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIxtQxN5oVcdWM+Y6GNlPDiI6uknKWelAvX9Le79mlYjUNOfTWQXvrjiJxsGALQzaXdAeE3YQhVztHJyL+m058gNvwXF/NJ6MQiy0C+h0tpwbHepPl7NaYWd7n9D7huhFXjmTGlKK2NxPa0v1kL5VSa6M5cHDNh8mrj32pICpiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkgQDX5F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777549612; x=1809085612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NTVYcIL/w1sQtMNYrrV2a74rDO7vqtiEkVH+wPMfvTU=;
  b=GkgQDX5FyqeaIUw6n0fElb1K603ZxeY0Ee6QtwoNvRGvXhzvna84X2eq
   /YbysRBBDeCwz8ewt3KwCFPGE/JFU8fpTPI37EX8Q+Ni5pXeLMKUax3N9
   +ogVD8eqm2/6KZxXFxCtK6jLxwW88MmoyshNR2mPwM4/caVYJgCDBMMra
   2rYL1sY6AnoOrnZX44FOkroGp6eMDtBHH0RJWRIkeJKSR+z8UQX1WaUVj
   0he2c625a/xTMoB/HY3OShSIHdL1pAgapVFwJcUsIyQJscYmUpnMFAjJs
   tjH+5/62TrcjzssN71vA2PldMOf+N6DaEafSORAQddZTIts3zXLwEXozQ
   A==;
X-CSE-ConnectionGUID: iwlKL2rrQdqeKwsTOJnAMg==
X-CSE-MsgGUID: krtiLW7CTGWIM4Kq3CQ6BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78551260"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78551260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 04:46:51 -0700
X-CSE-ConnectionGUID: n+8JpiroRtmzz5dfjEWvDA==
X-CSE-MsgGUID: Mm9UkdVtTMW6BwhpoFRylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231916923"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.42])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 04:46:48 -0700
Date: Thu, 30 Apr 2026 14:46:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: remove unused function
 fbtft_write_gpio16_wr_latched
Message-ID: <afNBJZOZSova0p22@ashevche-desk.local>
References: <20260430102529.25019-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430102529.25019-1-dennylin0707@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: DC0D54A2543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7134-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]

On Thu, Apr 30, 2026 at 10:25:29AM +0000, Hungyu Lin wrote:
> The function fbtft_write_gpio16_wr_latched is not referenced anywhere

fbtft_write_gpio16_wr_latched()

> in the driver and only contains a stub implementation.
> 
> Remove it from the driver.

Agree, pure code removal is always welcome.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



