Return-Path: <linux-fbdev+bounces-7731-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ROJmHHs0PWr0ywgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7731-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 16:00:27 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6216C656A
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 16:00:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="Q/N7acC+";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7731-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7731-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24CFA30172DA
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 14:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0705347BA9;
	Thu, 25 Jun 2026 14:00:01 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AE4326924;
	Thu, 25 Jun 2026 13:59:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396001; cv=none; b=oSSRwH+v1275LnfG9qgD1PppfktWONrApTNhGiEP34K3GWMtbCNRVLZANI6huhSqoE99ESnu9IjbSKL4yT7RpHgq4pCNgSjEMYB2DX+KN5Ez0NOfz7wUfCvY8DGjNK6fklXVAgbCFd7s5GJQtOnlJbe3CYMs8mROY0W70b3jAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396001; c=relaxed/simple;
	bh=H+7DugO4QPsYK+5l9G86Mtbq1kKJwp90ZGLt7miTQJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DubValy6SUpwul66IOpwGJNliFi6XCnVCtgxV+R3QKUUutswSZAVjl1HZsNFHFYIWdwc2ywKhV9LXacwtPMd25/NlLxAoObh6UZx9N8PDKsAdy3jM71m+b+VJz0Ghzn5JWsE2lhJIuPHRiKz1R8PhDyWGo5pPblr6YDekwKvKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/N7acC+; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782396000; x=1813932000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H+7DugO4QPsYK+5l9G86Mtbq1kKJwp90ZGLt7miTQJ4=;
  b=Q/N7acC+WisoU9ttoY3GCP5/+98/NavKoqMGgZyYbRhxHp9IoRAnz9th
   igAkfnHIQkmxK45mFlotMJI0Id5bUNfGPxO0DJuy6NssfCVzHMMpDLDId
   ohl9PmigPJFzH7bWAU83ydcZZl+/wKCPU1JEmimxT39RlOnSQbaANhh81
   dUWuf7kECCnIYogH+XJryHzBdfG7jJW+uy+otRokL5gyiRhQxBP0s4jgk
   ONUP2AHsSORxu+wLJ7uUoIvjjn1LzCDEm/Ci3b1SXve82ybN+vfv3kzUj
   wvhPUu9gEsEOR6g844mgSPLmdIGRe39XtN4l9DRVF3tC/ZKrT6YY+iMnn
   A==;
X-CSE-ConnectionGUID: ZlzdbheYSsyRYcLLN5hw/Q==
X-CSE-MsgGUID: UpIqXBPUQIqKA0yXpQIBLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82156377"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82156377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 06:59:59 -0700
X-CSE-ConnectionGUID: FUXGyTl8SKqiZbGKsj3rlA==
X-CSE-MsgGUID: chE6dVCaSNC1bwlI3PARCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="246351708"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 06:59:57 -0700
Date: Thu, 25 Jun 2026 16:59:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix unaligned vmem writes when txbuf is
 byte-offset
Message-ID: <aj00W8sbiqsYDH7b@ashevche-desk.local>
References: <20260625104220.21E5A1F00A3D@smtp.kernel.org>
 <20260625110237.304435-1-suryasaimadhu369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625110237.304435-1-suryasaimadhu369@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:suryasaimadhu369@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7731-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B6216C656A

On Thu, Jun 25, 2026 at 07:02:37PM +0800, suryasaimadhu wrote:
> fbtft_write_vmem16_bus8() and fb_ra8875's write_vmem16_bus8() offset
> txbuf16 by one byte for a command/start prefix, then store 16-bit pixel
> data via txbuf16[i]. On strict-alignment architectures this can fault
> the same way as the write_reg path fixed in the previous patch.

.write_reg()

Can you provide a real world example of the failure?

> Use put_unaligned() for these stores.

Sounds like a fix without Fixes tag.

> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>

Use your name in accordance with your official documents.

...

> +++ b/drivers/staging/fbtft/fb_ra8875.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>

>  

You should move this blank line to be...

>  #include <linux/gpio/consumer.h>
> +#include <linux/unaligned.h>

...here.

>  #include "fbtft.h"

...

>  #define DRVNAME "fb_ra8875"

Are other drivers also being affected?

...

> +++ b/drivers/staging/fbtft/fbtft-bus.c

Also needs linux/unaligned.h.

> +			put_unaligned(cpu_to_be16(vmem16[i]), &txbuf16[i]);

-- 
With Best Regards,
Andy Shevchenko



