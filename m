Return-Path: <linux-fbdev+bounces-6513-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MZyJU6ZrmnFGgIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6513-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 10:56:30 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 773802369E9
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 10:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 523C1301DBBB
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Mar 2026 09:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39443876AA;
	Mon,  9 Mar 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RJKwPlJ/"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD433859C3;
	Mon,  9 Mar 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050164; cv=none; b=TjVBX9JLB6nz11PBpmAAQ8AYGoenu5wuMuXPDdHNzDUTQHSt5hEGsKwBFvBJ5/n9+Y5wpCQVCsGcZnWrrWFW4GzWASVV2AbkosOIBU7ZgrzxyN0RvZvh4yYiORsXn00rGss2LdSA/WHqeqWOg4ukkBOp/8cCsFrq5Z9p04dIjwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050164; c=relaxed/simple;
	bh=r/rX+8B3OcjIowjnENHFgOtcFRjiTZJJiV5my7CDCfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=by8Z7hhTwUMnayvuESJzMGKswGmBq3JtjQ3EFc8NEt8C0iGjpnp/KmW2hEKcRFB37EYjKK+yX779OTgRjcXYbCeQdn/x9vcmBr6KweI5UbmKsxRxlhIL+cOw/FuIP7kCEgkb7c9EE1ixKtALa4pdCJIfFhg/AxG9BeYBR8qVGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RJKwPlJ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB395C2BCB1;
	Mon,  9 Mar 2026 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773050164;
	bh=r/rX+8B3OcjIowjnENHFgOtcFRjiTZJJiV5my7CDCfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJKwPlJ//ldEEcu8p99ZATzPgu7HCtMderGGQMcz9X9ESFiFNi602P9u0A4iR+sWL
	 09s2hrVN70sxjmOeko/pKrnGqvXrWzzK00Z1tr+HQYjQQ4fsdQSQVzuhkZ9S5GNMU8
	 IjGNaBOZ/27olkslDrVmF2WC402VBl3zu36+gE+E=
Date: Mon, 9 Mar 2026 10:56:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: dipesh chaudhary <me@dipeshchaudhary.in>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: constify g_fbmode array
Message-ID: <2026030943-obscure-alive-fa6e@gregkh>
References: <9e566c42-8ec3-4d06-91be-0489de4e91c0@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e566c42-8ec3-4d06-91be-0489de4e91c0@smtp-relay.sendinblue.com>
X-Rspamd-Queue-Id: 773802369E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6513-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.584];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,dipeshchaudhary.in:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:49:57AM +0000, dipesh chaudhary wrote:
> 
> Fix checkpatch warning for static const char array. Make the array of pointers read-only to improve memory safety.
> 
> Signed-off-by: dipesh chaudhary <me@dipeshchaudhary.in>
> ---
>  Makefile                        | 6 +++---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index df471d4212cc..e944c6e71e81 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> -VERSION = 6
> -PATCHLEVEL = 19
> +VERSION = 7
> +PATCHLEVEL = 0
>  SUBLEVEL = 0
> -EXTRAVERSION =
> +EXTRAVERSION = -rc1
>  NAME = Baby Opossum Posse
>  
>  # *DOCUMENTATION*

Why have you changed the Makefile?

And did you test-build your change?

thanks,

greg k-h

