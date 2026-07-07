Return-Path: <linux-fbdev+bounces-7871-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Vr6AJXzTGrxsQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7871-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 14:39:49 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4588D71B6FD
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 14:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sezginduran.net header.s=mail header.b=TOUwgg9O;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7871-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7871-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 133F4314BF3B
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 12:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43BF412281;
	Tue,  7 Jul 2026 12:27:51 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491340A93F;
	Tue,  7 Jul 2026 12:27:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427271; cv=none; b=Os6Q3ycwH+3zA+DyeTvQuU2CL/T8zXWvK+jwf/xVzT8YHOaqYFmNKfU/ozAAms5Tn+rDn5RNs8TuwRSo13cUgJAQkBmmADbwX4AXpau6N5tKAu5dc2cHdfiW0QKhFhk7l7Ok8l3MCRk8+7ndAPnIIHB9g+QmzNs9ggqziRlaj+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427271; c=relaxed/simple;
	bh=SYyRAZZ81AweDLWe5IkLWoMsXAsVwrAoV2TJbX6rLBU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TMntBtX8TtMaOKRBbvUxBwwYEpkYdoYuWDfWof1XBKUWOIRlGy8sT7T6Aawdv7NzmesM/7S5aKmeC3tdJGgnqeD5Vz2ixK58bh/eGRaAAvggnB97zwTNEQlbYK8WacfLneM/+oAO4afVgb/BzMEZf5BjT8fqYWJylGIZFyOGkcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=TOUwgg9O; arc=none smtp.client-ip=178.154.239.144
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:1199:0:640:2d84:0])
	by forward500b.mail.yandex.net (postfix) with ESMTPS id EA5CCC0D9A;
	Tue, 07 Jul 2026 15:27:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp) with ESMTPSA id iRH6ew7gQGk0-xAqaF9Jv;
	Tue, 07 Jul 2026 15:27:46 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1783427266;
	bh=jFICI/XmROnTIS7/SGbPk48OLtw960wDLSn7xgwyTcM=;
	h=In-Reply-To:Cc:Date:References:To:Subject:From:Message-ID;
	b=TOUwgg9O0H9IqAd3gQMQmJUlhn07Yq1goTtNnqbVgOV0J52PeXm5atVN9fOtmiiMv
	 TYOIX4ZoC08LztKiFoff8JNGDUwZRVFLa0ya1h9yqzGDBdj+c4FV00WfObpckCUsKx
	 uMobaHyZ6hvmtERXADec++SSWJ4MtKV0zSd0aG4M=
Message-ID: <dec681d9-a33d-48a1-a3b5-8e4d8679457d@sezginduran.net>
Date: Tue, 7 Jul 2026 15:27:43 +0300
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: Re: [PATCH v3 4/4] staging: sm750fb: deduplicate fbinfo loop in
 suspend/resume
To: Greg KH <gregkh@linuxfoundation.org>
Cc: error27@gmail.com, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260525085808.171974-1-ahmet@sezginduran.net>
 <20260525085808.171974-5-ahmet@sezginduran.net>
 <2026070721-trimming-justifier-ec8d@gregkh>
 <d3541f6b-0541-4986-b75f-ba19d2ce44f6@sezginduran.net>
Content-Language: tr
In-Reply-To: <d3541f6b-0541-4986-b75f-ba19d2ce44f6@sezginduran.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7871-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sezginduran.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sezginduran.net:from_mime,sezginduran.net:dkim,sezginduran.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4588D71B6FD

On 7/7/26 2:49 PM, Ahmet Sezgin Duran wrote:
> 
> Though, I should mention that compiled object file (sm750.o) is 
> identical in my dev machine, sha256sum matches.
> 

I made a mistake there. Those functions are omitted by the compiler, 
when CONFIG_PM_SLEEP is not enabled. That's why object file was identical.

When config is enabled, object file changes, before and after the patch.

Regards,
Ahmet Sezgin Duran

