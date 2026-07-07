Return-Path: <linux-fbdev+bounces-7862-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LFv3EHDETGqcpQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7862-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:18:40 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B4719A22
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:18:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=MDSmu+Ps;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7862-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7862-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A08230BFAF2
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 09:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56BB3905EC;
	Tue,  7 Jul 2026 09:13:18 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869893914ED;
	Tue,  7 Jul 2026 09:13:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415598; cv=none; b=LbceigZ0bL5+F9U/qceJS2ep0Qzs9GtKry6KiWtBJj7zmb0pq6XDGyxGxHGsAy3JFgNAen5KqEdBXsW+DQC4eDIE3MYjggtAR4NpXoc15mf7UXYkUMtZ/Q6550upC0ddiclNaNJb3pvDXO0QlXdqy9YnYIEeQHg+Gzu12bGkIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415598; c=relaxed/simple;
	bh=wyOdB9KbOxmtWx3A7FEKhU4nEKKqXjuWLFR2iciPMTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms6iFo5RcluC9mXdFG5RSKuo5Nd0xtDH3wK/+x4WVuOdY9UOQaoipxscVva1ovTPMdE2VeoORD3poFBXI2FxJbYS3H1MgiZkjr+kbFyzdhh7roFCaUnWEnre85dcJ9LpmUWxU+JpSCLnNRTNb68Msv/WNqWjXqs/vVg24ydxVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MDSmu+Ps; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC7D1F000E9;
	Tue,  7 Jul 2026 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783415597;
	bh=6smUS6s6HWwUwjxx51MxkZYCbfe6mmOxZoJeGBmIFPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MDSmu+PsXxeAlxDjrodZV54Ve4T+o6oVP3qPZEiJnwa/P/QOWMIrE61/4Z6Bv3ZSi
	 XAVuu+AcexML8Pu0bSXXQSyYBytI1LpmmOkekT+Ond2IT+Hhg6FCu8oYs43uEykH/L
	 yn9wEmEOB7tAUotPhMc6m2xd2AFmyPBpqF5sprws=
Date: Tue, 7 Jul 2026 11:13:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Noah Adkins <noahcadkins@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	"open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: sm750fb: convert camelCase parameters to
 snake_case
Message-ID: <2026070710-amusing-gecko-a39f@gregkh>
References: <20260615012837.90113-2-noahcadkins@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615012837.90113-2-noahcadkins@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:noahcadkins@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7862-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gregkh:mid,linuxfoundation.org:from_mime,linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F26B4719A22

On Sun, Jun 14, 2026 at 09:28:38PM -0400, Noah Adkins wrote:
> Convert the camelCase parameters in the 2D acceleration helper
> prototypes to snake_case to conform to the kernel coding style
> and to make them consistent with the parameter names in the
> corresponding implementations.

But they don't seem to match up with what the .c file says, right?  Why
not?

For example:

>  int sm750_hw_copyarea(struct lynx_accel *accel,
> -		      unsigned int sBase, unsigned int sPitch,
> +		      unsigned int source_base, unsigned int source_pitch,
>  		      unsigned int sx, unsigned int sy,
> -		      unsigned int dBase, unsigned int dPitch,
> +		      unsigned int d_base, unsigned int d_pitch,

"d_base" is "dest_base" in the .c file.

Same for some other variables.

thanks,

greg k-h

