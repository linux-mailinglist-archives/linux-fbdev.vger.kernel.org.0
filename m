Return-Path: <linux-fbdev+bounces-7719-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pmzNM8vZPGpLtQgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7719-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 09:33:31 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C166C362D
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 09:33:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sezginduran.net header.s=mail header.b=E3Fc+ueP;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7719-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7719-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B28B8302A507
	for <lists+linux-fbdev@lfdr.de>; Thu, 25 Jun 2026 07:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB6837BE60;
	Thu, 25 Jun 2026 07:33:29 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBDB21CA03;
	Thu, 25 Jun 2026 07:33:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372808; cv=none; b=p1a70iJWHD6JNOkjf3CXzDi+yfciFUVPlK8+HNdL6i0t9n2U0BNn78uEygDJxJfroF3gKKiH/MTsn0bZsIDr1bEt7Myf35r4X2fOW/BthQ570cMIeCVeQk99dEwXWzoM4dAuACcm+4+RTgTopVme14f4h7Wmf4qzQNsMr5j9or4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372808; c=relaxed/simple;
	bh=7IgP7fc0V3lY8nZieNuPz5s4BL2J6d7Wwjo3NAKVCuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1XnFy1bapP+F16cYn97VA23z3zKW72nEuXJjhnpJ5C1rmO2bP3aRtzKsnqYLziusGje0cQdxkpCkRBbOEUjGZM5q2N0UCOuw+mNKemWXwOuE4XW1p/95z7yRJz9DVG3bTWyrXHpKyP7nL/s+v1TKZocGV2hf18iH3/0NsaMpRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=E3Fc+ueP; arc=none smtp.client-ip=178.154.239.145
Received: from mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:b47:0:640:7767:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id D183B8134D;
	Thu, 25 Jun 2026 10:28:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (smtp) with ESMTPSA id xRTKoOEc8W20-dO1PEhxt;
	Thu, 25 Jun 2026 10:28:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1782372484;
	bh=MQMLxer7QaV+BZHIhaopGIzLs/HygD8v8hGoIgk99tA=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=E3Fc+uePnMMASiY73AkEUVRBGVs1wC01N1LtlJFsi1abr+pUyZBn8DE3eCwZcrZFH
	 vYAJg8x8lLWYJR7ybssLSaFxnIiD2Dr7eiwFYTgOMEw37sHE0/TDd6AQkQ3UwtJba/
	 5LRpNJiFqZEVoK+VkrrsQUuZWu31I2+ey216U+SQ=
Message-ID: <f5be5a78-a649-447c-8145-b32a530194c2@sezginduran.net>
Date: Thu, 25 Jun 2026 10:27:59 +0300
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: fix const pointer declaration
To: suryasaimadhu <suryasaimadhu369@gmail.com>, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260625071348.132880-1-suryasaimadhu369@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260625071348.132880-1-suryasaimadhu369@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7719-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suryasaimadhu369@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sezginduran.net];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com];
	FORGED_SENDER(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10C166C362D

On 6/25/26 10:13 AM, suryasaimadhu wrote:
> Make g_fbmode a constant pointer array by adding const qualifier
> after the asterisk, as recommended by checkpatch.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 89c811e08..8f533f3b1 100644
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

Did you compile this patch while sm750fb module is enabled?

Regards,
Ahmet Sezgin Duran

