Return-Path: <linux-fbdev+bounces-7858-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6u07IlLCTGoYpQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7858-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:09:38 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF4719893
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Xm2wKfnj;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7858-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7858-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51D30303DC65
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 09:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1666A38F927;
	Tue,  7 Jul 2026 09:08:28 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034CB331A5B;
	Tue,  7 Jul 2026 09:08:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415308; cv=none; b=u2tzN76RNZGqGsxeDQ6Xr3g6eLPwG0iUUPEyod2xOE6UrakX5qcfRacXtxheQ3hgpo93mQ4CIUqVxJy0ecYp8xhI3NnO3arjh8C577+tft99p3q4iQR7X3k7Foharw2Ok20lPM5J1b3Pj+x9HbAJcJSG62ZiKo5SjtllGfvRDHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415308; c=relaxed/simple;
	bh=zlhtgNkVnWqwGdtNZ6NiYL3PwfGWarfzXXU1qtH1JQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVZqSmmwg6EDq7covNtAvTPapcdlh6tNvRZttt1e4VS5VJKP5NLDgAzgBrG9r/LnnYLQA1CIvWrWKcRl4AHsQcvTWJSMAkwYEvF6ErlnE23vXBWd1WLGd6/Jsb5Z8cHMnPxIf5GXENgznqJZ41DGciFIoql4zjRMAg6CdOrq72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xm2wKfnj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E291F000E9;
	Tue,  7 Jul 2026 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783415306;
	bh=FKzvUY0CEml5/qgLfDuQEA4KzMAzFatcf8H2zjBdtHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xm2wKfnjx38h+PRMWdDWA1OqB5w8Vl0ybrZcHbIXh9ogyI3C9ap0bJIcaXB6EqXqv
	 wOJHDXmGbtbfiSJI9cEEKJYAsSUqOhH+bl9art3e8fq4MszOi3Z7F8im4pP6cbFDTc
	 S7PQsT1q05soAxOiNHuzLxhD5vL34Jc8t0cCBeBI=
Date: Tue, 7 Jul 2026 11:08:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michail Tatas <michail.tatas@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: sm750fb: rename pvReg to pv_reg
Message-ID: <2026070759-registrar-kilometer-f8ff@gregkh>
References: <cover.1779661132.git.michail.tatas@gmail.com>
 <fae018f80f61acea030d9893f3085998a78e4edf.1779661132.git.michail.tatas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fae018f80f61acea030d9893f3085998a78e4edf.1779661132.git.michail.tatas@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michail.tatas@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:michailtatas@gmail.com,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7858-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gregkh:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linuxfoundation.org:from_mime,linuxfoundation.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3CF4719893

On Mon, May 25, 2026 at 02:15:38AM +0300, Michail Tatas wrote:
> Rename variable pvReg to pv_reg as per
> the Linux coding standards

But "pv_reg" is not a correct name, right?  It's still in "hungarian"
notataion, which is not what we use in the kernel.

thanks,

greg k-h

