Return-Path: <linux-fbdev+bounces-6777-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHRcEvPuzGknYAYAu9opvQ
	(envelope-from <linux-fbdev+bounces-6777-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 12:09:55 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B32F63783DB
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 12:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF2AB30088B5
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Apr 2026 10:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0033B7774;
	Wed,  1 Apr 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cMMG91VN"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8FE38B7CF;
	Wed,  1 Apr 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038189; cv=none; b=D+7IJ05rKXBSMiLf4PrbXOFjyfny9fHRzQM6iqB1MUJSIgG3PEA6APT0FCrlo/tKT8HJygcXLThiYXdLdMA1gjfrrlnpDmio/69TmSR+J26gbSzrmwrVu7/z7GzMKhwubKdYeBA98R1MIf7bRmXzypCmmGj3AgKgz0E/ERsekKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038189; c=relaxed/simple;
	bh=L11j2EbvngSXn5/Y97Dj59dx/uLWIIoZMFR5GnuStc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7s9bJYr5KBJzO9qa86aRODVHMofQfSr3ZbwhV2b4XpdQK5vAjruII/H8Id7rBu9vrMtxq1jBJ2si0Lh9qEnR3nTX3Mt1FYCxSs5zQ9h+syVn/a3MuMlFqBKas/Tdk/uQwiBktN1D32/Cf9/mwf9nzuLfeWpOYba5MkDveLvQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cMMG91VN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9AEC4CEF7;
	Wed,  1 Apr 2026 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775038189;
	bh=L11j2EbvngSXn5/Y97Dj59dx/uLWIIoZMFR5GnuStc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMMG91VNPOV+5qFZ0F7FSq1I9LLKgZV08MDf/iwllsOpryEtFPJbMADU+tderf9ip
	 Mytl6EwLDTTtYsQuvcFjz6fvJJ2alvN2OicXcvNfA/YAgeTkGERgdL6s5qOrznkImh
	 DrsX9JNWB74F64A+XFPgVmATnbhTo8NElB4khCKg=
Date: Wed, 1 Apr 2026 12:09:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: constify fix_id array
Message-ID: <2026040129-maverick-blandness-084d@gregkh>
References: <20260331050738.1547-1-dennylin0707@gmail.com>
 <20260331135759.19108-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331135759.19108-1-dennylin0707@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6777-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: B32F63783DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 01:57:59PM +0000, Hungyu Lin wrote:
> Constify the static fix_id array so it can be placed in read-only memory.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> 
> ---
> Changes in v2:
> - Drop g_fbmode change as it is modified at runtime.
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 62f6e0cdf..795e9164b 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  		"kernel HELPERS prepared vesa_modes",
>  	};
>  
> -	static const char *fix_id[2] = {
> +	static const char * const fix_id[2] = {
>  		"sm750_fb1", "sm750_fb2",
>  	};
>  
> -- 
> 2.34.1
> 
> 

This is really a "v3" patch, AND please don't respond within the middle
of the thread, make it a new one.

thanks,

greg k-h

