Return-Path: <linux-fbdev+bounces-7065-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMyTEqU862mWKAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7065-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 Apr 2026 11:49:25 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCAF45C7BE
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 Apr 2026 11:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D65E3013D7C
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 Apr 2026 09:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EA531F98A;
	Fri, 24 Apr 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WZ+KVMEk"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5CE304972;
	Fri, 24 Apr 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024161; cv=none; b=Vzga40yz6BQGzOTwcVnmrnKcxXO0bIf/5yCe9cMKu/F7hW8H9miSPw+UojBrabFrA4Fghp/LZ6Aq+VRlB5N3omyov/ZZkh6V1YGR5D1A0ihoAcueTfE0XAmmOnAbUNdym7EWpnFJlnynt4pTiOzOldazwl+VwXzFHQYsGJ6tHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024161; c=relaxed/simple;
	bh=bCmMLd7TT625UC3cRQD0EElDDVxXsrbMw+gPrcqFMLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wn6zm98/b/LIKInhD30Px1Zvr0cY+Jqtqib+ggZ1zxRfn4wvJqBpbq0Ux4KM+Hn5PL/Zh7+rxzjLDwVTSwg5QcFdKueagVOLHmaC+v9ZijdjHcTQg68xPB79s+rO98U6imnV0ei+NET6l74x5ykkcuxfAvzlWbwuyfCkn1xoSDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WZ+KVMEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16482C2BCB4;
	Fri, 24 Apr 2026 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777024161;
	bh=bCmMLd7TT625UC3cRQD0EElDDVxXsrbMw+gPrcqFMLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZ+KVMEkBBHUpNlYmU5IIWtbtyf5QXsuQgX+/QHw0x7cJVo3iVTPDkQXxixA+EQap
	 5fqnQ2S+GdO+sKzfQwN/40mcbooHmjK4P2TQyEAAVLtASArBnHm62P0MirKywSsvW6
	 68xNHyXhihYSVy9ZQKT6UXp1EpM5OWQokJyYBIiY=
Date: Fri, 24 Apr 2026 11:49:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fbtft-bus: replace function-defining
 macro with concrete functions
Message-ID: <2026042402-dictation-curtly-8267@gregkh>
References: <20260424092818.3322248-1-hossu.alexandru@gmail.com>
 <aes6JY3Ht6p1VpFa@ashevche-desk.local>
 <69eb3b01.5d0a0220.3c3ebd.f35b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69eb3b01.5d0a0220.3c3ebd.f35b@mx.google.com>
X-Rspamd-Queue-Id: BDCAF45C7BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7065-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Fri, Apr 24, 2026 at 09:40:48AM -0000, Alexandru Hossu wrote:
> On Fri, Apr 24, 2026 at 12:38:45PM +0300, Andy Shevchenko wrote:
> > I'm not sure this patch improves the code. What I see it's harder to follow.
> > NAK.
> 
> Fair point. Three near-identical functions hide the pattern the macro
> makes explicit. I'll drop this approach.
> 
> If there's appetite for a minimal fix, I can send a v2 that moves
> EXPORT_SYMBOL() outside the macro body only, leaving the function
> definition untouched. Otherwise I'll leave it as-is and wait for
> Greg's take.

Please leave as-is, there's nothing wrong with the existing code here.

thanks,

greg k-h

