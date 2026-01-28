Return-Path: <linux-fbdev+bounces-5957-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qINLOJ7eeWnI0QEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5957-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 11:02:06 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864B9F295
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 11:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC272308F5E9
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 09:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66F734E743;
	Wed, 28 Jan 2026 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pKJA6wDs"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD234DCDF;
	Wed, 28 Jan 2026 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594283; cv=none; b=Depn4ztZKjNh40k96FCVQAn20Lgn2YFv2Bm3NXHxk6sFCbmeCJU4RnhFyKaW3kq6DTJXkSTySx26hfta+LK2AI8A5AbfOhnyjl7RJtboLsk7iTHHNypk2zzwWHVRVm+iIy/CRqvFJKcMX+L6M4GLcyuRTSWvhL6qboWIp1AILAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594283; c=relaxed/simple;
	bh=YBdgatfNyvQhHZDYc3SLYJhJFWnV+4AmYDAZ9R067f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQnDAuDRj+jzQZnKqph9waJ/wwZIs6bsSCQDYsP6vuXCBFSVeOgjo7QoicODWkpNriRFzoNx05/d57feCu2KP0YXYhrxApW4UZ+Tyt7Es42YyJIkNP93jbOJlM7yzhXeKJn5iQ9We6HjH627AAjjiyrECkgodfND+KTG68WvtBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pKJA6wDs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4E4C4CEF1;
	Wed, 28 Jan 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769594283;
	bh=YBdgatfNyvQhHZDYc3SLYJhJFWnV+4AmYDAZ9R067f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKJA6wDs9vz9vyZg71u4IZJXbFvoGHhlNqdyFzZGHCj4EPVxvrQWCGJQaPAAzcZsv
	 gRDi2943eMzb3QASx9oTs89KlmEGe9sTkaGy1iN8PhKnCcll6fD2cnM55q5R26l6AB
	 PlrBIP/ip5Ym3c5RTAtBv+EMA3bUlpcFiKDhWYz4=
Date: Wed, 28 Jan 2026 10:57:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Waffle0823 <csshin9928@gmail.com>
Cc: andy@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Improve damage_range to mark only changed rows
Message-ID: <2026012844-muster-lushness-def4@gregkh>
References: <20260128092210.864021-1-csshin9928@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128092210.864021-1-csshin9928@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5957-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 4864B9F295
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 06:22:10PM +0900, Waffle0823 wrote:
> Instead of marking the entire display as dirty, calculate
> start_row and end_row based on off/len and mark only those rows.
> This improves performance for partial framebuffer updates.
> 
> Signed-off-by: Waffle0823 <csshin9928@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>  {
>  	struct fbtft_par *par = info->par;
>  
> -	/* TODO: only mark changed area update all for now */
> -	par->fbtftops.mkdirty(info, -1, 0);
> +	__u32 width = info->var.xres;
> +	__u32 start_row = off / width;
> +	__u32 end_row = (off + len - 1) / width;
> +
> +	par->fbtftops.mkdirty(info, start_row, end_row);
>  }
>  
>  static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
> -- 
> 2.52.0
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

