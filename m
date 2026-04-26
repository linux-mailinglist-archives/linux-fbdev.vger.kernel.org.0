Return-Path: <linux-fbdev+bounces-7092-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPHDLUPd7mm+ygAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7092-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 05:51:31 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A64D46C9DD
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 05:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE8583012CC5
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 03:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8D137CD42;
	Mon, 27 Apr 2026 03:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jvjnijRw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB082373BE6;
	Mon, 27 Apr 2026 03:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261835; cv=none; b=WJmnAs4F8dwbzZYs9R6Z8jRki4hVQ/XW/FZZvXAu7K2qDN9hrwM2CHpaR/mvGj/L4I68wj+u1iDSJTBQC/MyAFuiLVJRih9fBdZf7UIWJ/Chu2JRYp9OBm6+UjYb2O3r1pzoq4epGEkvZwWQcjkppgo01/pbdTqugVIaqUoeyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261835; c=relaxed/simple;
	bh=6MbnM58GaH7QWBbKVSg3Dvl46HfyaUY5rCyabLyoRyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZikFGQoDlDIIUdS5l1WiX92OYDr0GfRWCFVxkhlCHh5Tw0enPaqc4AVWy6hOAqmzDkYL/zxBD7g0uO4f5tr4sKiJUWh+BRYisuikD3rlfGCQVMAHSn69HN/GlHdNQSgVhHVxkG0+paSSQ/1tGRECE0F78h7RGASsVHbUt/nOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jvjnijRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18E6C2BCB8;
	Mon, 27 Apr 2026 03:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261835;
	bh=6MbnM58GaH7QWBbKVSg3Dvl46HfyaUY5rCyabLyoRyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvjnijRwFYP3owM3BzNGcNARHoWCvk9hAdrBHHwtMF4zKwILQCZzQvF817ZPFpl0p
	 DHIBhWvTAHopgeGCxA3fKdCQ+pPx2foo19pM2M9AewGjij3O7b1hVpDI3f08gEfkmi
	 A7Cpn/jIVqhuw5+rx3sUEXwuNqRkfckLpe7N0ZY0=
Date: Sun, 26 Apr 2026 21:08:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: sm750fb: propagate error codes from
 de_wait()
Message-ID: <2026042610-tavern-easiest-c69c@gregkh>
References: <20260409155821.23375-1-dennylin0707@gmail.com>
 <20260409155821.23375-3-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409155821.23375-3-dennylin0707@gmail.com>
X-Rspamd-Queue-Id: 2A64D46C9DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7092-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Thu, Apr 09, 2026 at 03:58:21PM +0000, Hungyu Lin wrote:
> The sm750 acceleration functions currently return -1 when
> de_wait() fails, discarding the original error code.
> 
> Since de_wait() now returns proper errno values, propagate
> the error code instead of returning -1.

You can use the full 72 columns for a changelog text.

> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_accel.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
> index 0f94d859e91c..688ec262a8ed 100644
> --- a/drivers/staging/sm750fb/sm750_accel.c
> +++ b/drivers/staging/sm750fb/sm750_accel.c
> @@ -90,14 +90,16 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
>  		      u32 color, u32 rop)
>  {
>  	u32 de_ctrl;
> +	int ret;
>  
> -	if (accel->de_wait() != 0) {
> +	ret = accel->de_wait();
> +	if (ret) {
>  		/*
> -		 * int time wait and always busy,seems hardware
> +		 * int time wait and always busy, seems hardware

Nice fix, but not part of this change to make :(

thanks,

greg k-h

