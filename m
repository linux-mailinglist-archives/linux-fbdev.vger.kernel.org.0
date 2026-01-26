Return-Path: <linux-fbdev+bounces-5924-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFQMCfdCd2mMdQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5924-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 26 Jan 2026 11:33:27 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B868787060
	for <lists+linux-fbdev@lfdr.de>; Mon, 26 Jan 2026 11:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B71F9300CA29
	for <lists+linux-fbdev@lfdr.de>; Mon, 26 Jan 2026 10:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73F4330B17;
	Mon, 26 Jan 2026 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iFQUz3AN"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993C330DED5;
	Mon, 26 Jan 2026 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423563; cv=none; b=Ug9CEOZJSoX90xTpZCEga/We6ZivCwaTaTiCmbmSgP3EWakXE/qJKzpwFKyiYR120NzPiA8jF1jEDAE2D5WeCvlrtnpPJXYGMmYFRNbPpSheSVAns5OvUIt+PJKzxVDEqIWLFGyIzB71OvtfbTpfnwwIAJn2Ai/fVbHZB10wJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423563; c=relaxed/simple;
	bh=q3eFrdTHRAZUDsD1pmQSSgbtZhJ5tZlUAY2ThF5SSgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYnuFE1EYk04J/2Iim/F8c+yiY8EEx7Gz7cZBW+BNJ+YIWQuE53TxAAROmELLsr8FS9JN9P5jsUZjkA3G/omsY94k39S6ecARf3VPRwys0gmGOmHGaTLU12eAKys+gXQfguVy1H8BThEKF23bpQrYGweIh6jKY6EVXark+Hdmck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iFQUz3AN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C355C116C6;
	Mon, 26 Jan 2026 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769423563;
	bh=q3eFrdTHRAZUDsD1pmQSSgbtZhJ5tZlUAY2ThF5SSgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFQUz3AND1wnojc7Zyao0oIDpQ1W97D/N5g92EEJMSMCZF+B61q7D714UnUp63lG5
	 0YB94xOkQ/Ii1i/XfgpI0nWOXp7nL8sSvsZCqgz9+4d97PFbvwv+7y6LNkhegQheBJ
	 uw9SQCDTTQKTRX15diztjuAFXnFGa+xBs95+mhug=
Date: Mon, 26 Jan 2026 11:32:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Helge Deller <deller@gmx.de>, Hans de Goede <hansg@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>, Zsolt Kajtar <soci@c64.rulez.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
Message-ID: <2026012627-uncut-plaything-759e@gregkh>
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5924-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,gmx.de,suse.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B868787060
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:17:40PM +0800, pengfuyuan wrote:
> This series has been tested on:
> - ARM64 platforms with various display configurations
> - AMD RX550 graphics card
> - Moore Threads S30 graphics card
> - Multiple other graphics cards

How?  If there is no rust framebuffer drivers for those hardware
platforms, how exactly were these new codepaths tested?

> All tested configurations show normal display functionality with proper
> framebuffer initialization, rendering operations (including I/O, color register
> management, and blitting), memory mapping, and resource cleanup. The simplefb
> test driver successfully demonstrates the usage of all framebuffer framework
> APIs and validates the abstraction's correctness.

Really?  Where are the drivers for this?  Or did simplefb really work
for all of them?

confused,

greg k-h

