Return-Path: <linux-fbdev+bounces-6580-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGPLMuuRsWnkDAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6580-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2026 17:01:47 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1BF266E68
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2026 17:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C628630157D6
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2026 16:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3843C7E11;
	Wed, 11 Mar 2026 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gs7Fpa7w"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FAC2DB785;
	Wed, 11 Mar 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244898; cv=none; b=u4gnvwmCoVWZvEce+YpzbCsnjCma43/b5m1oCImzqCf0PXw7uP5mP3odY+2iNfK54cKdP0sbI/gZSilLNZq71ek/tqPnhMr5krWOu/iJq8cE/n5jNtqtCWkhYHGMC/em2JdTKhGhn1bmjGfxkY5XAPXGoYckXrZT1Htp4cvYvmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244898; c=relaxed/simple;
	bh=/Q4nI9GnPBiJS9h+l3JqwUOCgULwdWzmb5FA/Ol9xy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ9FNhU8bYQEG5dp//eqGXSJEiw20KOnU9L+6sLPTpjHLCkq8e2DKX9md0OBCXt0dbrLZ3UaoofAqachq9Ij11TKwiMr7mtbZUhELJTQekhb9y+SwJSmdGXCYgGHswY9hPF5EOHc/UlZeT/+pOMS9SHYUN7/5PJ+pTrh4hx4UIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gs7Fpa7w; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773244895; x=1804780895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Q4nI9GnPBiJS9h+l3JqwUOCgULwdWzmb5FA/Ol9xy4=;
  b=Gs7Fpa7wTgX7QJtTmjQtxyrEWwTfW8UYrfjyfs7geI6y2M2jJ1LdfwxP
   /CmeyCbEbM6RAYhYQb75hqXLaPM75sN9aNkVeVt/C7vSPHk8WuRr7pxmr
   bcj/s7aESRpEtZnnHnrdaPMtqi3Tq6AfG3HUeyDkJgjTjSTPFsvss+0Oy
   9iAbIn3mHAkbQ00MQQVj0tDnWzQq9Yu/YPS9BOr3mJaSIoZUVGQcvcW8K
   hMY8AuGkoanxn1iqS7HBAPtO8/yndM6N998yVsSd4DuL2WTMesvZAM3wU
   oVVxepJAfXYhBT6lZw4MVITRszExMGqvlq9v49eUQlpLLEPzwebrJ6gcb
   A==;
X-CSE-ConnectionGUID: +udRc8fxQ3iOdnGdV/7SvA==
X-CSE-MsgGUID: D3RxwqNhQpqQMk+SPWMZyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="96934097"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96934097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 09:01:35 -0700
X-CSE-ConnectionGUID: tcplHEL5RR6kBr0DO502Hw==
X-CSE-MsgGUID: moA3q3/wTK2j/j7bnZT68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="258436055"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 09:01:33 -0700
Date: Wed, 11 Mar 2026 18:01:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: replace udelay() with
 usleep_range()
Message-ID: <abGR2kBQlj3Wo4CQ@ashevche-desk.local>
References: <20260311142407.35403-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311142407.35403-1-mohd.abd.6602@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6580-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 3F1BF266E68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 02:24:07PM +0000, Anas Iqbal wrote:
> Replace udelay() with usleep_range() for a 250 microsecond delay
> as recommended by checkpatch.pl. usleep_range() avoids busy
> waiting and allows the scheduler to schedule other tasks.

Now, read README here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/staging/fbtft/README
and act accordingly.

If you have been mentored on this, show the above link to your mentors.

...

>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

Use the common sense here. This change won't be accepted.

...

> -	udelay(250);
> +	usleep_range(250, 500);

No.

-- 
With Best Regards,
Andy Shevchenko



