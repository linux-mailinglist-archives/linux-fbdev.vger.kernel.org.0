Return-Path: <linux-fbdev+bounces-6676-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOzoAUPAu2n1ngIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6676-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Mar 2026 10:22:11 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6702C886A
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Mar 2026 10:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88C1A3076638
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Mar 2026 09:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F9D3B8937;
	Thu, 19 Mar 2026 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MStv9cT2"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161D3B7B65
	for <linux-fbdev@vger.kernel.org>; Thu, 19 Mar 2026 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911315; cv=none; b=AoDKTqLvqfyQVb/Jty0QThX4a48O6Sd06gbI/5r0/+7gt7zDC28boOgNMqrUDC/g48dt9PpTwyKmtRDJUsp8mUApADhTD5/qPJuBOey21RXDk+z81cE9u8I6fFEeT91blY59irytC8fFFIN1zUsStpWHftlk/SNBJHcwBBaKNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911315; c=relaxed/simple;
	bh=ZRcVOhPdowDvzKLSuXQMCOObGmNVbYTZjhSNJcyjj9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6XMHfcVBeuaeCkdHpsT9TdJiZYOuScuAotWUVTrTiPaZLROCdQUH61eXW3erp1g1zz8OQSDu/fFVDev9DLppESl6u+7v3pXIJWgAejwpCa/Fsp+Z+/5/B1hKB3n1VSdhJamTDPUepVAImdgCSxDorxFyUwyZqX2frtYgSgav9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MStv9cT2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773911313; x=1805447313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZRcVOhPdowDvzKLSuXQMCOObGmNVbYTZjhSNJcyjj9I=;
  b=MStv9cT21XXLVoEKeGMT4nu7aB7m4JcP+A6dEop6GOIBNp3ef4WemeCl
   kEdHnWfivgfRSYTee1gI7SKohWFvhZQSl9aKiezuAPDyjOopE8/Hxp5r3
   Jv7ytT/YkTUz+cOgydHuQ331pmih5QWjcxcnza8XQ19Vg+HSIrQiugX4v
   5n4IuSEaGHc6tyNvIdqoXO2XbiczIJACF7uhShY84SnVz+YjSM7gimqUf
   VcR9QZeiQtvtZpaYDUx0nDNnqE1RpssqG5lpcf2VXs2vh2we0RGulSvKn
   PEN4XesoQkF26CtLaioxzPB3USvxIoYEa7TWiiEMajB1GnfZLqcHclpC+
   w==;
X-CSE-ConnectionGUID: SzfSTz3TQiaUJFOA7ekseA==
X-CSE-MsgGUID: h8omRWfST4KUZTsMK05KQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85605749"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="85605749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:08:32 -0700
X-CSE-ConnectionGUID: /HYQIwtlSlGVn7EFhK3P+w==
X-CSE-MsgGUID: xLwpsofwQ36F7lTP//oKmw==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:08:31 -0700
Date: Thu, 19 Mar 2026 11:08:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: Jason Yan <yanaijie@huawei.com>, Sam Ravnborg <sam@ravnborg.org>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	b.zolnierkie@samsung.com
Subject: Re: [PATCH] video: fbdev: matroxfb: remove dead code and set but not
 used variable
Message-ID: <abu9DKMN660yd3Sd@ashevche-desk.local>
References: <20200403021609.20968-1-yanaijie@huawei.com>
 <20200408101852.GC20795@ravnborg.org>
 <abpX_2PUWie03GdG@black.igk.intel.com>
 <17605e19-065c-4b71-abb2-a9c9a7b9ddc6@huawei.com>
 <abun9dwCYAWd1nIB@ashevche-desk.local>
 <e5f7611f-f087-4835-99e3-4fddc927aab8@huawei.com>
 <abuyJDK6E2aHA4rC@ashevche-desk.local>
 <c717b7b6-ffb6-47f9-b345-de0eddcfe7a4@gmx.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c717b7b6-ffb6-47f9-b345-de0eddcfe7a4@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6676-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 0A6702C886A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 09:35:33AM +0100, Helge Deller wrote:
> On 3/19/26 09:21, Andy Shevchenko wrote:
> > On Thu, Mar 19, 2026 at 04:06:44PM +0800, Jason Yan wrote:
> > > 在 2026/3/19 15:38, Andy Shevchenko 写道:
> > > > On Thu, Mar 19, 2026 at 10:22:08AM +0800, Jason Yan wrote:

...

> > > > Helge, can we revert this change and start over, please? (I can also send
> > > > revert if you think it's a better way)
> 
> Andy, all points you make against removing relevant code is absolutely right.
> 
> But for this specific commit 7b987887f97b ("video: fbdev: matroxfb: remove dead code and
> set but not used variable") I have to agree with Jason, that the patch is ok.
> I don't see any build errors either.

Just run on today's Linux Next (since the driver has not been changed in that
sense for a few years, the very same issue is present for a long time):

drivers/video/fbdev/matrox/g450_pll.c:412:18: error: variable 'mnp' set but not used [-Werror,-Wunused-but-set-variable]
  412 |                                 unsigned int mnp;
      |                                              ^
1 error generated.

> Are we mixing up things here maybe?

...

FWIW, I dove to the history of the driver.

So, the code, that was guarded by #if 0 was introduced in the original commit
213d22146d1f ("[PATCH] (1/3) matroxfb for 2.5.3"). And then guarded in the
commit 705e41f82988 ("matroxfb DVI updates: Handle DVI output on G450/G550.
Powerdown unused portions of G450/G550 DAC. Split G450/G550 DAC from older
DAC1064 handling. Modify PLL setting when both CRTCs use same pixel clocks.").

Even without that guard the modern compilers may see that the pixel_vco wasn't
ever used and seems a leftover after some debug or review made 25 years ago.

The g450_mnp2vco() doesn't have any IO and as Jason said doesn't seem to have
any side effects either than some unneeded CPU processing during runtime. I
agree that's unlikely that timeout (or heating up the CPU) has any effect on
the HW (GPU/display) functionality.

So, since the commit 7b987887f97b ("video: fbdev: matroxfb: remove dead code
and set but not used variable") the 'mnp' became unused, but eliminating that
code might have side-effects. The question here is what should we do with mnp?
The easiest way out is just mark it with __maybe_unused which will shut the
compiler up and won't change any possible IO flow.

-- 
With Best Regards,
Andy Shevchenko



