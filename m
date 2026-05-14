Return-Path: <linux-fbdev+bounces-7240-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDq0LDq2BWpZaAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7240-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 13:47:06 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE3541325
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 13:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93AD3045DDA
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 11:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3140C3C2B8F;
	Thu, 14 May 2026 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s6E1+9F+"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CB3C2797;
	Thu, 14 May 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759083; cv=none; b=jRNusAZuYX5BENxXJSI4kyCbsToJJJoFXDDleTJqOqx56aPQ/JIsikPoAu5ifrnsk5vUHas5Cu+Uo7m3h3tsLFXP395mWOd0te5fiLIafeAaj63oiuEAAaNW5JkRgSmydUZhWvlJQ6K084hILBmzCwg8o5wTta1fDuO6o0cLhYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759083; c=relaxed/simple;
	bh=CcXestgFm3BIUMs1eN088Hh3mP9VlPacV7qqGhr3unc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGQERt38HqiqnO9YTH0B154fVihEQCcyWLiaDwG8rh0wFpVrwuyHPku9b2q5mvk96LdpVdwy9Ehg3iP6wOl2UUBVuNYPzCtKFsjiZmqJk33B9MhQJsgTFzWCd0qWm9QPYAjrR83gzrKG4D95djR4MD3egP7BL4gA7XCuMe4TTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s6E1+9F+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD86C2BCB3;
	Thu, 14 May 2026 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778759082;
	bh=CcXestgFm3BIUMs1eN088Hh3mP9VlPacV7qqGhr3unc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6E1+9F+JjP6MEJyPmEkzyPxxH0UjG+CTuRbny803v3TQ9f8bffNlfYPa/fRoLhsZ
	 Clyf13o29zQl9zmS7hj/hlW6xFnC+Ep9OieGBxpkJhOFPb6NImVEvpQWL1UkYDXPRJ
	 gcOTPDdjcnyztMHyupG+f+g49Ei7PhNqtOfnk/Vk=
Date: Thu, 14 May 2026 13:44:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Add suspend checks to copyarea and
 imageblit
Message-ID: <2026051415-vineyard-antihero-ee6f@gregkh>
References: <20260514104924.60296-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514104924.60296-1-yogeshdangal66@gmail.com>
X-Rspamd-Queue-Id: 3BFE3541325
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7240-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 04:34:24PM +0545, Chhabilal Dangal wrote:
> lynxfb_ops_fillrect() already checks info->state before accessing
> the hardware 2D engine, but lynxfb_ops_copyarea() and
> lynxfb_ops_imageblit() do not.
> 
> The suspend path calls fb_set_suspend(), which sets the framebuffer
> state to FBINFO_STATE_SUSPENDED. Add matching state checks in the
> remaining accelerated callbacks for consistency with fillrect().
> 
> This patch was developed with AI assistance and is compile-tested only.

Please read the documentation for how to properly document LLM
assistance.

also, you aren't sending this to the right lists :(

thanks,

greg k-h

