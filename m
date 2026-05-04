Return-Path: <linux-fbdev+bounces-7145-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEewNb1n+GnwuAIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7145-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 04 May 2026 11:32:45 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3E4BAF6C
	for <lists+linux-fbdev@lfdr.de>; Mon, 04 May 2026 11:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8AD8300825D
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 May 2026 09:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC07B37BE92;
	Mon,  4 May 2026 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yr/dDx9M"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D937BE74;
	Mon,  4 May 2026 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887149; cv=none; b=iWuxhoB+J7B9A75ckrzaPjNk8lQCYpceSu/7WJEzl1NE2aiQfkzw5pSINIFJ2Zms8Qn78wxUs+f/AJ9+RjjcZFpyf5vfEV91gIdv/3ZiID+RN6bbtVv2mwcVdmHOPZj0uw1jpDTvNPK1lxWlLXJDd+1k2aP01wp8NmjSJIpovJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887149; c=relaxed/simple;
	bh=iFWW741N8v6QMD0wOrae5SV4vI1AZIZ8WmiSC3Pk47c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmuhKqiYBnSCLQVOR0BnUW1yFlN+2M+/GTcunzhXleS8ILWmClfavwIxjbVq0y8vQZi6lHs84btWe57MPSW5IqpPlJ1CdoOb5w7H282cFVe4msYpx7vH3GwjPEYybqkhgx+Mrlzt3QCYo66mSlxoSOOMcIuzp6UZ269zdgxxn6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yr/dDx9M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4356FC2BCB9;
	Mon,  4 May 2026 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777887149;
	bh=iFWW741N8v6QMD0wOrae5SV4vI1AZIZ8WmiSC3Pk47c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yr/dDx9Md4KtOpq6Wsb0p8wflez9KT7WNGDIJH4hsLaRnv743BcxjZGVmEPoyGrPG
	 7YiXGlzXSVn08p2XYQAFbE4W8zMTz7mFSyxJ5+MN0zLrINnpqZwA08eX4039slH3iy
	 SGSlqRICqZgloKlW0QByL54DllHk8vOMnrKAC+lU=
Date: Mon, 4 May 2026 11:32:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Francisco Maestre <francisco@maestretorreblanca.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: sm750fb: add const qualifier to string
 pointer arrays
Message-ID: <2026050410-mahogany-frozen-e870@gregkh>
References: <20260503004134.66693-1-francisco@maestretorreblanca.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503004134.66693-1-francisco@maestretorreblanca.com>
X-Rspamd-Queue-Id: 6CE3E4BAF6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7145-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]

On Sat, May 02, 2026 at 07:41:34PM -0500, Francisco Maestre wrote:
> Add 'const' qualifier to 'g_fbmode' and 'g_def_fbmode' pointer
> declarations to make them 'static const char * const', as the
> pointers themselves are not modified after initialization.
> 
> This fixes the following checkpatch.pl warning:
>   WARNING: static const char * array should probably be
>   static const char * const
> 
> Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 62f6e0cdff4d..dc9653ed2108 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,8 +33,8 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel;
>  static int g_nomtrr;
> -static const char *g_fbmode[] = {NULL, NULL};
> -static const char *g_def_fbmode = "1024x768-32@60";
> +static const char * const g_fbmode[] = {NULL, NULL};
> +static const char * const g_def_fbmode = "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview;
>  static char *g_option;
> -- 
> 2.50.1 (Apple Git-155)
> 
> 

These are not all threaded together, can you please resend them all as a
correct patch series?

thanks,

greg k-h

