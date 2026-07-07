Return-Path: <linux-fbdev+bounces-7863-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XXJLFxTJTGr5pgEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7863-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:38:28 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B13719E16
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ZQ80bHMs;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7863-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7863-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABA9E317DE2D
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4573C1F3A;
	Tue,  7 Jul 2026 09:23:02 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE793955F5;
	Tue,  7 Jul 2026 09:23:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416182; cv=none; b=ELScWI0ArKCQ1PzP4Mx04DFSqmQQqQ5UA6vD3QkxhA57CHR/d3v18mK85NmEyTo6EOSmWcjRtPaHubuiPMHESLJA1kh85gJXGdT2Le8FUOhs2JUQDhjoEMyGzXpYsqYwaNEy9rUP/4ZAgXMIFcfxsVN26QZkidndYg7e0KebH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416182; c=relaxed/simple;
	bh=zt22E1LX9kmkVm98NsMh/8f8xBREn/n7nY8DsZn/VB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMXj8lqyD/iBlKTzM9eyA6AKzK58MqWXCf2yCkrvY9C2pYFqa06KDFP5exKfLGDIpoOc8EyOGV7V7xKj/C6eo7OUOEoAJSzPjedunS0/d/isQVe7e+lj+q3xlHmrr+Gt9bNhmAOJMPzjS+7jVq+Ye8+BfIMNerRPVNFY5xL/qTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZQ80bHMs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BBE1F000E9;
	Tue,  7 Jul 2026 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783416180;
	bh=UaQwlQnyCdvbuPHBNAIA3OiyxH9sx25jbkvaRh2ZHk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZQ80bHMsCyg2muDZI/f5f3lWDTOQarmhBBYNYcWNWGkgQpA2MnsDVscSOO+/VxBNI
	 Kq35GnqvQI3fMN837+PxAKRnvaJefGuicPbN/ZRmDe8SNb6PwAcyRPw7Ynd1AuP8fl
	 ZL1CWcZkNR7ETjaE9sU5PROwnjXnL+SiKtuMaw+U=
Date: Tue, 7 Jul 2026 11:22:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Keefe Reeves <reeveskeefe@gmail.com>
Cc: andy@kernel.org, abdun.nihaal@gmail.com, error27@gmail.com,
	chintanlike@gmail.com, namcao@linutronix.de,
	niejianglei2021@163.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: use %pe for backlight errors
Message-ID: <2026070747-skype-exit-5962@gregkh>
References: <20260614201551.20542-1-reeveskeefe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614201551.20542-1-reeveskeefe@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7863-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:reeveskeefe@gmail.com,m:andy@kernel.org,m:abdun.nihaal@gmail.com,m:error27@gmail.com,m:chintanlike@gmail.com,m:namcao@linutronix.de,m:niejianglei2021@163.com,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdunnihaal@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,163.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gregkh:mid,linuxfoundation.org:from_mime,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3B13719E16

On Sun, Jun 14, 2026 at 05:15:51PM -0300, Keefe Reeves wrote:
> Coccinelle found two places where backlight registration errors are
> printed by passing PTR_ERR() to dev_err().
> 
> Use %pe instead so the error pointer can be printed directly. This keeps
> the behavior the same and just makes the error printing cleaner.
> 
> Signed-off-by: Keefe Reeves <reeveskeefe@gmail.com>
> ---
> Changes in v2:
> - Use reachable Gmail address for author and Signed-off-by.

Does not apply to my tree :(

