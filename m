Return-Path: <linux-fbdev+bounces-7894-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H0JKBLo8Tmr/JQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7894-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 08 Jul 2026 14:04:10 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB2D7261E8
	for <lists+linux-fbdev@lfdr.de>; Wed, 08 Jul 2026 14:04:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ygwpvJPm;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7894-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7894-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 235F83012EAE
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Jul 2026 12:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B26C3FFFA4;
	Wed,  8 Jul 2026 12:01:04 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F624BBFD;
	Wed,  8 Jul 2026 12:01:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512064; cv=none; b=fN0yf0umFWmwwS+Jznq/CsxY3Mqq2U3vBvUFp6rZT5nNlx7nkZnk/FzRn14iefofgHEDG12MlCeboX8a6nDiGbPRee72DzK8LP/lXtb2HBImmUhFDUXfUaoMYodshopFXnv7LNw9gXNk8mbSFzQTHx6qi0y2FStBfzAJqCP1Fgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512064; c=relaxed/simple;
	bh=Jtyz5mdtM3RdujAuDQH9BG+O8ipXDm6TjpRPi1dkua8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnNY1o0L91njgRE29T4W8e9w2iowUJzONGeX9O9aNPkt6wiMV32KZ0WhNwoSTOBd1lO3zsKrYwCt+nxzCJFP0H0p5UKNVyjPmfNJMlYmI5/oAvknIa1qD1MgR/G/rUI3Ugj+OzZtaqT6/0P/Lns8XX92AnKoR6pvuQTXy1Itx4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ygwpvJPm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8981F000E9;
	Wed,  8 Jul 2026 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783512062;
	bh=9p863L7he4lt5AW5SKjC2DMMvuDWQSHTHf5Po/24QRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ygwpvJPmgyQYEPywd1eG2GuHjo3Z2x9SpG70XgkkgLYg8lDse9UQvsIi4JqcuPWOF
	 /AhYaRxyPqB2tAOTl+T6Ev7fRfXo2SyoqRMNQiSSGeF95yIX9+TOih/VF88hvubKpp
	 /5BtsqQ74kZtNhqhtDxIoEXb2zYtCCvK9QJjEqB8=
Date: Wed, 8 Jul 2026 13:59:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: sm750fb: Remove unused variable
 'setAllEngOff'
Message-ID: <2026070828-arrange-degrading-a2ed@gregkh>
References: <2026070710-exact-unveiling-e321@gregkh>
 <20260708060307.12237-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708060307.12237-1-andrem.33333@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrem.33333@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem33333@gmail.com,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7894-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gregkh:mid,vger.kernel.org:from_smtp,linuxfoundation.org:from_mime,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AB2D7261E8

On Wed, Jul 08, 2026 at 03:03:07AM -0300, André Moreira wrote:
> The variable 'setAllEngOff' within the 'init_status' struct is only
> set to zero during setup but its value is never read anywhere else
> in the driver. Remove it entirely to clean up the code.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
> v6:
>   - Change patch approach from renaming CamelCase to entirely removing
>     the unused 'setAllEngOff' variable, based on Greg KH's feedback.

This doesn't apply to my tree at all.  Can you rebase against the
staging-testing branch and resend?

thanks,

greg k-h

