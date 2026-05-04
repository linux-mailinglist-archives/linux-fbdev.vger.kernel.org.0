Return-Path: <linux-fbdev+bounces-7144-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLKFOJ1n+GnwuAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7144-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 04 May 2026 11:32:13 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFEE4BAF4F
	for <lists+linux-fbdev@lfdr.de>; Mon, 04 May 2026 11:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA7FC300678B
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 May 2026 09:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844BA37BE6B;
	Mon,  4 May 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M4GIoMUQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64F34CFD6;
	Mon,  4 May 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887125; cv=none; b=Q+MKchuuu04g6KeBJhitYI+4yiU/IOYUVyWYpMhNc1J2FJK8WyOmgH0LdJHWs5/aiGZBZPws0wDmu5dlhXS9jr3RWKccq4kW/AIogBGIK6mHtnpE3XRghOnV1ohWNRF/Rm0sBN6DhTG0zy6u07xuN5rPIUq05u5/cUbMiZznaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887125; c=relaxed/simple;
	bh=vMA5PRgs8ntTwHIEk6v3P+NKINvjgkQSqHQu3XwTxEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxEbNf6I/XFYIO5B2ftMKgAYwrEND6FN539SZXa5sC8uvvVTZ6rdSDskwVSyBpL1sZs02u9g3vsGFgFdsUCwovi2ecMcuwmyOaPsCNB0ae0LKnC5ZMH6Hb3T/6s91enDHfNhz04488snxi+51ymOUscaGNpEfz74IP5WpBOwM0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M4GIoMUQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98729C2BCB8;
	Mon,  4 May 2026 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777887124;
	bh=vMA5PRgs8ntTwHIEk6v3P+NKINvjgkQSqHQu3XwTxEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4GIoMUQcv9QIzRWZ7fhyBvuU35VlanpYbJ7C8mCJN2SS/uy5vrIDL4K8JOz2ruOY
	 Tq8/BT4Rc1pdQNnovH00Hjlw4wpAGvX3a/jUreoJrMHLeIwgcI1Xu/gBawHUjdzh2W
	 If+hHGL2gjb5czEYCROpKYCdloPkpCMmGYr1fBI4=
Date: Mon, 4 May 2026 11:32:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: auth <skunkolee@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	"open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sm750fb: fix spelling typo in comment
Message-ID: <2026050447-outskirts-parted-db83@gregkh>
References: <20260429001557.71737-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429001557.71737-1-skunkolee@gmail.com>
X-Rspamd-Queue-Id: 7FFEE4BAF4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7144-lists,linux-fbdev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]

On Tue, Apr 28, 2026 at 06:15:56PM -0600, auth wrote:
> Fixed suspected typo in comment ("programe" -> "program").
> 
> Signed-off-by: auth <skunkolee@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> index 7163232c0701..6363a66d5570 100644
> --- a/drivers/staging/sm750fb/ddk750_mode.c
> +++ b/drivers/staging/sm750fb/ddk750_mode.c
> @@ -82,7 +82,7 @@ static void program_mode_registers(struct mode_parameter *mode_param,
>  	unsigned int tmp, reg;
>  
>  	if (pll->clock_type == SECONDARY_PLL) {
> -		/* programe secondary pixel clock */
> +		/* program secondary pixel clock */
>  		poke32(CRT_PLL_CTRL, sm750_format_pll_reg(pll));
>  
>  		tmp = ((mode_param->horizontal_total - 1) <<
> -- 
> 2.54.0
> 

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

