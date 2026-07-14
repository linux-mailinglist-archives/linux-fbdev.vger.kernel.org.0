Return-Path: <linux-fbdev+bounces-7995-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MdVeF5iLVmog8wAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7995-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 21:18:48 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E36507582D7
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 21:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Jr2ky4QC;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7995-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7995-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A87530359B8
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 19:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD8A2931ED;
	Tue, 14 Jul 2026 19:18:46 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0012931C7;
	Tue, 14 Jul 2026 19:18:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056726; cv=none; b=gdLHorWb/0CJiYjT6v9bs49niRE0hgGeyTHrc72AN5TE9vaYPnklZEV0Cg/TeLavqSfisiCG9BGp9NG0+13aDuHSXZiLIa1a4qg0Vuw6ROWXiTrlCInlGJKNvegsex9MSI/VMFXdu4FhN/h1UIePyflruvLA9DNfq08UzSZ6Tho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056726; c=relaxed/simple;
	bh=GfOYDJlWg3IZFciu0wTO8HAj2UD1NUueTFeDJjUZDeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMjG1KBmYSUF24SmTj14ORNoS524XkQPhLemkRvS+t2JI3Pe2tWfZ2CmrDw4hPmQ/5t9CnQM5aOqmaFmWws3t8f5604EGH7wrvsoL4PrsfO2KK6rmP45i0XWNUEKeIr1e3mZZPSQNOdXvrwWLQY0xvz1buBBAh9FljJ/Vs1BMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jr2ky4QC; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784056725; x=1815592725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GfOYDJlWg3IZFciu0wTO8HAj2UD1NUueTFeDJjUZDeQ=;
  b=Jr2ky4QCcSJgrvHH0cizZiwzLi2BAou/Fl5aSJtgw16Rrz6TkshCdLSG
   K6AuVOotqZdDRbgoMjOp2DFhMhF1wvCQnRamBqB7SOfNHgGrUVvaRaZjq
   eSnN0fFZNrZE7FyKh+JVqp+B+/9cuAPaqhqmyqRG4pgcTxDZLwqQSNlBw
   PRApQpKMh6KPeJZuUMfxtdYOkoSr5D5C/t7fJB/rILXNv9HBg5cYyGYEU
   3T/Sbyk/kPulwD4RD8rVvdYHf3sPsoDr4Dg2mH+H2+C7+CKgA82zwKAI8
   D2BAeifBlZgZ95WV+q9mVj8JI8NUy7nIiRHOT0gE2kMoIidu1kfleIJ5t
   A==;
X-CSE-ConnectionGUID: NkhesPlbSwuPgdkTB6JU6Q==
X-CSE-MsgGUID: BOUyspVeSQqtd3YcQSCj0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="72211823"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="72211823"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 12:18:44 -0700
X-CSE-ConnectionGUID: 9jbTOM19QO6MueOyBhvGoA==
X-CSE-MsgGUID: QKTFd/3vT42zxW848QgXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="254826846"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 12:18:42 -0700
Date: Tue, 14 Jul 2026 22:18:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, namcao@linutronix.de,
	tomasz.unger@yahoo.pl, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging/fbtft: Minor cleanups.
Message-ID: <alaLj25guWgLapBE@ashevche-desk.local>
References: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7995-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:graviaspanagiotis1@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:namcao@linutronix.de,m:tomasz.unger@yahoo.pl,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linutronix.de,yahoo.pl,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E36507582D7

On Tue, Jul 14, 2026 at 10:09:38PM +0300, Panagiotis Gravias wrote:
> Solved some style errors,
> parenthesis spacing, aligning arguments, replacing udelay() with
> usleep_range().
> 
> I hope this makes future checks with the style script cleaner and more
> helpfull.

To understand the resolution, read the mailing list archives for
the last ~6-9 months against this driver.

Also read and understand README in the folder of the driver.

-- 
With Best Regards,
Andy Shevchenko



