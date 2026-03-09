Return-Path: <linux-fbdev+bounces-6535-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMMgKcH4rmnZKgIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6535-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 17:43:45 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8A23CEBE
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 17:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 381B73029882
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Mar 2026 16:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C785B3B8BB8;
	Mon,  9 Mar 2026 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sLCry9I9"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC63ACF17;
	Mon,  9 Mar 2026 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074380; cv=none; b=ZtD4nWqLHhsIozJHCRkDPyDKOkNDk4S0Hw0coy82p3eQCYo7SgrmNNMUgntrfCH0L+k/MKazK+4ptiHTi2VGqPn77VEj//sNRrmKGMsx8fD+WB4TtsIrg/ia/VPxaMiMlCOxQLPaZlzy9C4D673r54CY/t7h6oi9aV2Q3LM5bUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074380; c=relaxed/simple;
	bh=1xfjIqDEkQZEleSzaHtcg9LZ76mWLmVjfAaua14bNR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkDQkj48KDKxgT/5HmCeMHIojtFqrJf+CKU+rGYfq2gx8vh9DhHoqpaSFZ9DuFlD3qnEDjAlyI2758wjdVjIaNs0+BxekgaFZDnyxgGGCnRnu4rkVWNeTB7C5YTZuLgSUO0UvyUc4DDksBALCSaw6IDI7P4PGvqELC5igmzgEMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sLCry9I9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4306C2BCB3;
	Mon,  9 Mar 2026 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773074380;
	bh=1xfjIqDEkQZEleSzaHtcg9LZ76mWLmVjfAaua14bNR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLCry9I9DiU/qS6eoG/Ma7qXRqvOQx2VI3WRSmGHWZ5xfxlO9VxJCMUGC5+jY/8bR
	 ECIyB0S6sVqAsRvq5+IwVA4gcAolah+sCqwSv1ZlX7J9KpaF7Jrw+Z3IXSiCIdNyFP
	 lHfIcCcdE5T3aSYCQL1odNBuXITqu8LkiU4zeAkQ=
Date: Mon, 9 Mar 2026 17:39:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gabriel Windlin <gawindlin@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] staging: sm750fb: remove unused GPIO_MUX bit field
 definitions
Message-ID: <2026030913-deliverer-scorpion-d940@gregkh>
References: <20260303232434.1850583-1-gawindlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303232434.1850583-1-gawindlin@gmail.com>
X-Rspamd-Queue-Id: 0DC8A23CEBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6535-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.533];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:24:22AM +0100, Gabriel Windlin wrote:
> The GPIO_MUX_0 through GPIO_MUX_31 bit field macros defined in
> ddk750_reg.h are not referenced anywhere in the driver. The register
> address GPIO_MUX itself is still used by ddk750_swi2c.c. Remove the
> unused bit definitions to reduce dead code as noted in the TODO file.

As Dan says, it's good to keep hardware documentation like this around,
as it's not taking any runtime space.

thanks,

greg k-h

