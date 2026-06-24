Return-Path: <linux-fbdev+bounces-7707-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E4xNIlzAO2racAgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7707-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 13:32:44 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D36BDAB4
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 13:32:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=l38ZyQB2;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7707-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7707-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89E6E300AD6B
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 11:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D63830569F;
	Wed, 24 Jun 2026 11:31:43 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C2194C98;
	Wed, 24 Jun 2026 11:31:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300703; cv=none; b=QJetQ1GeCTkKnH4xWDWG6DXFtHEPRNC4UfF10XE7dkDKR6+3Q1fyWvprFbKJGM7NIWQrBizitfMxSTMoDQjC7lIzIdrBmPb1Wy/m4unsqX4EHWzUpLOaSgrvkpJHgD0eVXPJ2KmvrrNmiGReaR73yaOQsWiRCdrOePXoGSVkxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300703; c=relaxed/simple;
	bh=d5HyWw/v+MgocWmiFJGhqAbm8vl8c80N0u9O+M8mTY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwG7z4jcTQdR+9AUfKtBfCta0PDNkxByrlr5q1MmVVRYUhlxyFY8CoedHZetsWAVNzxKrqj3pHBbnkEJ/ChlwaYNrXlAwRQr20m+FM9ck8+h4J3FV6FHRwG2jmZmo4HrAIQB+bhGE/EanQSiRwP07DXjakNVPEAYsCF10geok48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l38ZyQB2; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782300702; x=1813836702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d5HyWw/v+MgocWmiFJGhqAbm8vl8c80N0u9O+M8mTY4=;
  b=l38ZyQB25nom/AKrlcWWaFZxC1cqTUnqBezR2J5gQtgQ2ZlymsL8UNif
   EqVPHJkcPxF2fpY6K6MkDqEjVE7jwMvkAFmgmbXW2c9ucy2ma9unvyjTh
   0qPujSLK3Fh5N7S9vx1KNWW7iD+oDEhXDzq07oClPI+omgRe8ySzLileY
   KWD+nRsnH4bKqRvxNAj10tHRgECsZJ+U0W3Qch/+eLctAu19tqMA/BTnO
   k2+VSBeY1OV/PDs1Iq2cz0Fk0VtHdXcetnosAPyIPnra7fUjr7JbSBLUV
   lF31qn5j3TCJYaHJzbvNu0sO3Qj1GAjUDB0z1p+xAn6bMr9rl3y8WCZYg
   w==;
X-CSE-ConnectionGUID: 5P3kkip4S8eD/Xvacx0Ktg==
X-CSE-MsgGUID: eeI+IpGrSJ2DZprEkmD03w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94454223"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="94454223"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 04:31:41 -0700
X-CSE-ConnectionGUID: OFM21aTwQy+Fi8Ylpx5HTw==
X-CSE-MsgGUID: GLjjPo9NSSS9kKrITL0FQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="254791087"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 04:31:39 -0700
Date: Wed, 24 Jun 2026 14:31:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joyeta Modak <joyetamdk@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: use ARRAY_SIZE() in NUMARGS macro
Message-ID: <ajvAGK-0kCfkThcs@ashevche-desk.local>
References: <20260624073804.4391-1-joyetamdk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624073804.4391-1-joyetamdk@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:joyetamdk@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7707-lists,linux-fbdev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 643D36BDAB4

On Wed, Jun 24, 2026 at 01:08:04PM +0530, Joyeta Modak wrote:
> NUMARGS() computes the number of arguments by dividing the size of a
> temporary int array by sizeof(int). Using the standard ARRAY_SIZE()
> macro is the correct way to count array elements in the kernel, and
> ARRAY_SIZE() also provides a __must_be_array() compile time check. There
> are no functional changes.

...

> -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> +#define NUMARGS(...)  ARRAY_SIZE(((int[]){__VA_ARGS__}))
>  
>  #define write_reg(par, ...)                                            \
>  	((par)->fbtftops.write_register(par, NUMARGS(__VA_ARGS__), __VA_ARGS__))

What is the maximum parameters .write_register() takes in practice in the
fbtft drivers? If it's less than or equal to 15, we may use args.h instead.

-- 
With Best Regards,
Andy Shevchenko



