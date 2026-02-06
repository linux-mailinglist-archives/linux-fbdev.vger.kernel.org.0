Return-Path: <linux-fbdev+bounces-6095-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNo3OlbShWmOGwQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6095-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 06 Feb 2026 12:36:54 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C80FD4DD
	for <lists+linux-fbdev@lfdr.de>; Fri, 06 Feb 2026 12:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6411E303D314
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Feb 2026 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB7339E171;
	Fri,  6 Feb 2026 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg/JCpE9"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D322301
	for <linux-fbdev@vger.kernel.org>; Fri,  6 Feb 2026 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377746; cv=none; b=qL92aELnk2hIeWV2lEGf96IuU7oz7f9FuTKS7gYLLXunNV5F7wfEcssHKho2FDNg3dJ0b/5fSE/n5nTKtTIZgGkAx0+4nUFSHssPvJhQuHbmYFC+QmanhgEbenThYlxF+zFEwbpeXylIGQq7hTiXVKWEjT01sIUnSLzF1qfw9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377746; c=relaxed/simple;
	bh=JSF5pcLjyH9f13Yhs41JjhmwOxmO1Iv8GnJTsiRbMOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnqBWUh8Y1vQLgUMoJzNsfdwE+SKNNxyTlWN2s6sJP9pZW14yqcfCllHr5pqLItVnpSu6qA9Ec4yiqSEPDtt17207JT+E/Ih2JAEqaHABGzTfFsI65KF1UN613EQT8m45mtgAZ85i+OyKMFp1uWmUnqpLF3HTDMVqI8Noo4Kp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg/JCpE9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770377746; x=1801913746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JSF5pcLjyH9f13Yhs41JjhmwOxmO1Iv8GnJTsiRbMOw=;
  b=eg/JCpE9g5t40i7nVLpkk4QSuse0EVt1cQ0d2f306LJ1uJeShh6vGTaK
   /F0cTxN5liotOmzipqzG8Q/lcvtKPgQIsgwL294004YCLuZi0k9IpXZrD
   qChoF79FKvUg8Mqe6jwLPW8Dub/JbHsOqmpchdvmkLEae0I0w07euBJaN
   iIRD9HkaP96N3q7nc5hjgkvFLhEXotOJ4vSK8YYF/2GgQfIRA3bfI9Le8
   M6CB9iWciFdYyxmLrsvFSwd0KQnf7+9J2uISGInmlfzfLj59Y0RDPTKhh
   k/9N/q/Cq8QrbUR24nHDvpbnl5/VkgRuhouSmVn3x2pUlY1LSyD2qO9Co
   A==;
X-CSE-ConnectionGUID: TZPa0dQwRH2ExRJ4zjWqrQ==
X-CSE-MsgGUID: hpS9NwPKQWeQdCTaGlbFJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="59155896"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="59155896"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 03:35:45 -0800
X-CSE-ConnectionGUID: 1nv41lDjRwSzWGKgcYIsIg==
X-CSE-MsgGUID: yUeHcC10RAq2bTLXy4WjtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="241509383"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 03:35:43 -0800
Date: Fri, 6 Feb 2026 13:35:40 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aYXSDNxFZ3OQvP0C@smile.fi.intel.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
 <87y0l668ki.fsf@yellow.woof>
 <aYXEHajVeKvIMmL7@smile.fi.intel.com>
 <87ms1mb0vy.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ms1mb0vy.fsf@yellow.woof>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-6095-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 47C80FD4DD
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:51:45PM +0700, Nam Cao wrote:
> Andy Shevchenko <andriy.shevchenko@intel.com> writes:
> > Do you have an actual HW to test? If not, won't be applied either.
> 
> Yes, a pair with SPI interface.

Cool! Would be nice to have tested contribution, indeed.

-- 
With Best Regards,
Andy Shevchenko



