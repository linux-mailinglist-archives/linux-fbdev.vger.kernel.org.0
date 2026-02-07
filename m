Return-Path: <linux-fbdev+bounces-6116-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLNUDmw9h2mzVQQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6116-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 07 Feb 2026 14:26:04 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B8105F7D
	for <lists+linux-fbdev@lfdr.de>; Sat, 07 Feb 2026 14:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 969CD3011A71
	for <lists+linux-fbdev@lfdr.de>; Sat,  7 Feb 2026 13:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F3C341666;
	Sat,  7 Feb 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QvObUxeY"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B0831195B;
	Sat,  7 Feb 2026 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470759; cv=none; b=JbtDqQ34ji1PJ+OuKAbctacvgjcwQKXBJEIYceU7QeNW+TDcOIueM9wKQVtFgjFe3bsfMCUsPuae1Ol1tD5JapSUG1NMfQwMCSdOU19q7jHEpypkSHEHk815ybPGAM3Jgq19NKHxTHWGmmBP/aNbksQmhnFfBYNmRbOImpOkTjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470759; c=relaxed/simple;
	bh=zfNTIDjM1fIlLmljZnKO4X1C/QdQ5QohIcAg6pM5ZGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki8BHJtK/5SzHlumVe71NpdBPDE3tQHd5YgGyccfVBKIzWmfsp81BKGtNiGY99IqJeJbYg7zjg61Jg8uM47uAHUhzffDeVa7ZbcJkc+Y43ADM3UMmS/li+aOky/H9K0AITNSiaK1M3PXmUyP4u76zLVaL4mvcPQTEHswsIlsPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QvObUxeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD65C116D0;
	Sat,  7 Feb 2026 13:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770470758;
	bh=zfNTIDjM1fIlLmljZnKO4X1C/QdQ5QohIcAg6pM5ZGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvObUxeYq6qKhW06PpvY8n+Wra1x12+jwn0379vfXfr5+TjQ7w+MvM7vhxavFxgfU
	 7pJEmwDZHlTcoWIKMMXfAxceoJZ/d5kSQP1RBIFRTmS3gWf7oVbCw0MOl9ryBpr7bm
	 TpLc9GVC7Pgb1OqZF2QjMBA0hnrIZODSB56C9xu0=
Date: Sat, 7 Feb 2026 14:25:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dhyaan19022009-hue <dhyan19022009@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dhyaan19022009-hue <dhyaan19022009@gmail.com>
Subject: Re: [PATCH] staging: sm750fb: rename pvMem to pv_mem
Message-ID: <2026020732-underhand-helpless-6903@gregkh>
References: <20260204062240.20293-1-dhyaan19022009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204062240.20293-1-dhyaan19022009@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6116-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 820B8105F7D
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:52:40AM +0530, dhyaan19022009-hue wrote:
> Rename the CamelCase variable pvMem to the snake_case pv_mem to
> comply with the Linux kernel coding style. This fixes multiple
> warnings reported by checkpatch.pl.
> 
> Signed-off-by: dhyaan19022009-hue <dhyaan19022009@gmail.com>


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

