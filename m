Return-Path: <linux-fbdev+bounces-6210-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH+TNjP3jmnbGAEAu9opvQ
	(envelope-from <linux-fbdev+bounces-6210-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Feb 2026 11:04:35 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAB134D71
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Feb 2026 11:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05FF73072A6E
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Feb 2026 10:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58297319601;
	Fri, 13 Feb 2026 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLVRRFNw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836734D4F5;
	Fri, 13 Feb 2026 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770977062; cv=none; b=ugVeSlfgHxjt8CVk3fH04gN+gZz3VFagUt1rEvwm1WG6woRtRlObbccfFZYJLMEdpzF8g7m69SBmjme3+GEntR3LD4PPQem7KiNRNU5OsuzSDd3yt2R2tjNLCijXcosMSh2ZjVxo9K7H1bibB0qWLG86aipRlGwVNw94R+TY5ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770977062; c=relaxed/simple;
	bh=2YGib/pI9hafSc7CEu3zaO20oOQvYB0eNiC4EWgrIAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFGWF4Qekb1UdVhMdhjXglg0EU5Q+2gh11KmgzmVveLgN4BYzW/DqUrCS7VcQnurrczQY+92i1pX5blxTnPDnBp4ElkzAL/kM47SeuaCx6h68o+G3Xx7BiYVUDgAoxCGFYW7MnB5DMSn8luGNxbiqqZGlyAwrzhQ2J5JHrQsbLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLVRRFNw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770977061; x=1802513061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2YGib/pI9hafSc7CEu3zaO20oOQvYB0eNiC4EWgrIAo=;
  b=jLVRRFNwh5UEoo9XSqXzNTrvDudeB1E616aNrE7ET4Atjw9i0wW16sWV
   Ivxvsv9KdqcZAOwatcgofd16lXN/NF2RaEh5AZ0Hjpg27YLGLD8oxn0B9
   bGA8ReAqpjL662MD9WAsREBj7xfG6dfTIc5rgD76gu8MKnFIDsViND7Ho
   SUTEy873wafJaBnFiLkCjz6Mhka2uCfU8aGDBt35Dm8ifW2A+oGCsUda6
   O3DMkbe27vkSL+bEpL1VwgvZGHFFnNvvvfK/KLrt9AYNveO7ah6wT/g3l
   JzzMNOjqU7lrjl8nnOIgzri+qRje9GJ9HCj6cNYNJtpLFE1Ce+p4TgRRu
   g==;
X-CSE-ConnectionGUID: xXnFzC1DRPuBu3XwsNHtoA==
X-CSE-MsgGUID: +3r07n8ETX66uRYRSGBkFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75783221"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="75783221"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 02:04:20 -0800
X-CSE-ConnectionGUID: XWv9UOoASkCNjCFmsJITMQ==
X-CSE-MsgGUID: nFUH1aslQC6GiB+7KMGRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211600408"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 02:04:18 -0800
Date: Fri, 13 Feb 2026 12:04:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Remove duplications of
 fbtft_set_addr_win()
Message-ID: <aY73IMz_2iydUs7M@smile.fi.intel.com>
References: <20260213085927.3673653-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213085927.3673653-1-namcao@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6210-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 53EAB134D71
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:59:27AM +0100, Nam Cao wrote:
> Lots of drivers duplicate the default fbtft_set_addr_win(). Just use the
> default instead.

Very good catch, indeed you are right and we can simply drop these dups.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



