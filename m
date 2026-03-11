Return-Path: <linux-fbdev+bounces-6575-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKFlA/Z8sWmACAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6575-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2026 15:32:22 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D222265695
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2026 15:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86242303604E
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2026 14:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A433A168A;
	Wed, 11 Mar 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WZPUHHKC"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2D3101A2;
	Wed, 11 Mar 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238988; cv=none; b=SVPGPs4zlQyUO/hS0gPqlV7T4j61h8Czl8c7hA8WPsRwgpX6JEKLpuNRB89ciMAbK2wF9CVmk4NYtQNQ+HUHe1T2kFLk4J2FC6Oq0/2bGx1AF39WQoSlIaRd46E/euEbic5A/oU+sDVbhPdiYQ+ncpK4Q6dup6G+RWsniulq0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238988; c=relaxed/simple;
	bh=PCrKB/UgyGuu1KtWWqCXgqBIME8R1Qa1SQOoJrgdwl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bz1jLquMj7PNuo3UPFKVrlth60iCyMO+Xzrn5pC87bJS9OWGC3/y1Tk2ueTmgs9FpBdK2a2kuOp6jEffsta2iYneCVPe7PTs8MjRJqYZunocBz/ntoeHGLWUD/ncjaxAx16VJQ4LC75hZGNs+Aw0HuOp7ojtHP0nILgBTNDFTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WZPUHHKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666DBC4CEF7;
	Wed, 11 Mar 2026 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773238988;
	bh=PCrKB/UgyGuu1KtWWqCXgqBIME8R1Qa1SQOoJrgdwl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZPUHHKCBsJxIoj3ovNaAaxc+IOHubm9F2sVWV2YU+H9sXvuXPjIyI0/ufltw/MC+
	 LkNdrdNSLohXjI0ikmjDla7222Hwn5O4S2WsDMn/xgnj/XHO1bZFPHLcuVDcn7vWxW
	 25tOQBBfUHiM83+o1hPf1NEd+B5bro9Fv6rX1NeE=
Date: Wed, 11 Mar 2026 15:23:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: andy@kernel.org, linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_ra8875: replace udelay() with
 usleep_range()
Message-ID: <2026031151-fragrant-geometry-4b3f@gregkh>
References: <20260311135245.32730-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311135245.32730-1-mohd.abd.6602@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6575-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 6D222265695
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 01:52:45PM +0000, Anas Iqbal wrote:
> Replace udelay() with usleep_range() for 100 microsecond delays as
> recommended by checkpatch.pl. usleep_range() avoids busy waiting and
> allows the scheduler to run other tasks.
> 
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ra8875.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
> index 0ab1de6647d0..d2400bb44f1c 100644
> --- a/drivers/staging/fbtft/fb_ra8875.c
> +++ b/drivers/staging/fbtft/fb_ra8875.c
> @@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
>  	}
>  	len--;
>  
> -	udelay(100);
> +	usleep_range(100, 200);
>  
>  	if (len) {
>  		buf = (u8 *)par->buf;
> @@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
>  
>  	/* restore user spi-speed */
>  	par->fbtftops.write = fbtft_write_spi;
> -	udelay(100);
> +	usleep_range(100, 200);
>  }
>  
>  static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
> -- 
> 2.43.0
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

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

