Return-Path: <linux-fbdev+bounces-7557-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cnZWBl6wJ2p20gIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7557-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 08:19:10 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7326365CADD
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 08:19:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sezginduran.net header.s=mail header.b=JvGLMXZz;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7557-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7557-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 056B1309600D
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2026 06:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E103E3D1CC5;
	Tue,  9 Jun 2026 06:18:18 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD33D45C5;
	Tue,  9 Jun 2026 06:18:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985898; cv=none; b=CkyN4wtias1JygD+gxHI9/5G0HbStMMaXDiDmk+1Xw2ybA8HcIDX3A3Labl4g+N0g/+Xc/8OaURDomdCCCTE3KsV9Ts4uz85hTGOrjmemgK2WiEWaQdjAXm5P6RlH0QDKvPi2oa24MGy6S9pnOu+kYB+dqVnIYMT14YqQi3bgjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985898; c=relaxed/simple;
	bh=W9iANnASxu5epzdwEbAbG81T5EqEFeRsaZ2wQcgU2nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVUq8qGeARnL0ubMFDrtipDnVS/gahX0WVORXgY9MAgovTKDCjBB4NLl/Dxq6UMqm7A0ck/df+nIC2VzbYkxos470x/9b1x5o74zwoIn03kcQoxPUjyruKCo8/w4alya6cnR0fixRBTGvZmpOu4G+xz/5d+EGYsEM1jxVW8IvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=JvGLMXZz; arc=none smtp.client-ip=178.154.239.209
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:83a9:0:640:50fd:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 2425E81C93;
	Tue, 09 Jun 2026 09:12:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp) with ESMTPSA id TCCKNV5f3iE0-frI18scF;
	Tue, 09 Jun 2026 09:12:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1780985554;
	bh=1sgyk1K/ydvf0SyTNuuqeJvbfhlb/LHfb2YU3RO5j6s=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=JvGLMXZzO2DZWfkTNFE/YP62Ne8qv3iD2sGsOsaZn2h9MqS04QnBZj9WkXQnN3E9I
	 p8dG8FfZuW7V5VQOawUepr4dCE3AOA/m9AzKcu6WhiEo8oc2CDk2HN69SVpk8gsYjL
	 1k0M8FGAHRSs0+Jmoo0g+OXFLlZ14982mpIjGQqE=
Message-ID: <0d8d9f38-3cce-4da2-9ba8-f8e99f7b4dee@sezginduran.net>
Date: Tue, 9 Jun 2026 09:12:29 +0300
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array const
Content-Language: tr
To: Brock Haftner <brockhaftner@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260609011736.17401-1-brockhaftner@gmail.com>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260609011736.17401-1-brockhaftner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7557-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brockhaftner@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:gregkh@linuxfoundation.org,m:outreachy@lists.linux.dev,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sezginduran.net];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sezginduran.net:dkim,sezginduran.net:mid,sezginduran.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7326365CADD

On 6/9/26 4:17 AM, Brock Haftner wrote:
> The g_fbmode array is a static array of constant strings, but the pointer
> array itself is not marked as const. Fix the checkpatch.pl warning by
> adding the const modifier to the array declaration.
> 
> Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 89c811e0806c..8f533f3b1b42 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -21,7 +21,7 @@
>   static int g_hwcursor = 1;
>   static int g_noaccel __ro_after_init;
>   static int g_nomtrr __ro_after_init;
> -static const char *g_fbmode[] = {NULL, NULL};
> +static const char * const g_fbmode[] = {NULL, NULL};
>   static const char *g_def_fbmode = "1024x768-32@60";
>   static char *g_settings;
>   static int g_dualview __ro_after_init;

Did you compile this patch while enabling sm750fb driver in the config?

Regards,
Ahmet Sezgin Duran

