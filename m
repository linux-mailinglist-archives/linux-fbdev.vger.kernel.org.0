Return-Path: <linux-fbdev+bounces-7201-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IMPJp+/AmovwQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7201-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 07:50:23 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4051A71A
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 07:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 978723036961
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 05:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E7A40B6E3;
	Tue, 12 May 2026 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FL674Njf"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712573C9ED8;
	Tue, 12 May 2026 05:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564300; cv=none; b=fEeLs0R5H6iE8zjntqMcHw2K7fpO3plA2bDvXgTh1enW/RDX+RQ+skUbnRmPc+T+n5MhURB/BUkowcF1dg08q8QGTAsMbBc7UsNjzqlO4RnA/7FKgV8M5g8kC9G3lqWoJUjMlIlOroZrPxCe1+pQY17cD5YtlOx0DZF57q3x8wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564300; c=relaxed/simple;
	bh=16fmh/53jLOcSRwr5NGl7E1RhDPXNfW4uNvhC37G5pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aysuPNQE/g23zROg3/7kV+4jsfjGDaHovi/aGr4ipG8vOycbVj5j/3fJxpFMW7+Rs/QK3e18xBJS/BdtyOoweNSQoHMOQCkA2sriKeTHwhfgKjfLQUWHpMJ9JvvyKtc6X7mryJK5P7oyukpzEhNQ9808m0qppkBdbYGEz1GY37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FL674Njf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FB9C2BCC7;
	Tue, 12 May 2026 05:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778564299;
	bh=16fmh/53jLOcSRwr5NGl7E1RhDPXNfW4uNvhC37G5pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FL674Njf+cCxYewyyKqU4rEKKXwczXoyBhO5qkMs9ZRPPuFvkvEk/69CqAVE3xlTs
	 pfulEvd0CCIRdfAjgtFcKmqIK4V/dtRgeaquq2Ge6+N3ptO6wgmPGzBHcW1vIhd+GY
	 2ArdEPLDpu+Y/ySJOyZlg92+4DuwMEIUUvKJWZCM=
Date: Tue, 12 May 2026 07:37:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] staging: sm750fb: remove unused #include
 directives
Message-ID: <2026051203-slurp-slain-7458@gregkh>
References: <20260512044732.56417-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512044732.56417-1-yogeshdangal66@gmail.com>
X-Rspamd-Queue-Id: 3EC4051A71A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7201-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 10:32:31AM +0545, Chhabilal Dangal wrote:
> sm750_hw.c includes <asm/mtrr.h> under #ifdef CONFIG_MTRR, but no
> mtrr_add/mtrr_del calls exist in the file; the driver uses
> arch_phys_wc_add/arch_phys_wc_del in sm750.c instead.
> 
> sm750_hw.c, sm750_accel.c, and sm750_cursor.c all include
> <linux/platform_device.h>, but none use any platform device APIs.
> This is a PCI driver.

These are statements that don't really describe anything :(

> Remove these dead includes per the TODO item to refine the code
> and remove unused code.
> 
> Tested by building the full kernel and module with CONFIG_FB_SM750=m
> on x86_64:
>   make -j$(nproc)
>   make M=drivers/staging/sm750fb modules

You don't need to have these lines, it is assumed you test-built this.

> Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>

You need a blank line before this line.

Also, your patches were not properly connected, please use a tool like
git send-email to send them out.

Also, you are doing multiple things in this patch, please, only one
logical thing per commit.

thanks,

greg k-h

