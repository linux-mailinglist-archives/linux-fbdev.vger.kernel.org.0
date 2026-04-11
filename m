Return-Path: <linux-fbdev+bounces-6923-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFBxEshy2mln2ggAu9opvQ
	(envelope-from <linux-fbdev+bounces-6923-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Apr 2026 18:11:52 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D403E0C27
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Apr 2026 18:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F903011C60
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Apr 2026 16:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F563A75BB;
	Sat, 11 Apr 2026 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c8OIozop"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7272D2488;
	Sat, 11 Apr 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775923909; cv=none; b=Xue/weAODyUoYzNApoDTSUmQ74LwG138OxXdrnmWa9HuNR43Q5FwpqXE8vQnHVWzangrYq+JUFiwl9M53C0p5RZg15Y/CnGIxd2xnxSjn6ykknUr70nsrgv2x4d1rW1TmzuGvw5wzz44kJntu9z1eqc34yfFCvBIrahpMhNikYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775923909; c=relaxed/simple;
	bh=1DPOozjF3PkSt8DaiDKpW7A2kEoqNIhWphiiXCSIYXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdBoXaPSXjJSn/DS0HxXmrBL5OURFtYG+cgFpA55Y3rhDBaRIyn250vQOPXc1VIX0LrSe/K2WJL4pEly1y3/JbOdhPAx6rZuLcySmxkK+VupqogZWqcL5IP8XsiZN5hb38arJTQZCB2+Ua+4YTpDstnuvKqyrRxxo9HaAicn7K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c8OIozop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAAFC4CEF7;
	Sat, 11 Apr 2026 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775923908;
	bh=1DPOozjF3PkSt8DaiDKpW7A2kEoqNIhWphiiXCSIYXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8OIozopHkeJ98qDQjw3doukz2qiCoV9BoR39Z3BYGewhnZub3n7r317UMaKNZryw
	 kkIh0/ewWAEFD5SROVi0zXEbhBTuSjGHUb1DjtwVnTVQKCe+zMgwoRqwkKOplrmR6D
	 cr2CUn1/Q8i1IEF4kyU+RpdqnES9EAemnIvNL0Sc=
Date: Sat, 11 Apr 2026 18:11:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chandra Mouli Baskaran <bcmouli2006@gmail.com>
Cc: andy@kernel.org, linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: improve TODO comment clarity
Message-ID: <2026041127-cabbie-sandbag-48f5@gregkh>
References: <20260411152220.89174-1-bcmouli2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411152220.89174-1-bcmouli2006@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6923-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3D403E0C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 08:52:20PM +0530, Chandra Mouli Baskaran wrote:
> From: Chandra Mouli <bcmouli2006@gmail.com>
> 
> Clarify the TODO comment in fbtft_ops_damage_range() to
> better describe that the current implementation updates
> the entire displayinstead of only the modified region.

That does not match what this patch actually does :(


