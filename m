Return-Path: <linux-fbdev+bounces-7243-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PLuHazDBWpMbAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7243-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 14:44:28 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F98541D76
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 14:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B8193097D47
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 12:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1D03DD844;
	Thu, 14 May 2026 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DTBE/Yhm"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5E23C13EF;
	Thu, 14 May 2026 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762515; cv=none; b=fpnWwTqNjJscRZ8gvvHeJyP+RuWHpvAUn1fmr//b2TV1DCr8yqyzQKuxh+UxXufE/7hzgaZlWwuRB63wEBNBpajpXaqYcdopR1v4ZC1CY6uGKVcpoQ+7wJ5h1+WiCrJcf2Ea3za+d2ICeviW0JykLwWSPESVUKjfzRsGcfRvXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762515; c=relaxed/simple;
	bh=WijtTe8uSs9JsujZPjhv0DUy0mOjITrzfiwWnQWJ6Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qClPw3PjyNwXKMp2g6N+DZv9Q3YMvhVEsrtVQEk8au6ba6rxvFJNGjnTmjjB3P2A/CXKwq0ChbgLyIeiLlnB/Pz4p+Jo1SINo/ZbEdGDAOlqgRT7ElgL+FObb4rvg9i11GxR/LlIigsC3IU2+3+TBI70fIazvAKf+KP1xoU7jnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DTBE/Yhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368BBC2BCB3;
	Thu, 14 May 2026 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778762515;
	bh=WijtTe8uSs9JsujZPjhv0DUy0mOjITrzfiwWnQWJ6Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTBE/YhmLrYtj9u2UjuKJ70DFR0sFsnJty2sGn4Zfg/fWvvGx9r0W+89fwpkr1moE
	 f3esmI+7WkRdKm0+BE+QKeOnp7zMAHirm/SeGf97HwbIwhxfZjLX8PZohlR3DmvPOy
	 Ra1zkvD6cRYDJm2XuGERlY/cZvVq7zhrRxvVG7a0=
Date: Thu, 14 May 2026 14:41:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: Re: [PATCH] staging: sm750fb: Add suspend checks to copyarea and
 imageblit
Message-ID: <2026051449-default-unhearing-c7c7@gregkh>
References: <20260514120102.71615-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514120102.71615-1-yogeshdangal66@gmail.com>
X-Rspamd-Queue-Id: E1F98541D76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7243-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,linuxfoundation.org:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 05:46:02PM +0545, Chhabilal Dangal wrote:
> lynxfb_ops_fillrect() already checks info->state before accessing
> the hardware 2D engine, but lynxfb_ops_copyarea() and
> lynxfb_ops_imageblit() do not.
> 
> The suspend path calls fb_set_suspend(), which sets the framebuffer
> state to FBINFO_STATE_SUSPENDED. Add matching state checks in the
> remaining accelerated callbacks for consistency with fillrect().
> 
> Assisted-by: Claude Opus 4.6 (Anthropic LLM)
> Compile-tested only.
> 
> Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 9f3e3d37e..025ac8fe3 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -204,6 +204,9 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
>  	struct sm750_dev *sm750_dev;
>  	unsigned int base, pitch, bpp;
>  
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return;
> +
>  	par = info->par;
>  	sm750_dev = par->dev;
>  
> @@ -239,6 +242,9 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
>  	struct lynxfb_par *par;
>  	struct sm750_dev *sm750_dev;
>  
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return;
> +
>  	par = info->par;
>  	sm750_dev = par->dev;
>  	/*
> -- 
> 2.54.0
> 
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

