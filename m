Return-Path: <linux-fbdev+bounces-7022-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGSKHYsX4mml1gAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7022-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2026 13:20:43 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B441AC36
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2026 13:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D44D530263C1
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2026 11:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6F23624A8;
	Fri, 17 Apr 2026 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdtM41Zc"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D9F30FC1F;
	Fri, 17 Apr 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776424835; cv=none; b=B3bVyIT4q1aAoRbce6jTBZCVKZtwq4h4LIzqrUYU1PPaaO+icVd2jbL3ZaBH6rY0I4l20deK7F7qNLdTQIdS8GfAVAuz7j6hAszv7GwqP6q6+sf8yii0kJYa4qi37gzgBDE7SnaCCMqhNmMxee/HoO8R6/sBfUBapHsVevs5DNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776424835; c=relaxed/simple;
	bh=ZJ/IkHzAzvd9vULVzY+BMeJBCQ616LS8tQLsbyyNNFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZY9CUSoA+18w9bzoz4qIQ848gYRghjRh7wnd9tSTZJDc+f58j4/F6H/LNBVam6pVoMx6q4KsADZUnyCeJ4vZzZt8EjN52f3Z5IEPLrx9v7iNDZZ2RmboZoKTxVU9dJLdwVYyNmPtLR5WgJxffkbL4pSLLvRTzUtkO5NpJPwDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdtM41Zc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776424832; x=1807960832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZJ/IkHzAzvd9vULVzY+BMeJBCQ616LS8tQLsbyyNNFM=;
  b=BdtM41ZcozJHQUpdYh1lU9H2hYdOyRYYOfbY+DxmWJMpyGHZ1Zn5ka7U
   InAB/y4W+xWqq7KwtO5wzO86H9sNMnEHe0SHtiTwbkeSPhJnynmhK50i6
   MMurnAMu9HGWw6LR3PhiSDK9xnupmTX9rsW4mYUnQbbpiKz+yA2JkVRE1
   rk7dcu3pbd345kfIU3WhT/A5aNEW3pytYwNx/uE4+fQ+5J6bedvdcy+Z2
   cXClE2lX1A2Y/rY8fDmAPhn6zsFHCXdTOXLSecQwcoyuz6T5u/YDI97fD
   pF0/EbY0+ddRI7qs5A/6nHvERhm3EUxtwEQ107F+KrvKGGXbz1JXjjdXf
   g==;
X-CSE-ConnectionGUID: /5iCi1xzTG62XOhrP/0OpQ==
X-CSE-MsgGUID: FR5hXEkMQDyQyfaplb/u6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77512117"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77512117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 04:20:31 -0700
X-CSE-ConnectionGUID: ov5K17c3SU6ti8os0AnsgA==
X-CSE-MsgGUID: YPpPWat4QSurhH6SDlYWLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="229997857"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 04:20:31 -0700
Date: Fri, 17 Apr 2026 14:20:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Prasaanth <prasaanth2k@gmail.com>
Cc: linux-staging@lists.linux.dev, andy@kernel.org,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: fix alignment in write_reg
 call
Message-ID: <aeIXfMcia6e8cQvy@ashevche-desk.local>
References: <20260417101457.7599-1-prasaanth2k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417101457.7599-1-prasaanth2k@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7022-lists,linux-fbdev=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A5B441AC36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 03:44:57PM +0530, Prasaanth wrote:
> Fix alignment of multiline arguments in write_reg() call to
> match kernel coding style
> 
> Reported by checkpatch.pl

NAK. Use a common sense.

-- 
With Best Regards,
Andy Shevchenko



