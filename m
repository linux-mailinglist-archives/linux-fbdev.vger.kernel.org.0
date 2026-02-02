Return-Path: <linux-fbdev+bounces-6022-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DSoJ2+/gGl3AgMAu9opvQ
	(envelope-from <linux-fbdev+bounces-6022-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 02 Feb 2026 16:14:55 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A80CE049
	for <lists+linux-fbdev@lfdr.de>; Mon, 02 Feb 2026 16:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58B153045011
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Feb 2026 15:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C946366828;
	Mon,  2 Feb 2026 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Osvwnv6u"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528BF1EB9FA;
	Mon,  2 Feb 2026 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044483; cv=none; b=pgITFjBoETMKO4+71HL4ncoYL7wawGSNi4hzPtnUDHNN2WOpdWWwqsIUCCfRofy+npWK8zgxi6WiycK8fHlmIEnnGrHnL8yZICQUgw3JJ/EmevTFAe2Y4Oezrv0rHzV8GByx0pXYy/mgK7xcYqG5x1CKFTRrMk5XxOiO7NrxSvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044483; c=relaxed/simple;
	bh=c3u75pWcmcqcVT7QstGPGMl1crPrTIGN5HbAUC/P16E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQ5LjvoT2zUnafmTI1T+6FI9D4m4OQS4BM4fQFWSRx7jhKNLAS1RrEXq8PAt10u+9YawjLL3bYPc5rAxPv+veWs/Q32wTV2T3qeywvHv8Y5AgLUYKzrs6D8YGg+uc+sstuEKGxKFsEy6Jjuxs0ttmclj5J0W0ZoAxDGsWWkIUkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Osvwnv6u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77134C116C6;
	Mon,  2 Feb 2026 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770044482;
	bh=c3u75pWcmcqcVT7QstGPGMl1crPrTIGN5HbAUC/P16E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Osvwnv6uu0Qo44hC9SQDuzQxbpw++LAU3ZD09pBP5lfZYd1La99VAeogQdXHU+B1G
	 u1sSfEUyHhFTn5ADJHz6YWkx+UjmfwH8h4CFbi+gAEYAU/K0yWVfwQtwZ23SFdCTDB
	 WQ/eTK2nFXsWWz6XgQ40ImAOzLNPrE+E+QBuoQ3o=
Date: Mon, 2 Feb 2026 16:01:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: yehudis9982 <y0533159982@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: rename Bpp to bpp
Message-ID: <2026020201-monogamy-sash-4866@gregkh>
References: <20260202145413.132435-1-y0533159982@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202145413.132435-1-y0533159982@gmail.com>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-6022-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6A80CE049
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:54:13PM +0200, yehudis9982 wrote:
> Rename the Bpp parameter to bpp to avoid CamelCase, as reported by
> checkpatch.pl.
> 
> Signed-off-by: yehudis9982 <y0533159982@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_accel.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
> index 046b9282b..866b12c2a 100644
> --- a/drivers/staging/sm750fb/sm750_accel.c
> +++ b/drivers/staging/sm750fb/sm750_accel.c
> @@ -85,7 +85,7 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt)
>  }
>  
>  int sm750_hw_fillrect(struct lynx_accel *accel,
> -		      u32 base, u32 pitch, u32 Bpp,
> +		      u32 base, u32 pitch, u32 bpp,

What does "bpp" stand for?  Perhaps spell it out further?

thanks,

greg k-h

