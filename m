Return-Path: <linux-fbdev+bounces-6295-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOcPESO8lmntlAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6295-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Feb 2026 08:30:43 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC215CA98
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Feb 2026 08:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E555430072A2
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Feb 2026 07:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40A03271E8;
	Thu, 19 Feb 2026 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgOrLo8H"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79D6158538;
	Thu, 19 Feb 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771486236; cv=none; b=kuHw3Pk078iRUA++p+z+7QOgApZDS1XOa1IgozkI9ymxMpl2uK3brU6E/Upwt8iwZybZR70WxVUJdurEMO7iQZY0hf7SJbXCxC6BsGcEouLlviM2+P345XrTLJ9G2isgwr9ncYl01lCMt5jmeqf7C6SjDwaKhs9T8GlGe0sbGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771486236; c=relaxed/simple;
	bh=4UopJju+T6ayiowUx6+QzRQDCN3JznC4ONcFrg90nu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJUiJg2Xuv/yqeigkR+YFlG/J4WVkooD62qlXKLwJu0eTeG7nfXiqIz0Bv+QiPDJ96Z/PmtLPWm35ZZcWgMtzj8Oy85KRmBgST2nVA385qsOWrKv9QwFS+gBGOj3gtRgegbEWyilJF0e7WrseWOQDR73zhA1ezBl6JRsTtV0InI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgOrLo8H; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771486235; x=1803022235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4UopJju+T6ayiowUx6+QzRQDCN3JznC4ONcFrg90nu4=;
  b=NgOrLo8HE5IXhhQljZbmtxhsw2XeHpKyaGoX8Aw7vWn3PhPRH5bGQq7a
   FsYAnybMhS8Jawl77LW/kH6nmR9YL//i18YEcx8g4UwRpe1wUs9nx/mov
   8UIbcqEBfAv9prZrsBT+5LbBwjKw43bFKk0DkSClsutLbZsCB0NhCbWBc
   zOzVFsskg3f/aXIKFPsXu/0QR+1qZrS1maYiJG+SfK/4b9DO/udBRREsN
   Pi8VyqIAGhiPtjgH8S8nZJ/4TdkZXYbPvZRQz9GwwgS6nZak2vMN5VEIg
   //+8Da0URQesnGDtF8kv8OPSfJJbgeh5LHHq3fuvFlmi2BvczwHHCUxuR
   A==;
X-CSE-ConnectionGUID: 3MgrlC5GSxCtblx/o5LcTA==
X-CSE-MsgGUID: lyTSJiJQRTO9ROz+1y3jGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72609616"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72609616"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:30:34 -0800
X-CSE-ConnectionGUID: 2NbE2wBjTO64E6OY6HR2YA==
X-CSE-MsgGUID: AADvZWsPSfKNq1wsLDX/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212416665"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:30:32 -0800
Date: Thu, 19 Feb 2026 09:30:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: tomasz.unger@yahoo.pl
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: replace udelay with
 usleep_range
Message-ID: <aZa8Ft1W5Skrb5Pt@smile.fi.intel.com>
References: <20260218175517.87544-1-tomasz.unger.ref@yahoo.pl>
 <20260218175517.87544-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218175517.87544-1-tomasz.unger@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-6295-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smile.fi.intel.com:mid,yahoo.pl:email,intel.com:dkim]
X-Rspamd-Queue-Id: 65BC215CA98
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:55:17PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>

NAK.


-- 
With Best Regards,
Andy Shevchenko



