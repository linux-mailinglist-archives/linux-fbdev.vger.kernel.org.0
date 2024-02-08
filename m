Return-Path: <linux-fbdev+bounces-995-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA4F84E79D
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Feb 2024 19:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A5F1C2507C
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Feb 2024 18:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1897A85C7E;
	Thu,  8 Feb 2024 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LX7L9kcQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357A980058;
	Thu,  8 Feb 2024 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707416654; cv=none; b=rXQy6V99qzj4tfdL00W+dlf7E5yV2XXH/GHowmgzjI2H4IW9Kb9nzNkW4AjVUccWEr9aaaLv00Zp9i+A1nBkxcpb9D+LUhlOM9ksSuqAVkxMYaGfWIMBGlVKWfv0gnLnubqK8hkx5frp3tN+zMulwL86lcbXDVQEQT1aESYMI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707416654; c=relaxed/simple;
	bh=Dnkp5+FC8tPkB6sWCfSiExpXBoFHcCY2vvqGUmI/Woc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTtFLuI40k3nNNh8ajJPQmoRXGUA4SAucbLWkYTUe6EHDjRsJPhzph0hSY2Q5MYnwGbcTrrpEOSWdjPA2nus1CGLjsR4FAftl6Z9MVlgv6+/7XncDktzCWumxGflDxv2o/XedIggqW5K4u4t49HZR62On3BU/lhJ0oMkW2EP+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LX7L9kcQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707416653; x=1738952653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Dnkp5+FC8tPkB6sWCfSiExpXBoFHcCY2vvqGUmI/Woc=;
  b=LX7L9kcQEL9NJgaduT2KSucGricy2NkqUEK76Drm8xx5R44+megZZL9M
   0nz93+mbWf06g+zG/cbOROmlp9KISNhAgbCRPDdKRnW5jlpbUYrkUMIXZ
   oD5LetrY/EYujpWHSghbj7HaBtF/0JHoxIVDJyR6TKcNTphfM1kwbBH4G
   N4vcQ3GsZ+t1ntEqVvlIis5w8w5vKw4uhhcUj3UK23EtquMUReR/b+AHU
   6xRJGCru45KG9nb37a84kjKCHUan4t9mPQkWw5y/Py/ZUAPXf5GuyIs7Q
   G0Hna842wbOQn0mBr/3jAAxVN7eWo+iOQYkG0tU6mm1iC4Nht/gmALPTx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1442708"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1442708"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 10:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910462819"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="910462819"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 10:24:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rY94A-00000002wqo-2V3E;
	Thu, 08 Feb 2024 20:24:06 +0200
Date: Thu, 8 Feb 2024 20:24:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <ZcUcRlcQmQG4s42k@smile.fi.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240208113425.GK689448@google.com>
 <ZcUMMyV_vBTNw8Rz@smile.fi.intel.com>
 <20240208173946.GX689448@google.com>
 <ZcUYZRDVmHhKQu9j@smile.fi.intel.com>
 <20240208181455.GA689448@google.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208181455.GA689448@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 08, 2024 at 06:14:55PM +0000, Lee Jones wrote:
> On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > On Thu, Feb 08, 2024 at 05:39:46PM +0000, Lee Jones wrote:
> > > On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > > > On Thu, Feb 08, 2024 at 11:34:25AM +0000, Lee Jones wrote:
> > > > > On Thu, 01 Feb 2024, Andy Shevchenko wrote:

...

> > > > > >   backlight: mp3309c: Utilise temporary variable for struct device
> > > > 
> > > > (1)
> > > > 
> > > > > Set no longer applies.  Please rebase, thanks.
> > > > 
> > > > I got a contradictory messages:
> > > > 1) email that says that all had been applied;
> > > > 2) this email (that tells the complete opposite);
> > > > 3) the repository where the first two were applied.
> > > > 
> > > > While you can amend your scripts, I think I need to rebase only the last patch
> > > 
> > > This is what I assume happened:
> > > 
> > > 1. Attempted to apply the set (as a set)
> > > 2. 2 commits applied cleanly
> > > 3. The final commit conflicted
> > 
> > Which is really strange. I have just applied (with b4) on top of your changes
> > and no complains so far.
> > 
> > $ git am ./v2_20240201_andriy_shevchenko_backlight_mp3309c_allow_to_use_on_non_of_platforms.mbx
> > Applying: backlight: mp3309c: Make use of device properties
> > Applying: backlight: mp3309c: use dev_err_probe() instead of dev_err()
> > Applying: backlight: mp3309c: Utilise temporary variable for struct device
> > 
> > Can you show what b4 tells you about this?
> 
> Fetching patch(es)
> Analyzing 14 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v2 1/3] backlight: mp3309c: Make use of device properties
>     + Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org> (✓ DKIM/linaro.org)
>     + Link: https://lore.kernel.org/r/20240201151537.367218-2-andriy.shevchenko@linux.intel.com
>     + Signed-off-by: Lee Jones <lee@kernel.org>
>   ✓ [PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of dev_err()
>     + Tested-by: Flavio Suligoi <f.suligoi@asem.it> (✗ DKIM/asem.it)
>     + Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org> (✓ DKIM/linaro.org)
>     + Link: https://lore.kernel.org/r/20240201151537.367218-3-andriy.shevchenko@linux.intel.com
>     + Signed-off-by: Lee Jones <lee@kernel.org>
>   ✓ [PATCH v2 3/3] backlight: mp3309c: Utilise temporary variable for struct device
>     + Link: https://lore.kernel.org/r/20240201151537.367218-4-andriy.shevchenko@linux.intel.com
>     + Signed-off-by: Lee Jones <lee@kernel.org>
>   ---
>   ✓ Signed: DKIM/intel.com (From: andriy.shevchenko@linux.intel.com)
> ---
> Total patches: 3
> Prepared a fake commit range for 3-way merge (672ecc5199b5..d507b9f4c5b9)
> ---
>  Link: https://lore.kernel.org/r/20240201151537.367218-1-andriy.shevchenko@linux.intel.com
>  Base: not specified
> 
> Running through checkpatch.pl
> total: 0 errors, 0 warnings, 103 lines checked
> 
> "[PATCH v2 1/3] backlight: mp3309c: Make use of device properties" has no obvious style problems and is ready for submission.
> total: 0 errors, 0 warnings, 41 lines checked
> 
> "[PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of" has no obvious style problems and is ready for submission.
> total: 0 errors, 0 warnings, 81 lines checked
> 
> "[PATCH v2 3/3] backlight: mp3309c: Utilise temporary variable for" has no obvious style problems and is ready for submission.
> 
> Check the results (hit return to continue or Ctrl+c to exit)
> 
> 
> Applying patch(es)
> Applying: backlight: mp3309c: Make use of device properties
> Applying: backlight: mp3309c: use dev_err_probe() instead of dev_err()
> Applying: backlight: mp3309c: Utilise temporary variable for struct device
> Using index info to reconstruct a base tree...
> M	drivers/video/backlight/mp3309c.c
> Checking patch drivers/video/backlight/mp3309c.c...
> Applied patch drivers/video/backlight/mp3309c.c cleanly.
> Falling back to patching base and 3-way merge...
> error: Your local changes to the following files would be overwritten by merge:
> 	drivers/video/backlight/mp3309c.c
> Please commit your changes or stash them before you merge.
> Aborting
> error: Failed to merge in the changes.
> Patch failed at 0003 backlight: mp3309c: Utilise temporary variable for struct device
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".

Thank you!

It seems I have reduced context, so if you do `git am -C2 ...` it should apply.
Never mind, I'll send a new version which should work with -C3.

-- 
With Best Regards,
Andy Shevchenko



