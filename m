Return-Path: <linux-fbdev+bounces-6699-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEaIBYEAvmn1FAMAu9opvQ
	(envelope-from <linux-fbdev+bounces-6699-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 21 Mar 2026 03:20:49 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B962E2E41
	for <lists+linux-fbdev@lfdr.de>; Sat, 21 Mar 2026 03:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA5133030EC8
	for <lists+linux-fbdev@lfdr.de>; Sat, 21 Mar 2026 02:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64992BE05F;
	Sat, 21 Mar 2026 02:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="K1Az0G+I"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4F286415;
	Sat, 21 Mar 2026 02:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774059637; cv=none; b=E2vDZRU5Qy+GrcnyYWMB/sAKkZWiobApKSBWYPix9ofa9vq46YDo5xgYt86hJ14NXm9JEWJQA4sDg//0wp/PF2ABK5Vqa1paNBBlu360Bm3TjWkmNQz2NmqNANDWAKq+VfbhpAOfjPE6nJOb9PrWNzEZlw32SewteJw6uX4tp+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774059637; c=relaxed/simple;
	bh=Qer7XtUdn/hgWhPuvUq0nksSyHMOsuBlGMrQi8nOfj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V8420cD6sHBllowQCvopP6VuhsSMUV4LNzIJ51DqxooKXPD9a5w83SPrtmf71XtcNvDhuoRfuv0I9ilxPewAxaAmYwLuS/Xs0KmQaYXyzqEsqB1TxZn3fdJyiouIJ7XJEBIvQGL0uAILEkFguPxiuwSyQQu6iCd2jPI9DA9+pgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=K1Az0G+I; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=G1QUG9uubtkZKNrUSnV+qD2JajwUNppKtuRnRb8xPNk=;
	b=K1Az0G+IgOYrtU30nfOTWUkGDWXkpj9pDzK4YhV3vJuHVCUyldqiUVgWIb5tlqvpWs8PRxvV9
	M8GsIlbYTDNAO2XhEpyCXEwKxR8krFwI6C2q72udF1VSOErZvxN/HmRwodkDIRyhSQhdlkEWXfE
	csez44twmzDIrzSWnFKruTQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fd30M1db2zRhQf;
	Sat, 21 Mar 2026 10:14:27 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 35EA240569;
	Sat, 21 Mar 2026 10:20:30 +0800 (CST)
Received: from [10.174.179.11] (10.174.179.11) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 10:20:29 +0800
Message-ID: <530b1334-302d-44fb-b180-ddb52cd52115@huawei.com>
Date: Sat, 21 Mar 2026 10:20:28 +0800
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] video: fbdev: matroxfb: Mark variable with
 __maybe_unused to avoid W=1 build break
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Zimmermann
	<tzimmermann@suse.de>, <linux-fbdev@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
CC: Helge Deller <deller@gmx.de>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>
References: <20260320143646.3218199-1-andriy.shevchenko@linux.intel.com>
From: Jason Yan <yanaijie@huawei.com>
In-Reply-To: <20260320143646.3218199-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,gmail.com,google.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_FROM(0.00)[bounces-6699-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yanaijie@huawei.com,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:dkim,huawei.com:email,huawei.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 01B962E2E41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

在 2026/3/20 22:36, Andy Shevchenko 写道:
> Clang is not happy about set but unused variable:
> 
> drivers/video/fbdev/matrox/g450_pll.c:412:18: error: variable 'mnp' set but not used [-Werror,-Wunused-but-set-variable]
>     412 |                                 unsigned int mnp;
>         |                                              ^
> 1 error generated.
> 
> Since the commit 7b987887f97b ("video: fbdev: matroxfb: remove dead code
> and set but not used variable") the 'mnp' became unused, but eliminating
> that code might have side-effects. The question here is what should we do
> with 'mnp'? The easiest way out is just mark it with __maybe_unused which
> will shut the compiler up and won't change any possible IO flow. So does
> this change.
> 
> Fixes: 7b987887f97b ("video: fbdev: matroxfb: remove dead code and set but not used variable")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ---
> Cc: Jason Yan <yanaijie@huawei.com>
> ---
> 
> Below is a dive into the history of the driver.
> 
> The problem was revealed when the #if 0 guarded code along with unused
> pixel_vco variable was removed. That code was introduced in the original
> commit 213d22146d1f ("[PATCH] (1/3) matroxfb for 2.5.3"). And then guarded
> in the commit 705e41f82988 ("matroxfb DVI updates: Handle DVI output on
> G450/G550. Powerdown unused portions of G450/G550 DAC. Split G450/G550 DAC
> from older DAC1064 handling. Modify PLL setting when both CRTCs use same
> pixel clocks.").
> 
> NOTE: The two commits mentioned above pre-date Git era and available in
> history.git repository for archaeological purposes.
> 
> Even without that guard the modern compilers may see that the pixel_vco
> wasn't ever used and seems a leftover after some debug or review made
> 25 years ago.
> 
> The g450_mnp2vco() doesn't have any IO and as Jason said doesn't seem
> to have any side effects either than some unneeded CPU processing during
> runtime. I agree that's unlikely that timeout (or heating up the CPU) has
> any effect on the HW (GPU/display) functionality.
> ---
>   drivers/video/fbdev/matrox/g450_pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/matrox/g450_pll.c b/drivers/video/fbdev/matrox/g450_pll.c
> index e2c1478aa47f..6a08f78cd1ac 100644
> --- a/drivers/video/fbdev/matrox/g450_pll.c
> +++ b/drivers/video/fbdev/matrox/g450_pll.c
> @@ -409,7 +409,7 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
>   		case M_VIDEO_PLL:
>   			{
>   				u_int8_t tmp;
> -				unsigned int mnp;
> +				unsigned int mnp __maybe_unused;
>   				unsigned long flags;
>   
>   				matroxfb_DAC_lock_irqsave(flags);

Reviewed-by: Jason Yan <yanaijie@huawei.com>

