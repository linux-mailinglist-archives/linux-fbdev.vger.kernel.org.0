Return-Path: <linux-fbdev+bounces-5980-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FgmKUuPeml+7wEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5980-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 23:35:55 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C7A9A34
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 23:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9C6E302CD0B
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 22:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5253446D8;
	Wed, 28 Jan 2026 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9KNFiBf"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC1934405E
	for <linux-fbdev@vger.kernel.org>; Wed, 28 Jan 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769639707; cv=none; b=bIR+yNugsLw/jkH3BpN7uO6i5wcgABzjO1Wn/4jcHOjluScUvloDSdqRw+EVrRcyNYktKUvYsbTAooiYkmmVjlrlwHLo5aZEG9MSOpQvSBdD2mFIoZnP/q4ptlUycCFYh9FyQilDzboSk3NU7a1Yh20kaNX8ugZRITNJlz54rL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769639707; c=relaxed/simple;
	bh=nhYygQQwOHRkNC6CveoNJnpwHeTyhDqvKVE7dBa1WgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9KWVFOkCgSsACBR+mhzAqKbWDiMitqJVjD7SyhNghf6U1rw1we2nUR8wZuU1n7uLJiZyoCuADcIm5hDToiZ0Mlpjl5e5Ysax+J2OoVAYznY3egFfxuyqrB1f2yrCg3RHi/wOvrv+xcZbbKLgTCrvuLh7Oz1utDqND6AjJgXtBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9KNFiBf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769639706; x=1801175706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhYygQQwOHRkNC6CveoNJnpwHeTyhDqvKVE7dBa1WgY=;
  b=D9KNFiBfaCL6sNElvo44Pv5dI/KSr90RYr/rHIucInfWlrbTOB7TkDlC
   DNjShTpBzYLf6DGNm1/hYxDApJXbMHPC/tFOOWjKlH1qXWeWG6AA3w9xq
   a5L1JTIXWc38HS8mKRBGBSrheAA19Vq3GHfKWGE6xc6HdHjQ4VbnpzOnG
   /1WQwxu4cRykmbk2m9s/fev2AMtlwT3aOapKl4W/qPdkKQ1D49pbNWNSm
   h7eD1y4UdIHQgh4ECexLXfYXggCpYeMcgmreg4ypuYZK4mMe5/gAzZJAN
   /Qpws2jJBmPSd3btEpD3Gwt+9s0SY0QfXqaUzjzEZkuGsf7I6RxrhX3Aw
   w==;
X-CSE-ConnectionGUID: xNZeOP1uREmUdk79qr0T3Q==
X-CSE-MsgGUID: MQS42faKQ2uz/s+v0fO7xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70905543"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70905543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 14:35:05 -0800
X-CSE-ConnectionGUID: 6X5jH80pQeSWIE+VLaAAww==
X-CSE-MsgGUID: Ss0/p/x2QCel/znQA4hZcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207992461"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 14:35:03 -0800
Date: Thu, 29 Jan 2026 00:35:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: ChanSoo Shin <csshin9928@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aXqPFXQh5zpbnjhR@smile.fi.intel.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128203938.962414-1-csshin9928@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-5980-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 1D5C7A9A34
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:39:38AM +0900, ChanSoo Shin wrote:
> Instead of marking the entire display as dirty, calculate the start
> and end rows based on the damage offset and length and only mark the
> affected rows dirty. This reduces unnecessary full framebuffer updates
> for partial writes.
> 
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---

This is v5 and no changelog and no answers to the reviewers' questions.
Please, read all what people replied to your previous attempts.
Without that processed correctly NAK to this one.

-- 
With Best Regards,
Andy Shevchenko



