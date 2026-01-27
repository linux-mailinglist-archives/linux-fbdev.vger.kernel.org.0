Return-Path: <linux-fbdev+bounces-5942-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGgsGobSeGmNtQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5942-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Jan 2026 15:58:14 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B6962A3
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Jan 2026 15:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 013F630268D1
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Jan 2026 14:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD25535B65C;
	Tue, 27 Jan 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K+zFHhhD"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999E53587C2;
	Tue, 27 Jan 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525350; cv=none; b=bKRtNzFrUfADMnylyyOzn5c5J6XFPrPTdSko4UloR6EFY6z1+uIHoQWuui3klU0r5KtTCWt3++xI5N4xSppaT54UZKLCRjgOms//ZwxPuA7LAissCAalBFcxqva9PfDby7daAdInca7wAsvQ4I9s8FFQKJ+KxfOgpZJ6HQkDwtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525350; c=relaxed/simple;
	bh=48vWZ/4+BG9YwJ56E2KnU4acLxPmiexXS6A8kHskf10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueSpL9tlaAGzcq+Cw/c8Miui9+8y9uTJkAaqhf03TkCbY3dm4BvCGzZKQbOe3UCTtl4Loo0+snT835FKm+/N/dwJV4PX6nbxyJSvKdp8w7qYLqChz8gUYBjnCndunf6iRv0LjIHn/QKixBjxvUm1U99fo5Sx7W6UJBbzVnjB2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K+zFHhhD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E04C16AAE;
	Tue, 27 Jan 2026 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769525350;
	bh=48vWZ/4+BG9YwJ56E2KnU4acLxPmiexXS6A8kHskf10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+zFHhhDRE2WihFrjwmrZjCnB5LqfOHBGyI5xsL8fujdInxowt7zeEkdTXWSqLEqW
	 iadR3dDO/CqNK0pZqR3Y4OYQte9aMn91fjods0LAMg7AE4dnxDs6XYOdxQGOZClNur
	 A+wa8FqvtwPh3UnN/H/UR2czihHF0PgGvOcbczmk=
Date: Tue, 27 Jan 2026 15:49:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Madhumitha Sundar <madhuananda18@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make fixId array const
Message-ID: <2026012755-motivate-sadden-8063@gregkh>
References: <20260127114232.29504-1-madhuananda18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127114232.29504-1-madhuananda18@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-5942-lists,linux-fbdev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 525B6962A3
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:42:32AM +0000, Madhumitha Sundar wrote:
> The fixId array contains constant string literals, but the array itself is
> currently mutable.
> 
> Make the array const so that the compiler can place it in the read-only
> data section (.rodata) instead of writable memory.
> 
> This fixes a warning detected by checkpatch.pl:
> WARNING: static const char * array should probably be static const char * const
> 
> Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index fecd7457e..ff590061c 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  		"kernel HELPERS prepared vesa_modes",
>  	};
>  
> -	static const char *fixId[2] = {
> +	static const char * const fixId[2] = {
>  		"sm750_fb1", "sm750_fb2",
>  	};
>  
> -- 
> 2.43.0
> 
> 

Does not apply to my tree at all, please rebase and resend.

thanks,

greg k-h

