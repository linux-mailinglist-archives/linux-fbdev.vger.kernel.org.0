Return-Path: <linux-fbdev+bounces-7860-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0yS1CPbCTGpHpQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7860-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:12:22 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17C719928
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:12:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=BPldcR3h;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7860-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7860-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 712A33072ADB
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 09:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F9E390229;
	Tue,  7 Jul 2026 09:09:45 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2053905EC;
	Tue,  7 Jul 2026 09:09:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415385; cv=none; b=fR0abTBfjfzZtBDJZeq0W6taqjw7PORDDB8ixUCx1wFyBifl80pBzpi1GJUdVg9ZMaAmb+TXQ2tZL46AeahHYYrKdxGT03uUbfwtfH0TSbBb7wLkjUWhR7l1rnaU7ryzBPcGelq36oo3uIpG1QXy0Kpo/YPMN1w7jz6axtEPljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415385; c=relaxed/simple;
	bh=vPOuVeW5epXD7yeUkWK5wSMWExGXYaQMD3jBKVjlZfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCm8Ca4xiDgGtTE3yPZOOvuXFhCAHq7zqY0Thn3fAr2f+eznkvSgpJKvOXOAGFNhsxYiqi2ZFZgRza53vTd/rGDuD1RvmIwRhEyEusILX7oG9VC0cDlslOn+t42+56txvxArg+yy1f1DXsOonvazt9q1BLRmZOQpgxCWUvEFGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BPldcR3h; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAA51F00A3D;
	Tue,  7 Jul 2026 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783415384;
	bh=j8dyS+0xYby0cnr1vLiqDQ3mkMwebfrFYbyZIetKD5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPldcR3hjVN3fjJLSI5DoUjD61Sy2bGeq25i7hDN/YqzVmwB3xpHnPqdM0i/b6lGn
	 Nq8zDb5LUVfuBcg4oWKKfaB2lDVFhpqeisDl3qZhv/X29lq1Je2RjFGbAMj7C/82ID
	 2lXjDH4npx6V69X/BnBSJPGCehyOX04zUPmXTuSc=
Date: Tue, 7 Jul 2026 11:09:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: error27@gmail.com, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] staging: sm750fb: deduplicate fbinfo loop in
 suspend/resume
Message-ID: <2026070721-trimming-justifier-ec8d@gregkh>
References: <20260525085808.171974-1-ahmet@sezginduran.net>
 <20260525085808.171974-5-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525085808.171974-5-ahmet@sezginduran.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7860-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ahmet@sezginduran.net,m:error27@gmail.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,linuxfoundation.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A17C719928

On Mon, May 25, 2026 at 08:58:08AM +0000, Ahmet Sezgin Duran wrote:
> lynxfb_suspend() and lynxfb_resume() both walk sm750_dev->fbinfo[]
> via duplicated per-index blocks for fbinfo[0] and fbinfo[1].
> 
> Replace each pair of blocks with a for-loop bounded by
> sm750_dev->fb_count, the number of successfully registered
> framebuffers.
> 
> No functional changes intended.

Do you have the hardware to test changes like this?


thanks,

greg k-h

