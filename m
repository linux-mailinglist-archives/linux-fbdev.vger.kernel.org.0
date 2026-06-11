Return-Path: <linux-fbdev+bounces-7591-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7dapDstrKmprpAMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7591-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jun 2026 10:03:23 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C09F66FABA
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jun 2026 10:03:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YpUE8LHi;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7591-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7591-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 028093021D3C
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jun 2026 08:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47EE36F413;
	Thu, 11 Jun 2026 08:03:17 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F936D50D;
	Thu, 11 Jun 2026 08:03:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164997; cv=none; b=alSzTu4+ru3hm2jk72Y1DvreNSqO6KTlNEbIcL8+44pLateBuLOVGILxwM+9d1wIT6D2AWSQ8BtgCKj/h8t842+ln+OnaVc4/IKJkaQweyk2C9wAFoMAK7wnbT0czP1dip/sDPf9r/TlavDNLcZNwMyBD0CWGzNGfO8i0cFWs0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164997; c=relaxed/simple;
	bh=Ok2uxm/+RAQD10yVIEOzY444cIER//V8tOb/oha4UDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L63m5my6pGpYO5203g5xOWmi7zqVe8YF7Kcb79dgDLkoIZp365kpwz3f+KIMOfnPgTs9jOTrYxvsu+nG5L6BYT/b9PWdQw2ScGay2/0d7tfrrBtdh0WryDXaL0eCFvWHVRcZXx6vsu1UW1xztiUVBKZV9eqSTz6NzF6Tx7V7RrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpUE8LHi; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781164995; x=1812700995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ok2uxm/+RAQD10yVIEOzY444cIER//V8tOb/oha4UDY=;
  b=YpUE8LHio3/FNjO/hcPUUTCppKan2xPlurshgWrR0+AOx7ve64A1yLI/
   k1l/ZRraCvS/jwqOWRbmBywGsLC7cw02qkv9SoUtvp/c2ieOUBUabcw5E
   bBvGNBHyOrRgtOSq/fYxHUouob6+n0Gxk8D5p8dfkvS6W//ei1OpQcVi8
   6GRZ9+Sf6tUVZ1ERkZeICeB4YI1116wQtHXFNcjf6Vl4LnCUQqFyUYNYB
   ghrC1AisWNfTCJvEbuW7s8OMQKTJByAERNrVn6XA906MBHjsLTMJFnGD9
   QlPv3hmGPcNRYpNoIh5a3BU8otxMOoaw93UrYntwwe2RmiwvaZ5yC9GBG
   Q==;
X-CSE-ConnectionGUID: Y3V77NnrQ5qL70paPrsT5Q==
X-CSE-MsgGUID: zbosYHxjT36lw9cF7jELLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85869175"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85869175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:03:15 -0700
X-CSE-ConnectionGUID: YPsm1ZJRTO28vwiL+pNZiQ==
X-CSE-MsgGUID: 6+WXQ8+JTyCDmFqo5iVVuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="248284111"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:03:12 -0700
Date: Thu, 11 Jun 2026 11:03:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix typo in comment in fb_upd161704.c
Message-ID: <aiprvmR0jK4B1Q68@ashevche-desk.local>
References: <20260611-upd161704-typo-v1-1-2e51387c3b28.ref@yahoo.pl>
 <20260611-upd161704-typo-v1-1-2e51387c3b28@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-upd161704-typo-v1-1-2e51387c3b28@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7591-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomasz.unger@yahoo.pl,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C09F66FABA

On Thu, Jun 11, 2026 at 09:53:40AM +0200, Tomasz Unger wrote:
> Fix spelling mistake found by codespell: "cencter" -> "center".

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



