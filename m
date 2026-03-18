Return-Path: <linux-fbdev+bounces-6658-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAcHBoPJumm6bwIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6658-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Mar 2026 16:49:23 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B70CF2BE960
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Mar 2026 16:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3B65321F4B8
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Mar 2026 15:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1693D6484;
	Wed, 18 Mar 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l27fqDNQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E921ADC7;
	Wed, 18 Mar 2026 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847471; cv=none; b=mfisyfsuL4BU/DDUjoIYQHIdnZL9+loiIo4r1C/EYxnVVoh7KwhukPpIbIA/5cc+Jpv8IVfwfJuLEDExDP/eJXZYIOjXJicoVUqM8kigc8t0jO4uUV4GRhzEE9tWtrmDm5B2YTQoxvPyNzJhcK9DSVLY249KX+ouJKSFIY4/bdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847471; c=relaxed/simple;
	bh=z+ZlhfTmw1aEPMmQkN577hP2jlg4YMc3Fyxz2oubyLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMEZ8+9vVWj5hH2HDMJoIkboru8HiAV2nnIoBGN6I8MQ5WlvXepJya5m0traS3Fo+yLqCljbxCW25ztS/bA42tG0fMSZfI3v02F3TUdlCNhl69qUpDAhflKus1jZCWlrScrjUAZfWRCXtWHIfuwvd6nbb+Rk/2zpO8XC/xuXFY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l27fqDNQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9538FC2BC87;
	Wed, 18 Mar 2026 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773847471;
	bh=z+ZlhfTmw1aEPMmQkN577hP2jlg4YMc3Fyxz2oubyLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l27fqDNQgkCT4uSJjCKGSYUbgmIE7ipBm+uSo9vr2763Vg66BF8f6j38xP8fKuJxv
	 CUn6GlZY34KLo5VkJAZ5UrwVKwo9X1KqGnKKjd+tmRhRS6XFemvw6TNNRtVoivFtDI
	 uFst7BgPbMPzeXN80485fia6ST67lxeCxXp0YutA=
Date: Wed, 18 Mar 2026 16:24:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: sm750fb: Rename enum sm750_pnltype values
 to snake_case
Message-ID: <2026031815-unicorn-despair-4c63@gregkh>
References: <20260314080934.135457-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314080934.135457-1-chakrabortyshubham66@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6658-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.822];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: B70CF2BE960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:39:30PM +0530, Shubham Chakraborty wrote:
> This patch renames the CamelCase enum values in sm750_pnltype to follow the Linux kernel coding style.

Please wrap your changelogs at 72 columns.

thanks,

greg k-h

