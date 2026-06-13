Return-Path: <linux-fbdev+bounces-7613-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H5v5OEWXLWojhwQAu9opvQ
	(envelope-from <linux-fbdev+bounces-7613-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 13 Jun 2026 19:45:41 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0DA67F375
	for <lists+linux-fbdev@lfdr.de>; Sat, 13 Jun 2026 19:45:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sezginduran.net header.s=mail header.b=pxwvqvHO;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7613-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7613-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC6E03004905
	for <lists+linux-fbdev@lfdr.de>; Sat, 13 Jun 2026 17:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A2A282F1D;
	Sat, 13 Jun 2026 17:45:39 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7F29CE9;
	Sat, 13 Jun 2026 17:45:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372739; cv=none; b=ZOfVRy7cvwelFx/wpjCHTtCBBI+zs+wdg69brf4ZbyTZkaXNJR6A7yX6PsAHSDhCSwRmOG/gaD6YVzyMRHk/aRRZXW1hgkdAZZ9HW4THNs6ogFI1QidFMuAVA1/dIm+tDYvL3wJguUWl/lp0bCvNRbBzcBZIf8w289bsYucYc0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372739; c=relaxed/simple;
	bh=TvnnW06JGcrF1SfQEvkStW2pliDn8/LYo+PgJjhxbP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuiuePta439BYCrW0yp+xnaY/h4W3g/VnDmuLCbCeHerTwuFEbfEQO8bFBKofcdU+rBHNWLY12r5hh5BOwcYWE4hc2Sc6yqkLkwQ/qWzOgzRdfCHcGVBVAH/bKtbbAcxs88sp5nHXvxMOpmlakKQMeF64oYHb4RqXuwG83xolNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=pxwvqvHO; arc=none smtp.client-ip=178.154.239.210
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea2:0:640:ef77:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id 6B030C0AC8;
	Sat, 13 Jun 2026 20:38:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp) with ESMTPSA id DcRO1N1gAGk0-7bm0DuO2;
	Sat, 13 Jun 2026 20:38:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1781372299;
	bh=lOYfOjCx6O24LbWWPmXI0HRXGZ7a4GPCTAirV6MR0LQ=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=pxwvqvHOgUIxqgMwl0i8Sm7Uu9d1BwNb2KLrWD666m7bmGwf+kIunq6gL0J2Clacf
	 tJBcvgSEMxQTyM+nJl2bims6An6Av1HCR9K1FdO3D8lpqZRpuCtLV2PotAgRyrhMf1
	 F8qAu69qGgHHxOcwMEJFSgCfjaY/kPlKClSRDY9M=
Message-ID: <d3b705ca-9eb2-4464-8dea-d9cdbe8f050d@sezginduran.net>
Date: Sat, 13 Jun 2026 20:38:13 +0300
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: fix const pointer array declaration
To: Jack Lee <skunkolee@gmail.com>, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260612220646.61461-1-skunkolee@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260612220646.61461-1-skunkolee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7613-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:skunkolee@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sezginduran.net];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C0DA67F375

On 6/13/26 1:06 AM, Jack Lee wrote:
> g_fbmode should be declared as static const char * const to prevent
> modification of the array pointer itself.
> 
> Signed-off-by: Jack Lee <skunkolee@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 9f3e3d37e82a..19c3da654a43 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,7 +33,7 @@
>   static int g_hwcursor = 1;
>   static int g_noaccel;
>   static int g_nomtrr;
> -static const char *g_fbmode[] = {NULL, NULL};
> +static const char * const g_fbmode[] = {NULL, NULL};
>   static const char *g_def_fbmode = "1024x768-32@60";
>   static char *g_settings;
>   static int g_dualview;

Did you compile this patch while sm750fb driver is enabled?

Regards,
Ahmet Sezgin Duran

