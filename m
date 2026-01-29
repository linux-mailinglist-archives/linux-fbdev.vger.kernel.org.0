Return-Path: <linux-fbdev+bounces-5987-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFpNBzLkemn5/AEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5987-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 05:38:10 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE66ABB48
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 05:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CBE73017038
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 04:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0BC280327;
	Thu, 29 Jan 2026 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kp7r4jH0"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152226ED2A;
	Thu, 29 Jan 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661486; cv=none; b=fa2ablRcrT1Mr33woaBx+fgqrcmnOCJ4pbg5fWA59p7opHSEIS115X7b+78b18Ag5c2hIsBA0NbYhIDbVWgcGNuv9azdsM+pb4q7gheRtLCtzeX/K3h+dPkKTfk7eEV2PruNlfHefUYEm+w8/qBm0awEfa/m7i2JYZlPOO7LMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661486; c=relaxed/simple;
	bh=CiScCEL9euuEpGOeeAwg/0fqDkxe93uyrdAFznE9Rm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBp7DxPJerXtHmzsK31jZW7JcAZuAMVOjHuHJX8wLvIS8KEVJDiwVPAHV4MJfIaPd19A2oCko7RSRRnMeZ5R4ZO2YPBw6VqG/TxNnKm9d4FiaHXXyKtvFll/ZtHv7VuRGrJxODWX/Zpz5fJYJPlcerfHAulQevzE0FTYyklwBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kp7r4jH0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8D8C116D0;
	Thu, 29 Jan 2026 04:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769661485;
	bh=CiScCEL9euuEpGOeeAwg/0fqDkxe93uyrdAFznE9Rm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kp7r4jH06sLzIwyC+03sdtahoiz/d5jSzPQCa1IKysFCOqfN6DvAt3q/beJ8/5LXt
	 8jhOrmcx+6nXOtBP2h74rUvSCae85+1cLVjOLR9er500Z9tz6IrSFMC1ItG8mjboaX
	 IBpZfV+bd6ZzVCpert3y+q5P+H3umdnBV8yENbrc=
Date: Thu, 29 Jan 2026 05:38:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>
Cc: andy@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: use guard() to simplify code
Message-ID: <2026012929-disprove-certified-4057@gregkh>
References: <20260128212644.1170970-1-paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128212644.1170970-1-paul.retourne@orange.fr>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[orange.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5987-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 8BE66ABB48
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 10:26:42PM +0100, Paul Retourné wrote:
> Use guard() to simplify mutex locking. No functional change.

It's best to use guard() for new code, not touching existing code as:

>  3 files changed, 8 insertions(+), 8 deletions(-)

This made no change overall at all :(

thanks,

greg k-h

