Return-Path: <linux-fbdev+bounces-7869-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mPPBMRfpTGrMrwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7869-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 13:55:03 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA0671B219
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 13:55:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sezginduran.net header.s=mail header.b=fVO36lyy;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7869-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7869-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3E9C30D7446
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 11:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8452D3FBB50;
	Tue,  7 Jul 2026 11:49:53 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B4D3F88BA;
	Tue,  7 Jul 2026 11:49:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424993; cv=none; b=JgRUDJnBXqbqumm3eDF1CSP4HeH7dVX72iuFdpylPpimh8ec9C1A0gdbMIkWHuIhQtbBhwfGzRatx8lOUgYMAlAf9Za/E94ByxNC/QD+U3R/XBCh5fFtkcOC96FamVvQlRVXgGcGfj5nJN12Z7EWdRDqYNV0ZUluQlGener/vdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424993; c=relaxed/simple;
	bh=EdWoJK+myyXhYeBz+JSplxQPpYX1RmQ1R7YXxRWW9CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fplf+w8tQ9WMZxd827S/OzYm42PgbR1eF+bkwXl3hfpqXdT/X6Jh5f5knJK9zkWsp/+lBRMRQm6X7D/28ZK5rVOmoRDmWjokk3qc8GMw3elTEoOsCbS5g4hRc2ZN7p+ERX9IUUZNDoEZXfNTZdRoxFKurLa6RnkvCJ4pH8wezM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=fVO36lyy; arc=none smtp.client-ip=178.154.239.144
Received: from mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:1791:0:640:6f9:0])
	by forward500b.mail.yandex.net (postfix) with ESMTPS id 211D1C0E08;
	Tue, 07 Jul 2026 14:49:47 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net (smtp) with ESMTPSA id hnGLCr7dV8c0-P8akZTpm;
	Tue, 07 Jul 2026 14:49:46 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1783424986;
	bh=EbE5yCSgtrnpNezBi+iqi0fybLsCo/FMk+TcNxgBIxE=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=fVO36lyyDTXZbpud/MzfLUvRTCEf7kVxp0CiqiKSPlqa/+G5elWIyNEt0Y+jeoYUJ
	 ecp7aIm+T7oSTfTRz18CWpwq+92zIzPdr4xtd1Ntgz7b5JpDb4c3QtgAQO6m/vZloP
	 buwe5P8+omKGpeylbfXsmlhYLnNs0ZbeMdAvrGVc=
Message-ID: <d3541f6b-0541-4986-b75f-ba19d2ce44f6@sezginduran.net>
Date: Tue, 7 Jul 2026 14:49:43 +0300
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] staging: sm750fb: deduplicate fbinfo loop in
 suspend/resume
To: Greg KH <gregkh@linuxfoundation.org>
Cc: error27@gmail.com, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260525085808.171974-1-ahmet@sezginduran.net>
 <20260525085808.171974-5-ahmet@sezginduran.net>
 <2026070721-trimming-justifier-ec8d@gregkh>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <2026070721-trimming-justifier-ec8d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7869-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sezginduran.net:from_mime,sezginduran.net:dkim,sezginduran.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AA0671B219

On 7/7/26 12:09 PM, Greg KH wrote:
> On Mon, May 25, 2026 at 08:58:08AM +0000, Ahmet Sezgin Duran wrote:
>> lynxfb_suspend() and lynxfb_resume() both walk sm750_dev->fbinfo[]
>> via duplicated per-index blocks for fbinfo[0] and fbinfo[1].
>>
>> Replace each pair of blocks with a for-loop bounded by
>> sm750_dev->fb_count, the number of successfully registered
>> framebuffers.
>>
>> No functional changes intended.
> 
> Do you have the hardware to test changes like this?
> 
> 
> thanks,
> 
> greg k-h
No, I don't have the hardware. Just compile tested.

Though, I should mention that compiled object file (sm750.o) is 
identical in my dev machine, sha256sum matches.

Regards,
Ahmet Sezgin Duran

