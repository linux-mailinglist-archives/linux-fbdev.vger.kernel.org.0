Return-Path: <linux-fbdev+bounces-7734-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L47XLI84PWp/zQgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7734-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 16:17:51 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC36C683E
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 16:17:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TNeglqTd;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7734-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7734-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9E2D30A6A91
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 14:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E03E349CDD;
	Thu, 25 Jun 2026 14:09:55 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B072E7394;
	Thu, 25 Jun 2026 14:09:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396595; cv=none; b=OHndsl1W5C8D5exbNQOWJvrnujvb5sl67S0srlD9YOhqRiEmrFBUN6wOneuyZaweZ3EL2DD6gO3SReXIKNJGWt8ArjEKD3HCd6AgZxc2Nm4kX6MdLkqkH56xBUERnRAPbFRHyEFvjbZSqj5JIEDAz/vuPE8iYDcDnIiGvPO36Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396595; c=relaxed/simple;
	bh=c0Bmn6hGAyuAnYk1EnLNUGmPoh3wiWyFQ1JCR1xdNDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/VM9ewSXl86Y+WPlXSmlaK2sxm0cZm/djQzWU3L9Q/eN3TIZ7as3W4zU5oQFUa/t3IrZrErURNSn71iB4f9pTQObNv+eWjh/8CBN1UVw9EcLhW6vfTz8u9UQln447qv8VFjDSYxbS+chpohYuzf8q5XTjT3DONAH/fAliRjabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNeglqTd; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782396595; x=1813932595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c0Bmn6hGAyuAnYk1EnLNUGmPoh3wiWyFQ1JCR1xdNDM=;
  b=TNeglqTdTJbbhXlleiqx0UCu7VPf2DhTyRxjkpgcK8GgjRxlE+8WOBgZ
   UlAOX+ERFa0gkJ+ljgEv+HUOZIGpnqp6JKKag4j3G/vrkZDMWjdmsa6Lu
   Sz5DqzYCDrp5BQltjGEWOA25SKVwcOnxKEVsqT3lzVMDH/LSaMhxLWKhI
   pcTEutiDE5TIK13Br6cmWI+aOLFaVCswSuIqUKHS9z87Bi9RQBGwgh/0Q
   1mXwdb9jLVWWDf69FA7MHHUXjw6R/XNpcww/93Hf5m0QK4mSn0QXUH8+r
   KbOCm653RwN48NEq/1eSCPDpbpGSYZSZcckEr11O9HYnj4eHV5N/t971C
   g==;
X-CSE-ConnectionGUID: LbM4iuVuRiq1xmNFv6L1mA==
X-CSE-MsgGUID: kgvsQshTR1mEGRX2OqRicQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="100597977"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="100597977"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 07:09:54 -0700
X-CSE-ConnectionGUID: fJBYsruzT7O3YosKUuaS6w==
X-CSE-MsgGUID: DDU2IQeoRC2DL9WI0rmhJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="255652309"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 07:09:52 -0700
Date: Thu, 25 Jun 2026 17:09:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Madhu <suryasaimadhu369@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: replace empty modifier argument with
 no-op macro
Message-ID: <aj02rT4eRKRPhrNe@ashevche-desk.local>
References: <20260625092721.238366-1-suryasaimadhu369@gmail.com>
 <aj0Cv0Wzb3rieNqW@stanley.mountain>
 <CAB0uMAeMOV4Xhq2cNVjxne89yqF8vdubM8-OpPYGK4f4yBLMNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB0uMAeMOV4Xhq2cNVjxne89yqF8vdubM8-OpPYGK4f4yBLMNw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7734-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suryasaimadhu369@gmail.com,m:error27@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21AC36C683E

On Thu, Jun 25, 2026 at 04:00:24PM +0530, Sai Madhu wrote:

First of all, do not top-post!

> Thank you for the feedback. I understand and will drop this patch.
> 
> I have also noticed two pre-existing bugs in the same file
> (unaligned access and buffer size calculation when startbyte is used)
> and have sent a separate patch to fix those.

> On Thu, 25 Jun 2026 at 15:58, Dan Carpenter <error27@gmail.com> wrote:
> > On Thu, Jun 25, 2026 at 05:27:21PM +0800, suryasaimadhu wrote:

> > I don't hate this patch, but I think we've decided to leave this
> > as-is.

Yep. as Dan said,

-- 
With Best Regards,
Andy Shevchenko



