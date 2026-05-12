Return-Path: <linux-fbdev+bounces-7200-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGudHUi/AmoUwQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7200-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 07:48:56 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E078C51A6B8
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 07:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18D0C30BD4D1
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 05:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770843C1976;
	Tue, 12 May 2026 05:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aVi+rA53"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4E388E52;
	Tue, 12 May 2026 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564168; cv=none; b=NBa/2RjMKwLd9C+GOYqRoIdrBiBu21AeNIJcfQ2dcOaVMCWPxkZk4EN8TJAztq5yY6pvuNUlie/7omCuzXdHb7UXXEogy0XVxDCL69VuoGS+GbNryqBPnAOWVBHnmZplxOVliuc/IQNcnD+8x495S56+AHZR++BgOtrDz6bEan0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564168; c=relaxed/simple;
	bh=DZH5yH5vZbTuff6CKFBxrdPNRi5PhD/0sETkrpzSgX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YG+1H3CpNp0QryQsMh+CMFkrGfzwYbUd57rXKb3VSkW1YUsRxzyGamN6MXFKTF0oLe4yyGDuZjEhBdbaI3p/3hQ+VhI2FsYrSnrLyoBUY3vwpElPKEx/fNIx5VeQ/+zrfTLmjttSfBmwM++JunxUGstRwfffzGEFwfaAEvQ783Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aVi+rA53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E2BC4AF18;
	Tue, 12 May 2026 05:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778564167;
	bh=DZH5yH5vZbTuff6CKFBxrdPNRi5PhD/0sETkrpzSgX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aVi+rA53fQYulcZb7kAiPI+b7sf1jNogk8gH/VcsbOTpHfMvoYZY0zw6Rze+4U1ES
	 +Q9lvuc51/kBGUJ2lNvwSgrQJMK1Ar6eFZ8sXF6Bn+JHVnuGmtt8srjdinObYopT45
	 OdWW8cmifoFPclQQvP1NQOcBfUw208V2GAncKAaI=
Date: Tue, 12 May 2026 07:35:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alone <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: sm750fb: Keep g_fbmode array non-const
Message-ID: <2026051255-ditto-stainless-e4ba@gregkh>
References: <20260511170245.53556-1-yogeshdangal66@gmail.com>
 <2026051150-yearbook-detention-49d8@gregkh>
 <CAF9nfaDfdBKUnC6sVN8w84ruH5NkSxm8cqXN8JCWH0RESff4Rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF9nfaDfdBKUnC6sVN8w84ruH5NkSxm8cqXN8JCWH0RESff4Rg@mail.gmail.com>
X-Rspamd-Queue-Id: E078C51A6B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7200-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 12:48:05AM +0545, Alone wrote:
> Thanks for the clarification and guidance.
> 
> I want to learn the correct workflow. As a student contributor, what checks
> and testing steps should I always perform before sending a patch?

Please start with not top-posting and sending html email :)

After that, go through the kernelnewbies.org first-patch tutorial, as
well as the free Linux Foundation kernel development online class.
Between those two, you should have a good basis for working on this
correctly.

Also read all of the documentation we have about submitting a patch.
People wrote that for a reason, don't ignore it :)

thanks,

greg k-h

